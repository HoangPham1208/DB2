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
@Date = '2023-12-20',
@MaChuDichVu = 'TK003'

select * from DonHang where DonHang.MaDonHang = 'DH124'
select * from DonHang D, VeDatMayBay V, ChuyenBay where D.MaDonHang = V.MaDonHang and D.MaDonHang = 'DH124' and ChuyenBay.MaSo = V.MaSoChuyenBay
select * from VeDatMayBay where VeDatMayBay.MaDonHang = 'DH124'
select * from NguoiThamGiaChuyenBay
select * from ChuyenBay
