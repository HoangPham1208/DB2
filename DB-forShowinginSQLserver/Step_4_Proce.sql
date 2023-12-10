CREATE OR ALTER PROCEDURE DanhSachChuyenBayTheoNgay @Date DATE, @Start VARCHAR(20), @End VARCHAR(20), @Quantity INT
AS
BEGIN
   SELECT K.MaSoMayBay ,
		  C.DiaDiemXuatPhat, 
		  C.DiaDiemHaCanh, 
		  C.ThoiGianXuatPhat, 
		  C.ThoiGianHaCanh, 
		  K.LoaiKhoang, 
		  K.GiaKhoang, 
		  K.SoLuongGheToiDaCungCap, 
		  MAX(K.SoLuongGheToiDaCungCap) - COUNT(N.HoVaTen) AS SoLuongGheConLai
   FROM Chuyenbay C JOIN KhoangTrenChuyenBay K ON C.MaSo = K.MaSoMayBay 
		LEFT JOIN NguoiThamGiaChuyenBay N ON (K.MaSoMayBay = N.MaSoMayBay and K.LoaiKhoang = N.LoaiKhoang)
 
	WHERE CONVERT(DATE, C.ThoiGianXuatPhat) = @Date 
		  and C.DiaDiemXuatPhat = @Start
		  and C.DiaDiemHaCanh = @End
   GROUP BY K.MaSoMayBay ,
		  C.DiaDiemXuatPhat, 
		  C.DiaDiemHaCanh, 
		  C.ThoiGianXuatPhat, 
		  C.ThoiGianHaCanh, 
		  K.LoaiKhoang, 
		  K.GiaKhoang, 
		  K.SoLuongGheToiDaCungCap
   HAVING MAX(K.SoLuongGheToiDaCungCap) - COUNT(N.HoVaTen) >= @Quantity
   ORDER BY K.GiaKhoang
END
GO

/*exec SoluongNguoiBayTheoNgay @Date = '2023-03-02', @End = 'HaNoi', @Start = 'Ho Chi Minh City', @Quantity = 19
GO*/




CREATE OR ALTER PROCEDURE TimPhongKhachSan (@DateCheckIn DATE,@DateCheckOut DATE, @City VARCHAR(20))
AS
BEGIN
   declare @period INT=DATEDIFF(DAY, @DateCheckIn, @DateCheckOut); 
   SELECT P.MaSoThueKhachSan, K.TenKhachSan, K.DiaChi, K.ThanhPho, P.LoaiPhong, P.MoTa, P.GiaPhong, min(P.SoLuongCungCap) as SoLuongCungCap
   FROM KhachSan K, Phong P
   WHERE K.MaSoThue = P.MaSoThueKhachSan and P.Ngay >= @DateCheckIn AND  P.Ngay <= @DateCheckOut and K.ThanhPho = @City
   GROUP BY  P.MaSoThueKhachSan, K.TenKhachSan, K.DiaChi, K.ThanhPho, P.LoaiPhong, P.MoTa, P.GiaPhong
   having count(*)> @period
   ORDER BY P.GiaPhong ASC
END
go


CREATE OR ALTER PROCEDURE SoluongNguoiBayTheoNgay (@Date DATE, @MaChuDichVu VARCHAR(20))
AS
BEGIN
   SELECT d.MaSo, f.LoaiKhoang, COUNT(*) AS SoLuongGhe

   FROM ChuDichVu as a,	NhaCungCapDichVu as b, HangHangKhong as c, 
   ChuyenBay as d, KhoangTrenChuyenBay as e,NguoiThamGiaChuyenBay as f
   WHERE
		a.MaSoTaiKhoan=b.MaChuDichVu
		AND b.MaDichVu=c.MaDichVu
		AND c.MaSoThue=d.MaSoThueCuaHangHangKhong
		AND d.MaSo=e.MaSoMayBay
		AND e.MaSoMayBay=f.MaSoMayBay AND e.LoaiKhoang=f.LoaiKhoang
		AND a.MaSoTaiKhoan=@MaChuDichVu AND CONVERT(DATE, d.ThoiGianXuatPhat) = @Date
   GROUP BY d.MaSo, f.LoaiKhoang
   ORDER BY SoLuongGhe DESC
END

exec SoluongNguoiBayTheoNgay 
@Date = '2023-03-02',
@MaChuDichVu = 'TK001'

/*
exec SoluongNguoiBayTheoNgay @MaChuDV = 'TK003', @Date = '2023-03-01'
*/
