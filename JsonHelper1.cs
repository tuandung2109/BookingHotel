using System.Collections.Generic;
using System.IO;
using System.Web;
using Newtonsoft.Json;

namespace ThuLamBaiTapLon2
{
    public class JsonHelper1
    {
        private static readonly string FilePath = HttpContext.Current.Server.MapPath("~/App_Data/product.json");

        // Read products from JSON
        public static List<Product> ReadProducts()
        {
            if (!File.Exists(FilePath))
            {
                // If file doesn't exist, create an empty JSON array
                File.WriteAllText(FilePath, "[]");
            }

            string json = File.ReadAllText(FilePath);
            return JsonConvert.DeserializeObject<List<Product>>(json);
        }

        // Write products to JSON
        public static void WriteProducts(List<Product> products)
        {
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            File.WriteAllText(FilePath, json);
        }
    }
}
