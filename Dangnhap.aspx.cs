using System;
using System.Collections.Generic;

namespace ThuLamBaiTapLon2
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = usernameL.Text.Trim();
            string password = passwordL.Text.Trim();

            if (!string.IsNullOrEmpty(username) && !string.IsNullOrEmpty(password))
            {
                List<NguoiDung> users = JsonHelper.ReadUsers();

                foreach (NguoiDung user in users)
                {
                    if (username.Equals(user.username, StringComparison.OrdinalIgnoreCase) &&
                        password == user.password)
                    {
                        // Lưu thông tin vào Session
                        Session["username"] = user.username;
                        Session["role"] = user.role;

                        // Chuyển hướng đến Trangchu.aspx
                        Response.Redirect("Trangchu.aspx");
                        return;
                    }
                }

                // Hiển thị lỗi nếu đăng nhập sai
                errorL.Text = "Tên đăng nhập hoặc mật khẩu không đúng!";
            }
            else
            {
                errorL.Text = "Vui lòng nhập đầy đủ thông tin!";
            }
        }
    }
}
