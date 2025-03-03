<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HeThongPhong.aspx.cs" Inherits="ThuLamBaiTapLon2.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hệ thống phòng</title>
    <link href="Style3/hethongphong.css" rel="stylesheet" />
</head>
<body>
    <div class="header">
        <div class="header_top">
            <p>Định Công, Hoàng Mai, Hà Nội</p>
            <div id="login" class="login" runat="server">
				<p class="user"></p>
				<a href="Dangnhap.aspx" title="Đăng nhập">Đăng nhập</a>
			</div>
        </div>
        <div class="header_mid">
            <a href="Trangchu.aspx">
                <img width="200" height="80" src="image/logo.png" title="Đồng Hồ"/>
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

    <div class="up">
        <div class="abc">
            <a href="Trangchu.aspx"><strong>TRANG CHỦ</strong></a> / <a href="HeThongPhong.aspx"><strong>Hệ Thống Phòng</strong></a>
        </div>
    </div>
    <div class="container">
        <div class="sidebar_one">
            <div class="row_1">
                <strong>Danh mục </strong>
                <div class="show">
                    <ul>
                        <li><a href="HeThongPhong.aspx">Hệ thống phòng</a></li>
                        <li><a href="DichVu.aspx">Dịch vụ</a></li>
                    </ul>
                </div>
            </div>
            <div class="row_2"></div>
            <div class="row_3"></div>
        </div>

        <div class="sidebar_two">
            <div class="sanpham">
                <asp:ListView ID="phong" runat="server">
                    <ItemTemplate>
                        <a href="Trangsanphamchitiet.aspx?id=<%# Eval("Id") %>">
                            <div class="sanpham_show">
                                <img src="<%# Eval("Images") %>" alt="ảnh lỗi">
                                <div class="sanpham_gia">
                                    <strong><%# Eval("Name") %></strong>
                                    <p><%# Eval("Price") %> đồng</p>
                                </div>
                            </div>
                        </a>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>



	<div class="footter">
		<div class="footter_top">
			<div class="Thongtinlienhe">
				<h1>Thông Tin Liên Hệ</h1>
				<p>Địa chỉ: Định Công, Hoàng Mai, Hà Nội	</p>
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
