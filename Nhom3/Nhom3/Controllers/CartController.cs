using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Nhom3.Models;

namespace Nhom3.Controllers
{
    public class CartController : Controller
    {
        Nhom3DB db = new Nhom3DB();
        // GET: Cart
        [HttpGet]
        public ActionResult Orders()
        {
            List<SanPham> list = new List<SanPham>();
            if (Session[Nhom3.Session.ConstainCart.CART] != null)
            {
                List<ChiTietHoaDon> ses = (List<ChiTietHoaDon>)Session[Nhom3.Session.ConstainCart.CART];
                foreach (ChiTietHoaDon item in ses)
                {
                    var sanpham = db.SanPhams.Find(item.MaSP);
                    list.Add(sanpham);
                }
                for (int i = 0; i < list.Count; i++)
                {
                    list[i].ChiTietHoaDons.Add(ses[i]);
                }
            }
            return View(list);
        }

        [HttpPost]
        public JsonResult AddToCart(ChiTietHoaDon chiTiet)
        {

            if (chiTiet.SoLuongMua > db.SanPhams.Where(x => x.MaSP == chiTiet.MaSP).FirstOrDefault().SoLuong)
            {
                return Json(new { status = false }, JsonRequestBehavior.AllowGet);
            }
            bool isExists = false;
            List<ChiTietHoaDon> list = new List<ChiTietHoaDon>();
            if (Session[Nhom3.Session.ConstainCart.CART] != null)
            {
                list = (List<ChiTietHoaDon>)Session[Nhom3.Session.ConstainCart.CART];
                foreach (ChiTietHoaDon item in list)
                {
                    if (item.MaSP == chiTiet.MaSP)
                    {
                        item.SoLuongMua += chiTiet.SoLuongMua;
                        isExists = true;
                    }
                }
                if (!isExists)
                {
                    list.Add(chiTiet);
                }
            }
            else
            {
                list = new List<ChiTietHoaDon>();
                list.Add(chiTiet);
            }
            list.RemoveAll((x) => x.SoLuongMua <= 0);
            foreach (ChiTietHoaDon item in list)
            {
                item.GiaMua = db.SanPhams.Where(s => s.MaSP == item.MaSP).FirstOrDefault().Gia;
            }
            Session[Nhom3.Session.ConstainCart.CART] = list;
            return Json(new { status = true, cart = list }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult DeleteFromCart(int idctsp)
        {
            List<ChiTietHoaDon> list = (List<ChiTietHoaDon>)Session[Nhom3.Session.ConstainCart.CART];
            list.RemoveAll((x) => x.MaSP == idctsp);
            Session[Nhom3.Session.ConstainCart.CART] = list;
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult CheckOut()
        {
            TaiKhoanNguoiDung tk = (TaiKhoanNguoiDung)Session[Nhom3.Session.ConstaintUser.USER_SESSION];
            if (tk == null)
            {
                return RedirectToAction("Login", "Home");
            }
            List<SanPham> list = new List<SanPham>();
            List<ChiTietHoaDon> ses = (List<ChiTietHoaDon>)Session[Nhom3.Session.ConstainCart.CART];
            ViewBag.TaiKhoan = tk;
            foreach (ChiTietHoaDon item in ses)
            {
                var sp = db.SanPhams.Find(item.MaSP);
                list.Add(sp);
            }
            for (int i = 0; i < list.Count; i++)
            {
                list[i].ChiTietHoaDons.Add(ses[i]);
            }
            return View(list);
        }
    }
}
