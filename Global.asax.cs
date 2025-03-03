using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace ThuLamBaiTapLon2
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

            // Kiểm tra và tạo file Users.json nếu chưa tồn tại
            List<NguoiDung> users = JsonHelper.ReadUsers();
            if (users.Count == 0)
            {
                users.Add(new NguoiDung("admin", "admin@gmail.com", "admin123", "admin123", "admin"));
                users.Add(new NguoiDung("user1", "user1@gmail.com", "password1", "password1", "user"));
                JsonHelper.WriteUsers(users);
            }
            //sanpham

            // Đọc danh sách sản phẩm từ JSON
            List<Product> products = JsonHelper1.ReadProducts();
            if (products.Count == 0)
            {
                // Thêm sản phẩm mẫu
                products.AddRange(new List<Product>
                {
                    // Hệ thống phòng
                    new Product { Id = "1", Images = "../image/hethongphong/anh4_AnhDoc.jpg", Name = "Phòng 1", Price = "600000", Detail = "Phòng khách sạn sang trọng với giường đôi, ban công thoáng mát, tầm nhìn ra biển. Nội thất hiện đại, trang bị TV, minibar, điều hòa, và Wi-Fi miễn phí. Phòng tắm riêng có bồn tắm, vòi sen và các tiện nghi cao cấp." },
                    new Product { Id = "2", Images = "../image/hethongphong/anh4_AnhDoc.jpg", Name = "Phòng 2", Price = "850000", Detail = "Phòng khách sạn sang trọng với giường đôi, ban công thoáng mát, tầm nhìn ra biển. Nội thất hiện đại, trang bị TV, minibar, điều hòa, và Wi-Fi miễn phí. Phòng tắm riêng có bồn tắm, vòi sen và các tiện nghi cao cấp." },
                    new Product { Id = "3", Images = "../image/hethongphong/anh4_AnhDoc.jpg", Name = "Phòng 3", Price = "1200000", Detail = "Phòng khách sạn sang trọng với giường đôi, ban công thoáng mát, tầm nhìn ra biển. Nội thất hiện đại, trang bị TV, minibar, điều hòa, và Wi-Fi miễn phí. Phòng tắm riêng có bồn tắm, vòi sen và các tiện nghi cao cấp." },
                    new Product { Id = "4", Images = "../image/hethongphong/anh4_AnhDoc.jpg", Name = "Phòng 4", Price = "450000", Detail = "Phòng khách sạn sang trọng với giường đôi, ban công thoáng mát, tầm nhìn ra biển. Nội thất hiện đại, trang bị TV, minibar, điều hòa, và Wi-Fi miễn phí. Phòng tắm riêng có bồn tắm, vòi sen và các tiện nghi cao cấp." },
                    new Product { Id = "5", Images = "../image/hethongphong/anh4_AnhDoc.jpg", Name = "Phòng 5", Price = "700000", Detail = "Phòng khách sạn sang trọng với giường đôi, ban công thoáng mát, tầm nhìn ra biển. Nội thất hiện đại, trang bị TV, minibar, điều hòa, và Wi-Fi miễn phí. Phòng tắm riêng có bồn tắm, vòi sen và các tiện nghi cao cấp." },
                    new Product { Id = "6", Images = "../image/hethongphong/anh4_AnhDoc.jpg", Name = "Phòng 6", Price = "5500000", Detail = "Phòng khách sạn sang trọng với giường đôi, ban công thoáng mát, tầm nhìn ra biển. Nội thất hiện đại, trang bị TV, minibar, điều hòa, và Wi-Fi miễn phí. Phòng tắm riêng có bồn tắm, vòi sen và các tiện nghi cao cấp." },
                    new Product { Id = "7", Images = "../image/hethongphong/anh4_AnhDoc.jpg", Name = "Phòng 7", Price = "560000", Detail = "Phòng khách sạn sang trọng với giường đôi, ban công thoáng mát, tầm nhìn ra biển. Nội thất hiện đại, trang bị TV, minibar, điều hòa, và Wi-Fi miễn phí. Phòng tắm riêng có bồn tắm, vòi sen và các tiện nghi cao cấp." },
                    new Product { Id = "8", Images = "../image/hethongphong/anh4_AnhDoc.jpg", Name = "Phòng 8", Price = "670000", Detail = "Phòng khách sạn sang trọng với giường đôi, ban công thoáng mát, tầm nhìn ra biển. Nội thất hiện đại, trang bị TV, minibar, điều hòa, và Wi-Fi miễn phí. Phòng tắm riêng có bồn tắm, vòi sen và các tiện nghi cao cấp." },
                    // Dịch vụ
                    new Product { Id = "30", Images = "../image/dichvu/GaRan.png", Name = "Gà Rán", Price = "65000", Detail = "Gà Rán Siuu Siuu Thơm Ngon , Ăn là nghiện" },
                    new Product { Id = "31", Images = "../image/dichvu/GaRan.png", Name = "Gà Rán", Price = "65000", Detail = "Gà Rán Siuu Siuu Thơm Ngon , Ăn là nghiện" },
                    new Product { Id = "32", Images = "../image/dichvu/GaRan.png", Name = "Gà Rán", Price = "65000", Detail = "Gà Rán Siuu Siuu Thơm Ngon , Ăn là nghiện" },
                    new Product { Id = "33", Images = "../image/dichvu/GaRan.png", Name = "Gà Rán", Price = "65000", Detail = "Gà Rán Siuu Siuu Thơm Ngon , Ăn là nghiện" },
                    new Product { Id = "34", Images = "../image/dichvu/GaRan.png", Name = "Gà Rán", Price = "65000", Detail = "Gà Rán Siuu Siuu Thơm Ngon , Ăn là nghiện" },
                    new Product { Id = "35", Images = "../image/dichvu/GaRan.png", Name = "Gà Rán", Price = "65000", Detail = "Gà Rán Siuu Siuu Thơm Ngon , Ăn là nghiện" },
                    new Product { Id = "36", Images = "../image/dichvu/GaRan.png", Name = "Gà Rán", Price = "65000", Detail = "Gà Rán Siuu Siuu Thơm Ngon , Ăn là nghiện" },
                    new Product { Id = "37", Images = "../image/dichvu/GaRan.png", Name = "Gà Rán", Price = "65000", Detail = "Gà Rán Siuu Siuu Thơm Ngon , Ăn là nghiện" }
                });

                // Ghi danh sách sản phẩm vào JSON
                JsonHelper1.WriteProducts(products);
            }

            // Lưu danh sách sản phẩm vào Application
            Application["ProductList"] = products;

            // Đọc danh sách đơn hàng từ JSON nếu có (nếu bạn có lưu đơn hàng trong JSON)
            List<DonHang> donHangList = JsonHelper2.ReadOrders();

            if (donHangList == null || donHangList.Count == 0)
            {
                // Thêm đơn hàng mẫu nếu danh sách rỗng
                donHangList = new List<DonHang>
                {
                };

                // Ghi lại đơn hàng vào JSON nếu cần
                JsonHelper2.WriteOrders(donHangList);
            }

            // Lưu danh sách đơn hàng vào Application
            Application["DonHangList"] = donHangList;

        }
        protected void Session_Start(object sender, EventArgs e)
        {
            /**Session["product"] = new List<Product>();**/
            Application["sogiohang"] = 0;
            Session["login"] = 0;
            Application["DonHangList"] = new List<DonHang>();

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }
        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {
            // Ghi dữ liệu về JSON khi ứng dụng kết thúc (nếu cần)
            List<DonHang> donHangList = Application["DonHangList"] as List<DonHang>;
            if (donHangList != null)
            {
                JsonHelper2.WriteOrders(donHangList);
            }
        }
    }
}