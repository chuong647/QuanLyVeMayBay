<%@ Page Title="Thông tin khách hàng" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="USThongTinKH.aspx.cs" Inherits="CuoiKy.USThongTinKH" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="Style/styleTT.css"/>
    <link href='https://fonts.googleapis.com/css?family=Quicksand' rel='stylesheet'>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <p class="header-text"><b>Thông tin khách hàng</b></p>
    <div style="display: flex; justify-content: center; padding-bottom: 20px;">
        <table >
            <tr>
                <td><b>Họ và tên:</b></td>
                <td><asp:TextBox CssClass="textbox" ID="txtTen" runat="server"></asp:TextBox></td>
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
                    <asp:RadioButtonList ID="rdbGioiTinh" CssClass="radio" runat="server" RepeatDirection="Horizontal"> 
                        <asp:ListItem Value="false">Nữ</asp:ListItem>
                        <asp:ListItem Value="true">Nam</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td><b>Địa chỉ:</b></td>
                <td><asp:TextBox CssClass="textbox" ID="txtDiaChi" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><b>Số điện thoại:</b></td>
                <td><asp:TextBox CssClass="textbox" ID="txtSDT" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><b>CMND:</b></td>
                <td><asp:TextBox CssClass="textbox" ID="txtCMND" runat="server"></asp:TextBox></td>
            </tr>
            <tr style="text-align: center;">
                <td colspan="2" style="padding-top:25px">
                    <div style="padding-bottom:20px">
                        <asp:Button CssClass="button" ID="btnThem" runat="server" Text="Thêm" OnClick="btnThem_Click" />
                        <asp:Button CssClass="button" ID="btnSua" runat="server" Text="Cập Nhật" OnClick="btnSua_Click" />
                        <asp:Button CssClass="button" ID="btnXoa" runat="server" Text="Xóa" OnClick="btnXoa_Click" />
                        <asp:Button CssClass="button" ID="btnLamTrang" runat="server" Text="Làm trắng" OnClick="btnLamTrang_Click" />
                    </div>
                </td>
            </tr>
        </table>
        <div style="margin-left:50px; margin-right:50px; width:50%; text-align:center;">
            <div style="padding-bottom:20px;">
                <asp:TextBox CssClass="textbox" ID="txtTim" runat="server" placeholder="Tìm kiếm..."></asp:TextBox>
                <asp:Button CssClass="button" ID="btnTim" runat="server" Text="Tìm" OnClick="btnTim_Click" />
            </div>
            <div style="overflow:auto;">
                <asp:GridView style="text-align:left;" 
                    ID="gwKhachHang" runat="server" 
                    AutoGenerateColumns="False" 
                    CellPadding="3"
                    ForeColor="#333333" 
                    Width="400px" OnSelectedIndexChanged="gwKhachHang_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:CommandField HeaderText="Chọn" ShowSelectButton="True">
                            <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                            <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="TenKhachHang" HeaderText="Họ và tên" >
                            <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                            <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NgaySinh" HeaderText="Ngày sinh">
                            <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                            <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" >
                            <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                            <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="GioiTinh" HeaderText="Giới tính" >
                            <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                            <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SoDienThoai" HeaderText="Số điện thoại" >
                            <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                            <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CMND" HeaderText="CMND" >
                            <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                            <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                        </asp:BoundField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF"/>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Wrap="False" HorizontalAlign="Center" />
                    <PagerStyle BackColor="#2461BF" ForeColor="#000066" HorizontalAlign="Left" Wrap="False" />
                    <RowStyle BackColor="#EFF3FB" Wrap="False" ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
