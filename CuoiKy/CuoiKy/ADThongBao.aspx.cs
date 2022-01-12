using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuoiKy
{
    public partial class ADThongBao : System.Web.UI.Page
    {
        VemayBayDataContext kn = new VemayBayDataContext();
        public void loadgrid()
        {
            var Grid = from view in kn.THONGBAOs select view;
            Gridthongbao.DataSource = Grid;
            Gridthongbao.DataBind();
        }
        public void showMessage(string mess)
        {
            string strBuilder = "<script language='javascript'>alert('" + mess + "')</script>";
            Response.Write(strBuilder);
        }
        public void xoatrang()
        {
            txtmatb.Text = "";
            txtnoidung.Text = "";
            txttieude.Text = "";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadgrid();
            }
        }
        protected void Gridthongbao_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtmatb.Enabled = false;
            try
            {
                txtmatb.Text = HttpUtility.HtmlDecode(Gridthongbao.SelectedRow.Cells[1].Text).ToString();
                txttieude.Text = HttpUtility.HtmlDecode(Gridthongbao.SelectedRow.Cells[2].Text).ToString();
                txtnoidung.Text = HttpUtility.HtmlDecode(Gridthongbao.SelectedRow.Cells[3].Text).ToString();

            }
            catch (Exception)
            {

            }
        }

        protected void btnthem_Click(object sender, EventArgs e)
        {
            THONGBAO tb = new THONGBAO();
            tb.TieuDe = txttieude.Text;
            tb.NoiDung = txtnoidung.Text;

            kn.THONGBAOs.InsertOnSubmit(tb);
            kn.SubmitChanges();
            loadgrid();
            Page.DataBind();
            xoatrang();
            showMessage("Đã thêm thông báo");
        }

        protected void btncapnhat_Click(object sender, EventArgs e)
        {
            var cn = from capnhat in kn.THONGBAOs
                     where capnhat.MaThongBao == Int32.Parse(txtmatb.Text)
                     select capnhat;
            foreach (var ud in cn)
            {
                ud.TieuDe = txttieude.Text;
                ud.NoiDung = txtnoidung.Text;
                kn.SubmitChanges();
            }
            xoatrang();
            showMessage("Đã cập nhật thông báo");
        }

        protected void btnxoa_Click(object sender, EventArgs e)
        {
            var cn = from xoa in kn.THONGBAOs
                     where xoa.MaThongBao == Int32.Parse(txtmatb.Text)
                     select xoa;
            foreach (var delete in cn)
            {
                kn.THONGBAOs.DeleteOnSubmit(delete);
            }
            kn.SubmitChanges();
            loadgrid();
            Page.DataBind();
            xoatrang();
            showMessage("Đã xóa thông báo");
        }

        protected void btnlamtrang_Click(object sender, EventArgs e)
        {
            xoatrang();
        }

        protected void btntimkiem_Click(object sender, EventArgs e)
        {
            var tk = from timkiem in kn.THONGBAOs
                     where timkiem.MaThongBao.ToString().EndsWith(txttimkiem.Text)
                     || timkiem.TieuDe.EndsWith(txttimkiem.Text)
                     select timkiem;
            Gridthongbao.DataSource = tk;
            Gridthongbao.DataBind();
        }
    }
}