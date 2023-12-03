CREATE PROCEDURE DeleteTaiKhoanDangNhap
    @MaSo VARCHAR(20)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM TaiKhoanDangNhap WHERE MaSo = @MaSo)
    BEGIN
        RAISERROR ('Không tồn tại hàng cần xóa trong bảng.', 16, 1)
        RETURN;
    END
    DELETE FROM TaiKhoanDangNhap WHERE MaSo = @MaSo;
END;
