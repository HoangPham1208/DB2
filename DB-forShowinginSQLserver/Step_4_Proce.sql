CREATE OR ALTER PROCEDURE SoluongNguoiBayTheoNgay @Date DATE, @Start VARCHAR(20), @End VARCHAR(20), @Quantity INT
AS
BEGIN
   SELECT K.MaSoMayBay, K.LoaiKhoang, K.SoLuongGheToiDaCungCap, MAX(K.SoLuongGheToiDaCungCap) - COUNT(N.HoVaTen) AS SoLuongGheConLai
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

exec SoluongNguoiBayTheoNgay @Date = '2023-03-02', @End = 'HaNoi', @Start = 'Ho Chi Minh City', @Quantity = 19
GO



CREATE OR ALTER PROCEDURE TimPhongKhachSan (@Date DATE, @City VARCHAR(20))
AS
BEGIN
   SELECT K.TenKhachSan, P.LoaiPhong, P.SoLuongCungCap, P.GiaPhong
   FROM KhachSan K, Phong P
   WHERE K.MaSoThue = P.MaSoThueKhachSan 
   and P.Ngay = @Date 
   and K.ThanhPho = @City
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