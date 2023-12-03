----------- Tong tien cua một đơn hàng

CREATE FUNCTION dbo.CalculateTotalAmount(@MaDonHang VARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @TotalAmount INT;

    SELECT @TotalAmount = SUM(b.TongTien) + SUM(c.TongTien) +SUM(d.TongTien)
    FROM DonHang AS a
    JOIN VeDatPhong AS b ON a.MaDonHang = b.MaDonHang
    JOIN PhieuNhaHang AS c ON a.MaDonHang = c.MaDonHang
	JOIN VeDatMayBay as d  ON a.MaDonHang =d.MaDonHang
    WHERE a.MaDonHang = @MaDonHang
    GROUP BY a.MaDonHang, a.MaKhachHang;
    RETURN ISNULL(@TotalAmount, 0);
END;

ALTER TABLE DonHang
ADD TongTien AS dbo.CalculateTotalAmount(MaDonHang);

select * from DonHang
