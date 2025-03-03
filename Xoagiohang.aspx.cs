using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThuLamBaiTapLon2
{
    public partial class Xoagiohang : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            int soluot = Convert.ToInt32(Application["sogiohang"]);

            string deletedProductID = Request.QueryString.Get("Id");
            string deletedProductIDInCookies = deletedProductID + ",";
            string cartCookies = Request.Cookies["cart"].Value;
            int deletedProductIDPositionInCookies = cartCookies.IndexOf(deletedProductID);
            string newCookiesAfterDeletedProduct = cartCookies.Remove(deletedProductIDPositionInCookies, deletedProductIDInCookies.Length);

            Response.Cookies["cart"].Value = newCookiesAfterDeletedProduct;
            Response.Cookies["cart"].Expires = DateTime.Now.AddDays(12);
            Response.Redirect("ThanhToan.aspx");
            soluot--;
        }
    }
}