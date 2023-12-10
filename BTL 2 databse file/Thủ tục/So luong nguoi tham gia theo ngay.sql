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
