using System;

namespace ThuLamBaiTapLon2
{
    public class DonHang
    {
        public string MaDonHang { get; set; }
        public string TenNguoiDung { get; set; }
        public string SanPham { get; set; }
        public int SoLuong { get; set; }
        public decimal TongTien { get; set; }
        public DateTime NgayDat { get; set; }

        public DonHang(string maDonHang, string tenNguoiDung, string sanPham, int soLuong, decimal tongTien, DateTime ngayDat)
        {
            MaDonHang = maDonHang;
            TenNguoiDung = tenNguoiDung;
            SanPham = sanPham;
            SoLuong = soLuong;
            TongTien = tongTien;
            NgayDat = ngayDat;
        }
    }

}
