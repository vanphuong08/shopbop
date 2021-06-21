using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using aspnet12_project.Areas.Admin.Class;
using aspnet12_project.Models;
using PagedList;

namespace aspnet12_project.Controllers
{
    public class ProductController : Controller
    {
        public DataContext db = new DataContext();
        // GET: Product
        //danh muc san pham
        public ActionResult Category(int id, int? page)
        {            
            //Tao bien de truyen ra ngoai view
            ViewBag.id = id;
            //khai bao so ban ghi tren mot trang
            int pageSize = 8;
            //so trang
            int pageNumber = page ?? 1; //neu page = null thi page = 1, sau do gan cho pageNumber      

            //---
            string strOrder = "";
            string _order = Request.QueryString["order"] != null ? Request.QueryString["order"] : "";
            switch (_order)
            {
                case "priceAsc":
                    strOrder = " order by price asc ";
                    break;
                case "priceDesc":
                    strOrder = " order by price desc ";
                    break;
                case "nameAsc":
                    strOrder = " order by name asc ";
                    break;
                case "nameDesc":
                    strOrder = " order by name desc ";
                    break;
            }
            //---

            DataTable dt = Database.ListDataTable("select * from Products where category_id in (select id from Categories where id=" + id + " or parent_id=" + id + ") " + strOrder );
            //---
            //duyet cac ban ghi trong datatable, gan vao datalist
            List<Product> listRecord = new List<Product>();
            foreach(DataRow item in dt.Rows)
            {
                listRecord.Add(new Product() { id = Convert.ToInt32(item["id"]), name = item["name"].ToString(), description = item["description"].ToString(), category_id = Convert.ToInt32(item["category_id"]), content = item["content"].ToString(), photo = item["photo"].ToString(), hot = Convert.ToInt32(item["hot"]) });
            }
            //---            
            //bieu thuc lamda
            //List<Product> listRecord = db.Products.Where(anhxa => anhxa.category_id == id).OrderByDescending(anhxa => anhxa.id).ToList();
            
            return View("Category", listRecord.ToPagedList(pageNumber, pageSize));
        }
        //chi tiet san pham
        public ActionResult Detail(int id)
        {
            //lay mot ban ghi
            Product record = db.Products.Where(tbl => tbl.id == id).FirstOrDefault();
            return View("Detail",record);
        }
        //danh gia san pham
        //danh sach bien truyen sau dau ? tren url cung co the lay o ten ham
        public ActionResult Rating(int id, int star)
        {
            int _id = id;
            int _star = star;
            //---
            Rating record = new Rating();
            record.product_id = _id;
            record.star = _star;
            //---
            db.Ratings.Add(record);
            db.SaveChanges();
            //---
            return RedirectToAction("Detail","Product", new { id = _id });
        }
        //tim kiem san pham
        public ActionResult Search(int? page)
        {
            string _key = Request.QueryString["key"] != null ? Request.QueryString["key"] : "";
            //khai bao so ban ghi tren mot trang
            int pageSize = 12;
            //so trang
            int pageNumber = page ?? 1; //neu page = null thi page = 1, sau do gan cho pageNumber      

            DataTable dt = Database.ListDataTable("select * from Products where name like '%" + _key + "%'");
            //---
            //duyet cac ban ghi trong datatable, gan vao datalist
            List<Product> listRecord = new List<Product>();
            foreach (DataRow item in dt.Rows)
            {
                listRecord.Add(new Product() { id = Convert.ToInt32(item["id"]), name = item["name"].ToString(), description = item["description"].ToString(), category_id = Convert.ToInt32(item["category_id"]), content = item["content"].ToString(), photo = item["photo"].ToString(), hot = Convert.ToInt32(item["hot"]), price = Convert.ToDouble(item["price"]) });
            }
            //---            
            //bieu thuc lamda
            //List<Product> listRecord = db.Products.Where(anhxa => anhxa.category_id == id).OrderByDescending(anhxa => anhxa.id).ToList();

            return View("Search", listRecord.ToPagedList(pageNumber, pageSize));
        }
        //tim kiem san pham the muc gia
        public ActionResult SearchPrice(int? page)
        {
            string _fromPrice = Request.QueryString["fromPrice"] != null ? Request.QueryString["fromPrice"] : "0";
            string _toPrice = Request.QueryString["toPrice"] != null ? Request.QueryString["toPrice"] : "0";
            //khai bao so ban ghi tren mot trang
            int pageSize = 20;
            //so trang
            int pageNumber = page ?? 1; //neu page = null thi page = 1, sau do gan cho pageNumber      

            DataTable dt = Database.ListDataTable("select * from Products where price >= " + _fromPrice + " and price <= "+ _toPrice);
            //---
            //duyet cac ban ghi trong datatable, gan vao datalist
            List<Product> listRecord = new List<Product>();
            foreach (DataRow item in dt.Rows)
            {
                listRecord.Add(new Product() { id = Convert.ToInt32(item["id"]), name = item["name"].ToString(), description = item["description"].ToString(), category_id = Convert.ToInt32(item["category_id"]), content = item["content"].ToString(), photo = item["photo"].ToString(), hot = Convert.ToInt32(item["hot"]), price = Convert.ToDouble(item["price"]) });
            }
            //---            
            //bieu thuc lamda
            //List<Product> listRecord = db.Products.Where(anhxa => anhxa.category_id == id).OrderByDescending(anhxa => anhxa.id).ToList();

            return View("SearchPrice", listRecord.ToPagedList(pageNumber, pageSize));
        }
        //san pham yeu thich
        public ActionResult WishList(int id)
        {
            int _id = id;
            if (Session["WishListId"] == null)
            {
                //khoi tao gio hang
                Session["WishListId"] = new List<int>();
                List<int> _WishListId = Session["WishListId"] as List<int>;
                _WishListId.Add(_id);
                //gan nguoc lai gio hang
                Session["WishListId"] = _WishListId;
            }
            else
            {
                List<int> _WishListId = Session["WishListId"] as List<int>;
                bool flag = true;
                foreach(var item in _WishListId)
                    if (item == _id)
                        flag = false;
                if (flag == true)
                    _WishListId.Add(_id);
                //gan nguoc lai gio hang
                Session["WishListId"] = _WishListId;
            }
            return RedirectToAction("ReadWishList");
        }
        public ActionResult ReadWishList()
        {
            return View();
        }
        //AjaxSearch
        public ActionResult AJaxSearch()
        {
            string _key = Request.QueryString["key"] != null ? Request.QueryString["key"] : "";
            List<Product> _ListProduct = db.Products.Where(tbl => tbl.name.Contains(_key)).ToList();
            return View("AJaxSearch",_ListProduct);
        }
    }
}