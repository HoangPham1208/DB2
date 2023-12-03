-- Create the function for calculating the remaining seat amount
CREATE FUNCTION dbo.CalculateToTalLeftAmountBan(@MaSoThueNhaHang VARCHAR(20),@LoaiBan VARCHAR(20),@ThoiGian DATE)
RETURNS INT
AS
BEGIN
    DECLARE @TotalLeftAmount INT;
    SELECT @TotalLeftAmount = MAX(a.SoLuongCungCap) - COUNT(*)
    FROM Ban AS a
    WHERE a.MaSoThueNhaHang = @MaSoThueNhaHang AND a.LoaiBan=@LoaiBan AND a.ThoiGian=@ThoiGian
    GROUP BY a.MaSoThueNhaHang, a.LoaiBan,a.ThoiGian;
    RETURN ISNULL(@TotalLeftAmount, 0);
END;

-- Add a computed column for SoLuongGheConLai in the KhoangChuyenBay table
ALTER TABLE Ban
ADD SoLuongBanConLai AS dbo.CalculateToTalLeftAmountBan(MaSoThueNhaHang, LoaiBan,ThoiGian);

select * from Ban