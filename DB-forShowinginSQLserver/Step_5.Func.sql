CREATE FUNCTION GetTopPayments
(
    @TopCount INT,
    @StartDate DATE,
    @EndDate DATE
)
RETURNS TABLE
AS
RETURN
(
    SELECT TOP (@TopCount)
        c.Ho,
        c.TenDem,
        c.Ten,sum(b.TongTien) as SoTienKhachHangDaThanhToan
    FROM
        KhachHang as a join DonHang as b on a.MaSoTaiKhoan=b.MaKhachHang
		join TaiKhoanDangNhap as c on c.MaSo=a.MaSoTaiKhoan
    WHERE
        b.NgayGiaoDich BETWEEN @StartDate AND @EndDate AND b.TinhTrangDonHang='Đã thanh toán'
		GROUP BY a.MaSoTaiKhoan,c.Ho,c.TenDem,c.Ten
    ORDER BY
        SoTienKhachHangDaThanhToan DESC
);
GO



CREATE FUNCTION ThongKeDoanhThu12Thang(@machudichvu VARCHAR(20),@tenhangmaybay VARCHAR(50),@namthongke INT)
RETURNS TABLE
AS
RETURN
(
    SELECT
        MONTH(a.NgayGiaoDich) AS Thang,
        SUM(b.TongTien) AS TongDoanhThuThang
    FROM
        DonHang as a join VeDatMayBay as b on b.MaDonHang=a.MaDonHang AND a.TinhTrangDonHang='Đã thanh toán'
		join ChuyenBay as c on b.MaSoChuyenBay=c.MaSo
		join HangHangKhong as d on c.MaSoThueCuaHangHangKhong=d.MaSoThue
		join NhaCungCapDichVu as e on d.MaDichVu=e.MaDichVu
		join ChuDichVu as f on f.MaSoTaiKhoan=e.MaChuDichVu
    WHERE
        YEAR(a.NgayGiaoDich) = @namthongke AND TinhTrangDonHang='Đã thanh toán' AND e.MaChuDichVu=@machudichvu AND d.TenHang=@tenhangmaybay
    GROUP BY
        MONTH(a.NgayGiaoDich)
);
GO
--select * from DonHang join DonHang 
--select * from VeDatMayBay

--select * from ThongKeDoanhThu12Thang('TK003','AirAsia','2023')
--select * from HangHangKhong
