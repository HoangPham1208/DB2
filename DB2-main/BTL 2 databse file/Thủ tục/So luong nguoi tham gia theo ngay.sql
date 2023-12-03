CREATE OR ALTER PROCEDURE SoluongNguoiBayTheoNgay @Date DATE
AS
BEGIN
   SELECT C.MaSo, K.LoaiKhoang, COUNT(*) AS SoLuongGhe
   FROM Chuyenbay C, KhoangTrenChuyenBay K, NguoiThamGiaChuyenBay N
   WHERE CONVERT(DATE, C.ThoiGianXuatPhat) = @Date 
      and C.MaSo = K.MaSoMayBay 
      and K.MaSoMayBay = N.MaSoMayBay 
      and K.LoaiKhoang = N.LoaiKhoang
   GROUP BY C.MaSo, K.LoaiKhoang
   ORDER BY SoLuongGhe DESC
END

exec SoluongNguoiBayTheoNgay @Date = '2023-03-02'
