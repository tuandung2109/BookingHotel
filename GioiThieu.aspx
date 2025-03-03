<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GioiThieu.aspx.cs" Inherits="ThuLamBaiTapLon2.GioiThieu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Giới thiệu</title>
    <link href="Style3/gioithieu.css" rel="stylesheet" />
</head>
<body>
    <div class="header">
        <div class="header_top">
            <p>123 Định Công, Hoàng Mai, Hà Nội</p>
            <div id="login" class="login" runat="server">
				<p class="user"></p>
				<a href="Dangnhap.aspx" title="Đăng nhập">Đăng nhập</a>
			</div>
        </div>
        <div class="header_mid">
            <a href="Trangchu.aspx">
                <img width="200" height="80" src="image/logo.png" title="Hotel Management">
            </a>
        </div>
        <div class="header_bot">
            <ul>
				<li><a href="Trangchu.aspx">Trang chủ</a></li>
				<li><a href="GioiThieu.aspx">Giới thiệu</a></li>
				<li><a href="HeThongPhong.aspx">Hệ thống phòng</a></li>
				<li><a href="DichVu.aspx">Dịch vụ</a></li>
				<li><a href="Lienhe.aspx">Liên hệ</a></li>
				<li><a href="ThanhToan.aspx">Thanh toán</a></li>
            </ul>
        </div>
    </div>
    <div class="gioithieu">
        <div class="gioithieu_column_one">
            <img src="image/anh1.jpg" alt="lỗi" width="100%">
        </div>
        <div class="gioithieu_column_two">
            <h2>Giới thiệu về Khách sạn</h2>
            <span>
                “Khách sạn của chúng tôi tọa lạc tại vị trí đắc địa, mang đến không gian yên tĩnh và tiện nghi cho du khách. Với nhiều năm kinh nghiệm trong ngành dịch vụ lưu trú, chúng tôi tự hào cung cấp các phòng ở hiện đại, sạch sẽ và thoải mái. Đến với khách sạn của chúng tôi, quý khách sẽ được tận hưởng dịch vụ đẳng cấp, mang đến trải nghiệm tuyệt vời nhất cho mỗi kỳ nghỉ.”
            </span>
        </div>
    </div>
    <div class="section_content">
        <div class="section_item">
            <div class="section_child">
                <h3>Phòng tiện nghi</h3>
                <span>Chúng tôi cung cấp các phòng ở được trang bị đầy đủ tiện nghi, đảm bảo sự thoải mái và hài lòng cho khách hàng.</span>
            </div>
            <div class="section_child">
                <h3>Đặt phòng nhanh chóng</h3>
                <span>Quy trình đặt phòng dễ dàng và nhanh chóng, giúp khách hàng tiết kiệm thời gian.</span>
            </div>
            <div class="section_child">
                <h3>Dịch vụ 24/7</h3>
                <span>Chúng tôi luôn sẵn sàng phục vụ khách hàng 24/7, mang lại sự tiện lợi tối đa cho du khách.</span>
            </div>
        </div>
        <div class="section_item">
            <div class="section_child">
                <h3>Chính sách đổi phòng linh hoạt</h3>
                <span>Khách hàng có thể yêu cầu đổi phòng trong vòng 24 giờ nếu có bất kỳ sự cố nào xảy ra.</span>
            </div>
            <div class="section_child">
                <h3>Miễn phí bữa sáng</h3>
                <span>
                    Chúng tôi cung cấp bữa sáng miễn phí cho khách hàng, đảm bảo khởi đầu ngày mới đầy năng lượng.
                </span>
            </div>
            <div class="section_child">
                <h3>Giá cả cạnh tranh</h3>
                <span>Chúng tôi cam kết mang lại mức giá hợp lý cho dịch vụ đẳng cấp.</span>
            </div>
        </div>
    </div>
    <div class="section_img">
        <img src="image/hethongphong/anh3_PhongDoi.jpg" alt="Khách sạn" width="100%">
    </div>

    <div class="degi">

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