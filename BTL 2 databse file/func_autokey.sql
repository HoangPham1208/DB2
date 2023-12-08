CREATE OR ALTER PROCEDURE InsertAndGetAutoKey_VeDatMayBay
(
    @MaDonHang VARCHAR(20),
    @MaSoChuyenBay VARCHAR(20)
)
AS
BEGIN
    DECLARE @NextID INT;

    WITH CTE AS (
        SELECT 
            COALESCE(MAX(CAST(SUBSTRING(MaDatVe, 2, LEN(MaDatVe) - 1) AS INT)), 0) + ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS NextID
        FROM VeDatMayBay
    )
    SELECT @NextID = NextID FROM CTE;

	SELECT 'V00' + CAST(@NextID AS VARCHAR(3));

    INSERT INTO VeDatMayBay (MaDonHang, MaSoChuyenBay, MaDatVe)
    VALUES (
        @MaDonHang,
        @MaSoChuyenBay,
        'V00' + CAST(@NextID AS VARCHAR(3))
    );

	
END;
GO
select * from NguoiThamGiaChuyenBay N where N.MaVeMayBay = 'V004' 
go
delete from NguoiThamGiaChuyenBay where NguoiThamGiaChuyenBay.MaVeMayBay = 'V004'
go
EXEC InsertAndGetAutoKey_VeDatMayBay @MaDonHang = 'DH001', @MaSoChuyenBay = 'CB002'
GO

select * from VeDatMayBay
go

CREATE OR ALTER PROCEDURE InsertAndGetAutoKey_DonHang
(
    @MaKhachHang VARCHAR(255),
    @GeneratedKey VARCHAR(255) OUTPUT
)
AS
BEGIN
    DECLARE @nextID INT;

    -- Lấy giá trị mã số tăng dần tiếp theo cho mỗi hàng
    SELECT @nextID = COALESCE(MAX(CAST(SUBSTRING(td.MaDonHang, 3, LEN(td.MaDonHang) - 2) AS INT)), 0) + ROW_NUMBER() OVER (ORDER BY (SELECT NULL))
    FROM DonHang td

    -- Chèn dữ liệu mới và cập nhật MaDonHang
    INSERT INTO DonHang(TinhTrangDonHang, HinhThucThanhToan, MaKhachHang, NgayGiaoDich, TaiKhoanNganHang, MaNhanVienHoTro, MaDonHang)
    VALUES ('Chưa xác nhận', 'Vietcombank', @MaKhachHang, GETDATE(), '','', 'DH' + RIGHT('000' + CAST(@nextID AS VARCHAR(3)), 3);

    -- Trả về khóa được tạo tự động
    SET @GeneratedKey = 'DH' + RIGHT('000' + CAST(@nextID AS VARCHAR(3)), 3);
END;

DECLARE @GeneratedKey2 VARCHAR(255);
EXEC InsertAndGetAutoKey_DonHang 
    @MaKhachHang = 'exampleMaKhachHang',
    @GeneratedKey = @GeneratedKey2 OUTPUT;