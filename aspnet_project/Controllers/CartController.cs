﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using aspnet12_project.Areas.Admin.Class;
using aspnet12_project.Models;
using PagedList;

namespace aspnet12_project.Controllers
{
    public class CartController : Controller
    {
        public DataContext db = new DataContext();
        // GET: Cart
        public ActionResult Index()
        {
            //khai bao danh sach Cart
            List<CartItem> Cart = new List<CartItem>();
            if (Session["Cart"] == null)
                Session["Cart"] = Cart;
            else
                Cart = Session["Cart"] as List<CartItem>;
            return View("Index", Cart);
        }
        //them san pham vao gio hang
        public ActionResult Add(int id)
        {
            // lay ban ghi tuong ung voi id
            var record = db.Products.Where(tbl => tbl.id == id).FirstOrDefault();
            if (record != null)
            {
                //them moi sp vao gio hang
                ShoppingCart objCart = new ShoppingCart();
                objCart.CartAdd(new CartItem() { id = record.id, photo = record.photo, name = record.name, number = 1, price = Convert.ToInt32(record.price) });
            }
            return RedirectToAction("Index");
        }
        //xoa tung san pham
        public ActionResult Remove(int id)
        {
            ShoppingCart objCart = new ShoppingCart();
            objCart.CartDelete(id);
            return RedirectToAction("Index");
        }
        //xoa toan bo sang pham trong gio hang
        public ActionResult Destroy()
        {
            ShoppingCart objCart = new ShoppingCart();
            objCart.CartDestroy();
            return RedirectToAction("Index");
        }
        //cap nhat so luong san pham
        public ActionResult Update()
        {
            //duyet cac san pham tu gio hang
            if (Session["Cart"] != null)
            {
                List<CartItem> Cart = new List<CartItem>();
                Cart = Session["Cart"] as List<CartItem>;
                foreach (var item in Cart)
                {
                    var cartQuantity = "product_" + item.id;
                    var number = Request.Form[cartQuantity];
                    //Response.Write(number + "<br>");
                    ShoppingCart objCart = new ShoppingCart();
                    objCart.CartUpdate(item.id, Convert.ToInt32(number));
                }
            }
            return RedirectToAction("Index");
        }
        //thanh toan gio hang
        public ActionResult Checkout()
        {
            //kiem tra xem user da dang nhap chua, neu chua dang nhap thi di chuyen trang trang login
            if (this.Session["customer_email"] == null)
                return RedirectToAction("Login", "Account");
            else
            {
                //---
                List<CartItem> Cart = new List<CartItem>();
                Cart = Session["Cart"] as List<CartItem>;
                //---
                //tong gia
                double _price = 0;
                foreach (var item in Cart)
                    _price += item.price;
                //---
                //thay di cua customer
                int customer_id = Convert.ToInt32(this.Session["customer_id"].ToString());
                //tao ban ghi de insert du lieu vao bang Orders  
                Order recordOrder = new Order();
                recordOrder.customer_id = customer_id;
                recordOrder.price = Convert.ToDouble(_price);
                recordOrder.status = 0;
                recordOrder.date = DateTime.Now;
                //---
                db.Orders.Add(recordOrder);
                db.SaveChanges();
                //---
                int _order_id = recordOrder.id;
                //---
                foreach (var item in Cart)
                {
                    OrderDetail recordOrderDetail = new OrderDetail();
                    recordOrderDetail.order_id = _order_id;
                    recordOrderDetail.product_id = item.id;
                    recordOrderDetail.quantity = item.number;
                    recordOrderDetail.price = Convert.ToDouble(item.price);
                    //---
                    db.OrderDetails.Add(recordOrderDetail);
                    db.SaveChanges();
                    //---
                }
                //---
                //xoa toan bo gio hang
                ShoppingCart objCart = new ShoppingCart();
                objCart.CartDestroy();
                //---
                return RedirectToAction("Index", "Cart");
            }
        }
    }
}