using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.Mvc;

namespace aspnet12_project.Areas.Admin.Class
{
    public class CheckLogin:ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            //kiem tra neu user chua dang nhap thi di chuyen den action /Admin/Login
            /*if (HttpContext.Current.Session["email"] == null)
                //area = Admin, controller = Login, action = Index
                HttpContext.Current.Response.Redirect("/Admin/Login");*/
            //gan gia tri mac dinh
            HttpContext.Current.Session["email"] = "nva@gmail.com";
            base.OnActionExecuting(filterContext);
        }
    }
}