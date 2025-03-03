using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ThuLamBaiTapLon2
{
    public class Product
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Price { get; set; }
        public string Images { get; set; }
        public string Detail { get; set; }
        public string Owner { get; set; } // Chủ sở hữu sản phẩm

    }
}