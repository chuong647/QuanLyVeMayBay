using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuoiKy
{
    public partial class USThongTinCaNhan : System.Web.UI.Page
    {
        VemayBayDataContext kn = new VemayBayDataContext();
        protected string tdate { get; set; }
        private void UploadAvatar(string fileName)
        {
            // Xây dựng đường dẫn sẽ upload lên server
            // Ở đây, chúng ta lưu tất cả ảnh trong thư mục [images] trên root web
            String filePath = "~/image/" + fileName;

            if (fuAvt.HasFile)
            {
                fuAvt.SaveAs(Server.MapPath(filePath));
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var q = from nv in kn.NHANVIENs
                        where nv.TenDangNhap == Session["username"].ToString()
                        select nv;
                foreach (var nv in q)
                {
                    txtMaNV.Text = nv.MaNhanVien.ToString();
                    txtTen.Text = nv.TenNhanVien;
                    this.tdate = nv.NgaySinh;
                    bool gt = nv.GioiTinh;
                    if (gt == true)
                    {
                        rdbGioiTinh.ClearSelection();
                        rdbGioiTinh.Items.FindByValue("true").Selected = true;
                    }
                    if (gt == false)
                    {
                        rdbGioiTinh.ClearSelection();
                        rdbGioiTinh.Items.FindByValue("false").Selected = true;
                    }
                    txtDiaChi.Text = nv.DiaChi;
                    txtSDT.Text = nv.SoDienThoai;
                    //string cv = nv.ChucVu;
                    //if (cv == "Quản Lý")
                    //{
                    //    rdbChucVu.ClearSelection();
                    //    rdbChucVu.Items.FindByValue("true").Selected = true;
                    //}
                    //if (cv == "Nhân Viên")
                    //{
                    //    rdbChucVu.ClearSelection();
                    //    rdbChucVu.Items.FindByValue("false").Selected = true;
                    //}
                    string fileName = "~/image/" + nv.AnhNV.ToString().Trim();
                    avtCaNhan.ImageUrl = fileName;
                }
            }
        }
        public void showMessage(string mess)
        {
            string strBuilder = "<script language='javascript'>alert('" + mess + "')</script>";
            Response.Write(strBuilder);
        }
        protected void btncapnhat_Click(object sender, EventArgs e)
        {
            //chưa cập nhật đươc
            var q = from nv in kn.NHANVIENs
                    where nv.MaNhanVien == Int32.Parse(txtMaNV.Text)
                    select nv;
            foreach (var nv in q)
            {
                nv.TenNhanVien = txtTen.Text;
                nv.NgaySinh = Request.Form["datepick"];
                nv.GioiTinh = Boolean.Parse(rdbGioiTinh.SelectedValue);
                nv.DiaChi = txtDiaChi.Text;
                nv.SoDienThoai = txtSDT.Text;
                string extension = System.IO.Path.GetExtension(avtCaNhan.ImageUrl);
                string fileName = Session["username"].ToString() + extension;
                nv.AnhNV = fileName;
                UploadAvatar(fileName);

                kn.SubmitChanges();
                showMessage("Đã cập nhật thông tin cá nhân");
            }
            //refresh lại trang
            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
    }
}