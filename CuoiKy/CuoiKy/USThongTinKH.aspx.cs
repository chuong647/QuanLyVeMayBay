using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuoiKy
{
    public partial class USThongTinKH : System.Web.UI.Page
    {
        VemayBayDataContext kn = new VemayBayDataContext();
        public void load_gwKhachHang()
        {
            var q = from kh in kn.KHACHHANGs
                    select kh;
            gwKhachHang.DataSource = q;
            gwKhachHang.DataBind();
        }
        public void showMessage(string mess)
        {
            string strBuilder = "<script language='javascript'>alert('" + mess + "')</script>";
            Response.Write(strBuilder);
        }
        protected string tdate { get; set; }
        public void xoatrang()
        {
            txtCMND.Text = "";
            txtDiaChi.Text = "";
            txtSDT.Text = "";
            txtTen.Text = "";
            this.tdate = "";
            txtTim.Text = "";
            load_gwKhachHang();
            rdbGioiTinh.ClearSelection();
            txtCMND.Enabled = true;
        }
        public bool kiemtra(string cm)
        {
            var q = from kh in kn.KHACHHANGs
                    where kh.CMND == cm
                    select kh;
            if (q.Any())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_gwKhachHang();
                Page.DataBind();
            }
        }
        protected void gwKhachHang_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtCMND.Enabled = false;
            try
            {
                txtTen.Text = HttpUtility.HtmlDecode(gwKhachHang.SelectedRow.Cells[1].Text).ToString();
                this.tdate = HttpUtility.HtmlDecode(gwKhachHang.SelectedRow.Cells[2].Text).ToString();
                txtDiaChi.Text = HttpUtility.HtmlDecode(gwKhachHang.SelectedRow.Cells[3].Text).ToString();
                string gt = gwKhachHang.SelectedRow.Cells[4].Text;
                if (gt == "True")
                {
                    rdbGioiTinh.ClearSelection();
                    rdbGioiTinh.Items.FindByValue("true").Selected = true;
                }
                if (gt == "False")
                {
                    rdbGioiTinh.ClearSelection();
                    rdbGioiTinh.Items.FindByValue("false").Selected = true;
                }
                txtSDT.Text = HttpUtility.HtmlDecode(gwKhachHang.SelectedRow.Cells[5].Text).ToString();
                txtCMND.Text = HttpUtility.HtmlDecode(gwKhachHang.SelectedRow.Cells[6].Text).ToString();
            }
            catch (Exception)
            {

            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (kiemtra(txtCMND.Text))
            {
                showMessage("Khách hàng đã tồn tại");
            }
            else
            {
                KHACHHANG kh = new KHACHHANG();
                kh.TenKhachHang = txtTen.Text;
                string date = Request.Form["datepick"];
                kh.Ngaysinh = date;
                kh.GioiTinh = Boolean.Parse(rdbGioiTinh.SelectedValue);
                kh.DiaChi = txtDiaChi.Text;
                kh.SoDienThoai = txtSDT.Text;
                kh.CMND = txtCMND.Text;

                kn.KHACHHANGs.InsertOnSubmit(kh);
                kn.SubmitChanges();
                load_gwKhachHang();
                xoatrang();
                showMessage("Đã thêm thông tin khách hàng");
            }
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            var q = from kh in kn.KHACHHANGs
                    where kh.CMND == txtCMND.Text
                    select kh;
            foreach (var kh in q)
            {
                kh.TenKhachHang = txtTen.Text;
                string date = Request.Form["datepick"];
                kh.Ngaysinh = date;
                kh.GioiTinh = Boolean.Parse(rdbGioiTinh.SelectedValue);
                kh.DiaChi = txtDiaChi.Text;
                kh.SoDienThoai = txtSDT.Text;

                kn.SubmitChanges();
            }
            load_gwKhachHang();
            Page.DataBind();
            showMessage("Đã cập nhật thông tin khách hàng");
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            var q = from kh in kn.KHACHHANGs
                    where kh.CMND == txtCMND.Text
                    select kh;
            foreach (var kh in q)
            {
                kn.KHACHHANGs.DeleteOnSubmit(kh);
            }
            kn.SubmitChanges();
            load_gwKhachHang();
            xoatrang();
            showMessage("Đã xóa thông tin khách hàng");
        }

        protected void btnLamTrang_Click(object sender, EventArgs e)
        {
            xoatrang();
        }

        protected void btnTim_Click(object sender, EventArgs e)
        {
            var q = from kh in kn.KHACHHANGs
                    where kh.CMND.EndsWith(txtTim.Text) ||
                    kh.DiaChi.EndsWith(txtTim.Text) ||
                    kh.TenKhachHang.EndsWith(txtTim.Text) ||
                    kh.SoDienThoai.EndsWith(txtTim.Text)
                    select kh;
            gwKhachHang.DataSource = q;
            gwKhachHang.DataBind();
        }
    }
}