using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.ComponentModel.DataAnnotations;

namespace aspnet12_project.Models
{
    public class ProductImage
    {
        [Key]
        public int id { get; set; }
        public int product_id { get; set; }
        public string photo { get; set; }
    }
}