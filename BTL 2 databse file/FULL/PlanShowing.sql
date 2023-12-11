-- TaiKhoan
INSERT INTO TaiKhoanDangNhap(Ho,TenDem,Ten,NgaySinh,GioiTinh,SoCCCD,TenDangNhap,MatKhau) VALUES
( 'Nguyen', 'Van', 'A', '1990-01-15', 'M', '123456789082','nva','nva123');
INSERT INTO TaiKhoanDangNhap(Ho,TenDem,Ten,NgaySinh,GioiTinh,SoCCCD,TenDangNhap,MatKhau) VALUES
( 'Nguyen', 'Van', 'B', '2026-01-15', 'M', '456789555555','nvb','nvb123');
INSERT INTO TaiKhoanDangNhap(Ho,TenDem,Ten,NgaySinh,GioiTinh,SoCCCD,TenDangNhap,MatKhau) VALUES
( 'Nguyen', 'Van', 'C', '1980-01-15', 'M', '123444444444','nvc','nvc123');
-- SDT
INSERT INTO SoDienThoai (MaSoTaiKhoan, SoDienThoai) VALUES
('TK001', '0901234567');
INSERT INTO SoDienThoai (MaSoTaiKhoan, SoDienThoai) VALUES
('TK002', '0901234567');
INSERT INTO SoDienThoai (MaSoTaiKhoan, SoDienThoai) VALUES
('TK003', '1234567891');
-- Email
INSERT INTO Email (MaSoTaiKhoan, Email) VALUES
('TK001', 'asd@gmail.com');
INSERT INTO Email (MaSoTaiKhoan, Email) VALUES
('TK002', '123@gmail.com');
INSERT INTO Email (MaSoTaiKhoan, Email) VALUES
('TK002', 'asdsa@gmail.com');
INSERT INTO Email (MaSoTaiKhoan, Email) VALUES
('TK003', 'whoisyourdaddy@gmail.com');
-- Chu Dich Vu
INSERT INTO ChuDichVu (MaSoTaiKhoan)
VALUES
  ('TK003');
-- Nhan Vien
INSERT INTO NhanVien (MaSoTaiKhoan, ThoiGianLamViec, NgayBatDauLam, MaNhanVienQuanLy)
VALUES
  ('TK002', '09:30:00', '2021-12-05', NULL);
-- Bank Account
select * from TaiKhoanNganHang
select * from KhachHang
select * from TaiKhoanDangNhap
INSERT INTO TaiKhoanNganHang (SoTaiKhoan, TenNganHang, MaKhachHang,TrangThai)
VALUES
  ('1234567890', 'ACB', 'TK001','active');
  INSERT INTO TaiKhoanNganHang (SoTaiKhoan, TenNganHang, MaKhachHang,TrangThai)
VALUES
  ('9876543210', 'VCB', 'TK001','active');
  INSERT INTO TaiKhoanNganHang (SoTaiKhoan, TenNganHang, MaKhachHang,TrangThai)
VALUES
  ('2222222222', 'MB', 'TK001','inactive');
INSERT INTO TaiKhoanNganHang (SoTaiKhoan, TenNganHang, MaKhachHang,TrangThai)
values
  ('456456456', 'Vietcombank', 'TK002','active');
INSERT INTO TaiKhoanNganHang (SoTaiKhoan, TenNganHang, MaKhachHang,TrangThai)
values
  ('789789789', 'Vietcombank', 'TK003','inactive');

-- Nha Cung Cap Dich Vu
  INSERT INTO NhaCungCapDichVu (MaChuDichVu, LoaiDichVu)
VALUES
   ('TK003', 'Flight Booking');
INSERT INTO NhaCungCapDichVu (MaChuDichVu, LoaiDichVu)
VALUES
  ('TK003', 'Hotel Booking');


-- Hang Hang Khong
INSERT INTO HangHangKhong (MaSoThue, TenHang, MoTa, SoDienThoaiTuVanVien, MaDichVu)
VALUES
  ('H001', 'Vietnam Airlines', 'National Flag Carrier', '0909876543', 'DV001');
INSERT INTO HangHangKhong (MaSoThue, TenHang, MoTa, SoDienThoaiTuVanVien, MaDichVu) values
  ('H002', 'AirAsia', 'Low-cost Carrier', '0912345678', 'DV001');

-- Chuyen Bay
INSERT INTO ChuyenBay ( ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
   -- 1 den 6
  ( '2023-12-20 12:00:00', '2023-12-20 14:00:00', 'Ho Chi Minh City', 'Hanoi', 'H002');
  
INSERT INTO ChuyenBay ( ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2023-12-20 14:00:00', '2023-12-20 16:00:00', 'Ho Chi Minh City', 'Hanoi', 'H001');
  
INSERT INTO ChuyenBay ( ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2024-04-02 12:00:00', '2024-04-02 14:00:00', 'Hue', 'Hanoi', 'H002');
  
INSERT INTO ChuyenBay ( ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2024-04-07 12:00:00', '2024-04-07 14:00:00', 'DaNang', 'Hanoi', 'H001');
  
INSERT INTO ChuyenBay ( ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2024-05-02 12:00:00', '2024-05-02 14:00:00', 'Ho Chi Minh City', 'DaNang', 'H002');
INSERT INTO ChuyenBay ( ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2024-05-07 12:00:00', '2024-05-07 14:00:00', 'NhaTrang', 'Hanoi', 'H001');
INSERT INTO ChuyenBay ( ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2024-06-02 12:00:00', '2024-06-02 14:00:00', 'Ho Chi Minh City', 'Hue', 'H001');
INSERT INTO ChuyenBay ( ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2024-06-08 12:00:00', '2024-06-08 14:00:00', 'Ho Chi Minh City', 'Hanoi', 'H001');
  
INSERT INTO ChuyenBay ( ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2024-01-02 12:00:00', '2024-01-02 14:00:00', 'HaNoi', 'Ho Chi Minh City', 'H002');
INSERT INTO ChuyenBay ( ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2024-01-01 12:00:00', '2024-01-01 14:00:00', 'Ho Chi Minh City', 'NhaTrang', 'H001');
  
INSERT INTO ChuyenBay ( ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2024-02-09 12:00:00', '2024-02-09 14:00:00', 'NhaTrang', 'Hanoi', 'H002');
  
INSERT INTO ChuyenBay ( ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2024-02-09 12:00:00', '2024-02-09 14:00:00', 'HaNoi', 'DaNang', 'H001');

  -- 6 den 12
  
INSERT INTO ChuyenBay ( ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2024-09-01 12:00:00', '2024-09-01 14:00:00', 'Ho Chi Minh City', 'Hanoi', 'H001');
  
INSERT INTO ChuyenBay ( ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2024-09-14 12:00:00', '2024-09-14 14:00:00', 'HaNoi', 'Hue', 'H002');
INSERT INTO ChuyenBay ( ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2024-10-02 12:00:00', '2024-10-02 14:00:00', 'Hue', 'Hanoi', 'H001');
INSERT INTO ChuyenBay ( ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2024-10-07 12:00:00', '2024-10-07 14:00:00', 'DaNang', 'Hanoi', 'H001');
INSERT INTO ChuyenBay ( ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2024-11-02 12:00:00', '2024-11-02 14:00:00', 'Ho Chi Minh City', 'DaNang', 'H001');
INSERT INTO ChuyenBay ( ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2024-11-07 12:00:00', '2024-11-07 14:00:00', 'NhaTrang', 'Hanoi', 'H001');
INSERT INTO ChuyenBay ( ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2024-12-02 12:00:00', '2024-12-02 14:00:00', 'Ho Chi Minh City', 'Hue', 'H001');
INSERT INTO ChuyenBay ( ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2024-12-08 12:00:00', '2024-12-08 14:00:00', 'Ho Chi Minh City', 'Hanoi', 'H001');
INSERT INTO ChuyenBay ( ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2024-07-02 12:00:00', '2024-07-02 14:00:00', 'HaNoi', 'Ho Chi Minh City', 'H002');
INSERT INTO ChuyenBay ( ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2024-07-01 12:00:00', '2024-07-01 14:00:00', 'Ho Chi Minh City', 'NhaTrang', 'H002');
INSERT INTO ChuyenBay ( ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2024-08-09 12:00:00', '2024-08-09 14:00:00', 'NhaTrang', 'Hanoi', 'H002');
INSERT INTO ChuyenBay ( ThoiGianXuatPhat, ThoiGianHaCanh, DiaDiemXuatPhat, DiaDiemHaCanh, MaSoThueCuaHangHangKhong)
VALUES
  ( '2024-09-09 12:00:00', '2024-08-09 14:00:00', 'HaNoi', 'DaNang', 'H002');
-- Khoang
INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB001', 'Business', 2000000, 20,'Spacious seats with premium services');
  INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB001', 'Economy', 800000, 150, 'Standard seating with in-flight entertainment');
  INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB002', 'Business', 1800000, 18, 'Comfortable seats with extra legroom');
  INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB002', 'Economy', 700000, 160, 'Affordable seating for budget travelers');
  INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB003', 'Business', 1900000, 30, 'Comfortable seats with extra legroom');
  INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB003', 'Economy', 750000, 150, 'Affordable seating for budget travelers');
  INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB004', 'Business', 1850000, 25, 'Comfortable seats with extra legroom');
  INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB004', 'Economy', 750000, 160, 'Affordable seating for budget travelers');
  INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB005', 'Business', 1750000, 22, 'Comfortable seats with extra legroom');
  INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB005', 'Economy', 850000, 144, 'Affordable seating for budget travelers');
  INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB006', 'Business', 1600000, 32, 'Comfortable seats with extra legroom');
  INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB006', 'Economy', 770000, 145, 'Affordable seating for budget travelers');
  INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB007', 'Business', 1900000, 30, 'Comfortable seats with extra legroom');
  INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB007', 'Economy', 750000, 150, 'Affordable seating for budget travelers');
  INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB008', 'Business', 2000000, 20,'Spacious seats with premium services');
  INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB008', 'Economy', 800000, 150, 'Standard seating with in-flight entertainment');
  INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB009', 'Business', 1800000, 18, 'Comfortable seats with extra legroom');
  INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB009', 'Economy', 700000, 160, 'Affordable seating for budget travelers');


  select * from ChuyenBay
  INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB010', 'Business', 1900000, 30, 'Comfortable seats with extra legroom');
  INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB010', 'Economy', 750000, 150, 'Affordable seating for budget travelers');
  INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB011', 'Business', 1850000, 25, 'Comfortable seats with extra legroom');
  INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB011', 'Economy', 750000, 160, 'Affordable seating for budget travelers');
  INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB012', 'Business', 1750000, 22, 'Comfortable seats with extra legroom');
  INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB012', 'Economy', 850000, 144, 'Affordable seating for budget travelers');
  INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB013', 'Business', 2000000, 13,'Spacious seats with premium services');
   INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB013', 'Economy', 800000, 150, 'Standard seating with in-flight entertainment');
   INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB014', 'Business', 1800000, 14, 'Comfortable seats with extra legroom');
   INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB014', 'Economy', 700000, 160, 'Affordable seating for budget travelers');
   INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB015', 'Business', 1900000, 15, 'Comfortable seats with extra legroom');
   INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB015', 'Economy', 750000, 150, 'Affordable seating for budget travelers');
   INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB016', 'Business', 1850000, 16, 'Comfortable seats with extra legroom');
   INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB016', 'Economy', 750000, 160, 'Affordable seating for budget travelers');
   INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB017', 'Business', 1750000, 17, 'Comfortable seats with extra legroom');
   INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB017', 'Economy', 850000, 144, 'Affordable seating for budget travelers');
   INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB018', 'Business', 1600000, 18, 'Comfortable seats with extra legroom');
   INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB018', 'Economy', 770000, 145, 'Affordable seating for budget travelers');
   INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB019', 'Business', 1900000, 19, 'Comfortable seats with extra legroom');
   INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB019', 'Economy', 750000, 150, 'Affordable seating for budget travelers');
   INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB020', 'Business', 2000000, 20,'Spacious seats with premium services');
   INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB020', 'Economy', 800000, 150, 'Standard seating with in-flight entertainment');
   INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB021', 'Business', 1800000, 21, 'Comfortable seats with extra legroom');
   INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB021', 'Economy', 700000, 160, 'Affordable seating for budget travelers');
   INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB022', 'Business', 1900000, 22, 'Comfortable seats with extra legroom');
   INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB022', 'Economy', 750000, 150, 'Affordable seating for budget travelers');
   INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB023', 'Business', 1850000, 23, 'Comfortable seats with extra legroom');
   INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB023', 'Economy', 750000, 160, 'Affordable seating for budget travelers');
   INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB024', 'Business', 1750000, 24, 'Comfortable seats with extra legroom');
   INSERT INTO KhoangTrenChuyenBay (MaSoMayBay, LoaiKhoang, GiaKhoang, SoLuongGheToiDaCungCap, MoTa)
VALUES
  ('CB024', 'Economy', 850000, 144, 'Affordable seating for budget travelers');
-- Hanh Ly
select * from ChuyenBay
select * from KhoangTrenChuyenBay
INSERT INTO HanhLy (MaSoMayBay, LoaiHanhLyKyGui, ChiTiet, GiaCa) values
 ('CB001','5kg','small bag',100000),
  ('CB001','10kg','medium bag',300000),
   ('CB001','15kg','big bag',500000),
    ('CB001','20kg','large bag',700000),
	 ('CB001','25kg','super bag',1000000),
('CB002','5kg','bo bag',100000),
  ('CB002','10kg','bu bag',300000),
   ('CB002','15kg','be bag',500000),
    ('CB002','20kg','ba bag',700000),
	 ('CB002','25kg','bi bag',1000000);
-- Khach san
INSERT INTO KhachSan ( MaSoThue , TenKhachSan , DiaChi , ThanhPho , SoDienThoaiLeTan , MaDichVu )
VALUES
	('K001' , 'Royal'  , '70 Phan Boi Chau' , 'TPHCM' , '0901100011' , 'DV002' ),
	('K002' , 'Capital'  , '85 Nguyen Trai' , 'TPHCM' , '0901200012' , 'DV002' ),
	('K003' , 'Country'  , '90 Ta Quang Buu' , 'TPHCM' , '0901300013' , 'DV002' );
	INSERT INTO KhachSan ( MaSoThue , TenKhachSan , DiaChi , ThanhPho , SoDienThoaiLeTan , MaDichVu )
VALUES
	('K004' , 'Royal'  , '70 Ton Duc Ke' , 'HN' , '0901100011' , 'DV002' ),
	('K005' , 'Capital'  , '85 Nguyen Khuyen' , 'HN' , '0901200012' , 'DV002' ),
	('K006' , 'Country'  , '90 Ta Tan' , 'HN' , '0901300013' , 'DV002' );
-- Phong
INSERT INTO Phong ( MaSoThueKhachSan , LoaiPhong , Ngay , SoLuongCungCap , MoTa , GiaPhong )
VALUES

	( 'K001' , 'Normal - 2 person' , '2024-01-01' , 10 , 'Affordable price, full amenities' , 1000000 ),
	( 'K001' , 'VIP - 2 person' , '2024-01-01' , 10 , 'Full service, full amenities' , 2000000 ),
	( 'K002' , 'Normal - 4 person' , '2024-01-01' , 10 , 'Affordable price, full service' , 800000 ),
	( 'K002' , 'VIP - 2 person' , '2024-01-01' , 10 , 'Restaurant, swimming pool , soccer field available' , 1500000 ),
	( 'K003' , 'VIP - 2 person' , '2024-01-01' , 10 , 'Affordable price, full amenities' , 1200000 );
	INSERT INTO Phong ( MaSoThueKhachSan , LoaiPhong , Ngay , SoLuongCungCap , MoTa , GiaPhong )
VALUES

	( 'K004' , 'Normal - 2 person' , '2024-01-01' , 10 , 'Affordable price, full amenities' , 1000000 ),
	( 'K004' , 'VIP - 2 person' , '2024-01-01' , 10 , 'Full service, full amenities' , 2000000 ),
	( 'K004' , 'Normal - 2 person' , '2024-01-02' , 10 , 'Affordable price, full amenities' , 1000000 ),
	( 'K004' , 'VIP - 2 person' , '2024-01-02' , 10 , 'Full service, full amenities' , 2000000 ),
	( 'K004' , 'Normal - 2 person' , '2024-01-03' , 10 , 'Affordable price, full amenities' , 1000000 ),
	( 'K004' , 'VIP - 2 person' , '2024-01-03' , 10 , 'Full service, full amenities' , 2000000 ),
	( 'K004' , 'VIP - 2 person' , '2024-01-04' , 10 , 'Full service, full amenities' , 2000000 ),
	( 'K004' , 'Normal - 2 person' , '2024-01-05' , 10 , 'Affordable price, full amenities' , 1000000 );
--
select* from DonHang
/*
update DonHang
set TinhTrangDonHang = 'xac nhan'
where MaDonHang = 'DH010'
*/
--

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

select * from NhaCungCapDichVu
select * from HangHangKhong