CREATE TRIGGER instead_of_insert_VeDatMayBay
ON VeDatMayBay
INSTEAD OF INSERT
AS
BEGIN
    -- Custom logic to generate MaDatVe and handle the insert
    DECLARE @nextID INT;
    DECLARE @prefix VARCHAR(1);
    DECLARE @flightNumber INT;
    DECLARE @origin CHAR(1);
    DECLARE @destination CHAR(1);

    -- Lấy giá trị mã số tăng dần tiếp theo cho mỗi hàng
    SELECT @nextID = COALESCE(MAX(CAST(SUBSTRING(MaDatVe, 2, LEN(MaDatVe) - 1) AS INT)), 0) + ROW_NUMBER() OVER (ORDER BY (SELECT NULL))
    FROM VeDatMayBay;

    -- Lấy thông tin từ bảng ChuyenBay
    SELECT TOP 1
        @prefix = LEFT(a.TenHang, 1)
    FROM INSERTED i
    INNER JOIN ChuyenBay ch ON i.MaSoChuyenBay = ch.MaSo
    INNER JOIN HangHangKhong a ON ch.MaSoThueCuaHangHangKhong = a.MaSoThue;

    -- Chèn dữ liệu mới và cập nhật MaVeMayBay
    INSERT INTO VeDatMayBay (MaDonHang, MaSoChuyenBay, MaDatVe)
    SELECT MaDonHang, MaSoChuyenBay, @prefix +  + RIGHT('000' + CAST(@nextID AS VARCHAR(3)), 3)
    FROM INSERTED;
END;
