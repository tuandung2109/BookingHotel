using System;
using System.Collections.Generic;

namespace ThuLamBaiTapLon2
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (!string.IsNullOrEmpty(username) && !string.IsNullOrEmpty(password))
            {
                // Đọc danh sách người dùng từ JSON
                List<NguoiDung> users = JsonHelper.ReadUsers();

                foreach (NguoiDung user in users)
                {
                    if (username.Trim().Equals(user.username.Trim(), StringComparison.OrdinalIgnoreCase) && password.Trim() == user.password.Trim())
                    {
                        Session["username"] = user.username;
                        Session["role"] = user.role;

                        if (user.role == "admin")
                        {
                            Response.Redirect("Admin.aspx");
                        }
                        else
                        {
                            Response.Redirect("Trangchu.aspx");
                        }
                        return;
                    }

                }
                lblError.Text = "Tên đăng nhập hoặc mật khẩu không đúng hoặc không có quyền admin!";
            }
            else
            {
                lblError.Text = "Vui lòng nhập đầy đủ thông tin!";
            }
        }
    }
}
