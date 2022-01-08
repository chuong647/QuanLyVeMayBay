using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuoiKy
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        VemayBayDataContext kn = new VemayBayDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            var q = from nv in kn.NHANVIENs
                    where nv.TenDangNhap == Session["username"].ToString()
                    select nv;
            foreach(var nv in q)
            {
                lbUser.Text = nv.TenNhanVien;
            }
        }
        protected void btnDangXuat_Click(object sender, EventArgs e)
        {
            Session.Remove("username");
            Response.Redirect("DangNhap.aspx");
        }
    }
}