using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuoiKy
{
    public partial class USThongBao : System.Web.UI.Page
    {
        VemayBayDataContext kn = new VemayBayDataContext();
        public void loadthongbao()
        {
            var q = from tb in kn.THONGBAOs
                    select tb;
            gwThongBao.DataSource = q;
            gwThongBao.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadthongbao();
            }
        }
        protected void grvthongbao_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                lbThongBao.Text = HttpUtility.HtmlDecode(gwThongBao.SelectedRow.Cells[2].Text).ToString();
                txtNoiDung.Text = HttpUtility.HtmlDecode(gwThongBao.SelectedRow.Cells[3].Text).ToString();
            }
            catch
            {

            }

        }
    }
}