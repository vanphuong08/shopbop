using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using aspnet12_project.Areas.Admin.Class;
using aspnet12_project.Models;
using PagedList;

namespace aspnet12_project.Controllers
{
    public class OrdersController : Controller
    {
        public DataContext db = new DataContext();
        // GET: Orders
        public ActionResult Index(int? page)
        {
            //kiem tra neu user chua dang nhap thi di chuyen den trang login
            if (this.Session["customer_id"] == null)
                return RedirectToAction("Login","Account");
            //int? page -> neu page co gia tri thi gan gia tri do vao bien page
            //khai bao so ban ghi tren mot trang
            int pageSize = 10;
            //page ?? 1 -> neu bien page = null thi gan gia tri 1, con khong thi lay gia tri
            int pageNumber = page ?? 1;
            //var listRecord = (from tbl in db.Users orderby tbl.id descending select tbl);
            int _customer_id = Convert.ToInt32(this.Session["customer_id"]);
            var listRecord = db.Orders.Where(tbl=>tbl.customer_id == _customer_id).OrderByDescending(tbl => tbl.id).ToList();
            //goi view
            return View("Index", listRecord.ToPagedList(pageNumber, pageSize));
        }
    }
}