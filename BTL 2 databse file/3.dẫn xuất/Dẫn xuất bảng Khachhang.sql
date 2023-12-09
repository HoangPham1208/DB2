-- Create a function for calculating the total amount for a KhachHang
CREATE FUNCTION dbo.CalculateTotalAmountPaid(@MaSoTaiKhoan VARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @TotalAmount INT;

    SELECT @TotalAmount = SUM(C.GiaKhoang)
    FROM VeDatMayBay AS a
    JOIN NguoiThamGiaChuyenBay AS b ON a.MaDatVe = b.MaVeMayBay
    JOIN KhoangTrenChuyenBay AS c ON b.MaSoMayBay = c.MaSoMayBay AND b.LoaiKhoang = c.LoaiKhoang
    JOIN DonHang AS d ON a.MaDonHang = d.MaDonHang
    WHERE d.MaKhachHang = @MaSoTaiKhoan AND d.TinhTrangDonHang='ThanhCong'
    GROUP BY d.MaKhachHang;
    RETURN ISNULL(@TotalAmount,0);
END;

-- Add a computed column for TongTien in the KhachHang table
ALTER TABLE KhachHang
ADD TienThanhThanhToan AS dbo.CalculateTotalAmountPaid(MaSoTaiKhoan);
