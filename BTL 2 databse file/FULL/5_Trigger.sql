CREATE TRIGGER So_Luong_Khach_Tren1Ve
ON dbo.NguoiThamGiaChuyenBay  
AFTER INSERT
AS 
BEGIN
    DECLARE @max_passengers_per_MaVe INT = 9;

    IF EXISTS (
        SELECT 1
        FROM (
            SELECT MaVeMayBay, COUNT(*) AS PassengerCount
            FROM NguoiThamGiaChuyenBay
            GROUP BY MaVeMayBay
        ) AS VeCounts
        WHERE PassengerCount > @max_passengers_per_MaVe
    )
    BEGIN
        DELETE FROM dbo.NguoiThamGiaChuyenBay
        WHERE MaKhachHang IN (SELECT MaKhachHang FROM INSERTED);
        RAISERROR('Số hành khách vượt cùng loại vé đã quá 9 người.', 16, 1);
    END;
END;
go
-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER So_luong_hanh_ly_max
   ON  GuiHanhLy
   AFTER INSERT
AS 
BEGIN
  DECLARE @max_passengers_per_MaVe INT = 9;
  IF EXISTS (
      SELECT 1
      FROM (
          SELECT MaSoMayBay,MaNguoiThamGiaChuyenBay, sum(SoLuong) AS PassengerCount
          FROM GuiHanhLy
          GROUP BY MaSoMayBay,MaNguoiThamGiaChuyenBay
      ) AS VeCounts
      WHERE PassengerCount > @max_passengers_per_MaVe
  )

  BEGIN
DELETE FROM b
FROM GuiHanhLy as b
WHERE EXISTS  (
    SELECT a.MaSoMayBay, a.MaNguoiThamGiaChuyenBay
    FROM GuiHanhLy as a
    WHERE a.MaSoMayBay = b.MaSoMayBay
      AND a.MaNguoiThamGiaChuyenBay = b.MaNguoiThamGiaChuyenBay
    GROUP BY a.MaSoMayBay, a.MaNguoiThamGiaChuyenBay
    HAVING SUM(a.SoLuong) > 9
);
    RAISERROR('Số lượng hành lý đã quá 9 kiện.', 16, 1);
  END;
END;

  go
  CREATE TRIGGER Tr_UpdateCustomerLevel
ON DonHang
AFTER UPDATE
AS
BEGIN
  SET NOCOUNT ON;

  UPDATE KhachHang
  SET CapBac = 
      CASE 
        WHEN a.TienDaThanhToan > 10000000 THEN 'VIP 2'
        WHEN a.TienDaThanhToan > 3000000 THEN 'VIP 1'
        ELSE 'Normal'
      END
  FROM KhachHang as a join DonHang as b on a.MaSoTaiKhoan=b.MaKhachHang
  WHERE b.TinhTrangDonHang='Đã thanh toán'
  
END;
select * from KhachHang
select * from DonHang
select * from KhoangTrenChuyenBay

  -- Update customer level based on total order amount
go

CREATE TRIGGER delete_NguoiThamGiaChuyenBay
ON dbo.NguoiThamGiaChuyenBay
AFTER DELETE 
AS 
BEGIN 
    IF EXISTS (
		select * from VeDatMayBay FULL OUTER JOIN NguoiThamGiaChuyenBay on VeDatMayBay.MaDatVe = NguoiThamGiaChuyenBay.MaVeMayBay
		where VeDatMayBay.TongTien = 0
	)
	BEGIN 
		DELETE FROM dbo.VeDatMayBay
		WHERE MaDatVe IN ( select MaVeMayBay from deleted)
	END
END;
go
CREATE TRIGGER trg_AutoAddKhachHang
ON TaiKhoanDangNhap
AFTER INSERT
AS
BEGIN
  SET NOCOUNT ON;

  INSERT INTO KhachHang (MaSoTaiKhoan, CapBac)
  SELECT MaSo, 'Normal'
  FROM inserted;
END;
go