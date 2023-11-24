-- Create the function for calculating the remaining seat amount
CREATE FUNCTION dbo.CalculateToTalLeftAmountPhong(@MaSoThueKhachSan VARCHAR(20),@LoaiPhong VARCHAR(20),@Ngay DATE)
RETURNS INT
AS
BEGIN
    DECLARE @TotalLeftAmount INT;
    SELECT @TotalLeftAmount = MAX(a.SoLuongCungCap) - COUNT(*)
    FROM Phong AS a
    WHERE a.MaSoThueKhachSan = @MaSoThueKhachSan AND a.LoaiPhong=@LoaiPhong AND a.Ngay=@Ngay
    GROUP BY a.MaSoThueKhachSan, a.LoaiPhong,a.Ngay;
    RETURN ISNULL(@TotalLeftAmount, 0);
END;

-- Add a computed column for SoLuongGheConLai in the KhoangChuyenBay table
ALTER TABLE Phong
ADD SoLuongPhongConLai AS dbo.CalculateToTalLeftAmountPhong(MaSoThueKhachSan, LoaiPhong,Ngay);

select * from Phong