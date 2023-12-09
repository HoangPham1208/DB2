CREATE FUNCTION dbo.CalculateTotalAmount(@MaDonHang VARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @TotalAmount INT;

    SELECT @TotalAmount = SUM(C.GiaKhoang)
    FROM VeDatMayBay AS a
    JOIN NguoiThamGiaChuyenBay AS b ON a.MaDatVe = b.MaVeMayBay
    JOIN KhoangTrenChuyenBay AS c ON b.MaSoMayBay = c.MaSoMayBay AND b.LoaiKhoang = c.LoaiKhoang
    JOIN DonHang AS d ON a.MaDonHang = d.MaDonHang
    WHERE d.MaDonHang = @MaDonHang
    GROUP BY d.MaDonHang, d.MaKhachHang;
    RETURN ISNULL(@TotalAmount, 0);
END;
ALTER TABLE DonHang
ADD TongTien AS dbo.CalculateTotalAmount(DonHang.MaDonHang)
