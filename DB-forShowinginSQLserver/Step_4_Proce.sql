CREATE OR ALTER PROCEDURE SoluongNguoiBayTheoNgay @Date DATE, @Start VARCHAR(20), @End VARCHAR(20), @Quantity INT
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
   GROUP BY K.MaSoMayBay, K.LoaiKhoang, K.GiaKhoang, K.MoTa, K.SoLuongGheToiDaCungCap
   HAVING MAX(K.SoLuongGheToiDaCungCap) - COUNT(N.HoVaTen) >= @Quantity
   ORDER BY SoLuongGheConLai
END
GO

/*exec SoluongNguoiBayTheoNgay @Date = '2023-03-02', @End = 'HaNoi', @Start = 'Ho Chi Minh City', @Quantity = 19
GO*/



select * from ChuyenBay
select * from NguoiThamGiaChuyenBay
select * from KhoangTrenChuyenBay

INSERT INTO NguoiThamGiaChuyenBay ( HoVaTen, SoDienThoai, Email, SoCCCD, NgaySinh, MaVeMayBay, MaSoMayBay, LoaiKhoang)
VALUES
  ( 'Tran Thi B', '0987654321', 'tranb@yahoo.com', '987654321098', '1988-10-20', 'V001', 'CB001', 'Business');
  INSERT INTO NguoiThamGiaChuyenBay ( HoVaTen, SoDienThoai, Email, SoCCCD, NgaySinh, MaVeMayBay, MaSoMayBay, LoaiKhoang)
VALUES
  ( 'Le Van C', '0901234567', 'lecv@gmail.com', '111122223333', '1995-03-08', 'A002', 'CB002', 'Economy');
go

CREATE OR ALTER PROCEDURE TimPhongKhachSan (@DateCheckIn DATE,@DateCheckOut DATE, @City VARCHAR(20))
AS
BEGIN
   declare @period INT=DATEDIFF(DAY, @DateCheckIn, @DateCheckOut); 
   SELECT P.MaSoThueKhachSan, K.TenKhachSan, P.LoaiPhong, P.GiaPhong,min(P.SoLuongCungCap) as SoLuongCungCap
   FROM KhachSan K, Phong P
   WHERE K.MaSoThue = P.MaSoThueKhachSan and P.Ngay >= @DateCheckIn AND  P.Ngay <= @DateCheckOut and K.ThanhPho = @City
   GROUP BY  P.MaSoThueKhachSan, K.TenKhachSan, P.LoaiPhong, P.GiaPhong
   having count(*)> @period
   ORDER BY P.GiaPhong ASC
END
go
-- exec TimPhongKhachSan @Date = '2023-03-02', @City = 'City B'
/*
  INSERT INTO KhachSan (MaSoThue, TenKhachSan, DiaChi, ThanhPho, SoDienThoaiLeTan, MaDichVu)
VALUES
  ('KS001', 'Luxury Hotel', '123 Main Street', 'City A', '0123456789', 'DV002'),
  ('KS002', 'Budget Inn1', '456 Side Street', 'City B', '0987654321', 'DV002'),
  ('KS003', 'Budget Inn2', '456 Side Street', 'City B', '0987654321', 'DV002'),
  ('KS004', 'Budget Inn3', '456 Side Street', 'City B', '0987654321', 'DV002');


-- Sample data for Phong
INSERT INTO Phong (MaSoThueKhachSan, LoaiPhong, Ngay, SoLuongCungCap, MoTa, GiaPhong)
VALUES
  ('KS001', 'Suite', '2023-03-01', 5, 'Spacious suite with a view', 1500000),
  ('KS001', 'Standard', '2023-03-01', 10, 'Basic room for budget travelers', 500000),
  ('KS002', 'Single', '2023-03-02', 8, 'Compact room for solo travelers', 300000),
  ('KS002', 'Standard', '2023-03-02', 9, 'Compact room for solo travelers', 300000),
  ('KS002', 'Couple', '2023-03-02', 10, 'Compact room for solo travelers', 300000),
  ('KS002', 'Suite', '2023-03-02', 0, 'Compact room for solo travelers', 300000)

-- Sample data for VeDatPhong

CREATE TABLE KhachSan (
  MaSoThue VARCHAR(10) NOT NULL,
  TenKhachSan VARCHAR(50) NOT NULL,
  DiaChi VARCHAR(50) NOT NULL,
  ThanhPho VARCHAR(20) NOT NULL,
  SoDienThoaiLeTan VARCHAR(11) NOT NULL,
  MaDichVu VARCHAR(20) NOT NULL,
  PRIMARY KEY (MaSoThue)
);

CREATE TABLE Phong (
  MaSoThueKhachSan VARCHAR(10) NOT NULL,
  LoaiPhong VARCHAR(20) NOT NULL,
  Ngay DATE NOT NULL,
  SoLuongCungCap INT NOT NULL,
  MoTa VARCHAR(255) ,
  GiaPhong DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (MaSoThueKhachSan, LoaiPhong, Ngay),
  FOREIGN KEY (MaSoThueKhachSan) REFERENCES KhachSan(MaSoThue)
);
*/
