using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ecom_Project;

namespace Ecom_Project.Admin
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        ConClass ob = new ConClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null || Session["logtype"] == null || Session["logtype"].ToString() != "admin")
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadAdminDetails();
            }
        }

        private void LoadAdminDetails()
        {
            try
            {
                string query = "SELECT Admin_name FROM Admin_tab WHERE Admin_id = " + Session["uid"].ToString();
                object result = ob.Scalar(query);
                if (result != null && !string.IsNullOrEmpty(result.ToString()))
                {
                    string adminName = result.ToString();
                    lblAdminName.Text = adminName;
                    lblAdminNameSidebar.Text = adminName;
                    lblAdminNameMenu.Text = adminName;

                    string initial = adminName.Substring(0, 1).ToUpper();
                    lblAvatarSidebar.Text = initial;
                    lblAvatarTop.Text = initial;
                }
            }
            catch
            {
                // Fallback to default if query fails
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