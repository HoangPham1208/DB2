CREATE TRIGGER trg_AutoAddKhachHang
ON TaiKhoanDangNhap
AFTER INSERT
AS
BEGIN
  SET NOCOUNT ON;

  INSERT INTO KhachHang (MaSoTaiKhoan, CapBac)
  SELECT MaSo, 'Normal'
  FROM inserted;
END;