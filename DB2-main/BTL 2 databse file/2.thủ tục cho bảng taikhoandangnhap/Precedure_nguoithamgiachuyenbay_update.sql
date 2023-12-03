CREATE PROCEDURE UpdateNguoiThamGiaChuyenBay
    @MaKhachHang VARCHAR(255),
    @HoVaTen VARCHAR(40),
    @SoDienThoai VARCHAR(11),
    @Email VARCHAR(255),
    @SoCCCD VARCHAR(12),
    @NgaySinh DATE,
    @MaVeMayBay VARCHAR(20),
    @MaSoMayBay VARCHAR(20),
    @LoaiKhoang VARCHAR(20)
AS
BEGIN
    -- Kiểm tra dữ liệu hợp lệ
    IF DATEDIFF(YEAR, @NgaySinh, GETDATE()) < 18
    BEGIN
        RAISEERROR('Tuổi người tham gia chuyến bay phải lớn hơn hoặc bằng 18.', 16, 1);
        RETURN;
    END

    -- Kiểm tra định dạng số điện thoại
    IF LEN(@SoDienThoai) <> 11 OR @SoDienThoai NOT LIKE '[0-9]%'
    BEGIN
        RAISEERROR('Số điện thoại không hợp lệ.', 16, 1);
        RETURN;
    END

    -- Kiểm tra định dạng email
    IF NOT (CHARINDEX('@', @Email) > 0 AND CHARINDEX('.', @Email, CHARINDEX('@', @Email)) > 0)
    BEGIN
        RAISEERROR('Địa chỉ email không hợp lệ.', 16, 1);
        RETURN;
    END

    -- Kiểm tra các ràng buộc khác nếu cần
    -- ...

    -- Thực hiện cập nhật dữ liệu
    UPDATE NguoiThamGiaChuyenBay
    SET HoVaTen = @HoVaTen,
        SoDienThoai = @SoDienThoai,
        Email = @Email,
        SoCCCD = @SoCCCD,
        NgaySinh = @NgaySinh,
        MaVeMayBay = @MaVeMayBay,
        MaSoMayBay = @MaSoMayBay,
        LoaiKhoang = @LoaiKhoang
    WHERE MaKhachHang = @MaKhachHang;
END;
