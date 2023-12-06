-- :)) nhap dữ liệu phải ghi lại câu insert chán quá
-- Dữ liệu cho bảng TaiKhoanDangNhap
INSERT INTO TaiKhoanDangNhap(Ho,TenDem,Ten,NgaySinh,GioiTinh,SoCCCD) VALUES
( 'Nguyen', 'Van', 'A', '1990-01-15', 'M', '123456789082');
INSERT INTO TaiKhoanDangNhap(Ho,TenDem,Ten,NgaySinh,GioiTinh,SoCCCD) VALUES
( 'Nguyen', 'Van', 'B', '1985-01-15', 'M', '456789555555');
INSERT INTO TaiKhoanDangNhap(Ho,TenDem,Ten,NgaySinh,GioiTinh,SoCCCD) VALUES
( 'Nguyen', 'Van', 'C', '1980-01-15', 'M', '123444444444');


INSERT INTO SoDienThoai (MaSoTaiKhoan, SoDienThoai) VALUES
('TK001', '0901234567');
INSERT INTO SoDienThoai (MaSoTaiKhoan, SoDienThoai) VALUES
('TK002', '0901234567');
INSERT INTO SoDienThoai (MaSoTaiKhoan, SoDienThoai) VALUES
('TK003', '1234567891');

INSERT INTO Email (MaSoTaiKhoan, Email) VALUES
('TK001', 'asd@gmail.com');
INSERT INTO Email (MaSoTaiKhoan, Email) VALUES
('TK002', '123@gmail.com');
INSERT INTO Email (MaSoTaiKhoan, Email) VALUES
('TK002', 'asdsa@gmail.com');
INSERT INTO Email (MaSoTaiKhoan, Email) VALUES
('TK003', 'whoisyourdaddy@gmail.com');
INSERT INTO ChuDichVu (MaSoTaiKhoan)
VALUES
  ('TK003');

INSERT INTO NhanVien (MaSoTaiKhoan, ThoiGianLamViec, NgayBatDauLam, MaNhanVienQuanLy)
VALUES
  ('TK002', '09:30:00', '2021-12-05', NULL);

INSERT INTO KhachHang (MaSoTaiKhoan, CapBac)
VALUES
  ('TK001', 'VIP');
INSERT INTO KhachHang (MaSoTaiKhoan, CapBac)
Values
  ('TK002', 'Regular');
INSERT INTO KhachHang (MaSoTaiKhoan, CapBac)
values
  ('TK003', 'Regular');

INSERT INTO TaiKhoanNganHang (SoTaiKhoan, TenNganHang, MaKhachHang,TrangThai)
VALUES
  ('1234567890', 'ACB', 'TK001','Xác nhận');
INSERT INTO TaiKhoanNganHang (SoTaiKhoan, TenNganHang, MaKhachHang,TrangThai)
values
  ('9876543210', 'Vietcombank', 'TK002','Xác nhận');
INSERT INTO TaiKhoanNganHang (SoTaiKhoan, TenNganHang, MaKhachHang,TrangThai)
values
  ('1234567891', 'Vietcombank', 'TK003','Chưa Xác nhận');

INSERT INTO DonHang ( TinhTrangDonHang, HinhThucThanhToan, MaKhachHang, NgayGiaoDich, TaiKhoanNganHang, MaNhanVienHoTro)
VALUES
  ( 'Chưa thanh toán', 'Cash', 'TK001', '2023-02-15', '1234567890', 'TK002');

INSERT INTO NhaCungCapDichVu (MaChuDichVu, LoaiDichVu)
VALUES
  ('TK003', 'Flight Booking');

  SELECT * FROM ChuDichVu

INSERT INTO HangHangKhong (MaSoThue, TenHang, MoTa, SoDienThoaiTuVanVien, MaDichVu)
VALUES
  ('H001', 'Vietnam Airlines', 'National Flag Carrier', '0909876543', 'DV001');
INSERT INTO HangHangKhong (MaSoThue, TenHang, MoTa, SoDienThoaiTuVanVien, MaDichVu) values
  ('H002', 'AirAsia', 'Low-cost Carrier', '0912345678', 'DV001');

INSERT INTO ChuyenBay ( Ngay, ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2023-03-01', '2023-03-01 08:00:00', '2023-03-01 10:00:00', 'Hanoi', 'Ho Chi Minh City', 'H001');

INSERT INTO ChuyenBay ( Ngay, ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2023-03-02', '2023-03-02 12:00:00', '2023-03-02 14:00:00', 'Ho Chi Minh City', 'Hanoi', 'H002');


INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB001', 'Business', 2000000, 20, 'Spacious seats with premium services'),
  ('CB001', 'Economy', 800000, 150, 'Standard seating with in-flight entertainment'),
  ('CB002', 'Business', 1800000, 18, 'Comfortable seats with extra legroom'),
  ('CB002', 'Economy', 700000, 160, 'Affordable seating for budget travelers');

INSERT INTO VeDatMayBay (MaDonHang, MaSoChuyenBay)
VALUES
  ( 'DH001', 'CB001');


INSERT INTO NguoiThamGiaChuyenBay ( HoVaTen, SoDienThoai, Email, SoCCCD, NgaySinh, MaVeMayBay, MaSoMayBay, LoaiKhoang)
VALUES
  ( 'Tran Thi B', '0987654321', 'tranb@yahoo.com', '987654321098', '1988-10-20', 'V001', 'CB001', 'Business');
INSERT INTO NguoiThamGiaChuyenBay ( HoVaTen, SoDienThoai, Email, SoCCCD, NgaySinh, MaVeMayBay, MaSoMayBay, LoaiKhoang) values
  ( 'Tran Thi C', '0987654321', 'tranc@ gmail.com', '987654321099', '1988-10-20', 'V001', 'CB001', 'Business');
INSERT INTO NguoiThamGiaChuyenBay ( HoVaTen, SoDienThoai, Email, SoCCCD, NgaySinh, MaVeMayBay, MaSoMayBay, LoaiKhoang) values
  ( 'Tran Thi D', '0987654321', 'trand@ gmail.com', '987654321100', '1988-10-20', 'V001', 'CB001', 'Business');
INSERT INTO NguoiThamGiaChuyenBay ( HoVaTen, SoDienThoai, Email, SoCCCD, NgaySinh, MaVeMayBay, MaSoMayBay, LoaiKhoang) values
  ( 'Tran Thi E', '0987654321', 'trane@ gmail.com', '987654321101', '1988-10-20', 'V001', 'CB001', 'Business');
INSERT INTO NguoiThamGiaChuyenBay ( HoVaTen, SoDienThoai, Email, SoCCCD, NgaySinh, MaVeMayBay, MaSoMayBay, LoaiKhoang) values
  ( 'Tran Thi F', '0987654321', 'tranf@ gmail.com', '987654321102', '1988-10-20', 'V001', 'CB001', 'Business');
INSERT INTO NguoiThamGiaChuyenBay ( HoVaTen, SoDienThoai, Email, SoCCCD, NgaySinh, MaVeMayBay, MaSoMayBay, LoaiKhoang) values
  ( 'Tran Thi G', '0987654321', 'trang@ gmail.com', '987654321103', '1988-10-20', 'V001', 'CB001', 'Business');


select * from TaiKhoanDangNhap
select * from SoDienThoai
select * from Email
select * from ChuDichVu
select * from NhanVien
select * from KhachHang
select * from TaiKhoanNganHang
select * from DonHang
select * from NhaCungCapDichVu
select * from HangHangKhong
select * from ChuyenBay
select * from KhoangTrenChuyenBay
select * from VeDatMayBay
select * from NguoiThamGiaChuyenBay


