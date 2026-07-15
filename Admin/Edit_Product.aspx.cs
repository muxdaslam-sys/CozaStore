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
    public partial class Edit_Products : System.Web.UI.Page
    {
        ConClass ob = new ConClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SP_Product";
                int id = Convert.ToInt32(Request.QueryString["id"]);
                cmd.Parameters.AddWithValue("@Product_id", id);
                cmd.Parameters.AddWithValue("@Action", 5);
                SqlDataReader dr = ob.SP_Reader(cmd);
                while (dr.Read())
                {
                    Product_name.Text = dr["Product_name"].ToString();
                    Category_name.Text = dr["Category_name"].ToString();
                    Product_price.Text = dr["Product_price"].ToString();
                    Product_stock.Text = dr["Product_stock"].ToString();
                    imgCurrent.ImageUrl = dr["Product_image"].ToString();
                    Product_description.Text = dr["Product_description"].ToString();
                    // Set the status dropdown selected value
                    string status = dr["Product_status"].ToString();
                    if (Product_status.Items.FindByValue(status) != null)
                    {
                        Product_status.SelectedValue = status;
                    }
                }
            }
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            // Update logic to be implemented
            string path = imgCurrent.ImageUrl;

            if (Product_image.HasFile)
            {
                path = "~/images/products/" + Product_image.FileName;
                Product_image.SaveAs(Server.MapPath(path));
            }

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SP_Product";
            int id = Convert.ToInt32(Request.QueryString["id"]);
            cmd.Parameters.AddWithValue("@Product_id", id);
            cmd.Parameters.AddWithValue("@Action", 2);
            cmd.Parameters.AddWithValue("@Product_price", Product_price.Text);
            cmd.Parameters.AddWithValue("@Product_stock", Product_stock.Text);
            cmd.Parameters.AddWithValue("@Product_image", path);
            cmd.Parameters.AddWithValue("@Product_description", Product_description.Text);
            cmd.Parameters.AddWithValue("@Product_status", Product_status.SelectedItem.Text);

            int i = ob.SP_nonquery(cmd);
            if (i != 0)
            {
                // Register a script that displays the success toast, and then redirects after 1.5 seconds
                string script = "showAdminToast('Product Updated!', 'The Product has been updated successfully.', 'success'); " +
                                "setTimeout(function() { window.location.href = 'Product.aspx'; }, 3000);";
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