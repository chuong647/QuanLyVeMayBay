using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuoiKy
{
    public partial class QuanLi_PQ : System.Web.UI.Page
    {
        protected void btnQuanLi_Click(object sender, EventArgs e)
        {
            Response.Redirect("ADThongTinNhanVien.aspx");
        }
        protected void btnNhanVien_Click(object sender, EventArgs e)
        {
            Response.Redirect("USBanVe.aspx");
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}