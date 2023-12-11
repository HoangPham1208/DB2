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

CREATE OR ALTER PROCEDURE SoluongNguoiBayTheoNgay (@Date DATE, @MaChuDv VARCHAR(20))
AS
BEGIN

   SELECT H.TenHang, C.MaSo AS MaSoChuyenBay, K.LoaiKhoang, COUNT(N.HoVaTen) AS SoLuongNguoiThamGia, MAX(K.GiaKhoang)*(COUNT(N.HoVaTen)) AS TongTienVeThuDuoc
   FROM NhaCungCapDichVu D JOIN HangHangKhong H ON D.MaDichVu = H.MaDichVu
   JOIN ChuyenBay C ON H.MaSoThue = C.MaSoThueCuaHangHangKhong
   JOIN KhoangTrenChuyenBay K ON C.MaSo = K.MaSoMayBay
   LEFT JOIN NguoiThamGiaChuyenBay N ON (K.MaSoMayBay = N.MaSoMayBay and K.LoaiKhoang = N.LoaiKhoang)
   WHERE CONVERT(DATE, C.ThoiGianXuatPhat) = @Date and D.MaChuDichVu = @MaChuDV
   GROUP BY H.TenHang, C.MaSo, K.LoaiKhoang
   ORDER BY SoLuongNguoiThamGia
END


--exec SoluongNguoiBayTheoNgay @MaChuDV = 'TK003', @Date = '2023-12-20'

go

CREATE OR ALTER PROCEDURE SoluongNguoiBayTheoNgayCuaHangBay @MaChuDV VARCHAR(20), @Date DATE, @name VARCHAR(20)
AS
BEGIN
   SELECT H.TenHang, C.MaSo AS MaSoChuyenBay, K.LoaiKhoang, COUNT(N.HoVaTen) AS SoLuongNguoiThamGia, MAX(K.GiaKhoang)*(COUNT(N.HoVaTen)) AS TongTienVeThuDuoc
   FROM NhaCungCapDichVu D JOIN HangHangKhong H ON D.MaDichVu = H.MaDichVu
   JOIN ChuyenBay C ON H.MaSoThue = C.MaSoThueCuaHangHangKhong
   JOIN KhoangTrenChuyenBay K ON C.MaSo = K.MaSoMayBay
   LEFT JOIN NguoiThamGiaChuyenBay N ON (K.MaSoMayBay = N.MaSoMayBay and K.LoaiKhoang = N.LoaiKhoang)
   WHERE CONVERT(DATE, C.ThoiGianXuatPhat) = @Date and D.MaChuDichVu = @MaChuDV and H.TenHang = @name
   GROUP BY H.TenHang, C.MaSo, K.LoaiKhoang
   ORDER BY SoLuongNguoiThamGia
END
go
select * from ChuDichVu
select * from NhaCungCapDichVu
select * from KhoangTrenChuyenBay
go
CREATE OR ALTER PROCEDURE SoLuongNguoiBayTong @MaChuDV VARCHAR(20)
AS
BEGIN
   SELECT H.TenHang, C.MaSo AS MaSoChuyenBay, K.LoaiKhoang, C.ThoiGianXuatPhat, COUNT(N.HoVaTen) AS SoLuongNguoiThamGia, MAX(K.GiaKhoang)*(COUNT(N.HoVaTen)) AS TongTienVeThuDuoc
   FROM NhaCungCapDichVu D JOIN HangHangKhong H ON D.MaDichVu = H.MaDichVu
   JOIN ChuyenBay C ON H.MaSoThue = C.MaSoThueCuaHangHangKhong
   JOIN KhoangTrenChuyenBay K ON C.MaSo = K.MaSoMayBay
   LEFT JOIN NguoiThamGiaChuyenBay N ON (K.MaSoMayBay = N.MaSoMayBay and K.LoaiKhoang = N.LoaiKhoang)
   WHERE D.MaChuDichVu = @MaChuDV
   GROUP BY H.TenHang, C.MaSo, K.LoaiKhoang, C.ThoiGianXuatPhat
   ORDER BY SoLuongNguoiThamGia
end

--exec SoluongNguoiBayTheoNgay 
--@Date = '2023-03-02',
--@MaChuDichVu = 'TK001'
go
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
