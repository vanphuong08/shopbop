using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.ComponentModel.DataAnnotations;

namespace aspnet12_project.Models
{
    public class Category
    {
        [Key]
        public int id { get; set; }
        public int parent_id { get; set; }
        public string name { get; set; }
    }
}