GO
CREATE OR ALTER FUNCTION TimChuyenBay 
(
	@Date DATE, 
	@Start VARCHAR(50), 
	@End VARCHAR(50), 
	@Airline VARCHAR(50)
)
RETURNS TABLE
AS
RETURN
(
	SELECT C.MaSo, H.TenHang, C.ThoiGianXuatPhat, C.ThoiGianHaCanh, C.DiaDiemXuatPhat, C.DiaDiemHaCanh 
	FROM ChuyenBay C, HangHangKhong H
	WHERE C.MaSoThueCuaHangHangKhong = H.MaSoThue 
		AND C.DiaDiemHaCanh = @End
		AND C.DiaDiemXuatPhat = @Start
		AND CONVERT(DATE, C.ThoiGianXuatPhat) = @Date
		AND (@Airline IS NULL OR H.TenHang = @Airline)
)
GO

select * from TimChuyenBay('2023-03-01', 'HaNoi', 'Ho Chi Minh City', 'Vietnam Airlines')
GO
DROP PROCEDURE TimChuyenBay

select * from ChuyenBay
select * from HangHangKhong
