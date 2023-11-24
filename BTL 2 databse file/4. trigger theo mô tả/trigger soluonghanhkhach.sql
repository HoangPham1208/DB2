-- ================================================
-- This template generate automatically by SQL Server when click create new trigger.
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
--GRANT SELECT ON dbo.Testtrigger TO public;
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

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
    DELETE FROM VeDatMayBay
    WHERE MaDatVe IN ( SELECT MaVeMayBay
          FROM NguoiThamGiaChuyenBay
          GROUP BY MaVeMayBay
		  HAVING COUNT(*)> @max_passengers_per_MaVe)
    RAISERROR('Số hành khách vượt cùng loại vé đã quá 9 người.', 16, 1);
  END;
END;


