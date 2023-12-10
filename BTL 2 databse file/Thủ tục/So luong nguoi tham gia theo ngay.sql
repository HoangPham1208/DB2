CREATE OR ALTER PROCEDURE SoluongNguoiBayTheoNgay (@Date DATE, @MaChuDichVu VARCHAR(20))
AS
BEGIN
   SELECT C.MaSo, K.LoaiKhoang, COUNT(*) AS SoLuongGhe
   FROM Chuyenbay C, KhoangTrenChuyenBay K, NguoiThamGiaChuyenBay N
   WHERE CONVERT(DATE, C.ThoiGianXuatPhat) = @Date 
      and C.MaSo = K.MaSoMayBay 
      and K.MaSoMayBay = N.MaSoMayBay 
      and K.LoaiKhoang = N.LoaiKhoang
   GROUP BY C.MaSo, K.LoaiKhoang
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

select * from ChuDichVu
select * from NhaCungCapDichVu
select * from HangHangKhong