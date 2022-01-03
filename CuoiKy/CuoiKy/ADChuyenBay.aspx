<%@ Page Title="Chuyến bay" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ADChuyenBay.aspx.cs" Inherits="CuoiKy.ADChuyenBay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="Style/styleTT.css"/>
    <link href='https://fonts.googleapis.com/css?family=Quicksand' rel='stylesheet'>
    <p class="header-text"><b>Chuyến bay</b></p>
    <div style="display: flex; justify-content: center;">
        <table>
          <tr>
              <td><b>Mã chuyến bay:</b></td>
              <td >  
                  <asp:TextBox Enabled="false" CssClass="textbox" ID="txtmachuyenbay" runat="server" ></asp:TextBox>
              </td>
              <td style="padding-left:50px; text-align:center" >
                  <asp:TextBox CssClass="textbox" ID="txttim" runat="server" placeholder="Tìm kiếm..."></asp:TextBox> 
                  <asp:Button CssClass="button" ID="tbntim" runat="server" Text="Tìm kiếm" OnClick="tbntim_Click" />
          </tr>
          <tr>
              <td ></td>
              <td>
              </td>
              <td rowspan="6" style="padding-left:50px">
                  <div style="overflow:auto;width:550px ">
                      <asp:GridView style="text-align:left;" 
                            ID="grv" runat="server" 
                            AutoGenerateColumns="False" 
                            CellPadding="3"
                            ForeColor="#333333" 
                            Width="550px" OnSelectedIndexChanged="grv_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                            <Columns>
                              <asp:CommandField  HeaderText="chọn" ShowSelectButton="true">
                                    <HeaderStyle Font-Names="quicksand" Font-Size="18px" />
                                    <ItemStyle Font-Names="quicksand" Font-Size="18px" />
                                </asp:CommandField>
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
                  </div>
              </td>
          </tr>
          <tr>
              <td><b>Tên máy bay:</b></td>
              <td>
                  <asp:DropDownList CssClass="drop" ID="drtenmaybay" runat="server"></asp:DropDownList>
              </td>
          </tr>
         <tr>
              <td><b>Nơi xuất phát:</b></td>
              <td>
                  <asp:DropDownList CssClass="drop" ID="dropnoixuatphat" runat="server"></asp:DropDownList>
              </td>
          </tr>
         <tr>
              <td ><b>Nơi Đến:</b></td>
              <td>
                  <asp:DropDownList CssClass="drop" ID="dropnoiden" runat="server"></asp:DropDownList>
              </td>
          </tr>
           
           <tr>
              <td ><b>Ngày đi:</b></td>
              <td>
                    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
                    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
                    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
                    <input id="datepicker" width="260px" name="datepick1" value="<%= tdate1 %>" />
                    <script>
                        $('#datepicker').datepicker({
                            showOtherMonths: true
                        });
                    </script>
                </td>
          </tr>
        <tr>
              <td><b>Ngày đến:</b></td>
              <td>
                  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
                    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
                    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
                    <input id="datepicker1" width="260px" name="datepick2" value="<%= tdate2 %>" />
                    <script>
                        $('#datepicker1').datepicker({
                            showOtherMonths: true
                        });
                    </script>
              </td>
          </tr>
           <tr>
              <td><b>Giờ bay:</b></td>
              <td>
                  <asp:TextBox CssClass="textbox"  ID="txtgiobay" runat="server" ></asp:TextBox>
              </td>
          </tr>
         <tr>
              <td><b>Giờ đến:</b></td>
              <td>
                  <asp:TextBox CssClass="textbox"  ID="txtgioden" runat="server" ></asp:TextBox>
              </td>
          </tr>
           <tr>
              <td><b>Ghi chú:</b></td>
              <td>
                  <asp:TextBox CssClass="textbox" ID="txtghichu" runat="server"></asp:TextBox>
              </td>
          </tr>
          <tr>
              <td></td>
                <td colspan="2" style="padding-top:20px;padding-bottom:20px"> 
                    <asp:Button CssClass="button" ID="btncapnhat" runat="server" Text="Cập nhật" OnClick="btncapnhat_Click" />
                    <asp:Button CssClass="button" ID="btnthem" runat="server" Text="Thêm" OnClick="btnthem_Click" />
                    <asp:Button CssClass="button" ID="btnxoa" runat="server" Text="Xóa" OnClick="btnxoa_Click" />
                    <asp:Button CssClass="button" ID="btnlt" runat="server" Text="Làm Trắng" OnClick="btnlt_Click" />
           
                </td>
                <td></td>
          </tr>
      </table>
    </div>
</asp:Content>
