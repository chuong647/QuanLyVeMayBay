using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuoiKy
{
    public partial class ADMayBay : System.Web.UI.Page
    {
        VemayBayDataContext kn = new VemayBayDataContext();
        public void loadgrid()
        {
            var Grid = from view in kn.MAYBAYs select view;
            gwMayBay.DataSource = Grid;
            gwMayBay.DataBind();
        }
        private void showMessage(string mess)
        {
            string strBuilder = "<script language='javascript'>alert('" + mess + "')</script>";
            Response.Write(strBuilder);
        }
        public void xoatrang()
        {
            txtghethuong.Text = "";
            txtghethuonggia.Text = "";
            txthangsanxuat.Text = "";
            txtmamaybay.Text = "";
            txttenmaybay.Text = "";
            txttimkiem.Text = "";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadgrid();
            }
        }
        protected void btnthem_Click(object sender, EventArgs e)
        {
            MAYBAY tb = new MAYBAY();
            tb.TenMayBay = txttenmaybay.Text;
            tb.HangSanXuat = txthangsanxuat.Text;
            tb.SoGheLTG = Int32.Parse(txtghethuonggia.Text);
            tb.SoGheLT = Int32.Parse(txtghethuong.Text);
            kn.MAYBAYs.InsertOnSubmit(tb);
            kn.SubmitChanges();
            loadgrid();
            Page.DataBind();
            xoatrang();
            showMessage("Đã thêm thông tin máy bay");
        }
        protected void gwMayBay_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                txtmamaybay.Enabled = false;
                txtmamaybay.Text = HttpUtility.HtmlEncode(gwMayBay.SelectedRow.Cells[1].Text).ToString();
                txttenmaybay.Text = HttpUtility.HtmlEncode(gwMayBay.SelectedRow.Cells[2].Text).ToString();
                txthangsanxuat.Text = HttpUtility.HtmlEncode(gwMayBay.SelectedRow.Cells[3].Text).ToString();
                txtghethuonggia.Text = HttpUtility.HtmlEncode(gwMayBay.SelectedRow.Cells[4].Text).ToString();
                txtghethuong.Text = HttpUtility.HtmlEncode(gwMayBay.SelectedRow.Cells[5].Text).ToString();
            }
            catch (Exception)
            {
            }
        }
        protected void btncapnhat_Click(object sender, EventArgs e)
        {
            var cn = from capnhat in kn.MAYBAYs
                     where capnhat.MaMayBay == Int32.Parse(txtmamaybay.Text)
                     select capnhat;
            foreach (var ud in cn)
            {
                ud.TenMayBay = txttenmaybay.Text;
                ud.HangSanXuat = txthangsanxuat.Text;
                ud.SoGheLTG = Int32.Parse(txtghethuonggia.Text);
                ud.SoGheLT = Int32.Parse(txtghethuong.Text);
                kn.SubmitChanges();
            }
            loadgrid();
            xoatrang();
            showMessage("Đã cập nhật thông tin máy bay");
        }
        protected void btnxoa_Click(object sender, EventArgs e)
        {
            var cn = from xoa in kn.MAYBAYs
                     where xoa.MaMayBay == Int32.Parse(txtmamaybay.Text)
                     select xoa;
            foreach (var delete in cn)
            {
                kn.MAYBAYs.DeleteOnSubmit(delete);
            }
            kn.SubmitChanges();
            loadgrid();
            Page.DataBind();
            xoatrang();
            showMessage("Đã xóa thông tin máy bay");
        }
        protected void btntimkiem_Click(object sender, EventArgs e)
        {
            var tk = from timkiem in kn.MAYBAYs
                     where timkiem.TenMayBay.EndsWith(txttimkiem.Text)
                     select timkiem;
            gwMayBay.DataSource = tk;
            gwMayBay.DataBind();
        }
        protected void btnLamTrang_Click(object sender, EventArgs e)
        {
            xoatrang();
        }
    }
}