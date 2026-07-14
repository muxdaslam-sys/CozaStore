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
    public partial class Edit_Category : System.Web.UI.Page
    {
        ConClass ob = new ConClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SP_Category";
                int id = Convert.ToInt32(Request.QueryString["id"]);
                cmd.Parameters.AddWithValue("@Category_id", id);
                cmd.Parameters.AddWithValue("@Action", 5);
                SqlDataReader dr = ob.SP_Reader(cmd);
                while (dr.Read())
                {
                    Category_name.Text = dr["Category_name"].ToString();
                    imgCurrent.ImageUrl = dr["Category_image"].ToString();
                    Category_discription.Text = dr["Category_description"].ToString();
                    
                    // Set the status dropdown selected value
                    string status = dr["Category_status"].ToString();
                    if (Category_status.Items.FindByValue(status) != null)
                    {
                        Category_status.SelectedValue = status;
                    }
                }
            }
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            // Default to keeping the current image if no new image is selected
            string path = imgCurrent.ImageUrl;

            if (Category_image.HasFile)
            {
                path = "~/images/" + Category_image.FileName;
                Category_image.SaveAs(Server.MapPath(path));
            }

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SP_Category";
            int id = Convert.ToInt32(Request.QueryString["id"]);
            cmd.Parameters.AddWithValue("@Category_id", id);
            cmd.Parameters.AddWithValue("@Action", 2);
            cmd.Parameters.AddWithValue("@cname", Category_name.Text);
            cmd.Parameters.AddWithValue("@cimage", path);
            cmd.Parameters.AddWithValue("@cdis", Category_discription.Text);
            cmd.Parameters.AddWithValue("@Cstatus", Category_status.SelectedItem.Text);
            
            int i = ob.SP_nonquery(cmd);
            if (i != 0)
            {
                // Register a script that displays the success toast, and then redirects after 1.5 seconds
                string script = "showAdminToast('Category Updated!', 'The category has been updated successfully.', 'success'); " +
                                "setTimeout(function() { window.location.href = 'Category.aspx'; }, 1500);";
                ScriptManager.RegisterStartupScript(this, GetType(), "toast", script, true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "toast",
                    "showAdminToast('Failed to Update', 'Something went wrong. Please try again.', 'error');", true);
            }
        }
    }
}