using System;
using System.Collections.Generic;

namespace ThuLamBaiTapLon2
{
    public partial class Dangky : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string username = Request.Form.Get("username");
                string email = Request.Form.Get("email");
                string password = Request.Form.Get("password");
                string repassword = Request.Form.Get("re-password");
                List<NguoiDung> users = JsonHelper.ReadUsers();

                if (!string.IsNullOrEmpty(username) && !string.IsNullOrEmpty(email) &&
                    !string.IsNullOrEmpty(password) && !string.IsNullOrEmpty(repassword))
                {
                    if (users.Exists(u => u.username.Equals(username, StringComparison.OrdinalIgnoreCase)))
                    {
                        btn_error.InnerHtml = "Tên đăng nhập đã được sử dụng.";
                        return;
                    }

                    if (users.Exists(u => u.email.Equals(email, StringComparison.OrdinalIgnoreCase)))
                    {
                        btn_error.InnerHtml = "Email đã được sử dụng.";
                        return;
                    }

                    if (password != repassword)
                    {
                        btn_error.InnerHtml = "Mật khẩu xác nhận không khớp.";
                        return;
                    }

                    // Thêm người dùng mới
                    users.Add(new NguoiDung(username, email, password, repassword, "user"));
                    JsonHelper.WriteUsers(users);
                    btn_error.InnerHtml = "Đăng ký thành công!";
                }
                else
                {
                    btn_error.InnerHtml = "Vui lòng nhập đầy đủ thông tin!";
                }
            }
        }
    }
}
