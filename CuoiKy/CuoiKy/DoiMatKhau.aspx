<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoiMatKhau.aspx.cs" Inherits="CuoiKy.DoiMatKhau" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password</title>
    <link rel="stylesheet" href="Style/StyleDangNhap.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="box">
                <img class="logosize" src="image/logo.png" alt="" />
                <h1 class="header">Đổi mật khẩu</h1>
                <asp:TextBox class="text" ID="txtTenDN" placeholder="Tên đăng nhập" runat="server" required=""></asp:TextBox>
             <asp:TextBox class="text" TextMode="Password" placeholder="Mật khẩu mới" ID="txtPassword" runat="server" required=""></asp:TextBox>
             <asp:TextBox class="text" TextMode="Password" placeholder="Nhập lại mật khẩu" ID="txtRePass" runat="server" required=""></asp:TextBox>
             <asp:Button class="btn" ID="btnDangNhap" runat="server" Text="Đồng ý" OnClick="btnDangNhap_Click" />
            </div>
        </div>
    </form>
</body>
</html>
