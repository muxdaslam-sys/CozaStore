using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecom_Project.User
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }
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