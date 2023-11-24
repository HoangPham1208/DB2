-- Create the function for calculating the remaining seat amount
CREATE FUNCTION dbo.CalculateTotalAmountInChuyenBay(@MaSoMayBay VARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @TotalAmount INT;
    SELECT @TotalAmount = SUM(b.SoLuongGheToiDaCungCap)
    FROM ChuyenBay AS a
    JOIN KhoangChuyenBay AS b ON a.MaSo = b.MaSoMayBay 
    WHERE a.MaSo = @MaSoMayBay
    GROUP BY a.MaSo;
    RETURN ISNULL(@TotalAmount, 0);
END;

-- Add a computed column for SoLuongGheConLai in the KhoangChuyenBay table
ALTER TABLE ChuyenBay
ADD SoLuongNguoiToiDa AS dbo.CalculateTotalAmountInChuyenBay(MaSo);

select * from ChuyenBay