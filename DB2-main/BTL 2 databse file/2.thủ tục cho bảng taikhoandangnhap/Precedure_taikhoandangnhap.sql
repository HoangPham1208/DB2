CREATE PROCEDURE InsertTaiKhoanDangNhap
    @Ho VARCHAR(20),
    @TenDem VARCHAR(20),
    @Ten VARCHAR(20),
    @NgaySinh DATE,
    @GioiTinh CHAR(1),
    @SoCCCD VARCHAR(12)
AS
BEGIN
    IF @NgaySinh > GETDATE()
    BEGIN
        RAISERROR ('Ngày sinh không thể là tương lai.', 16, 1)
        RETURN;
    END
	IF NOT (@GioiTinh IN ('F', 'M'))
    BEGIN
        RAISERROR ('Giới tính nhập vào phải là M hoặc F', 16, 1)
        RETURN;
    END
	IF ( DATALENGTH(@SoCCCD) <>12 )
	BEGIN 
		RAISERROR('Phải nhập số CCCD đủ 12 kí tự',16,1)
		RETURN;
		END;
	 IF PATINDEX('%[^0-9]%', @SoCCCD) > 0
    BEGIN
        RAISERROR ('Số CCCD chỉ được chưa các kí tự là số.', 16, 1)
        RETURN;
    END
    INSERT INTO TaiKhoanDangNhap( Ho, TenDem, Ten, NgaySinh, GioiTinh, SoCCCD)
    VALUES ( @Ho, @TenDem, @Ten, @NgaySinh, @GioiTinh, @SoCCCD);
END;