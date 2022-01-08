<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="CuoiKy.DangNhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LOGIN</title>
    <link rel="stylesheet" href="Style/StyleDangNhap.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="box">
            <img class="logosize" src="image/logo.png" alt="" />
            <h1 class="header">Đăng nhập</h1>
            <asp:TextBox class="text" ID="txtTenDN" placeholder="Tên đăng nhập" runat="server" required=""></asp:TextBox>
            <asp:TextBox class="text" ID="txtPassword" TextMode="Password" placeholder="Mật khẩu" runat="server" required=""></asp:TextBox>
            <asp:Button class="btn" ID="btnDangNhap" runat="server" Text="Đăng nhập" OnClick="btnDangNhap_Click"/>
        </div>
    </form>
</body>
</html>
