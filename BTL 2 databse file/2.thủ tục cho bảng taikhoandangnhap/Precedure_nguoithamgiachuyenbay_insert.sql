-- FE xử lý tự lấy masovemaybay, loaikhong nó đã chọn.	
 -- mã vé thì khi người dùng click chọn chuyến bay -> generate maxvemaybay sau đó lấy mã này lên rồi đưa vào thủ tục insert nguoithamgia
CREATE PROCEDURE InsertNguoiThamGiaChuyenBay
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
        RAISERROR('Tuổi người tham gia chuyến bay phải lớn hơn hoặc bằng 18.', 16, 1);
        RETURN;
    END

    -- Kiểm tra định dạng số điện thoại
    IF LEN(@SoDienThoai) <> 11 OR @SoDienThoai NOT LIKE '[0-9]%'
    BEGIN
        RAISERROR('Số điện thoại không hợp lệ.', 16, 1);
        RETURN;
    END

    -- Kiểm tra định dạng email
    IF NOT (CHARINDEX('@', @Email) > 0 AND CHARINDEX('.', @Email, CHARINDEX('@', @Email)) > 0)
    BEGIN
        RAISERROR('Địa chỉ email không hợp lệ.', 16, 1);
        RETURN;
    END

    -- Kiểm tra các ràng buộc khác nếu cần
    -- ...

    -- Thực hiện thêm dữ liệu
    INSERT INTO NguoiThamGiaChuyenBay ( HoVaTen, SoDienThoai, Email, SoCCCD, NgaySinh, MaVeMayBay, MaSoMayBay, LoaiKhoang)
    VALUES ( @HoVaTen, @SoDienThoai, @Email, @SoCCCD, @NgaySinh, @MaVeMayBay, @MaSoMayBay, @LoaiKhoang);
END;
GO

EXEC InsertNguoiThamGiaChuyenBay
	@HoVaTen = 'Nguyen Thi E',
    @SoDienThoai = '0111223456',
    @Email = 'han@gmail.com',
    @SoCCCD = '046203008632',
    @NgaySinh = '2003-12-17',
    @MaVeMayBay = 'V00021',
    @MaSoMayBay = 'CB002',
    @LoaiKhoang = 'Business'