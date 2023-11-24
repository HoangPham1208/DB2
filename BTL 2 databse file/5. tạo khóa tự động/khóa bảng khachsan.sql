CREATE TRIGGER instead_of_insert_VeDatPhong
ON VeDatPhong
INSTEAD OF INSERT
AS
BEGIN
    -- Custom logic to generate MaSo and handle the insert
    DECLARE @nextID INT;

    -- Lấy giá trị mã số tăng dần tiếp theo cho mỗi hàng
    SELECT @nextID = COALESCE(MAX(CAST(SUBSTRING(MaDatPhong, 4, LEN(MaDatPhong) - 3) AS INT)), 0) + ROW_NUMBER() OVER (ORDER BY (SELECT NULL))
    FROM VeDatPhong;

    -- Chèn dữ liệu mới và cập nhật MaSo
    INSERT INTO VeDatPhong (MaDonHang,MaDatPhong)
    SELECT MaDonHang, 'VDP'  + RIGHT('000' + CAST(@nextID AS VARCHAR(3)), 3)
    FROM INSERTED;
END;

