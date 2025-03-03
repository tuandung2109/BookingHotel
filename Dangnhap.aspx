<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dangnhap.aspx.cs" Inherits="ThuLamBaiTapLon2.WebForm3" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập</title>
    <link href="Style3/Dangnhap.css" rel="stylesheet" />
</head>
<body>
    <div class="header">
        <div class="header_top">
            <p>Định Công, Hoàng Mai, Hà Nội</p>
            <div id="login" class="login" runat="server">
                <p class="user"></p>
            </div>
        </div>
        <div class="header_mid">
            <a href="index.html">
                <img width="200" height="80" src="images/logo.png" title="Đồng Hồ">
            </a>
        </div>
        <div class="header_bot">
            <ul>
                <li><a href="Trangchu.aspx">Trang chủ</a></li>
                <li><a href="gioithieu.aspx">Giới thiệu</a></li>
                <li><a href="HeThongPhong.aspx">Hệ thống phòng</a></li>
                <li><a href="DichVu.aspx">Dịch vụ</a></li>
                <li><a href="Lienhe.aspx">Liên hệ</a></li>
                <li><a href="ThanhToan.aspx">Thanh toán</a></li>
            </ul>
        </div>
    </div>
    <div class="content">
        <div id="login-form" class="auth">
            <form id="form1" runat="server">
                <div class="auth__header">
                    <h2>Đăng nhập</h2>
                    <a href="Dangky.aspx">Đăng ký</a>
                </div>
                <div class="auth__form">
                    <div class="form-control">
                        <label for="username">Tên đăng nhập</label>
                        <asp:TextBox ID="usernameL" runat="server" CssClass="form-control" Placeholder="Nhập tên đăng nhập"></asp:TextBox>
                    </div>
                    <div class="form-control">
                        <label for="password">Mật khẩu</label>
                        <asp:TextBox ID="passwordL" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Nhập mật khẩu"></asp:TextBox>
                    </div>
                    <asp:Label ID="errorL" runat="server" ForeColor="Red"></asp:Label>
                    <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" CssClass="auth_btn" OnClick="btnLogin_Click" />
                </div>
            </form>
        </div>
    </div>
    <div class="footter">
        <div class="footter_top">
            <div class="Thongtinlienhe">
                <h1>Thông Tin Liên Hệ</h1>
                <p>Địa chỉ: Định Công, Hoàng Mai, Hà Nội    </p>
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
