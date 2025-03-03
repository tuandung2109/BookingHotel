using System;
using System.Collections.Generic;
using System.Linq;

namespace ThuLamBaiTapLon2
{
    public partial class Admin : System.Web.UI.Page
    {
        private List<NguoiDung> users;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Kiểm tra quyền truy cập
            if (Session["username"] == null || Session["role"] == null || Session["role"].ToString() != "admin")
            {
                Response.Redirect("AdminLogin.aspx");
            }

            // Đọc danh sách người dùng từ file JSON
            users = JsonHelper.ReadUsers();

            if (!IsPostBack)
            {
                BindGridView(); // Hiển thị danh sách người dùng
            }
        }

        private void BindGridView()
        {
            GridViewUsers.DataSource = users;
            GridViewUsers.DataBind();
        }

        private void BindGridViewUserProducts(string username)
        {
            // Đọc danh sách đơn hàng từ file JSON
            List<DonHang> danhSachDonHang = JsonHelper2.ReadOrders() ?? new List<DonHang>();

            // Lọc đơn hàng theo người dùng
            var userOrders = danhSachDonHang
                .Where(order => order.TenNguoiDung == username)
                .ToList();

            // Gán dữ liệu vào GridView
            GridViewUserProducts.DataSource = userOrders;
            GridViewUserProducts.DataBind();

            // Hiển thị thông báo
            lblMessage.Text = userOrders.Count == 0
                ? $"Người dùng {username} chưa có đơn hàng nào."
                : $"Hiển thị {userOrders.Count} đơn hàng của {username}.";
        }

        protected void btnAddOrUpdate_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string role = ddlRole.SelectedValue;

            // Kiểm tra tính hợp lệ
            if (!string.IsNullOrEmpty(username) && !string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(password))
            {
                NguoiDung existingUser = users.FirstOrDefault(u => u.username == username);

                if (existingUser != null)
                {
                    // Cập nhật thông tin người dùng
                    existingUser.email = email;
                    existingUser.password = password;
                    existingUser.role = role;
                    lblMessage.Text = $"Thông tin người dùng {username} đã được cập nhật.";
                }
                else
                {
                    // Thêm người dùng mới
                    users.Add(new NguoiDung(username, email, password, password, role));
                    lblMessage.Text = "Người dùng mới đã được thêm.";
                }

                // Ghi danh sách người dùng vào file JSON
                JsonHelper.WriteUsers(users);
                BindGridView();
            }
            else
            {
                lblMessage.Text = "Vui lòng nhập đầy đủ thông tin!";
            }
        }

        protected void GridViewUsers_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditUser")
            {
                // Hiển thị thông tin người dùng để chỉnh sửa
                NguoiDung user = users[index];
                txtUsername.Text = user.username;
                txtEmail.Text = user.email;
                txtPassword.Text = user.password;
                ddlRole.SelectedValue = user.role;
                lblMessage.Text = $"Đang chỉnh sửa {user.username}.";
            }
            else if (e.CommandName == "DeleteUser")
            {
                // Xóa người dùng
                users.RemoveAt(index);
                JsonHelper.WriteUsers(users);
                BindGridView();
                lblMessage.Text = "Người dùng đã bị xóa.";
            }
            else if (e.CommandName == "ViewProducts")
            {
                // Xem thông tin đơn hàng của người dùng
                string username = users[index].username;
                BindGridViewUserProducts(username);
            }
        }

        protected void GridViewUserProducts_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteOrder")
            {
                // Lấy chỉ số hàng được chọn
                int index = Convert.ToInt32(e.CommandArgument);

                // Đọc danh sách đơn hàng từ file JSON
                List<DonHang> danhSachDonHang = JsonHelper2.ReadOrders() ?? new List<DonHang>();

                if (index >= 0 && index < danhSachDonHang.Count)
                {
                    // Xóa đơn hàng
                    danhSachDonHang.RemoveAt(index);

                    // Ghi lại danh sách vào file JSON
                    JsonHelper2.WriteOrders(danhSachDonHang);

                    // Cập nhật lại GridView
                    GridViewUserProducts.DataSource = danhSachDonHang;
                    GridViewUserProducts.DataBind();

                    lblMessage.Text = "Đơn hàng đã được xóa.";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblMessage.Text = "Chỉ số không hợp lệ. Không thể xóa đơn hàng.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void btnViewOrders_Click(object sender, EventArgs e)
        {
            // Đọc danh sách đơn hàng từ file JSON
            List<DonHang> danhSachDonHang = JsonHelper2.ReadOrders();

            // Kiểm tra nếu không có đơn hàng
            if (danhSachDonHang == null || danhSachDonHang.Count == 0)
            {
                lblMessage.Text = "Không có đơn hàng nào!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                GridViewUserProducts.DataSource = null;
                GridViewUserProducts.DataBind();
                return;
            }

            // Hiển thị danh sách đơn hàng
            GridViewUserProducts.DataSource = danhSachDonHang;
            GridViewUserProducts.DataBind();

            lblMessage.Text = $"Hiển thị {danhSachDonHang.Count} đơn hàng đã đặt.";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            // Điều hướng về trang chủ
            Response.Redirect("Trangchu.aspx");
        }
    }
}
