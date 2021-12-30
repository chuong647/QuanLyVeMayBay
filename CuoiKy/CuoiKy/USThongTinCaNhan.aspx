<%@ Page Title="Thông tin cá nhân" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="USThongTinCaNhan.aspx.cs" Inherits="CuoiKy.USThongTinCaNhan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="Style/styleTT.css"/>
    <link rel="stylesheet" href="Style/styleTTCaNhan.css"/>
    <link href='https://fonts.googleapis.com/css?family=Quicksand' rel='stylesheet'>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <p class="header-text" style="display:flex; justify-content:center;"><b>Thông tin cá nhân</b></p>
    <div style="display:flex; justify-content:center; padding-bottom: 15px;">
         <div style="display:flex">
             <div style="text-align:center">
                 <p>
                    <asp:FileUpload CssClass="upload" ID="fuAvt" runat="server" onchange="showimagepreview1(this)"/>
                        <script type ="text/javascript"  >
                            function showimagepreview1(input) {
                                if (input.files && input.files[0]) {
                                    var filerdr = new FileReader();
                                    filerdr.onload = function (e) {
                                        $('#<%= avtCaNhan.ClientID %>').attr('src', e.target.result);
                                    }
                                    filerdr.readAsDataURL(input.files[0]);
                                }
                            }
                        </script>
                    </p>
                <div style="padding-right:20px">
                    <asp:Image CssClass="anh" ID="avtCaNhan" runat="server" />
                </div>
             </div>
            <table>
                <tr>
                    <td><b>Mã nhân viên:</b></td>
                    <td>
                        <asp:TextBox CssClass="textbox" ID="txtMaNV" runat="server" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><b>Họ và tên:</b></td>
                    <td>
                        <asp:TextBox CssClass="textbox"  ID="txtTen" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><b>Ngày sinh:</b></td>
                        <td style="display:flex;">
                            <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
                            <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
                            <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
                            <input id="datepicker" width="260px" name="datepick" value="<%= tdate %>" />
                            <script>
                                $('#datepicker').datepicker({
                                    showOtherMonths: true
                                });
                            </script>
                        </td>
                </tr>
                <tr>
                    <td><b>Giới tính:</b></td>
                    <td style="align-content:center;">
                        <asp:RadioButtonList CssClass="radio" ID="rdbGioiTinh" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem  Value="true" Text="Nam"></asp:ListItem>
                            <asp:ListItem Value="false" Text="Nữ"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                 <tr>
                    <td><b>Địa chỉ:</b></td>
                     <td>
                         <asp:TextBox CssClass="textbox" ID="txtDiaChi" runat="server"></asp:TextBox>
                     </td>
                </tr>
                <tr>
                    <td><b>Số điện thoại:</b></td>
                    <td>
                        <asp:TextBox CssClass="textbox"  ID="txtSDT" runat="server"></asp:TextBox>
                    </td>
                    </tr>
                 <tr>
                    <td><b>Chức vụ:</b></td>
                    <td style="align-content:center;">
                        <asp:RadioButtonList ID="rdbChucVu" CssClass="radio" runat="server" RepeatDirection="Horizontal" Enabled="false"> 
                            <asp:ListItem Value="true">Quản lí</asp:ListItem>
                            <asp:ListItem Value="false">Nhân viên</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr style="text-align:center">
                    <td colspan="2" style="padding-top:20px;">
                         <asp:Button CssClass="button" ID="btncapnhat" runat="server" Text="Cập Nhật" OnClick="btncapnhat_Click"/>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
