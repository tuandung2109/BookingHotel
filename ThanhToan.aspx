<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThanhToan.aspx.cs" Inherits="ThuLamBaiTapLon2.ThanhToan" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <link rel="stylesheet" href="Style3/giohang.css" />
    <title>Giỏ hàng</title>
</head>
<body>
    <div class="header">
        <div class="header_top" id="header-top">
            <p>Định Công, Hoàng Mai, Hà Nội</p>
            <div id="login" class="login" runat="server">
                <p class="user"></p>
                <a href="Dangnhap.aspx" title="Đăng nhập">Đăng nhập</a>
            </div>
        </div>
        <div class="header_mid">
            <a href="Trangchu.aspx">
                <img width="200" height="80" src="image/logo.png" title="Đồng Hồ" />
            </a>
        </div>
        <div class="header_bot" id="header-bot">
            <ul>
                <li><a href="Trangchu.aspx">Trang chủ</a></li>
                <li><a href="gioithieu.aspx">Giới thiệu</a></li>
                <li><a href="HeThongPhong.aspx">Hệ thống phòng</a></li>
                <li><a href="DichVu.aspx">Dịch vụ</a></li>
                <li><a href="Lienhe.aspx">Liên hệ</a></li>
                <li><a href="ThanhToan.aspx">Thanh toán</a></li>
                <a href="javascript:void(0);" style="font-size:35px;" class="icon" onclick="responsive()">&#9776;</a>
            </ul>
        </div>
    </div>

    <!-- Form được viết đúng cấu trúc -->
    <form id="form1" runat="server">
        <div class="main">
            <p class="sogiohang" id="sogiohang" runat="server"></p>
            <div class="cart_product">
                <table class="bang">
                    <tr>
                        <th>Ảnh</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá</th>
                        <th>Tác vụ</th>
                    </tr>
                    <asp:ListView ID="ListViewCart" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td class="td1"><img src="<%# Eval("Images") %>" class="anh" /></td>
                                <td><p><%# Eval("Name") %></p></td>
                                <td><p><%# Eval("Price") %> đồng</p></td>
                                <td><a href="ThanhToan.aspx?action=delete&id=<%# Eval("Id") %>" class="delete-link">Xóa</a></td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                </table>
            </div>
            <div class="cart_price">
                <div class="cart--right">
                    <h2 class="cart__title--right">Đơn hàng<br /></h2>
                    <div class="cart__products-total-price">
                        <p>Tổng tiền sản phẩm</p>
                        <p runat="server" id="products_price">0 <span class="cart__product-price-unit">đ</span></p>
                    </div>
                    <div class="cart__order-total">
                        <p>Tổng cộng: </p>
                        <p runat="server" id="order_total_price">0 <span class="cart__product-price-unit">đ</span></p>
                    </div>
                    <div class="cart__buttons--right">
                        <!-- Đảm bảo nút Button được viết đúng -->
                        <asp:Button ID="btnThanhToan" runat="server" CssClass="purchase-button" Text="Thanh toán" OnClick="btnThanhToan_Click" />
                        <!-- Thêm Label hiển thị thông báo -->
                        <asp:Label ID="lblMessage" runat="server" CssClass="message-label" />
                    </div>
                </div>
            </div>
        </div>
    </form>

    <div class="footter">
        <div class="footter_top">
            <div class="Thongtinlienhe">
                <h1>Thông Tin Liên Hệ</h1>
                <p>Địa chỉ: Định Công, Hoàng Mai, Hà Nội</p>
                <p>SĐT: 0123456789</p>
                <p>Gmail: abc@gmail.com</p>
            </div>
            <div class="Lienket">
                <h1>Liên Kết</h1>
                <ul>
                    <li><a href="GioiThieu.aspx">Giới thiệu</a></li>
                    <li><a href="HeThongPhong.aspx">Hệ thống phòng</a></li>
                    <li><a href="DichVu.aspx">Dịch vụ</a></li>
                    <li><a href="LienHe.aspx">Liên hệ</a></li>
                </ul>
            </div>
            <div class="Lienket">
                <h1>Hỗ Trợ</h1>
                <ul>
                    <li><a href="#">Hướng dẫn đặt phòng</a></li>
                    <li><a href="#">Hướng dẫn thanh toán</a></li>
                    <li><a href="#">Chính sách khách sạn</a></li>
                    <li><a href="#">An ninh khách sạn</a></li>
                    <li><a href="#">Tư vấn khách hàng</a></li>
                </ul>
            </div>
        </div>
        <div class="footter_bot">
            <div class="copyright">
                © Bản quyền thuộc về nhóm 14
            </div>
        </div>
    </div>
</body>
</html>
