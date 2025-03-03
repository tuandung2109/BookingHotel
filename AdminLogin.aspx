<%@ Page Language="C#" EnableViewState="false" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="ThuLamBaiTapLon2.AdminLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập Admin</title>
    <link href="Style3/LoginAdmin.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="login-form">
        <div class="login-container">
            <h2>Đăng nhập Admin</h2>
            <div class="form-group">
                <label for="txtUsername">Tên đăng nhập:</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" Placeholder="Nhập tên đăng nhập"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtPassword">Mật khẩu:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Nhập mật khẩu"></asp:TextBox>
            </div>
            <asp:Label ID="lblError" runat="server" CssClass="error-message"></asp:Label>
            <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" CssClass="btn-login" OnClick="btnLogin_Click" />
        </div>
    </form>
</body>
</html>
