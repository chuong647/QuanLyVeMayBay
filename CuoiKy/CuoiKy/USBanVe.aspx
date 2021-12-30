<%@ Page Title="Bán Vé" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="USBanVe.aspx.cs" Inherits="CuoiKy.USBanVe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="Style/StyleTT.css"/>
    <link rel="stylesheet" href="Style/StyleBanVe.css"/>
    <link href='https://fonts.googleapis.com/css?family=Quicksand' rel='stylesheet'>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <p class="header-text"><b>Bán vé</b></p>
    <div style="display: flex; justify-content: center; padding-bottom: 20px;">
        <table >
            <tr>
                <td><b>Số lượng vé:</b></td>
                <td>
                    <asp:TextBox CssClass="textbox" ID="txtSLB" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td><b>Loại vé:</b></td>
                <td style="padding-left:1px">
                    <asp:RadioButtonList ID="rdbLoaiVe" CssClass="radio"  runat="server" RepeatDirection="Horizontal"> 
                        <asp:ListItem Value="LV01">Phổ thông</asp:ListItem>
                        <asp:ListItem Value="LV02">Thương gia</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td><b>Khách hàng:</b></td>
                <td><asp:DropDownList CssClass="drop" ID="ddlKhachHang" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td><b>Mã chuyến bay:</b></td>
                <td><asp:DropDownList CssClass="drop" ID="ddlMaChuyenBay" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td style="display:flex;">
                    <asp:Button CssClass="hiddenbtn" ID="btnGia" Text="Tổng giá:" runat="server" Font-Bold="True" OnClick="btnGia_Click" />
                </td>
                <td><asp:Label CssClass="gia" ID="lbGia" runat="server" Text="0,000 VNĐ"></asp:Label></td>
            </tr>
            <tr style="text-align: center;">
                <td colspan="2">
                    <div style="padding-top:15px">
                        <asp:Button CssClass="button" ID="btnThem" runat="server" Text="Thêm" OnClick="btnThem_Click" />
                        <asp:Button CssClass="button" ID="btnLamTrang" runat="server" Text="Làm trắng" OnClick="btnLamTrang_Click" />
                    </div>
                </td>
            </tr>
        </table>
        <div style="margin-left:50px; margin-right:50px; width:50%; text-align:center;">
            <div style="padding-bottom:20px;">
                <asp:TextBox CssClass="textbox" ID="txtTim" runat="server" placeholder="Tìm kiếm..."></asp:TextBox>
                <asp:DropDownList CssClass="tieuchi" ID="ddlTieuChi" runat="server">
                    <asp:ListItem Value="0">--Chọn tiêu chí--</asp:ListItem>
                    <asp:ListItem Value="ChuyenBay">Chuyến bay</asp:ListItem>
                    <asp:ListItem Value="Ve">Vé</asp:ListItem>
                </asp:DropDownList>
                <asp:Button CssClass="button" ID="btnTim" runat="server" Text="Tìm" OnClick="btnTim_Click" />
            </div>
            <div style="overflow:auto;">
                <p style="text-align:left; font-size:25px; font-family:'Quicksand';"><b>Danh sách chuyến bay</b></p>
                <asp:GridView style="text-align:left;" 
                            ID="grv" runat="server" 
                            AutoGenerateColumns="False" 
                            CellPadding="3"
                            ForeColor="#333333" 
                            Width="550px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                            <Columns>
                              <asp:BoundField DataField="MaChuyenBay" HeaderText="Mã Chuyến Bay" >
                                    <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                                    <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                                </asp:BoundField> 
                              <asp:BoundField DataField="TenMayBay" HeaderText="Tên máy bay" >
                                    <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                                    <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                                </asp:BoundField>
                              <asp:BoundField DataField="TenD" HeaderText="Nơi xuất phát" >
                                    <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                                    <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                                </asp:BoundField>
                              <asp:BoundField DataField="TenC" HeaderText="Nơi đến" >
                                    <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                                    <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                                </asp:BoundField>
                              <asp:BoundField DataField="NgayDi" HeaderText="Ngày đi" >
                                    <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                                    <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                                </asp:BoundField>
                              <asp:BoundField DataField="NgayDen" HeaderText="Ngày đến" >
                                    <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                                    <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                                </asp:BoundField>
                              <asp:BoundField DataField="GioBay" HeaderText="Giờ bay" >
                                    <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                                    <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                                </asp:BoundField>
                               <asp:BoundField DataField="GioDen" HeaderText="Giờ đến" >
                                    <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                                    <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                                </asp:BoundField>
                              <asp:BoundField DataField="GhiChu" HeaderText="Ghi chú" >
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
                <p style="text-align:left; font-size:25px; font-family:'Quicksand';"><b>Danh sách vé đã đặt</b></p>
                <asp:GridView style="text-align:left;" 
                    ID="gwVeBan" runat="server" 
                    AutoGenerateColumns="False" 
                    CellPadding="3"
                    ForeColor="#333333" 
                    Width="400px" OnRowDeleting="gwVeBan_RowDeleting" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="gwVeBan_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" DeleteText="Hủy vé" >
                            <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                            <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                        </asp:CommandField>
                        <asp:CommandField HeaderText="In vé" SelectText="Print" ShowSelectButton="True" >
                            <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                            <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="id" HeaderText="ID" >
                            <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                            <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TenLoai" HeaderText="Loại vé">
                            <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                            <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SLVeBan" HeaderText="Số lượng vé" >
                            <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                            <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TenNhanVien" HeaderText="Nhân viên" >
                            <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                            <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TenKhachHang" HeaderText="Khách hàng" >
                            <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                            <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TenMayBay" HeaderText="Máy bay">
                            <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                            <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NgayDi" HeaderText="Ngày đi" >
                            <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                            <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NgayDen" HeaderText="Ngày đến" >
                            <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                            <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="GioBay" HeaderText="Giờ bay" >
                            <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                            <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TenD" HeaderText="Nơi xuất phát" >
                            <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                            <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TenC" HeaderText="Nơi đến" >
                            <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                            <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="GhiChu" HeaderText="Ghi chú" >
                            <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                            <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TongGia" HeaderText="Tổng giá" >
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