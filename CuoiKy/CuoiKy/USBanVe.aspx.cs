using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuoiKy
{
    public partial class USBanVe : System.Web.UI.Page
    {
        VemayBayDataContext kn = new VemayBayDataContext();
        public void load_gwVeBan()
        {
            var q = from vb in kn.VEBANs
                    join lv in kn.LOAIVEs on vb.MaLoai equals lv.MaLoai
                    join nv in kn.NHANVIENs on vb.MaNhanVien equals nv.MaNhanVien
                    join kh in kn.KHACHHANGs on vb.CMND equals kh.CMND
                    join cb in kn.CHUYENBAYs on vb.MaChuyenBay equals cb.MaChuyenBay
                    join ddc in kn.DIEMDAUs on cb.MaDau equals ddc.MaDau
                    join ddd in kn.DIEMCUOIs on cb.MaCuoi equals ddd.MaCuoi
                    join mb in kn.MAYBAYs on cb.MaMayBay equals mb.MaMayBay
                    select new
                    {
                        vb.id,vb.SLVeBan, vb.TongGia,
                        lv.TenLoai,
                        nv.TenNhanVien,
                        kh.TenKhachHang,
                        cb.MaChuyenBay,
                        cb.NgayDen,
                        cb.NgayDi,
                        cb.GhiChu,
                        cb.GioBay,
                        ddc.TenD,
                        ddd.TenC,
                        mb.TenMayBay
                    };
            gwVeBan.DataSource = q;
            gwVeBan.DataBind();
        }
        public void load_ChuyenBay()
        {
            var q = from cb in kn.CHUYENBAYs
                    join ddc in kn.DIEMDAUs on cb.MaDau equals ddc.MaDau
                    join ddd in kn.DIEMCUOIs on cb.MaCuoi equals ddd.MaCuoi
                    join mb in kn.MAYBAYs on cb.MaMayBay equals mb.MaMayBay
                    select new
                    {
                        cb.MaChuyenBay,
                        mb.TenMayBay,
                        ddc.TenD,
                        ddd.TenC,
                        cb.NgayDi,
                        cb.NgayDen,
                        cb.GioBay,
                        cb.GioDen,
                        cb.GhiChu
                    };
            grv.DataSource = q;
            grv.DataBind();
        }
        public void load_ddlKhachHang()
        {
            var q = from kh in kn.KHACHHANGs
                    select kh;
            ddlKhachHang.DataSource = q;
            ddlKhachHang.DataTextField = "TenKhachHang";
            ddlKhachHang.DataValueField = "CMND";
            ddlKhachHang.DataBind();
        }
        public void load_ddlMaChuyenBay()
        {
            var q = from cb in kn.CHUYENBAYs
                    select cb;
            ddlMaChuyenBay.DataSource = q;
            ddlMaChuyenBay.DataTextField = "MaChuyenBay";
            ddlMaChuyenBay.DataValueField = "MaChuyenBay";
            ddlMaChuyenBay.DataBind();
        }
        public void showMessage(string mess)
        {
            string strBuilder = "<script language='javascript'>alert('" + mess + "')</script>";
            Response.Write(strBuilder);
        }
        public void xoatrang()
        {
            //txtMaVe.Text = "";
            txtSLB.Text = "";
            ddlKhachHang.ClearSelection();
            ddlMaChuyenBay.ClearSelection();
            rdbLoaiVe.ClearSelection();
            lbGia.Text = "0,000";
        }
   
        public void inve(string mve, string tmb, string lv, string ten, string ndi, string nden, string ngdi, string gbay, string gia)
        {
            string fileName = "E:\\Mon Hoc\\Cong Nghe NET\\CuoiKy\\CuoiKy\\Ve\\" + mve + ".txt";
            FileStream fs = new FileStream(fileName, FileMode.Create);
            StreamWriter swriter = new StreamWriter(fs, Encoding.UTF8);
            swriter.WriteLine("Mã vé: " + mve +
                                "\r\n Tên máy bay: " + tmb +
                                "\r\n Họ và tên khách hàng: " + ten +
                                "\r\n Loại ghế: " + lv +
                                "\r\n Nơi xuất phát: " + ndi +
                                "\r\n Nơi đến: " + nden +
                                "\r\n Ngày đi: " + ngdi +
                                "\r\n Giờ bay: " + gbay);
           
            swriter.Flush();
            fs.Close();
        }
        public void themve()
        {
            VEBAN vb = new VEBAN();
            vb.MaLoai = rdbLoaiVe.SelectedValue;
            vb.SLVeBan = Int32.Parse(txtSLB.Text);
            vb.CMND = ddlKhachHang.SelectedValue;
            vb.MaChuyenBay = Int32.Parse(ddlMaChuyenBay.SelectedValue);

            var q = from lv in kn.LOAIVEs
                    where lv.MaLoai == rdbLoaiVe.SelectedValue.ToString()
                    select lv;
            foreach (var lv in q)
            {
                int t = Int32.Parse(txtSLB.Text) * Int32.Parse(lv.Gia);
                vb.TongGia = t;
            }
            var q1 = from nv in kn.NHANVIENs
                     where nv.TenDangNhap == Session["username"].ToString()
                     select nv;
            foreach (var nv in q1)
            {
                vb.MaNhanVien = nv.MaNhanVien;
            }
            kn.VEBANs.InsertOnSubmit(vb);

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_gwVeBan();
                load_ddlKhachHang();
                load_ddlMaChuyenBay();
                load_ChuyenBay();
                Page.DataBind();
            }
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            var q = from cb in kn.CHUYENBAYs
                    join mb in kn.MAYBAYs on cb.MaMayBay equals mb.MaMayBay
                    where Int32.Parse(ddlMaChuyenBay.SelectedValue) == cb.MaChuyenBay
                    select mb;
            foreach (var lg in q)
            {
                if (txtSLB.Text.Equals(""))
                {
                    showMessage("Vui lòng nhập số lượng vé");
                }
                else
                {
                    if (rdbLoaiVe.SelectedValue.ToString().Equals("LV01"))
                    {
                        if (lg.SoGheLT <= 0)
                        {
                            showMessage("Máy bay đã hết ghế hạng phổ thông.");
                        }
                        else
                        {
                            if (Int32.Parse(txtSLB.Text) > lg.SoGheLT)
                            {
                                showMessage("Số ghế còn lại không đủ");
                            }
                            else
                            {
                                lg.SoGheLT = lg.SoGheLT - Int32.Parse(txtSLB.Text);
                                themve();
                                showMessage("Đã thêm vé");
                            }
                        }
                    }
                    else
                    {
                        if (lg.SoGheLTG <= 0)
                        {
                            showMessage("Máy bay đã hết ghế hạng thương gia.");
                        }
                        else
                        {
                            if (Int32.Parse(txtSLB.Text) > lg.SoGheLTG)
                            {
                                showMessage("Số ghế còn lại không đủ");
                            }
                            else
                            {
                                lg.SoGheLTG = lg.SoGheLTG - Int32.Parse(txtSLB.Text);
                                themve();
                                showMessage("Đã thêm vé");
                            }
                        }

                    }
                }
                kn.SubmitChanges();
                load_ddlKhachHang();
                load_ddlMaChuyenBay();
                load_ChuyenBay();
                load_gwVeBan();
                xoatrang();
                Page.DataBind();
            }
        }

        protected void btnLamTrang_Click(object sender, EventArgs e)
        {
            xoatrang();
        }

        protected void gwVeBan_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string i = gwVeBan.Rows[e.RowIndex].Cells[2].Text;
            var q = from vb in kn.VEBANs
                    where vb.id == Int32.Parse(i)
                    select vb;
            foreach (var vb in q)
            {
                var q1 = from cb in kn.CHUYENBAYs
                         join mb in kn.MAYBAYs on cb.MaMayBay equals mb.MaMayBay
                         where gwVeBan.Rows[e.RowIndex].Cells[7].Text == mb.TenMayBay
                         select mb;
                foreach (var mb in q1)
                {
                    if (HttpUtility.HtmlDecode(gwVeBan.Rows[e.RowIndex].Cells[3].Text).ToString() == "Hạng Thường")
                    {
                        mb.SoGheLT += Int32.Parse(gwVeBan.Rows[e.RowIndex].Cells[4].Text);
                    }
                    else
                    {
                        mb.SoGheLTG += Int32.Parse(gwVeBan.Rows[e.RowIndex].Cells[4].Text);
                    }
                }
                kn.VEBANs.DeleteOnSubmit(vb);
                showMessage("Đã hủy vé");
            }
            kn.SubmitChanges();
            load_ddlKhachHang();
            load_ddlMaChuyenBay();
            load_ChuyenBay();
            load_gwVeBan();
            Page.DataBind();
        }

        protected void btnGia_Click(object sender, EventArgs e)
        {
            var q = from lv in kn.LOAIVEs
                    where lv.MaLoai == rdbLoaiVe.SelectedValue.ToString()
                    select lv;
            foreach (var lv in q)
            {
                int t = Int32.Parse(txtSLB.Text) * Int32.Parse(lv.Gia);
                lbGia.Text = t.ToString("0,0") + " VNĐ";
            }
        }

        protected void btnTim_Click(object sender, EventArgs e)
        {
            if (ddlTieuChi.SelectedValue.Equals("Ve"))
            {
                load_ChuyenBay();
                var q = from vb in kn.VEBANs
                        join lv in kn.LOAIVEs on vb.MaLoai equals lv.MaLoai
                        join nv in kn.NHANVIENs on vb.MaNhanVien equals nv.MaNhanVien
                        join kh in kn.KHACHHANGs on vb.CMND equals kh.CMND
                        join cb in kn.CHUYENBAYs on vb.MaChuyenBay equals cb.MaChuyenBay
                        join ddc in kn.DIEMDAUs on cb.MaDau equals ddc.MaDau
                        join ddd in kn.DIEMCUOIs on cb.MaCuoi equals ddd.MaCuoi
                        join mb in kn.MAYBAYs on cb.MaMayBay equals mb.MaMayBay
                        where lv.TenLoai.EndsWith(txtTim.Text)
                        || nv.TenNhanVien.EndsWith(txtTim.Text)
                        || kh.TenKhachHang.EndsWith(txtTim.Text)
                        || mb.TenMayBay.EndsWith(txtTim.Text)
                        || cb.NgayDi.EndsWith(txtTim.Text)
                        select new
                        {
                            vb.id,
                            vb.SLVeBan,
                            vb.TongGia,
                            lv.TenLoai,
                            nv.TenNhanVien,
                            kh.TenKhachHang,
                            cb.NgayDen,
                            cb.NgayDi,
                            cb.GhiChu,
                            cb.GioBay,
                            mb.TenMayBay,
                            ddc.TenD,
                            ddd.TenC
                        };
                gwVeBan.DataSource = q;
                gwVeBan.DataBind();
            }
            else
            {
                if (ddlTieuChi.SelectedValue.Equals("ChuyenBay"))
                {
                    load_gwVeBan();
                    var q = from tim in kn.CHUYENBAYs
                            join dau in kn.DIEMDAUs on tim.MaDau equals dau.MaDau
                            join cuoi in kn.DIEMCUOIs on tim.MaCuoi equals cuoi.MaCuoi
                            join ten in kn.MAYBAYs on tim.MaMayBay equals ten.MaMayBay
                            where (tim.MaChuyenBay).ToString().EndsWith(txtTim.Text)
                            || dau.TenD.EndsWith(txtTim.Text)
                            || cuoi.TenC.EndsWith(txtTim.Text)
                            || tim.NgayDi.EndsWith(txtTim.Text)
                            || tim.NgayDen.EndsWith(txtTim.Text)
                            select new
                            {
                                tim.MaChuyenBay,
                                ten.TenMayBay,
                                dau.TenD,
                                cuoi.TenC,
                                tim.NgayDi,
                                tim.NgayDen,
                                tim.GioBay,
                                tim.GioDen,
                                tim.GhiChu
                            };

                    grv.DataSource = q;
                    grv.DataBind();
                }
                else
                {
                    showMessage("Bạn muốn tìm kiếm thông tin của Vé hay chuyến bay? Hãy chọn tiêu chí tìm kiếm.");
                    load_gwVeBan();
                    load_ChuyenBay();
                }
            }
            Page.DataBind();
        }

        protected void gwVeBan_SelectedIndexChanged(object sender, EventArgs e)
        {
            string mve, tmb, lv, ten, ndi, nden, ngdi, gbay, tien;
            mve = HttpUtility.HtmlDecode(gwVeBan.SelectedRow.Cells[2].Text).ToString(); ;
            tmb = HttpUtility.HtmlDecode(gwVeBan.SelectedRow.Cells[7].Text).ToString();
            lv = HttpUtility.HtmlDecode(gwVeBan.SelectedRow.Cells[3].Text).ToString();
            ten = HttpUtility.HtmlDecode(gwVeBan.SelectedRow.Cells[6].Text).ToString();
            ngdi = HttpUtility.HtmlDecode(gwVeBan.SelectedRow.Cells[8].Text).ToString();
            gbay = HttpUtility.HtmlDecode(gwVeBan.SelectedRow.Cells[10].Text).ToString();
            ndi = HttpUtility.HtmlDecode(gwVeBan.SelectedRow.Cells[11].Text).ToString();
            nden = HttpUtility.HtmlDecode(gwVeBan.SelectedRow.Cells[12].Text).ToString();
            tien = HttpUtility.HtmlDecode(gwVeBan.SelectedRow.Cells[14].Text).ToString();
            inve(mve, tmb, lv, ten, ndi, nden, ngdi, gbay, tien);
            showMessage("Đã in vé thành công");
        }
    }
}