-- Create the function for calculating the remaining seat amount
CREATE FUNCTION dbo.CalculateTotalPaidAmountVeMayBay(@MaVe VARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @TotalAmount INT;
    SELECT @TotalAmount=SUM(c.GiaKhoang) +SUM(e.GiaCa*d.SoLuong)
    FROM VeDatMayBay AS a
    JOIN NguoiThamGiaChuyenBay AS b ON a.MaDatVe = b.MaVeMayBay
	JOIN KhoangTrenChuyenBay as c on b.MaSoMayBay=c.MaSoMayBay AND b.LoaiKhoang=c.LoaiKhoang
	JOIN GuiHanhLy as d on b.MaKhachHang=d.MaNguoiThamGiaChuyenBay 
	JOIN HanhLy as e on d.LoaiHanhLyKyGui=e.LoaiHanhLyKyGui AND d.MaSoMayBay=e.MaSoMayBay
    WHERE a.MaDatVe = @MaVe
    GROUP BY a.MaDatVe;
    RETURN ISNULL(@TotalAmount, 0);
END;

-- Add a computed column for SoLuongGheConLai in the KhoangChuyenBay table

ALTER TABLE VeDatMayBay
ADD TongTien AS dbo.CalculateTotalPaidAmountVeMayBay(MaDatVe);
select * from VeDatMayBay

