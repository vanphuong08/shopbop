using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using aspnet12_project.Models;
using aspnet12_project.Areas.Admin.Class;
//phan trang
using PagedList;
//su dung doi tuong ma hoa -> de su dung ham SHA256()
using System.Security.Cryptography;
using System.Web.Helpers;

namespace aspnet12_project.Areas.Admin.Controllers
{
    //kiem tra dang nhap
    [CheckLogin]
    public class UsersController : Controller
    {
        public DataContext db = new DataContext();
        // GET: Admin/Users
        public ActionResult Index()
        {
            return RedirectToAction("Read");
        }
        //int? page co nghia la neu page co gia tri thi gan cho no, khong thi se gan la null
        public ActionResult Read(int? page)
        {
            //khai bao so ban ghi tren mot trang
            int pageSize = 4;
            //so trang
            int pageNumber = page ?? 1; //neu page = null thi page = 1, sau do gan cho pageNumber
            //linq truyen thong
            //List<User> listRecord = (from anhxa in db.Users orderby anhxa.id descending select anhxa).ToList();
            //bieu thuc lamda
            List <User> listRecord = db.Users.OrderByDescending(anhxa => anhxa.id).ToList();
            return View("Read",listRecord.ToPagedList(pageNumber,pageSize));
        }
        //update - GET
        public ActionResult Update(int id)
        {
            int _id = id;
            //lay mot ban ghi tuong ung voi id truyen vao
            User record = db.Users.Where(tbl=>tbl.id ==_id).FirstOrDefault();
            //goi view, truyen du lieu ra view
            return View("CreateUpdate", record);
        }
        //update - POST
        [HttpPost, ValidateAntiForgeryToken]
        public ActionResult Update(FormCollection fc, int id)
        {
            int _id = id;
            //lay du lieu cach 1: su dung doi tuong Request.Form
            string _name = Request.Form["name"];
            //lay du lieu cach 2: su dung doi tuong FormCollection
            string _email = fc["email"];
            string _password = Request.Form["password"];            
            //lay mot ban ghi tuong ung voi id truyen vao
            //FirstOrDefault() -> lay mot ban ghi dau tien, neu khong co thi tra ve null
            //su dung bieu thuc lamda
            User record = db.Users.Where(tbl=>tbl.id ==_id).FirstOrDefault();
            //su dung linq truyen thong
            //User record = (from anhxa in db.Users where anhxa.id == _id select anhxa).FirstOrDefault();
            //---
            record.name = _name;
            //neu password khong rong thi ma hoa password            
            if (!String.IsNullOrEmpty(_password))
            {
                _password = Crypto.SHA256(_password);
                record.password = _password;
            }
            //kiem tra xem email da ton tai chua, neu chua thi update
            User checkRecord = db.Users.Where(tbl => tbl.email == _email && tbl.id != _id).FirstOrDefault();
            if (checkRecord == null)
                record.email = _email;
            //update thay doi
            db.SaveChanges();
            //---
            //di chuyen den url
            return RedirectToAction("Read","Users");
        }
        //create - GET
        public ActionResult Create()
        {
            return View("CreateUpdate");
        }
        //create - POST
        [HttpPost, ValidateAntiForgeryToken]
        public ActionResult Create(FormCollection fc)
        {
            //lay du lieu cach 1: su dung doi tuong Request.Form
            string _name = Request.Form["name"];
            //lay du lieu cach 2: su dung doi tuong FormCollection
            string _email = fc["email"];
            string _password = Request.Form["password"];
            //ma hoa password
            _password = Crypto.SHA256(_password);
            //kiem tra neu email chua ton tai trong csdl thi them moi ban ghi
            User checkRecord = db.Users.Where(tbl => tbl.email == _email).FirstOrDefault();
            if(checkRecord == null)
            {
                //khoi tao mot ban ghi moi
                User record = new User();
                //them du lieu cho ban ghi nay
                record.email = _email;
                record.name = _name;
                record.password = _password;
                //them ban ghi vao csdl
                db.Users.Add(record);
                //cap nhat thay doi
                db.SaveChanges();
            }
            else
                return RedirectToAction("Create", "Users", new { notify = "emailExists" });
                //new { notify = "emailExists" } -> /Admin/Users/Create?notify=emailExists
            //di chuyen den url
            return RedirectToAction("Read", "Users");
        }
        //xoa ban ghi
        public ActionResult Delete(int id)
        {
            int _id = id;
            //lay mot ban ghi tuong ung voi id truyen vao
            User record = db.Users.Where(tbl => tbl.id == _id).FirstOrDefault();
            //xoa ban ghi vua lay ra
            if(record != null)
            {
                db.Users.Remove(record);
                //cap nhat thay doi
                db.SaveChanges();
            }
            //di chuyen den url
            return RedirectToAction("Read", "Users");
        }
    }
}