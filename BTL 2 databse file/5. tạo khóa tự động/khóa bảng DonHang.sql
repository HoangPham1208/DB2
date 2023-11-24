CREATE TRIGGER instead_of_insert_DonHang
ON DonHang
INSTEAD OF INSERT
AS
BEGIN
    -- Custom logic to generate MaDonHang and handle the insert
    DECLARE @nextID INT;

    -- Lấy giá trị mã số tăng dần tiếp theo cho mỗi hàng
    SELECT @nextID = COALESCE(MAX(CAST(SUBSTRING(td.MaDonHang, 3, LEN(td.MaDonHang) - 2) AS INT)), 0) + ROW_NUMBER() OVER (ORDER BY (SELECT NULL))
    FROM DonHang td
    CROSS JOIN INSERTED;

    -- Chèn dữ liệu mới và cập nhật MaDonHang
    INSERT INTO DonHang(TinhTrangDonHang, HinhThucThanhToan, MaKhachHang,NgayGiaoDich,TaiKhoanNganHang,MaNhanVienHoTro,  MaDonHang)
    SELECT TinhTrangDonHang, HinhThucThanhToan, MaKhachHang,NgayGiaoDich,TaiKhoanNganHang,MaNhanVienHoTro, 'DH' + RIGHT('000' + CAST(@nextID AS VARCHAR(3)), 3)
    FROM INSERTED;
END;
select * from DonHang
