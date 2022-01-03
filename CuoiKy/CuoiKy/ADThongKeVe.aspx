<%@ Page Title="Thống kê vé" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ADThongKeVe.aspx.cs" Inherits="CuoiKy.ADThongKeVe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="Style/styleTT.css"/>
    <link href='https://fonts.googleapis.com/css?family=Quicksand' rel='stylesheet'>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <p class="header-text"><b>Thống kê vé</b></p>
    <div style="display: flex; justify-content: center; padding-bottom: 20px; margin-left:50px">
        <div>
            <div style="margin-right:50px; width: 1000px;">
                <p style="font-family:'Quicksand'; font-size:25px;">
                    <b>Số lượng vé đã bán:</b> 
                    <asp:Label ID="lbSLV" runat="server" Text="Label"></asp:Label>
                </p>
                <p style="font-family:'Quicksand'; font-size:25px;">
                    <b>Tổng tiền:</b> 
                    <asp:Label ID="lbTien" runat="server" Text="Label"></asp:Label>
                </p>
                <asp:GridView style="text-align:left;" 
                    ID="gwVeBan" runat="server" 
                    AutoGenerateColumns="False" 
                    CellPadding="3"
                    ForeColor="#333333" 
                    Width="500px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <Columns>
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
                        <asp:BoundField DataField="GioBay" HeaderText="Giờ bay" >
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
