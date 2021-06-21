using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using aspnet12_project.Areas.Admin.Class;
using aspnet12_project.Models;
using PagedList;
//su dung doi tuong ma hoa -> de su dung ham SHA256()
using System.Security.Cryptography;
using System.Web.Helpers;

namespace aspnet12_project.Controllers
{
    public class AccountController : Controller
    {
        public DataContext db = new DataContext();
        // GET: Account
        //dang ky thanh vien
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost, ValidateAntiForgeryToken, ValidateInput(false)]
        public ActionResult Register(FormCollection fc)
        {
            string _name = fc["name"].Trim();
            string _phone = fc["phone"].Trim();
            string _address = fc["address"].Trim();
            string _email = fc["email"].Trim();
            string _password = fc["password"].Trim();
            //ma hoa password
            _password = Crypto.SHA256(_password);
            //kiem tra xem customer da ton tai chua, neu chua thi insert
            Customer recordCheck = db.Customers.Where(tbl => tbl.email.Equals(_email)).FirstOrDefault();            
            if (recordCheck == null)
            {
                Customer record = new Customer();
                //---
                record.name = _name;
                record.phone = _phone;
                record.address = _address;
                record.email = _email;
                record.password = _password;
                //---
                db.Customers.Add(record);
                db.SaveChanges();
                //---
                //new { notify = "success", a = 1, b = 2 } -> truyen danh sach cac bien
                return RedirectToAction("Register", "Account", new { notify = "success", a = 1, b = 2 });
            }
            else
                return RedirectToAction("Register", "Account", new { notify = "email_exists", a = 1, b = 2 });
        }
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost, ValidateAntiForgeryToken, ValidateInput(false)]
        public ActionResult Login(FormCollection fc)
        {            
            string _email = fc["email"];
            string _password = fc["password"];
            _password = Crypto.SHA256(_password);
            //kiem tra ban ghi trong csdl
            Customer record = db.Customers.Where(tbl => tbl.email == _email && tbl.password == _password).FirstOrDefault();
            if (record == null)
                return RedirectToAction("Login", "Account", new { notify = "invalid" });
            else
            {
                //gan bien session
                this.Session["customer_email"] = record.email;
                this.Session["customer_id"] = record.id;
                return RedirectToAction("Index", "Home");
            }
        }
        public ActionResult Logout()
        {
            this.Session["customer_email"] = null;
            this.Session["customer_id"] = null;
            return RedirectToAction("Login","Account");
        }
    }
}