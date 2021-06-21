using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using aspnet12_project.Models;
using aspnet12_project.Areas.Admin.Class;
//phan trang
using PagedList;
//su dung doi tuong DataTable
using System.Data;
//su dung doi tuong connection
using System.Data.SqlClient;
//doc cac thong so tu file Web.Config
using System.Configuration;
//thao tac voi file
using System.IO;

namespace aspnet12_project.Areas.Admin.Controllers
{
    //kiem tra dang nhap
    [CheckLogin]
    public class ProductsController : Controller
    {
        // GET: Admin/ProductsController
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
            ViewBag.pageNumber = pageNumber;
            //linq truyen thong
            //List<User> listRecord = (from anhxa in db.Products orderby anhxa.id descending select anhxa).ToList();
            //---
            List<Parameter> Params = new List<Parameter>();
            DataTable dt = Database.ListDataTable("select * from Products order by id desc", Params);
            //---
            //khoi tao doi tuong Products
            List<Product> listRecord = new List<Product>();
            //duyet cac phan tu cua datatable, gan vao datalist
            foreach (DataRow item in dt.Rows)
            {
                Product record = new Product();
                record.id = Convert.ToInt32(item["id"]);
                record.category_id = Convert.ToInt32(item["category_id"]);
                record.name = item["name"].ToString();
                record.description = item["description"].ToString();
                record.content = item["content"].ToString();
                record.hot = Convert.ToInt32(item["hot"]);
                record.photo = item["photo"].ToString();
                record.price = Convert.ToDouble(item["price"].ToString());
                record.discount = Convert.ToInt32(item["discount"].ToString());
                listRecord.Add(record);
            }
            //---
            return View("Read", listRecord.ToPagedList(pageNumber, pageSize));
        }
        //update - GET
        public ActionResult Update(int id)
        {
            //lay mot ban ghi
            List<Parameter> parameters = new List<Parameter>();
            parameters.Add(new Parameter() { name = "@id", value = id.ToString() });
            DataRow record = Database.FirstDataRow("select * from Products where id=@id",parameters);
            //goi view, truyen du lieu ra view
            return View("CreateUpdate",record);
        }
        //update - POST
        [HttpPost,ValidateAntiForgeryToken,ValidateInput(false)]
        public ActionResult Update(FormCollection fc, int id)
        {
            string _name = fc["name"];
            string _price = fc["price"];
            string _discount = fc["discount"];
            string _description = fc["description"];
            string _content = fc["content"];
            int _hot = fc["hot"] != null ? 1 : 0;
            string _category_id = fc["category_id"];
            //---
            List<Parameter> parameters = new List<Parameter>();
            parameters.Add(new Parameter() { name = "@name", value = _name.ToString() });
            parameters.Add(new Parameter() { name = "@price", value = _price.ToString() });
            parameters.Add(new Parameter() { name = "@discount", value = _discount.ToString() });
            parameters.Add(new Parameter() { name = "@description", value = _description.ToString() });
            parameters.Add(new Parameter() { name = "@content", value = _content.ToString() });
            parameters.Add(new Parameter() { name = "@hot", value = _hot.ToString() });
            parameters.Add(new Parameter() { name = "@category_id", value = _category_id.ToString() });
            parameters.Add(new Parameter() { name = "@id", value = id.ToString() });
            //---
            Database.Execute("update Products set name=@name, price=@price, discount=@discount,description=@description,content=@content,hot=@hot,category_id=@category_id where id=@id", parameters);
            //neu user upload anh thi thuc hien upload file
            if (Request.Files["photo"].ContentLength > 0)
            {
                //lay anh cu vao xoa
                //lay anh cu
                DataRow oldPhoto = Database.FirstDataRow("select photo from Products where id=" + id);
                //kiem tra xem file co ton tai khong, neu ton tai thi xoa file
                string pathDeleted = Path.Combine(Server.MapPath("~/Assets/Upload/Products"), oldPhoto["photo"].ToString());
                if (System.IO.File.Exists(pathDeleted))
                    System.IO.File.Delete(pathDeleted);
                //---
                //thuc hien upload file
                string path = Path.Combine(Server.MapPath("~/Assets/Upload/Products"), Path.GetFileName(id + "_" + Request.Files["photo"].FileName));
                Request.Files["photo"].SaveAs(path);
                //update lai truong photo
                string _photo = id + "_" + Request.Files["photo"].FileName.ToString();
                Database.Execute("update Products set photo='" + _photo + "' where id=" + id);
            }
            //---
            int _pageNumber = Convert.ToInt32(Request.QueryString["page"]);
            //---
            return RedirectToAction("Read","Products", new { page = _pageNumber });
        }
        //create - GET
        public ActionResult Create()
        {
            //goi view, truyen du lieu ra view
            return View("CreateUpdate");
        }
        //update - POST
        [HttpPost, ValidateAntiForgeryToken, ValidateInput(false)]
        public ActionResult Create(FormCollection fc)
        {
            string _name = fc["name"];
            string _price = fc["price"];
            string _discount = fc["discount"];
            string _description = fc["description"];
            string _content = fc["content"];
            int _hot = fc["hot"] != null ? 1 : 0;
            string _category_id = fc["category_id"];
            //---
            List<Parameter> parameters = new List<Parameter>();
            parameters.Add(new Parameter() { name = "@name", value = _name.ToString() });
            parameters.Add(new Parameter() { name = "@price", value = _price.ToString() });
            parameters.Add(new Parameter() { name = "@discount", value = _discount.ToString() });
            parameters.Add(new Parameter() { name = "@description", value = _description.ToString() });
            parameters.Add(new Parameter() { name = "@content", value = _content.ToString() });
            parameters.Add(new Parameter() { name = "@hot", value = _hot.ToString() });
            parameters.Add(new Parameter() { name = "@category_id", value = _category_id.ToString() });            
            //---
            //neu user upload anh thi thuc hien upload file
            string _photo = "";
            if (Request.Files["photo"].ContentLength > 0)
            {                
                //---
                //thuc hien upload file
                string path = Path.Combine(Server.MapPath("~/Assets/Upload/Products"), Path.GetFileName(Request.Files["photo"].FileName));
                Request.Files["photo"].SaveAs(path);
                //update lai truong photo
                _photo = Request.Files["photo"].FileName.ToString();                
            }
            parameters.Add(new Parameter() { name = "@photo", value = _photo.ToString() });
            //---
            Database.Execute("insert into Products(name,category_id,description,content,hot,photo,price,discount) values(@name,@category_id,@description,@content,@hot,@photo,@price,@discount)", parameters);
            
            //---
            return RedirectToAction("Read", "Products");
        }
        //delete
        public ActionResult Delete(int id)
        {
            //lay anh cu vao xoa
            //lay anh cu
            DataRow oldPhoto = Database.FirstDataRow("select photo from Products where id=" + id);
            //kiem tra xem file co ton tai khong, neu ton tai thi xoa file
            string pathDeleted = Path.Combine(Server.MapPath("~/Assets/Upload/Products"), oldPhoto["photo"].ToString());
            if (System.IO.File.Exists(pathDeleted))
                System.IO.File.Delete(pathDeleted);
            //---
            List<Parameter> parameters = new List<Parameter>();
            parameters.Add(new Parameter() { name = "@id", value = id.ToString() });
            Database.Execute("delete from Products where id=@id",parameters);
            return RedirectToAction("Read", "Products");
        }
        //ham liet ke danh sach cac anh thuoc san pham
        public ActionResult Images(int id)
        {
            int _product_id = id;
            ViewBag.product_id = _product_id;
            //lay danh sach cac anh thuoc san pham
            List<Parameter> parameters = new List<Parameter>();
            parameters.Add(new Parameter() { name = "@product_id", value = _product_id.ToString() });
            DataTable dt = Database.ListDataTable("select * from ProductsImages where product_id=@product_id", parameters);
            return View("Images", dt);
        }
        //them moi anh vao san pham - GET
        public ActionResult CreateImage(int product_id)
        {
            return View();
        }
        //them moi anh vao san pham - POST
        [HttpPost, ValidateAntiForgeryToken]
        public ActionResult CreateImage(FormCollection fc, int product_id)
        {
            //---
            List<Parameter> parameters = new List<Parameter>();            
            //---
            //neu user upload anh thi thuc hien upload file
            string _photo = "";
            if (Request.Files["photo"].ContentLength > 0)
            {
                //---
                //thuc hien upload file
                string path = Path.Combine(Server.MapPath("~/Assets/Upload/ProductsImages"), Path.GetFileName(Request.Files["photo"].FileName));
                Request.Files["photo"].SaveAs(path);
                //update lai truong photo
                _photo = Request.Files["photo"].FileName.ToString();
            }
            parameters.Add(new Parameter() { name = "@photo", value = _photo.ToString() });
            parameters.Add(new Parameter() { name = "@product_id", value = product_id.ToString() });
            //---
            Database.Execute("insert into ProductsImages(product_id,photo) values(@product_id,@photo)", parameters);
            return RedirectToAction("Images","Products", new { id = product_id });
        }
        //delete image
        public ActionResult DeleteImage(int id, int product_id)
        {
            //lay anh cu vao xoa
            //lay anh cu
            DataRow oldPhoto = Database.FirstDataRow("select photo from ProductsImages where id=" + id);
            //kiem tra xem file co ton tai khong, neu ton tai thi xoa file
            string pathDeleted = Path.Combine(Server.MapPath("~/Assets/Upload/ProductsImages"), oldPhoto["photo"].ToString());
            if (System.IO.File.Exists(pathDeleted))
                System.IO.File.Delete(pathDeleted);
            //---
            List<Parameter> parameters = new List<Parameter>();
            parameters.Add(new Parameter() { name = "@id", value = id.ToString() });
            Database.Execute("delete from ProductsImages where id=@id", parameters);
            return RedirectToAction("Images", "Products", new { id = product_id });
        }
    }
}