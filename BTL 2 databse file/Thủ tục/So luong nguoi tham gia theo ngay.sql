CREATE OR ALTER PROCEDURE SoluongNguoiBayTheoNgay @MaChuDV VARCHAR(20), @Date DATE
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

exec SoluongNguoiBayTheoNgay @MaChuDV = 'TK003', @Date = '2023-12-20'

CREATE OR ALTER PROCEDURE SoluongNguoiBayTheoNgayCuaChuyenBay @MaChuDV VARCHAR(20), @Date DATE, @name VARCHAR(20)
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
select * from ChuDichVu
select * from NhaCungCapDichVu
select * from KhoangTrenChuyenBay

CREATE OR ALTER PROCEDURE SoLuongNguoiBayTong @MaChuDV VARCHAR(20)
AS
BEGIN
   SELECT H.TenHang, C.MaSo AS MaSoChuyenBay, K.LoaiKhoang, COUNT(N.HoVaTen) AS SoLuongNguoiThamGia, MAX(K.GiaKhoang)*(COUNT(N.HoVaTen)) AS TongTienVeThuDuoc
   FROM NhaCungCapDichVu D JOIN HangHangKhong H ON D.MaDichVu = H.MaDichVu
   JOIN ChuyenBay C ON H.MaSoThue = C.MaSoThueCuaHangHangKhong
   JOIN KhoangTrenChuyenBay K ON C.MaSo = K.MaSoMayBay
   LEFT JOIN NguoiThamGiaChuyenBay N ON (K.MaSoMayBay = N.MaSoMayBay and K.LoaiKhoang = N.LoaiKhoang)
   WHERE D.MaChuDichVu = @MaChuDV
   GROUP BY H.TenHang, C.MaSo, K.LoaiKhoang
   ORDER BY SoLuongNguoiThamGia
END