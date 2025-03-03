using System;
using System.Collections.Generic;
using System.Web.UI;

namespace ThuLamBaiTapLon2
{
    public partial class Trangchu : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                string username = Session["username"].ToString();
                login.InnerHtml = $"<p class='user'>Xin chào {username} | </p>" +
                                  "<a href='Dangxuat.aspx'>Đăng xuất</a>" +
                                  "<a href='Admin.aspx' title='Admin'>Admin</a>";
            }
            else
            {
                login.InnerHtml = "<a href='Admin.aspx' title='Admin'>Admin</a>" +
                                  "<a href='Dangnhap.aspx' title='Đăng nhập'>Đăng nhập</a>";
            }

            // Tải toàn bộ danh sách sản phẩm từ Application
            List<Product> ProductList = (List<Product>)Application["ProductList"];

            // Đảm bảo danh sách không rỗng trước khi gán vào ListView
            if (ProductList != null && ProductList.Count > 0)
            {
                hethongphong.DataSource = ProductList;
                hethongphong.DataBind();
            }
            else
            {
                login.InnerHtml += "<p>Danh sách sản phẩm trống!</p>";
            }
        }
    }
}
