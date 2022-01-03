<%@ Page Title="Thông báo" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="USThongBao.aspx.cs" Inherits="CuoiKy.USThongBao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="Style/StyleTB.css">
    <link rel="stylesheet" href="Style/StyleTT.css"/>
    <link href='https://fonts.googleapis.com/css?family=Quicksand' rel='stylesheet'>
    <table style="width:100%;">
        <tr>
            <td  colspan="3" style=" display:flex; justify-content:center; text-align:center;padding-left:100px; padding-top:50px;">
                <div  style=" border:1px; overflow:auto; width:1020px">
                     <asp:GridView style="text-align:left;" 
                        ID="gwThongBao" runat="server" 
                        AutoGenerateColumns="False" 
                        CellPadding="3"
                        ForeColor="#333333" 
                        Width="100%" 
                        OnSelectedIndexChanged="grvthongbao_SelectedIndexChanged" 
                        BackColor="White" 
                        BorderColor="#CCCCCC"
                        BorderStyle="None" 
                        BorderWidth="1px">
                        <Columns>
                            <asp:CommandField  HeaderText="Chọn" SelectText="Chọn" ShowSelectButton="true">
                                <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                                <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="MaThongBao" HeaderText="Mã thông báo" >
                                <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                                <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TieuDe" HeaderText=" Tiêu đề" >
                                <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                                <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="NoiDung" HeaderText= "Nội dung" >
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
            </td>
        </tr>
        <tr style="display:flex; justify-content:center;">
            <td colspan="3"><asp:Label CssClass="label" ID="lbThongBao" runat="server" Text="Thông báo"/></td>
        </tr>
        <tr>
            <td colspan="3" style=" display:flex; justify-content:center; padding-left:100px;padding-top:20px; padding-bottom:40px">
                <asp:TextBox  CssClass="text" TextMode="MultiLine" ID="txtNoiDung" runat="server" Enabled="False"></asp:TextBox>
            </td>
        </tr>
    </table>

</asp:Content>
