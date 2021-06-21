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

namespace aspnet12_project.Areas.Admin.Controllers
{
    //kiem tra dang nhap
    [CheckLogin]
    public class CategoriesController : Controller
    {
        // GET: Admin/Categories
        public DataContext db = new DataContext();
        // GET: Admin/Categories
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
            //List<User> listRecord = (from anhxa in db.Categories orderby anhxa.id descending select anhxa).ToList();
            //---
            //su dung ADO de ket noi            
            //lay chuoi ket noi tu file config
            string connectionString = ConfigurationManager.ConnectionStrings["connection"].ToString();
            //tao ket noi csdl
            SqlConnection conn = new SqlConnection(connectionString);
            //tao doi tuong cmd de thuc thi cau truy van
            SqlCommand cmd = new SqlCommand("select * from Categories where parent_id = 0 order by id desc", conn);
            //tao doi tuong DataTable de chuan bi nhan du lieu
            DataTable dt = new DataTable();
            //tao doi tuong DataAdapter de fill du lieu vao datatable
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            //fill du lieu vao dt
            da.Fill(dt);
            //---
            //khoi tao doi tuong Categories
            List<Category> listRecord = new List<Category>();
            //duyet cac phan tu cua datatable, gan vao datalist
            foreach(DataRow item in dt.Rows)
            {
                Category record = new Category();
                record.id = Convert.ToInt32(item["id"]);
                record.parent_id = Convert.ToInt32(item["parent_id"]);
                record.name = item["name"].ToString();
                listRecord.Add(record);
            }
            //---
            return View("Read", listRecord.ToPagedList(pageNumber, pageSize));
        }
        //update - GET
        public ActionResult Update(int id)
        {
            int _id = id;
            //---
            //lay ra ban ghi tuong ung voi danh muc truyen vao
            //lay chuoi ket noi tu file Web.config
            string strConnection = ConfigurationManager.ConnectionStrings["connection"].ToString();
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(strConnection))
            {
                SqlCommand cmd = new SqlCommand("select * from Categories where id=@id", conn);
                cmd.Parameters.AddWithValue("@id",_id);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                //---
                DataRow dr = dt.NewRow();
                if (dt.Rows.Count > 0)
                    dr = dt.Rows[0];
                return View("CreateUpdate", dr);
            }            
            //---
        }
        //update - POST
        [HttpPost, ValidateAntiForgeryToken]
        public ActionResult Update(FormCollection fc, int id)
        {
            int _id = id;
            string _name = Request.Form["name"];
            string _parent_id = Request.Form["parent_id"];
            //---
            //lay ra ban ghi tuong ung voi danh muc truyen vao
            //lay chuoi ket noi tu file Web.config
            string strConnection = ConfigurationManager.ConnectionStrings["connection"].ToString();
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(strConnection))
            {
                SqlCommand cmd = new SqlCommand("update Categories set name=@name, parent_id=@parent_id where id=@id", conn);
                cmd.Parameters.AddWithValue("@name", _name);
                cmd.Parameters.AddWithValue("@parent_id", _parent_id);
                cmd.Parameters.AddWithValue("@id", _id);
                //mo lenh ket noi
                conn.Open();
                //thuc thi cau lenh sql
                cmd.ExecuteNonQuery();
            }
            //---
            //di chuyen den url: Admin/Categories/Read
            return RedirectToAction("Read","Categories");
        }
        //Create - GET
        public ActionResult Create()
        {
            return View("CreateUpdate");
        }
        //Create - POST
        [HttpPost, ValidateAntiForgeryToken]
        public ActionResult Create(FormCollection fc)
        {            
            string _name = Request.Form["name"];
            string _parent_id = Request.Form["parent_id"];
            //---
            //lay ra ban ghi tuong ung voi danh muc truyen vao
            //lay chuoi ket noi tu file Web.config
            string strConnection = ConfigurationManager.ConnectionStrings["connection"].ToString();
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(strConnection))
            {
                SqlCommand cmd = new SqlCommand("insert into Categories(name,parent_id) values(@name,@parent_id)", conn);
                cmd.Parameters.AddWithValue("@name", _name);
                cmd.Parameters.AddWithValue("@parent_id", _parent_id);                
                //mo lenh ket noi
                conn.Open();
                //thuc thi cau lenh sql
                cmd.ExecuteNonQuery();
            }
            //---
            //di chuyen den url: Admin/Categories/Read
            return RedirectToAction("Read", "Categories");
        }
        //delete
        public ActionResult Delete(int id)
        {
            int _id = id;            
            //---
            //lay ra ban ghi tuong ung voi danh muc truyen vao
            //lay chuoi ket noi tu file Web.config
            string strConnection = ConfigurationManager.ConnectionStrings["connection"].ToString();
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(strConnection))
            {
                SqlCommand cmd = new SqlCommand("delete from Categories where id=@id or parent_id=@id", conn);                
                cmd.Parameters.AddWithValue("@id", _id);
                //mo lenh ket noi
                conn.Open();
                //thuc thi cau lenh sql
                cmd.ExecuteNonQuery();
            }
            //---
            //di chuyen den url: Admin/Categories/Read
            return RedirectToAction("Read", "Categories");
        }
    }
}