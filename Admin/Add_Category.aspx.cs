using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Ecom_Project.Admin
{
    public partial class Add_Category : System.Web.UI.Page
    {
        ConClass ob = new ConClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            string path = "";

            if (Category_image.HasFile)
            {
                path = "~/images/" + Category_image.FileName;
                Category_image.SaveAs(Server.MapPath(path));
            }

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SP_Category";

            cmd.Parameters.AddWithValue("@cname", Category_name.Text);
            cmd.Parameters.AddWithValue("@cimage", path);
            cmd.Parameters.AddWithValue("@cdis", Category_discription.Text);
            cmd.Parameters.AddWithValue("@cstatus", "Available");
            int i = ob.SP_nonquery(cmd);
            if (i != 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "toast",
                    "showAdminToast('Category Created!','The category has been added successfully.','success');", true);
                // Clear form
                Category_name.Text = "";
                Category_discription.Text = "";
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "toast",
                    "showAdminToast('Failed to Add','Something went wrong. Please try again.','error');", true);
            }
        }
    }
}