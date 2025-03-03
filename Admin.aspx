<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="ThuLamBaiTapLon2.Admin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trang Quản Trị</title>
    <link href="Style3/Admin.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Quản lý hệ thống</h1>
        </div>
        <div class="btn-home-wrapper">
            <asp:Button ID="btnHome" runat="server" Text="Về trang chủ" CssClass="btn-home" OnClick="btnHome_Click" />
        </div>

        <!-- Form Thêm/Sửa Người Dùng -->
        <div class="form-section">
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" Placeholder="Tên đăng nhập"></asp:TextBox>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Email"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Mật khẩu"></asp:TextBox>
            <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control">
                <asp:ListItem Text="Admin" Value="admin"></asp:ListItem>
                <asp:ListItem Text="User" Value="user"></asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="btnAddOrUpdate" runat="server" Text="Thêm/Cập nhật" CssClass="btn btn-primary" OnClick="btnAddOrUpdate_Click" />
        </div>

        <!-- Danh sách người dùng -->
        <asp:GridView ID="GridViewUsers" runat="server" AutoGenerateColumns="False" OnRowCommand="GridViewUsers_RowCommand" CssClass="grid-view">
            <Columns>
                <asp:BoundField DataField="username" HeaderText="Tên đăng nhập" />
                <asp:BoundField DataField="email" HeaderText="Email" />
                <asp:BoundField DataField="role" HeaderText="Vai trò" />
                <asp:TemplateField HeaderText="Hành động">
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" CommandName="EditUser" CommandArgument='<%# Container.DataItemIndex %>' Text="Sửa" />
                        <asp:Button ID="btnDelete" runat="server" CommandName="DeleteUser" CommandArgument='<%# Container.DataItemIndex %>' Text="Xóa" />
                        <asp:Button ID="btnViewProducts" runat="server" CommandName="ViewProducts" CommandArgument='<%# Container.DataItemIndex %>' Text="Xem Sản Phẩm" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <!-- Danh sách sản phẩm của người dùng -->
        <div>
            <h2>Danh sách sản phẩm của người dùng</h2>
            <asp:GridView ID="GridViewUserProducts" runat="server" AutoGenerateColumns="False" CssClass="grid-view" OnRowCommand="GridViewUserProducts_RowCommand">
                <Columns>
                    <asp:BoundField DataField="MaDonHang" HeaderText="Mã Đơn Hàng" />
                    <asp:BoundField DataField="TenNguoiDung" HeaderText="Tên Người Dùng" />
                    <asp:BoundField DataField="SanPham" HeaderText="Tên Sản Phẩm" />
                    <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng" />
                    <asp:BoundField DataField="TongTien" HeaderText="Tổng Tiền" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="NgayDat" HeaderText="Ngày Đặt" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:TemplateField HeaderText="Hành động">
                        <ItemTemplate>
                            <asp:Button ID="btnDeleteOrder" runat="server" Text="Xóa" CommandName="DeleteOrder" CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn btn-danger" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <!-- Thông báo -->
        <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>
