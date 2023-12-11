-- thu tuc 1 : Insert NguoiThamGiaChuyenBay
select * from NguoiThamGiaChuyenBay
select * from VeDatMayBay
select * from KhoangTrenChuyenBay

exec InsertNguoiThamGiaChuyenBay 'Hoang Gia Bao' , '0914748951' , 'hgb@gmail.com' , '987654652003' , '2003-05-06' ,  'V001' , 'CB001' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Hoang Gia B12' , '0914748951' , 'hgb@gmail.com' , '987654652003' , '2003-05-06' ,  'V001' , 'CB001' , 'Business'
exec InsertNguoiThamGiaChuyenBay '' , '0914748951' , 'hgb@gmail.com' , '987654652003' , '2003-05-06' ,  'V001' , 'CB001' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Hoang Gia Bao' , '0914748951' , 'hgb@gmail.com' , '987654652003' , '2003-05-06' ,  'V001' , 'CB001' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Nguyen Van A' , '091474895101232' , 'hgb@gmail.com' , '987654652003' , '2003-05-06' ,  'V001' , 'CB001' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Nguyen Van B' , '09147' , 'hgb@gmail.com' , '987654652003' , '2003-05-06' ,  'V001' , 'CB001' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Hoang Gia Bao' , '' , 'hgb@gmail.com' , '987654652003' , '2003-05-06' ,  'V001' , 'CB001' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Hoang Gia Bao' , '09147489517' , 'hgb@gmail.com' , '987654652003' , '2025-05-06' ,  'V001' , 'CB001' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Hoang Gia Bao' , '09147489517' , 'hgb@gmail.com' , '987654652003' , '2023-05-06' ,  'V001' , 'CB001' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Hoang Gia Bao' , '09147489517' , 'hgb@gmail.com' , '987654652003' , '' ,  'V001' , 'CB001' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Hoang Gia Bao' , '0914748951' , 'hgb@gmail.com' , '9876546520031' , '2003-05-06' ,  'V001' , 'CB001' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Hoang Gia Bao' , '0914748951' , 'hgb@gmail.com' , '' , '2003-05-06' ,  'V001' , 'CB001' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Hoang Gia Bao' , '0914748951' , 'hgb@gmail.com' , '' , '2023-05-06' ,  'V001' , 'CB001' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Hoang Gia Bao' , '0914748951' , 'hgbgmail.com' , '987654652003' , '2003-05-06' ,  'V001' , 'CB001' , 'Business'

delete from NguoiThamGiaChuyenBay
select * from NguoiThamGiaChuyenBay

-- thu tuc 2 : Update NguoiThamGiaChuyenBay

delete from NguoiThamGiaChuyenBay
select * from NguoiThamGiaChuyenBay

exec UpdateNguoiThamGiaChuyenBay 'NTGCB001' , 'Hoang Gia B12' , '0914748951' , 'hgb@gmail.com' , '987654652003' , '2003-05-06' ,  'V001' , 'CB001' , 'Business'
exec UpdateNguoiThamGiaChuyenBay 'NTGCB001' , '' , '0914748951' , 'hgb@gmail.com' , '987654652003' , '2003-05-06' ,  'V001' , 'CB001' , 'Business'
exec UpdateNguoiThamGiaChuyenBay 'NTGCB001' , 'Hoang Gia Bao' , '09147489511215312' , 'hgb@gmail.com' , '987654652003' , '2003-05-06' ,  'V001' , 'CB001' , 'Business'
exec UpdateNguoiThamGiaChuyenBay 'NTGCB001' , 'Hoang Gia Bao' , '09112' , 'hgb@gmail.com' , '987654652003' , '2003-05-06' ,  'V001' , 'CB001' , 'Business'
exec UpdateNguoiThamGiaChuyenBay 'NTGCB001' , 'Hoang Gia Bao' , '' , 'hgb@gmail.com' , '987654652003' , '2003-05-06' ,  'V001' , 'CB001' , 'Business'
exec UpdateNguoiThamGiaChuyenBay 'NTGCB001' , 'Hoang Gia Bao' , '09147489517' , 'hgb@gmail.com' , '987654652003' , '2025-05-06' ,  'V001' , 'CB001' , 'Business'
exec UpdateNguoiThamGiaChuyenBay 'NTGCB001' , 'Hoang Gia Bao' , '09147489517' , 'hgb@gmail.com' , '987654652003' , '2023-05-06' ,  'V001' , 'CB001' , 'Business'
exec UpdateNguoiThamGiaChuyenBay 'NTGCB001' , 'Hoang Gia Bao' , '09147489517' , 'hgb@gmail.com' , '987654652003' , '' ,  'V001' , 'CB001' , 'Business'
exec UpdateNguoiThamGiaChuyenBay 'NTGCB001' , 'Hoang Gia Bao' , '0914748951' , 'hgb@gmail.com' , '9876546520031' , '2003-05-06' ,  'V001' , 'CB001' , 'Business'
exec UpdateNguoiThamGiaChuyenBay 'NTGCB001' , 'Hoang Gia Bao' , '0914748951' , 'hgb@gmail.com' , '' , '2003-05-06' ,  'V001' , 'CB001' , 'Business'
exec UpdateNguoiThamGiaChuyenBay 'NTGCB001' , 'Hoang Gia Bao' , '0914748951' , 'hgb@gmail.com' , '' , '2023-05-06' ,  'V001' , 'CB001' , 'Business'
exec UpdateNguoiThamGiaChuyenBay 'NTGCB001' , 'Hoang Gia Bao' , '0914748951' , 'hgbgmail.com' , '987654652003' , '2003-05-06' ,  'V001' , 'CB001' , 'Business'


-- thu tuc 3 : Delete NguoiThamGiaChuyenBay
-- TODO
delete from NguoiThamGiaChuyenBay
select * from NguoiThamGiaChuyenBay

exec InsertNguoiThamGiaChuyenBay 'Hoang Gia Bao' , '0914748951' , 'hgb@gmail.com' , '987654652003' , '2003-05-06' ,  'V001' , 'CB001' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Pham Ba Hoang' , '0901130502' , 'pbh@yahoo.com' , '987654112003' , '2003-01-01' ,  'V001' , 'CB001' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Trinh Van Han' , '0901130457' , 'tvh@gmail.com' , '987654492003' , '2003-09-04' ,  'V001' , 'CB001' , 'Business'

/*exec InsertNguoiThamGiaChuyenBay 'Nguyễn Phi Hoàng' , '0901130412' , 'nph@gmail.com' , '987134492003' , '2003-09-05' ,  'V002' , 'CB002' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Nguyễn Văn Hoàng' , '0901130456' , 'nvh@gmail.com' , '987564492003' , '2003-09-10' ,  'V002' , 'CB002' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Nguyễn Gia Phong' , '0901130412' , 'ngp@gmail.com' , '987651792003' , '2003-10-04' ,  'V001' , 'CB001' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Nguyễn Gia Quý' , '0901130401' , 'ngq@gmail.com' , '987134492003' , '2003-08-04' ,  'V001' , 'CB001' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Lê Hùng Bảo' , '0901130458' , 'lhb@gmail.com' , '987654492113' , '2004-10-05' ,  'V001' , 'CB001' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Lê Hùng Hoàng' , '0901130456' , 'lhh@gmail.com' , '987654492173' , '2005-11-11' ,  'V001' , 'CB001' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Lê Hùng Quý' , '0901110457' , 'lhq@gmail.com' , '987654492923' , '2000-09-04' ,  'V001' , 'CB001' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Trần Đan Bảo' , '0901112457' , 'tdb@gmail.com' , '987154492003' , '2000-09-04' ,  'V001' , 'CB001' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Trần Đan Hưng' , '0906430457' , 'tdh@gmail.com' , '157654492003' , '2001-08-25' ,  'V001' , 'CB001' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Trần Đan Huy' , '0911130457' , 'tdh1@gmail.com' , '177654492003' , '1998-09-14' ,  'V001' , 'CB001' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Trần Huỳnh Long' , '0903130457' , 'thl@gmail.com' , '981954492003' , '1997-10-05' ,  'V001' , 'CB001' , 'Business'
exec InsertNguoiThamGiaChuyenBay 'Trần Huỳnh Hân' , '0998130457' , 'thh1@gmail.com' , '981054492003' , '1996-03-05' ,  'V001' , 'CB001' , 'Business'*/

exec DeleteNguoiThamGiaChuyenBay 'NTGCB001'  -- ma cua nguoi dau tien, chay bang NguoiThamGiaChuyenBay de lay ma roi thu xoa


-- trigger 1 : Cập nhật dữ liệu cấp bậc

delete from PhieuNhaHang
delete from VeDatMayBay
delete from VeDatPhong
delete from ChonPhong
delete from ChonBan
delete from DonHang
delete from NguoiThamGiaChuyenBay
select * from NguoiThamGiaChuyenBay
select * from DonHang
select * from KhachHang
select * from KhachSan
select * from NhaHang
select * from ChuyenBay
select * from ChonBan
select * from ChonPhong
select * from VeDatMayBay
select * from PhieuNhaHang
select * from VeDatPhong

select * from KhoangTrenChuyenBay
select * from Ban
select * from Phong
exec InsertAndGetAutoKey_DonHang 'TK001'
exec InsertAndGetAutoKey_DonHang 'TK001'

exec InsertAndGetAutoKey_VeDatMayBay 'DH001' , 'CB001'

exec InsertAndGetAutoKey_VeDatPhong 'DH001' 

insert into PhieuNhaHang ( MaDonHang ) 
values
('DH001');

insert NguoiThamGiaChuyenBay ( HoVaTen , SoDienThoai , Email , SoCCCD , NgaySinh , MaVeMayBay , MaSoMayBay , LoaiKhoang )
values
('Hoang Gia Bao' , '0914748951' , 'hgb@gmail.com' , '987654652003' , '2003-05-06' ,  'V001' , 'CB001' , 'Business'),
('Pham Ba Hoang' , '0901130502' , 'pbh@yahoo.com' , '987654112003' , '2003-01-01' ,  'V001' , 'CB001' , 'Business'),
('Trinh Van Han' , '0901130457' , 'tvh@gmail.com' , '987654492003' , '2003-09-04' ,  'V001' , 'CB001' , 'Business');

insert ChonPhong ( MaSoThueKhachSan , LoaiPhong , Ngay , MaDatPhong , SoLuong )
values
('K001' , 'Normal - 2 person' , '2024-01-01' , 'VDP001' , 2 );
insert ChonBan ( MaSoThueNhaHang , LoaiBan , ThoiGian , MaDatCho , SoLuong )
values
('N001' , 'Party' , '2024-01-01' , 'VDC001' ,  2);
select * from DonHang
update DonHang
set
 TinhTrangDonHang = 'Da Thanh Toan'
where MaSoTaiKhoan = 'TK001';

-- tu do tinh duoc tong tien cua 1 don hang - > co the cap nhat lai cap bac

-- trigger 2 : kiểm tra số lượng nguoithamgiachuyenbay trên 1 vé đặt <= 9

select * from NguoiThamGiaChuyenBay
delete from NguoiThamGiaChuyenBay
select * from VeDatMayBay

 INSERT INTO NguoiThamGiaChuyenBay ( HoVaTen, SoDienThoai, Email, SoCCCD, NgaySinh, MaVeMayBay, MaSoMayBay, LoaiKhoang)
VALUES
  ( 'Hoang Gia Bao', '0914748951', 'hgb@gmail.com', '111122223331', '1995-03-08', 'V001', 'CB002', 'Economy');
   INSERT INTO NguoiThamGiaChuyenBay ( HoVaTen, SoDienThoai, Email, SoCCCD, NgaySinh, MaVeMayBay, MaSoMayBay, LoaiKhoang)
VALUES
  ( 'Pham Ba Hoang', '0914748961', 'pbh@gmail.com', '111122223332', '1995-03-18', 'V001', 'CB002', 'Economy');
   INSERT INTO NguoiThamGiaChuyenBay ( HoVaTen, SoDienThoai, Email, SoCCCD, NgaySinh, MaVeMayBay, MaSoMayBay, LoaiKhoang)
VALUES
  ( 'Trinh Van Han', '0914748971', 'tvh@gmail.com', '111122223333', '1995-03-28', 'V001', 'CB002', 'Economy');
   INSERT INTO NguoiThamGiaChuyenBay ( HoVaTen, SoDienThoai, Email, SoCCCD, NgaySinh, MaVeMayBay, MaSoMayBay, LoaiKhoang)
VALUES
  ( 'Nguyen Ngoc Quy', '0901234567', 'nnq@gmail.com', '111122223334', '1995-04-08', 'V001', 'CB002', 'Economy');
   INSERT INTO NguoiThamGiaChuyenBay ( HoVaTen, SoDienThoai, Email, SoCCCD, NgaySinh, MaVeMayBay, MaSoMayBay, LoaiKhoang)
VALUES
  ( 'Hoang Gia Han', '0901234515', 'hgh@gmail.com', '111122223335', '1995-04-18', 'V001', 'CB002', 'Economy');
   INSERT INTO NguoiThamGiaChuyenBay ( HoVaTen, SoDienThoai, Email, SoCCCD, NgaySinh, MaVeMayBay, MaSoMayBay, LoaiKhoang)
VALUES
  ( 'Hoang Gia Quy', '0901234152', 'hgq@gmail.com', '111122223336', '1995-04-28', 'V001', 'CB002', 'Economy');
   INSERT INTO NguoiThamGiaChuyenBay ( HoVaTen, SoDienThoai, Email, SoCCCD, NgaySinh, MaVeMayBay, MaSoMayBay, LoaiKhoang)
VALUES
  ( 'Pham Ba Quy', '0995234567', 'pbq@gmail.com', '111122223337', '1995-05-08', 'V001', 'CB002', 'Economy');
   INSERT INTO NguoiThamGiaChuyenBay ( HoVaTen, SoDienThoai, Email, SoCCCD, NgaySinh, MaVeMayBay, MaSoMayBay, LoaiKhoang)
VALUES
  ( 'Pham Ba Han', '0901218567', 'pghan@gmail.com', '111122223338', '1995-05-18', 'V001', 'CB002', 'Economy');

     INSERT INTO NguoiThamGiaChuyenBay ( HoVaTen, SoDienThoai, Email, SoCCCD, NgaySinh, MaVeMayBay, MaSoMayBay, LoaiKhoang)
VALUES
  ( 'Pham Ba Bao', '0901231467', 'pbb@gmail.com', '111122223339', '1995-05-28', 'V001', 'CB002', 'Economy');
     INSERT INTO NguoiThamGiaChuyenBay ( HoVaTen, SoDienThoai, Email, SoCCCD, NgaySinh, MaVeMayBay, MaSoMayBay, LoaiKhoang)
VALUES
  ( 'Trinh Van Quy', '0901034567', 'tvq@gmail.com', '111122223340', '1995-06-08', 'V001', 'CB002', 'Economy');


-- Thủ Tục 1 : Kiểm tra số lượng hành khách trên từng chuyến bay được chọn theo ngày

select * from ChuyenBay
select * from KhoangTrenChuyenBay
select * from NguoiThamGiaChuyenBay
select * from HangHangKhong

-- da co dư lieu tư ChuyenBay , KhoangTrenChuyenBay , NguoiThamGiaChuyenBay , HangHangKhong, tu do co the chay lenh de thuc hien thu tuc

-- VD : exec SoluongNguoiBayTheoNgay @MaChuDV = 'TK003', @Date = '2023-12-20'

-- Thủ tục 2 : Tìm phòng khách sạn
--có thể chạy lệnh delete mà kh conflict và  data cũ 2 bảng kh còn dùng nữa
select * from KhachSan
select * from Phong
delete Phong
delete KhachSan
------ Khách sạn K003 ( trường hợp có thể đặt liên tiếp 3 ngày)
 INSERT INTO KhachSan ( MaSoThue , TenKhachSan , DiaChi , ThanhPho , SoDienThoaiLeTan , MaDichVu )
VALUES
  ('K003', 'VIP Hotel', 'Đường 123 Main ','Binh Duong', '0123456789', 'DV002');
  INSERT INTO Phong (MaSoThueKhachSan, LoaiPhong, Ngay, SoLuongCungCap, MoTa, GiaPhong)
VALUES
  ('K003', 'Suite', '2024-01-01', 5, 'Spacious suite with a view', 1500000),
  ('K003', 'Standard', '2024-01-01', 10, 'Basic room for budget travelers', 500000),
  ('K003', 'Single', '2024-01-01', 8, 'Compact room for solo travelers', 300000),
   ('K003', 'Suite', '2024-01-02', 2, 'Spacious suite with a view', 1500000),
    ('K003', 'Suite', '2024-01-03', 5, 'Spacious suite with a view', 1500000);
------ Khách sạn K004 ( trường hợp không thể đặt liên tiếp 3 ngày)
 INSERT INTO KhachSan ( MaSoThue , TenKhachSan , DiaChi , ThanhPho , SoDienThoaiLeTan , MaDichVu )
VALUES
  ('K004', 'Lotus Hotel', '123 Main Street','TPHCM', '09999999987','DV002');
  INSERT INTO Phong (MaSoThueKhachSan, LoaiPhong, Ngay, SoLuongCungCap, MoTa, GiaPhong)
VALUES
  ('K004', 'Suite', '2024-01-01', 5, 'Spacious suite with a view', 1500000),
    ('K004', 'Suite', '2023-01-03', 5, 'Spacious suite with a view', 1500000);

--Gọi thủ tục
---1 OUTPUT != Rỗng . Trả về số lượng phòng của của mỗi loại phòng mà 3 ngày đều cung cấp.
DECLARE @DateCheckIn DATE = '2024-01-01';
DECLARE @DateCheckOut DATE = '2024-01-03';
DECLARE @City VARCHAR(20) = 'Binh Duong';
EXEC TimPhongKhachSan @DateCheckIn, @DateCheckOut, @City;
---2: OUTPUT = Rỗng
DECLARE @DateCheckIn DATE = '2024-01-01';
DECLARE @DateCheckOut DATE = '2024-01-03';
DECLARE @City VARCHAR(20) = 'TPHCM';
EXEC TimPhongKhachSan @DateCheckIn, @DateCheckOut, @City;

--- Dữ liệu tạm
------ Khách sạn K005
INSERT INTO KhachSan (MaSoThue, TenKhachSan, DiaChi, SoDienThoaiLeTan, MaDichVu,ThanhPho)
VALUES
  ('K005', 'Hwei Hotel', '123 Main Street, City C', '0123456789', 'DV002','CITY C');
  INSERT INTO Phong (MaSoThueKhachSan, LoaiPhong, Ngay, SoLuongCungCap, MoTa, GiaPhong)
VALUES
  ('K005', 'Suite', '2023-03-01', 5, 'Spacious suite with a view', 1500000),
   ('K005', 'Suite', '2023-03-02', 7, 'Spacious suite with a view', 1500000),
    ('K005', 'Suite', '2023-03-03', 2, 'Spacious suite with a view', 1500000);
------ Khách sạn K006
INSERT INTO KhachSan (MaSoThue, TenKhachSan, DiaChi, SoDienThoaiLeTan, MaDichVu,ThanhPho)
VALUES
  ('K006', 'Gwen Hotel', '123 Main Street, City C', '0123456789', 'DV002','CITY C');
  INSERT INTO Phong (MaSoThueKhachSan, LoaiPhong, Ngay, SoLuongCungCap, MoTa, GiaPhong)
VALUES
  ('K006', 'VIP', '2023-03-01', 5, 'Spacious suite with a view', 2000000),
   ('K006', 'VIP', '2023-03-02', 7, 'Spacious suite with a view', 2000000),
    ('K006', 'VIP', '2023-03-03', 2, 'Spacious suite with a view', 2000000);

-- Hàm 1 : Hân làm
-- Hàm 2 : Dùng lại data cũ của chuyenbay, khoang, nguoithamgiachuyenbay, vedatmaybay
