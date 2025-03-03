<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dangky.aspx.cs" Inherits="ThuLamBaiTapLon2.Dangky" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng ký</title>
    <link href="Style3/Dangky.css" rel="stylesheet" />
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
			<a href="index.html">
				<img width="200" height="80" src="images/logo.png" title="Đồng Hồ"/>
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
	<div id="reg-form" class="auth">
                <form action="Dangky.aspx" method="post" runat="server">
                <div class="auth__header">
                    <h2>Đăng ký</h2>
                    <a href="Dangnhap.aspx">Đăng nhập</a>
                </div>
                <div class="auth__form">
                    <div class="form-control">
                        <label for="username">Tên đăng nhập</label>
                        <input type="text" id="username" placeholder="Nhập tên đăng nhập" name="username"/>
                        <p runat="server" id="username_error"></p>
                    </div>
                    <div class="form-control">
                        <label for="email">Email</label>
                        <input type="text" id="email" placeholder="abcd@gmail.com" name="email"/>
                        <p></p>
                    </div>
                    <div class="form-control">
                        <label for="password">Mật khẩu</label>
                        <input type="password" id="password" placeholder="Nhập mật khẩu" name="password"/>
                        <p></p>
                    </div>
                    <div class="form-control">
                        <label for="re-password">Xác nhận mật khẩu</label>
                        <input type="password" id="re-password" placeholder="Nhập lại mật khẩu" name="re-password"/>
                        <p></p>
                    </div>
                    <p runat="server" id="btn_error" style="color:red"></p>
                    <button class="auth_btn" id="btnReg">Đăng ký</button>
                </div>
                </form>
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
	<script>
        let form = document.querySelector('.auth__form');
        let username = document.getElementById('username');
        let email = document.getElementById('email');
        let password = document.getElementById('password');
        let repassword = document.getElementById('re-password');
        let inputs = form.querySelectorAll('.input');

        // Check bỏ trống
        for (let i = 0; i < inputs.length; i++) {
            inputs[i].onblur = inputs[i].oninput = function () {
                if (inputs[i].value.trim()) {
                    setSuccessFor(inputs[i]);
                } else {
                    setErrorFor(inputs[i], 'Trường này không được bỏ trống');
                }
            }
        }
        function setErrorFor(input, message) {
            const formControl = input.parentElement;
            const p = formControl.querySelector('p');
            p.innerText = message;
            formControl.className = 'form-control invalid';
            input.focus();
        }

        //function setSuccessFor(input) {
        //    const formControl = input.parentElement;
        //    const p = formControl.querySelector('p');
        //    p.innerText = '';
        //    formControl.className = 'form-control valid';
        //}

        //username.onblur = username.oninput = function () {
        //    if (username.value.trim().length < 6) {
        //        setErrorFor(username, 'Tên đăng nhập phải it nhất 6 ký tự');
        //    } else {
        //        setSuccessFor(username);
        //    }
        //}
        /*function validateEmail(email) {
            var re = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
            return re.test(email);
        }
        email.onblur = email.oninput = function () {
            if (!validateEmail(email.value)) {
                setErrorFor(email, "Sai định dạng email");
            }
            else {
                setSuccessFor(email);
            }
        }*/
        //Check pass Mật khẩu phải có số và ký tự thường và ký tự in hoa
        //function numberPassword(password) {
        //    var numbers = /[0-9]/g;
        //    if (password.value.match(numbers)) {
        //        return true;
        //    }
        //    else return false;
        //}
        //function charactersPassword(password) {
        //    var characters = /[a-z]/g;
        //    if (password.value.match(characters)) {
        //        return true;
        //    }
        //    else return false;
        //}
        //function CharactersPassword(password) {
        //    var Characters = /[A-Z]/g;
        //    if (password.value.match(Characters)) {
        //        return true;
        //    }
        //    else return false;
        //}
        //password.onblur = password.oninput = function () {
        //    if (!numberPassword(password)||!charactersPassword(password)||!CharactersPassword(password)) {
        //        setErrorFor(password, "Mật khẩu phải có số, ký tự thường và ký tự in hoa ");
        //    }
        //    else {
        //        setSuccessFor(password);
        //    }
        //}
        // Ký tự đầu là ký tự in hoa
        /*function checkpass(password) {
            var Characters = /[A-Z]/g;
            var a = password.value.charAt(0);
            if (a.match(Characters)) {
                return true;
            }
            else {
                return false;
            }

        }
        password.onblur = password.oninput = function () {
            if (!checkpass(password)) {
                setErrorFor(password, "Ký tự đầu phải là ký tự in hoa ");
            }
            else {
                setSuccessFor(password);
            }
        }*/
        ///^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/ 8 ký tự 1hoa 1 thường 1 ddbiet  1 số
        /* Tối thiểu 7-15 ký tự 1 in thường, 1 số 1 ký tự đb
        function checkpass(password) {
            if (password.value.match(/^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{7,15}$/)) {
                return true;
            }
            else {
                return false;
            }
        }
            password.onblur = password.oninput = function () {
                if (!checkpass(password)) {
                setErrorFor(password, "Mật khẩu phải có số, ký tự thường và ký tự in hoa ");
            }
            else {
                setSuccessFor(password);
            }
        }*/

        // Check trùng password 
        repassword.onblur = repassword.oninput = function () {
            if (repassword.value.trim() === password.value.trim()) {
                setSuccessFor(repassword);
            } else {
                //setErrorFor(repassword, '');
                setErrorFor(repassword, 'Mật khẩu chưa trùng khớp');
            }
        }


        btnReg.onclick = function (e) {
            var valid = true;
            if (!(username.value.trim() || email.value.trim() || password.value.trim() || repassword.value.trim())) {
                //alert('Hãy điền đầy đủ các trường');
                let btn_error = document.getElementById('btn_error');
                btn_error.innerHTML = 'Hãy điền đầy đủ các trường';
                valid = false;
            }

            if (!username.value.trim()) {
                setErrorFor(username, 'Trường này không được bỏ trống');
                valid = false;
                console.log(valid);
            }
            else {
                setSuccessFor(username);
            }
            if (!email.value.trim()) {
                setErrorFor(email, 'Trường này không được bỏ trống');
                valid = false;
                console.log(valid);
            } else {
                setSuccessFor(email);
            }
            if (!password.value.trim()) {
                setErrorFor(password, 'Trường này không được bỏ trống');
                valid = false;
                console.log(valid);
            } else {
                setSuccessFor(password);
            }
            if (!repassword.value.trim()) {
                setErrorFor(repassword, 'Trường này không được bỏ trống');
                valid = false;
                console.log(valid);
            } else {
                setSuccessFor(repassword);
            }
            if (!valid) {
                e.preventDefault();
            }
        }
    </script>
</html>