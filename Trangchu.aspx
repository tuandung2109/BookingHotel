<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Trangchu.aspx.cs" Inherits="ThuLamBaiTapLon2.Trangchu" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trang chủ</title>
    <link href="Style3/trangchu.css" rel="stylesheet" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
	<div class="header">
		<div class="header_top" id="header-top">
			<div id="login" class="login" runat="server">
				<p class="user"></p>
				<a href="Admin.aspx" title="Admin">Admin</a>
				<a href="Dangnhap.aspx" title="Đăng nhập">Đăng nhập</a>
			</div>	
		</div>
		<div class="header_mid">
			<a href="Trangchu.aspx">
				<img width="200" height="80" src="image/logo.png" title="HOTEL" />
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
			</ul>
		</div>
	</div>

	<!-- PHẦN BANNER -->
	<div class="banner">
		<img id="img" src="image/anh1.jpg" width="auto" />
	</div>

	<h1 class="h1">Hệ thống phòng</h1>
	<div class="sanpham">
			<asp:ListView ID="hethongphong" runat="server">
				<ItemTemplate>
					<div class="hethongphong">
					<a href="Trangsanphamchitiet.aspx?id=<%# Eval("Id") %>">
						<img id="anh1" width="200" height="80" src="<%# Eval("Images") %>" title="Phòng">
						<div class="hethongphong_gia" id="sanpham1">
							<strong id="ten1"><%# Eval("Name") %></strong>
							<p id="gia1"><%# Eval("Price") %> đồng</p>
						</div>
					</a>
					</div>
				</ItemTemplate>
			</asp:ListView>
	</div>

	<!-- PHẦN FOOTER -->
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
