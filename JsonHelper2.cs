using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace ThuLamBaiTapLon2
{
    public static class JsonHelper2
    {
        private static string ordersFilePath = HttpContext.Current.Server.MapPath("~/App_Data/Orders.json");

        public static List<DonHang> ReadOrders()
        {
            if (!File.Exists(ordersFilePath))
            {
                return new List<DonHang>();
            }

            string json = File.ReadAllText(ordersFilePath);

            return JsonConvert.DeserializeObject<List<DonHang>>(json) ?? new List<DonHang>();
        }

        public static void WriteOrders(List<DonHang> orders)
        {
            string json = JsonConvert.SerializeObject(orders, Formatting.Indented);
            File.WriteAllText(ordersFilePath, json);
        }
    }


}