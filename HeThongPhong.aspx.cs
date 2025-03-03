using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThuLamBaiTapLon2
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Kiểm tra xem người dùng đã đăng nhập chưa
            if (Session["username"] != null)
            {
                login.InnerHtml = "<p class='user'>Xin chào " + Session["username"].ToString() + " | " + "</p>" +
                                  "<a href='Dangxuat.aspx'>Đăng xuất</a>";
            }
            // Lấy danh sách sản phẩm từ Application
            List<Product> ProductList = (List<Product>)Application["ProductList"];

            if (ProductList != null && ProductList.Count > 0)
            {
                // Lọc danh sách sản phẩm để chỉ lấy các phòng
                List<Product> hethongphong = ProductList.Where(product =>
                    product.Id == "1" || product.Id == "2" || product.Id == "3" || product.Id == "4" ||
                    product.Id == "5" || product.Id == "6" || product.Id == "7" || product.Id == "8").ToList();
                // Gán danh sách vào ListView và hiển thị
                phong.DataSource = hethongphong;
                phong.DataBind();
            }
            else
            {
                // Xử lý khi danh sách sản phẩm rỗng hoặc không tồn tại
                phong.DataSource = new List<Product>(); // Gán danh sách rỗng
                phong.DataBind();
            }
        }
    }
}
