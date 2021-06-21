using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

//using folder Class de nhin thay cac file ben trong
using aspnet12_project.Areas.Admin.Class;

namespace aspnet12_project.Areas.Admin.Controllers
{
    //kiem tra dang nhap
    [CheckLogin]
    public class HomeController : Controller
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            return View();
        }
    }
}