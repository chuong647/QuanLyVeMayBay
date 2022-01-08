using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuoiKy
{
    public partial class ADThongTinNhanVien : System.Web.UI.Page
    {
        VemayBayDataContext kn = new VemayBayDataContext();
        protected string tdate { get; set; }
        public void showMessage(string mess)
        {
            string strBuilder = "<script language='javascript'>alert('" + mess + "')</script>";
            Response.Write(strBuilder);
        }
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
        public void xoatrang()
        {
            txtUsername.Enabled = true;
            rdbChucVu.Enabled = true;
            txtMaNV.Text = "";
            txtTen.Text = "";
            this.tdate = "";
            rdbGioiTinh.ClearSelection();
            txtDiaChi.Text = "";
            txtSDT.Text = "";
            rdbChucVu.ClearSelection();
            txtUsername.Text = "";
            txtPassword.Text = "nhanvienmoi";
            avtNhanVien.ImageUrl = "";
        }
        public void load_gwNhanVien()
        {
            var q = from nv in kn.NHANVIENs
                    select nv;
            gwNhanVien.DataSource = q;
            gwNhanVien.DataBind();
        }
        public bool kiemtra(string us)
        {
            var q = from nv in kn.NHANVIENs
                    where nv.TenDangNhap == us
                    select nv;
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
                load_gwNhanVien();
                Page.DataBind();
            }
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (kiemtra(txtUsername.Text))
            {
                showMessage("Tên đăng nhập đã tồn tại");
            }
            else
            {
                NHANVIEN nv = new NHANVIEN();
                nv.TenNhanVien = txtTen.Text;
                nv.NgaySinh = Request.Form["datepick"];
                nv.DiaChi = txtDiaChi.Text;
                nv.GioiTinh = Boolean.Parse(rdbGioiTinh.SelectedValue);
                nv.SoDienThoai = txtSDT.Text;
                bool cv = Boolean.Parse(rdbChucVu.SelectedValue);
                if (cv == true)
                {
                    nv.ChucVu = "Quản Lý";
                }
                else
                {
                    nv.ChucVu = "Nhân Viên";
                }
                nv.TenDangNhap = txtUsername.Text;
                nv.MatKhau = txtPassword.Text;
                string extension = System.IO.Path.GetExtension(fuAvt.FileName);
                string fileName = txtUsername.Text + extension;
                nv.AnhNV = fileName;
                UploadAvatar(fileName);

                kn.NHANVIENs.InsertOnSubmit(nv);
                kn.SubmitChanges();
                load_gwNhanVien();
                xoatrang();
                Page.DataBind();
                showMessage("Đã thêm nhân viên");
            }
        }

        protected void btnLamTrang_Click(object sender, EventArgs e)
        {
            xoatrang();
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            var q = from nv in kn.NHANVIENs
                    where nv.MaNhanVien == Int32.Parse(txtMaNV.Text)
                    select nv;
            foreach (var nv in q)
            {
                kn.NHANVIENs.DeleteOnSubmit(nv);
            }
            kn.SubmitChanges();
            load_gwNhanVien();
            xoatrang();
            Page.DataBind();
            showMessage("Đã xóa nhân viên");
        }
        protected void gwNhanVien_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtUsername.Enabled = false;
            txtMaNV.Enabled = false;
            rdbChucVu.Enabled = false;
            try
            {
                txtMaNV.Text = HttpUtility.HtmlDecode(gwNhanVien.SelectedRow.Cells[1].Text).ToString();
                txtTen.Text = HttpUtility.HtmlDecode(gwNhanVien.SelectedRow.Cells[2].Text).ToString();
                this.tdate = HttpUtility.HtmlDecode(gwNhanVien.SelectedRow.Cells[3].Text).ToString();
                txtDiaChi.Text = HttpUtility.HtmlDecode(gwNhanVien.SelectedRow.Cells[4].Text).ToString();
                string gt = gwNhanVien.SelectedRow.Cells[5].Text;
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
                txtSDT.Text = HttpUtility.HtmlDecode(gwNhanVien.SelectedRow.Cells[6].Text).ToString();
                string cv = HttpUtility.HtmlDecode(gwNhanVien.SelectedRow.Cells[7].Text).ToString();
                if (cv == "Quản Lý")
                {
                    rdbChucVu.ClearSelection();
                    rdbChucVu.Items.FindByValue("true").Selected = true;
                }
                if (cv == "Nhân Viên")
                {
                    rdbChucVu.ClearSelection();
                    rdbChucVu.Items.FindByValue("false").Selected = true;
                }
                txtUsername.Text = HttpUtility.HtmlDecode(gwNhanVien.SelectedRow.Cells[8].Text).ToString();
                txtPassword.Text = HttpUtility.HtmlDecode(gwNhanVien.SelectedRow.Cells[9].Text).ToString();

                var q = from nv in kn.NHANVIENs
                        where nv.MaNhanVien == Int32.Parse(HttpUtility.HtmlDecode(gwNhanVien.SelectedRow.Cells[1].Text).ToString())
                        select nv;
                foreach (var nv in q)
                {
                    string fileName = "~/image/" + nv.AnhNV.ToString().Trim();
                    avtNhanVien.ImageUrl = fileName;
                }
            }
            catch (Exception)
            {

            }
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
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
                string extension = System.IO.Path.GetExtension(avtNhanVien.ImageUrl);
                string fileName = txtUsername.Text + extension;
                nv.AnhNV = fileName;
                UploadAvatar(fileName);

                kn.SubmitChanges();
                load_gwNhanVien();
                showMessage("Đã cập nhật thông tin  nhân viên");
            }
            //refresh lại trang
            Page.Response.Redirect(Page.Request.Url.ToString(), true);//Page.Request.Url.ToString(): Lấy đường dẫn của web page
        }

        protected void btnTim_Click(object sender, EventArgs e)
        {
            var q = from nv in kn.NHANVIENs
                    where (nv.MaNhanVien).ToString().EndsWith(txtTim.Text)
                          || nv.ChucVu.EndsWith(txtTim.Text)
                          || nv.DiaChi.EndsWith(txtTim.Text)
                          || nv.TenNhanVien.EndsWith(txtTim.Text)
                    select nv;
            gwNhanVien.DataSource = q;
            gwNhanVien.DataBind();
        }
    }
}