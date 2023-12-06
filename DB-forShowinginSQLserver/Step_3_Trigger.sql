-- Create a trigger to update customer level based on TongTien

drop trigger if exists So_Luong_Khach_Tren1Ve 
go
drop trigger if exists Tr_UpdateCustomerLevel 
go

CREATE TRIGGER Tr_UpdateCustomerLevel
ON dbo.KhachHang
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE KhachHang
    SET CapBac = CASE 
        WHEN KhachHang.TienThanhThanhToan > 3000000 THEN 'VIP 2'
        WHEN KhachHang.TienThanhThanhToan > 10000 THEN 'VIP 1'
        ELSE 'Normal'
      END
    FROM KhachHang
    INNER JOIN INSERTED ON KhachHang.MaSoTaiKhoan = INSERTED.MaSoTaiKhoan;
END;
go

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
