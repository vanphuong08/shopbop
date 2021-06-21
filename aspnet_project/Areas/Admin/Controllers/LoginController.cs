using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using aspnet12_project.Models;
//ma hoa SHA256
using System.Security.Cryptography;
using System.Web.Helpers;

namespace aspnet12_project.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        private DataContext db = new DataContext();
        // GET: Admin/Login
        public ActionResult Index()
        {
            return View();
        }
        //khi an nut submit
        [HttpPost, ValidateAntiForgeryToken]
        public ActionResult Index(FormCollection fc)
        {
            //ham Trim() dung de cat ky tu khoang trang truoc va sau chuoi
            //lay gia tri cua form theo doi tuong Request
            string _email = Request.Form["email"].Trim();
            //lay gia tri cua form theo doi tuong FormCllection
            string _password = fc["password"].Trim();
            //return Content(_email);
            //ma hoa password
            _password = Crypto.SHA256(_password);
            //---
            //lay mot ban ghi
            //su dung truy van linq thuong
            //User record = (from anhxa in db.Users where anhxa.email == _email select anhxa).FirstOrDefault();
            //su dung bieu thuc lamda
            //.FirstOrDefault() -> lay mot ban ghi
            User record = db.Users.Where(tbl=>tbl.email == _email).FirstOrDefault();
            if(record != null && record.password == _password)
            {
                //khoi tao session
                this.Session["email"] = _email;
                //di chuyen den url: /Admin/Home
                return RedirectToAction("Index","Home");
            }
            //---
            return View();
        }
        //dang xuat
        public ActionResult Logout()
        {
            this.Session["email"] = null;
            return RedirectToAction("Index","Login");
        }
    }
}