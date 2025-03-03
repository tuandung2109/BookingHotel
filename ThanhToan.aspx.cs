using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThuLamBaiTapLon2
{
    public partial class ThanhToan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] != null)
                {
                    // Kiểm tra và xử lý lệnh xóa
                    if (Request.QueryString["action"] == "delete" && Request.QueryString["id"] != null)
                    {
                        string productIdToRemove = Request.QueryString["id"];
                        RemoveProductFromCart(productIdToRemove);
                    }

                    LoadUserInfo();
                    LoadCartData();
                }
                else
                {
                    Response.Redirect("Dangnhap.aspx");
                }
            }
        }

        private void RemoveProductFromCart(string productId)
{
    if (Request.Cookies["cart"] != null)
    {
        string cartCookies = Request.Cookies["cart"].Value;

        // Tách cookie thành danh sách sản phẩm
        List<string> productList = cartCookies.Split(',')
                                               .Where(id => !string.IsNullOrEmpty(id) && id != productId)
                                               .ToList();

        // Cập nhật cookie
        if (productList.Any())
        {
            Response.Cookies["cart"].Value = string.Join(",", productList);
            Response.Cookies["cart"].Expires = DateTime.Now.AddDays(12);
        }
        else
        {
            // Nếu không còn sản phẩm nào, xóa cookie
            Response.Cookies["cart"].Expires = DateTime.Now.AddDays(-1);
        }

        // Debug thông tin cookie
        System.Diagnostics.Debug.WriteLine("Cookie sau khi xóa: " + Response.Cookies["cart"]?.Value);
    }
}
    

        private void LoadUserInfo()
        {
            string username = Session["username"].ToString();
            login.Controls.Add(new Literal
            {
                Text = $"<p class='user'>Xin chào {username} | <a href='Dangxuat.aspx'>Đăng xuất</a></p>"
            });
        }

        private void LoadCartData()
        {
            if (Request.Cookies["cart"] != null && !string.IsNullOrEmpty(Request.Cookies["cart"].Value))
            {
                List<Product> cartList = GetCartProducts(); // Lấy danh sách sản phẩm trong giỏ hàng

                if (cartList.Count > 0)
                {
                    // Hiển thị sản phẩm trong giỏ hàng
                    ListViewCart.DataSource = cartList;
                    ListViewCart.DataBind();

                    // Tính tổng tiền giỏ hàng
                    int totalPrice = cartList.Sum(p => Convert.ToInt32(p.Price));
                    products_price.InnerHtml = $"{totalPrice:n0} đ";
                    order_total_price.InnerHtml = $"{totalPrice:n0} đ";
                }
                else
                {
                    // Giỏ hàng trống, hiển thị giá trị là 0 đ
                    ListViewCart.DataSource = null;  // Không có sản phẩm trong giỏ
                    ListViewCart.DataBind();
                    products_price.InnerHtml = "0 đ";
                    order_total_price.InnerHtml = "0 đ";
                }
            }
            else
            {
                // Nếu không có cookie giỏ hàng, giỏ hàng trống
                ListViewCart.DataSource = null;
                ListViewCart.DataBind();
                products_price.InnerHtml = "0 đ";
                order_total_price.InnerHtml = "0 đ";
            }
        }


        private List<Product> GetCartProducts()
        {
            List<Product> cartList = new List<Product>();
            List<Product> productList = (List<Product>)Application["ProductList"];

            if (Request.Cookies["cart"] != null && !string.IsNullOrEmpty(Request.Cookies["cart"].Value))
            {
                string cartCookies = Request.Cookies["cart"].Value;

                foreach (string productID in cartCookies.Split(',').Where(id => !string.IsNullOrEmpty(id)))
                {
                    Product product = productList.FirstOrDefault(p => p.Id == productID);
                    if (product != null)
                    {
                        cartList.Add(product);
                    }
                }
            }

            return cartList;
        }

        protected void btnThanhToan_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["cart"] != null)
            {
                List<Product> cartList = GetCartProducts();

                if (cartList.Count > 0)
                {
                    List<DonHang> danhSachDonHang = JsonHelper2.ReadOrders();
                    string username = Session["username"].ToString();

                    foreach (var product in cartList)
                    {
                        DonHang donHangMoi = new DonHang(
                            Guid.NewGuid().ToString(),  // Mã đơn hàng
                            username,                  // Tên người dùng
                            product.Name,              // Tên sản phẩm
                            1,                         // Số lượng
                            decimal.Parse(product.Price), // Giá tiền
                            DateTime.Now               // Ngày đặt hàng
                        );

                        danhSachDonHang.Add(donHangMoi);
                    }

                    JsonHelper2.WriteOrders(danhSachDonHang);
                    Application["DonHangList"] = danhSachDonHang;

                    // Xóa cookie giỏ hàng
                    Response.Cookies["cart"].Expires = DateTime.Now.AddDays(-1);

                    lblMessage.Text = "Thanh toán thành công!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;

                    // Reload lại giỏ hàng
                    LoadCartData();
                }
                else
                {
                    lblMessage.Text = "Giỏ hàng trống!";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void ListViewCart_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteProduct" && Request.Cookies["cart"] != null)
            {
                string productIdToRemove = e.CommandArgument.ToString();
                string cartCookies = Request.Cookies["cart"].Value;

                // Debug thông tin trước khi xóa
                System.Diagnostics.Debug.WriteLine("Cookie trước khi xóa: " + cartCookies);

                // Xóa sản phẩm khỏi danh sách
                List<string> productList = cartCookies.Split(',') // Tách giá trị cookie thành danh sách
                                                       .Where(id => id != productIdToRemove && !string.IsNullOrEmpty(id)) // Xóa sản phẩm cần xóa
                                                       .ToList();

                if (productList.Any())
                {
                    Response.Cookies["cart"].Value = string.Join(",", productList); // Cập nhật lại cookie với sản phẩm còn lại
                    Response.Cookies["cart"].Expires = DateTime.Now.AddDays(12); // Gia hạn cookie thêm 12 ngày
                }
                else
                {
                    // Nếu không còn sản phẩm nào trong giỏ hàng, xóa cookie
                    Response.Cookies["cart"].Expires = DateTime.Now.AddDays(-1);
                }

                // Debug thông tin sau khi xóa
                System.Diagnostics.Debug.WriteLine("Cookie sau khi xóa: " + Response.Cookies["cart"]?.Value);

                // Cập nhật lại giao diện giỏ hàng
                LoadCartData();
            }
            LoadCartData();
        }

    }
}
