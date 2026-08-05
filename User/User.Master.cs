using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ecom_Project;

namespace Ecom_Project.User
{
    public partial class User : System.Web.UI.MasterPage
    {
        ConClass ob = new ConClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null || Session["logtype"] == null || Session["logtype"].ToString() != "user")
            {
                Response.Redirect("~/Login.aspx");
                return;
            }
        }

        public string GetCartCount()
        {
            if (Session["uid"] != null)
            {
                try
                {
                    int userId = Convert.ToInt32(Session["uid"]);
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = @"SELECT ISNULL(SUM(Quantity), 0) 
                                       FROM Cart_tab 
                                       WHERE User_id = @uid AND Cart_status = 1";
                    cmd.Parameters.AddWithValue("@uid", userId);

                    string result = ob.SP_Scalar(cmd);
                    return string.IsNullOrEmpty(result) ? "0" : result;
                }
                catch
                {
                    return "0";
                }
            }
            return "0";
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Logout from Forms Authentication
            FormsAuthentication.SignOut();

            // Remove session
            Session.Clear();
            Session.Abandon();

            // Prevent caching
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
            Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);

            // Go back to login
            Response.Redirect("~/Login.aspx");
        }
    }
}