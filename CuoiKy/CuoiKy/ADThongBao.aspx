<%@ Page Title="Thông báo" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ADThongBao.aspx.cs" Inherits="CuoiKy.ADThongBao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="Style/styleTT.css"/>
    <link rel="stylesheet" href="Style/styleTBAD.css"/>
    <link href='https://fonts.googleapis.com/css?family=Quicksand' rel='stylesheet'>
    <script src="https://kit.fontawesome.com/a076d05399.js"> </script>
    <p class="header-text"><b>Thông báo</b></p>
    <div style="display: flex; justify-content: center; padding-bottom: 20px; margin-left:50px">
        <table style="width:550px;">
            <tr>
                <td><b>Mã thông báo:</b></td>
                <td><asp:TextBox Enabled="false" CssClass="textbox" ID="txtmatb" runat="server" ></asp:TextBox></td>
            </tr>
            <tr>
                <td><b>Tiêu đề:</b></td>
                <td><asp:TextBox CssClass="textbox" ID="txttieude" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><b>Nội dung:</b></td>
                <td style="padding-top:10px;"><asp:TextBox TextMode="MultiLine" CssClass="txtnoidung" ID="txtnoidung" runat="server" Height="100px" ></asp:TextBox></td>
            </tr>
            <tr>
                <td style="text-align:center" colspan="2">
                    <asp:Button CssClass="button" ID="btnthem" runat="server" Text="Thêm" OnClick="btnthem_Click"/>
                    <asp:Button CssClass="button" ID="btncapnhat" runat="server" Text="Cập Nhật" OnClick="btncapnhat_Click"/>
                    <asp:Button CssClass="button" ID="btnxoa" runat="server" Text="Xóa" OnClick="btnxoa_Click"/>
                    <asp:Button CssClass="button" ID="btnlamtrang" runat="server" Text="Làm trắng" OnClick="btnlamtrang_Click"/>
                </td>
            </tr>
        </table>
        <div style="margin-right:50px; width: 550px; text-align:center;">
            <div style="padding-bottom:20px;">
                <asp:TextBox CssClass="textbox" ID="txttimkiem" runat="server" placeholder="Tìm kiếm..." ></asp:TextBox>
                <asp:Button Cssclass="button" ID="btntimkiem" runat="server" Text="Tìm kiếm" OnClick="btntimkiem_Click" />
            </div>
            <div style="overflow:auto;">
                <asp:GridView style="text-align:left;" 
                    ID="Gridthongbao" runat="server" 
                    AutoGenerateColumns="False" 
                    CellPadding="3"
                    ForeColor="#333333" 
                    Width="550px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="Gridthongbao_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField HeaderText="Chọn" SelectText="Chọn" ShowSelectButton="True" >
                            <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                            <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="MaThongBao" HeaderText="Mã thông báo">
                            <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                            <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TieuDe" HeaderText="Tiêu đề" >
                            <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                            <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NoiDung" HeaderText="Nội dung thông báo">
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

