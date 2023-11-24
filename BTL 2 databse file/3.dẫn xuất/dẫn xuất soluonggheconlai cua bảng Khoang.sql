-- Create the function for calculating the remaining seat amount
CREATE FUNCTION dbo.CalculateSeatLeftAmount(@MaSoMayBay VARCHAR(20), @LoaiKhoang VARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @TotalLeftAmount INT;

    SELECT @TotalLeftAmount = MAX(a.SoLuongGheToiDaCungCap) - COUNT(*)
    FROM KhoangChuyenBay AS a
    JOIN NguoiThamGiaChuyenBay AS b ON a.LoaiKhoang = b.LoaiKhoang AND a.MaSoMayBay = b.MaSoMayBay
    WHERE a.MaSoMayBay = @MaSoMayBay AND a.LoaiKhoang = @LoaiKhoang
    GROUP BY a.MaSoMayBay, a.LoaiKhoang;

    RETURN ISNULL(@TotalLeftAmount, 0);
END;

-- Add a computed column for SoLuongGheConLai in the KhoangChuyenBay table
ALTER TABLE KhoangChuyenBay
ADD SoLuongGheConLai AS dbo.CalculateSeatLeftAmount(MaSoMayBay, LoaiKhoang);

select * from KhoangChuyenBay