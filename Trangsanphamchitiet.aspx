<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Trangsanphamchitiet.aspx.cs" Inherits="ThuLamBaiTapLon2.Trangsanphamchitiet" %>

<!DOCTYPE aspx>

<aspx xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta charset="utf-8">
	<link rel="stylesheet" href="Style3/Trangsanphamchitiet.css">
    <title>Phòng</title>
</head>
<body>
	<form id="form1" runat="server">
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
				<img width="200" height="80" src="images/logo.png" title="Phòng">
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
				<a href="javascript:void(0);" style="font-size:35px;" class="icon" onclick="responsive() ">&#9776;</a>
			</ul>
		</div>
	</div>



	<div>
	<div class="main">
		<asp:ListView ID="ListViewProductinformation" runat="server" >
			<ItemTemplate>
				<div class="anh">
					<img src="<%# Eval("Images") %>" title="ảnh phòng">
				</div>

				<div class="content">
					<h1 class="header-content"><%# Eval("Name") %></h1>
					<hr width="20px" />
					<p style="font-size:45px;color: #C89979;   " class="header-content"><b><%# Eval("Price") %> đồng</b></p>
					<p class="header-content"><%# Eval("Detail") %></p>
					<ul class="header-content">
						<li>Chất lượng</li>
						<li>Five Star</li>
					</ul>
				</ItemTemplate>
		</asp:ListView>
		<div class="submit">
			<p class="Themgio" name="Themgio" runat="server" id="Themgio" style="color:red"></p>
			<button type="submit" class="themvaogio" runat="server" ID="AddToCartButton1" onserverclick="AddToCartButton" >Thêm</button>
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
		</form>
	
</body>
</aspx>
