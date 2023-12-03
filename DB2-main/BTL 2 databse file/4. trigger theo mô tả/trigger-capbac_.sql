-- Create a trigger to update customer level based on TongTien
CREATE TRIGGER Tr_UpdateCustomerLevel
ON NguoiThamGiaChuyenBay
AFTER INSERT, UPDATE
AS
BEGIN
  SET NOCOUNT ON;

  -- Update customer level based on total order amount
  UPDATE KhachHang
  SET CapBac = 
      CASE 
        WHEN KhachHang.TienThanhThanhToan > 3000000 THEN 'VIP 2'
        WHEN KhachHang.TienThanhThanhToan > 10000 THEN 'VIP 1'
        ELSE 'Normal'
      END
  FROM KhachHang
  
END;

select * from KhachHang
select * from DonHang
select * from KhoangTrenChuyenBay

  -- Update customer level based on total order amount