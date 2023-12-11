-- Create the function for calculating the remaining seat amount
go
CREATE FUNCTION dbo.TenKhachSanVeDatPhong(@MaDatPhong VARCHAR(20))
RETURNS VARCHAR
AS
BEGIN
    DECLARE @TenKhachSan VARCHAR(50);
    SELECT @TenKhachSan = d.TenKhachSan
    FROM VeDatPhong AS a join ChonPhong as b on a.MaDatPhong=b.MaDatPhong
	JOIN Phong as c on b.MaSoThueKhachSan=c.MaSoThueKhachSan AND b.LoaiPhong=c.LoaiPhong AND b.Ngay=c.Ngay
	JOIN KhachSan as d on d.MaSoThue=c.MaSoThueKhachSan
    WHERE a.MaDatPhong = @MaDatPhong
    RETURN ISNULL(@TenKhachSan, '');
END;
go

-- Add a computed column for SoLuongGheConLai in the KhoangChuyenBay table
ALTER TABLE VeDatPhong
ADD TenKhachSan AS dbo.TenKhachSanVeDatPhong(MaDatPhong);

select * from VeDatPhong
go
-- Create the function for calculating the remaining seat amount
CREATE FUNCTION dbo.TenNhaHangPhieuNhaHang(@MaDatCho VARCHAR(20))
RETURNS VARCHAR
AS
BEGIN
    DECLARE @TenNhaHang VARCHAR(50);
    SELECT @TenNhaHang = d.TenNhaHang
    FROM PhieuNhaHang AS a join ChonBan as b on a.MaDatCho=b.MaDatCho
	JOIN Ban as c on b.MaSoThueNhaHang=c.MaSoThueNhaHang AND b.LoaiBan=c.LoaiBan AND b.ThoiGian=c.ThoiGian
	JOIN NhaHang as d on d.MaSoThue=c.MaSoThueNhaHang
    WHERE a.MaDatCho = @MaDatCho
    RETURN ISNULL(@TenNhaHang, '');
END;
go
-- Add a computed column for SoLuongGheConLai in the KhoangChuyenBay table
ALTER TABLE PhieuNhaHang
ADD TenNhaHang AS dbo.TenNhaHangPhieuNhaHang(MaDatCho);

select * from PhieuNhaHang
go 
-- Create the function for calculating the remaining seat amount
CREATE FUNCTION dbo.DiaChiPhieuNhaHang(@MaDatCho VARCHAR(20))
RETURNS VARCHAR
AS
BEGIN
    DECLARE @DiaChi VARCHAR(50);
    SELECT @DiaChi = d.DiaChi
    FROM PhieuNhaHang AS a join ChonBan as b on a.MaDatCho=b.MaDatCho
	JOIN Ban as c on b.MaSoThueNhaHang=c.MaSoThueNhaHang AND b.LoaiBan=c.LoaiBan AND b.ThoiGian=c.ThoiGian
	JOIN NhaHang as d on d.MaSoThue=c.MaSoThueNhaHang
    WHERE a.MaDatCho = @MaDatCho
    RETURN ISNULL(@DiaChi, '');
END;
go
-- Add a computed column for SoLuongGheConLai in the KhoangChuyenBay table
ALTER TABLE PhieuNhaHang
ADD DiaChi AS dbo.DiaChiPhieuNhaHang(MaDatCho);

select * from PhieuNhaHang
go 
-- Create the function for calculating the remaining seat amount
CREATE FUNCTION dbo.DiaChiVeDatPhong(@MaDatPhong VARCHAR(20))
RETURNS VARCHAR
AS
BEGIN
    DECLARE @DiaChi VARCHAR(50);
    SELECT @DiaChi = d.DiaChi
    FROM VeDatPhong AS a join ChonPhong as b on a.MaDatPhong=b.MaDatPhong
	JOIN Phong as c on b.MaSoThueKhachSan=c.MaSoThueKhachSan AND b.LoaiPhong=c.LoaiPhong AND b.Ngay=c.Ngay
	JOIN KhachSan as d on d.MaSoThue=c.MaSoThueKhachSan
    WHERE a.MaDatPhong = @MaDatPhong
    RETURN ISNULL(@DiaChi, '');
END;
go
-- Add a computed column for SoLuongGheConLai in the KhoangChuyenBay table
ALTER TABLE VeDatPhong
ADD DiaChi AS dbo.DiaChiVeDatPhong(MaDatPhong);

select * from VeDatPhong    
go    
CREATE FUNCTION dbo.CalculateSeatLeftAmount(@MaSoMayBay VARCHAR(20), @LoaiKhoang VARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @TotalLeftAmount INT;
	DECLARE @SoLuongGheToiDaCungCap INT
    SELECT @TotalLeftAmount = ISNULL(a.SoLuongGheToiDaCungCap, a.SoLuongGheToiDaCungCap) - ISNULL(Count(*), 0)
    FROM KhoangTrenChuyenBay AS a
    JOIN NguoiThamGiaChuyenBay AS b ON a.LoaiKhoang = b.LoaiKhoang AND a.MaSoMayBay = b.MaSoMayBay
    WHERE a.MaSoMayBay = @MaSoMayBay AND a.LoaiKhoang = @LoaiKhoang
    GROUP BY a.MaSoMayBay, a.LoaiKhoang,a.SoLuongGheToiDaCungCap;
	select @SoLuongGheToiDaCungCap = c.SoLuongGheToiDaCungCap from KhoangTrenChuyenBay as c where c.MaSoMayBay=@MaSoMayBay AND c.LoaiKhoang=@LoaiKhoang;
    RETURN ISNULL(@TotalLeftAmount, @SoLuongGheToiDaCungCap);
END;
go
-- Add a computed column for SoLuongGheConLai in the KhoangTrenChuyenBay table
ALTER TABLE KhoangTrenChuyenBay
ADD SoLuongGheConLai AS dbo.CalculateSeatLeftAmount(MaSoMayBay, LoaiKhoang);
go  
-- Create the function for calculating the remaining seat amount
CREATE FUNCTION dbo.CalculateToTalLeftAmountBan(@MaSoThueNhaHang VARCHAR(20),@LoaiBan VARCHAR(20),@ThoiGian DATE)
RETURNS INT
AS
BEGIN
    DECLARE @TotalLeftAmount INT;
    SELECT @TotalLeftAmount = ISNULL(a.SoLuongCungCap, 0) - ISNULL(b.SoLuong, 0)
    FROM Ban AS a left join ChonBan as b on a.MaSoThueNhaHang=b.MaSoThueNhaHang AND a.LoaiBan=b.LoaiBan AND a.ThoiGian=b.ThoiGian
    WHERE a.MaSoThueNhaHang = @MaSoThueNhaHang AND a.LoaiBan=@LoaiBan AND a.ThoiGian=@ThoiGian
    RETURN ISNULL(@TotalLeftAmount, 0);
END;
go
-- Add a computed column for SoLuongGheConLai in the KhoangChuyenBay table
ALTER TABLE Ban
ADD SoLuongBanConLai AS dbo.CalculateToTalLeftAmountBan(MaSoThueNhaHang, LoaiBan,ThoiGian);
go 
CREATE FUNCTION dbo.CalculateTotalAmountInChuyenBay(@MaSoMayBay VARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @TotalAmount INT;
    SELECT @TotalAmount = SUM(b.SoLuongGheToiDaCungCap)
    FROM ChuyenBay AS a
    JOIN KhoangTrenChuyenBay AS b ON a.MaSo = b.MaSoMayBay 
    WHERE a.MaSo = @MaSoMayBay
    GROUP BY a.MaSo;
    RETURN ISNULL(@TotalAmount, 0);
END;
go
ALTER TABLE ChuyenBay
ADD SoLuongNguoiToiDa AS dbo.CalculateTotalAmountInChuyenBay(MaSo);

select * from ChuyenBay
go 
CREATE FUNCTION dbo.CalculateToTalLeftAmountPhong(@MaSoThueKhachSan VARCHAR(20),@LoaiPhong VARCHAR(20),@Ngay DATE)
RETURNS INT
AS
BEGIN
    DECLARE @TotalLeftAmount INT;
    SELECT @TotalLeftAmount = ISNULL(a.SoLuongCungCap, 0) - ISNULL(b.SoLuong, 0)
    FROM Phong AS a left join ChonPhong as b on a.MaSoThueKhachSan=b.MaSoThueKhachSan AND a.LoaiPhong=b.LoaiPhong AND a.Ngay=b.Ngay
    WHERE a.MaSoThueKhachSan = @MaSoThueKhachSan AND a.LoaiPhong=@LoaiPhong AND a.Ngay=@Ngay
    RETURN ISNULL(@TotalLeftAmount, 0);
END;
go
-- Add a computed column for SoLuongGheConLai in the KhoangChuyenBay table
ALTER TABLE Phong
ADD SoLuongPhongConLai AS dbo.CalculateToTalLeftAmountPhong(MaSoThueKhachSan, LoaiPhong,Ngay);
go 
CREATE FUNCTION dbo.CalculateTotalPaidAmountVeMayBay(@MaVe VARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @TotalAmount INT;
    SELECT @TotalAmount=COALESCE(SUM(c.GiaKhoang), 0) + COALESCE(SUM(e.GiaCa * d.SoLuong), 0)
    FROM VeDatMayBay AS a
    JOIN NguoiThamGiaChuyenBay AS b ON a.MaDatVe = b.MaVeMayBay
	JOIN KhoangTrenChuyenBay as c on b.MaSoMayBay=c.MaSoMayBay AND b.LoaiKhoang=c.LoaiKhoang
	FULL OUTER JOIN GuiHanhLy as d on b.MaKhachHang=d.MaNguoiThamGiaChuyenBay 
	FULL OUTER JOIN HanhLy as e on d.LoaiHanhLyKyGui=e.LoaiHanhLyKyGui AND d.MaSoMayBay=e.MaSoMayBay
    WHERE a.MaDatVe = @MaVe AND a.MaDatVe is not null
    GROUP BY a.MaDatVe;
    RETURN ISNULL(@TotalAmount, 0);
END;
go

ALTER TABLE VeDatMayBay
ADD TongTien AS dbo.CalculateTotalPaidAmountVeMayBay(MaDatVe);
select * from VeDatMayBay
--select * from GuiHanhLy
go 
-- Create the function for calculating the remaining seat amount
CREATE FUNCTION dbo.CalculateTotalPaidAmountVeDatPhong(@MaDatPhong VARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @TotalAmount INT;
    SELECT @TotalAmount=SUM(c.GiaPhong)
    FROM VeDatPhong AS a
    JOIN ChonPhong AS b ON a.MaDatPhong = b.MaDatPhong 
	JOIN Phong as c on b.MaSoThueKhachSan=c.MaSoThueKhachSan AND b.LoaiPhong=c.LoaiPhong AND b.Ngay=c.Ngay
    WHERE a.MaDatPhong = @MaDatPhong
    GROUP BY a.MaDatPhong;
    RETURN ISNULL(@TotalAmount, 0);
END;
go
-- Add a computed column for SoLuongGheConLai in the KhoangChuyenBay table
ALTER TABLE VeDatPhong
ADD TongTien AS dbo.CalculateTotalPaidAmountVeDatPhong(MaDatPhong);

select * from VeDatPhong


go 
-- Create the function for calculating the remaining seat amount
CREATE FUNCTION dbo.CalculateTotalPaidAmountPhieuNhaHang(@MaDatCho VARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @TotalAmount INT;
    SELECT @TotalAmount=SUM(c.Gia)
    FROM PhieuNhaHang AS a
    JOIN ChonBan AS b ON a.MaDatCho = b.MaDatCho 
	JOIN Ban as c on b.MaSoThueNhaHang=c.MaSoThueNhaHang AND b.LoaiBan=c.LoaiBan AND b.ThoiGian=c.ThoiGian
    WHERE a.MaDatCho = @MaDatCho
    GROUP BY a.MaDatCho;
    RETURN ISNULL(@TotalAmount, 0);
END;
go
-- Add a computed column for SoLuongGheConLai in the KhoangChuyenBay table
ALTER TABLE PhieuNhaHang
ADD TongTien AS dbo.CalculateTotalPaidAmountPhieuNhaHang(MaDatCho);


select * from PhieuNhaHang

----------- Tong tien cua một đơn hàng
go
CREATE FUNCTION dbo.CalculateTotalAmount(@MaDonHang VARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @TotalAmount1 INT;
	DECLARE @TotalAmount2 INT;
	DECLARE @TotalAmount3 INT;
    SELECT @TotalAmount1= ISNULL(SUM(b.TongTien),0)
    FROM DonHang AS a
	LEFT  JOIN VeDatPhong AS b ON a.MaDonHang = b.MaDonHang
		WHERE A.MaDonHang=@MaDonHang

    GROUP BY a.MaDonHang;

	 SELECT @TotalAmount2= ISNULL(SUM(c.TongTien),0) 
    FROM DonHang AS a
    LEFT JOIN PhieuNhaHang AS c ON a.MaDonHang = c.MaDonHang
		WHERE A.MaDonHang=@MaDonHang
    GROUP BY a.MaDonHang;

	 SELECT @TotalAmount3=ISNULL(SUM(d.TongTien),0)
    FROM DonHang AS a
	LEFT JOIN VeDatMayBay as d  ON a.MaDonHang =d.MaDonHang
	WHERE A.MaDonHang=@MaDonHang
    GROUP BY a.MaDonHang;


    RETURN ISNULL(@TotalAmount1+@TotalAmount2+@TotalAmount3, 0);
END;
go
ALTER TABLE DonHang
ADD TongTien AS dbo.CalculateTotalAmount(MaDonHang);
select * from PhieuNhaHang

select * from DonHang
select * from VeDatMayBay
go
-- Create a function for calculating the total amount for a KhachHang
CREATE FUNCTION dbo.CalculateTotalAmountPaid(@MaKhachHang VARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @TotalAmount INT;

    SELECT @TotalAmount = sum(b.TongTien)
    FROM KhachHang AS a
    JOIN DonHang AS b ON a.MaSoTaiKhoan = b.MaKhachHang
    WHERE a.MaSoTaiKhoan = @MaKhachHang AND b.TinhTrangDonHang='Ðã thanh toán'
    GROUP BY a.MaSoTaiKhoan;
    RETURN ISNULL(@TotalAmount,0);
END;
go
-- Add a computed column for TongTien in the KhachHang table
ALTER TABLE KhachHang
ADD TienDaThanhToan AS dbo.CalculateTotalAmountPaid(MaSoTaiKhoan);
select * from KhachHang
select * from DonHang
