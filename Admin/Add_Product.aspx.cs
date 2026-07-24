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
    public partial class Add_Product : System.Web.UI.Page
    {
        ConClass ob = new ConClass();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SP_Category";
                cmd.Parameters.AddWithValue("@Action", 4);
                DataSet ds = ob.SP_Adapter(cmd);
                ddlCategory.DataSource = ds;
                ddlCategory.DataTextField = "Category_name";
                ddlCategory.DataValueField = "Category_id";
                ddlCategory.DataBind();
                ddlCategory.Items.Insert(
                    0,
                    new ListItem("-- Select Category --", "0")
                );
            }
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            string path = "";

            if (Product_image.HasFile)
            {
                path = "~/Images/products/" + Product_image.FileName;
                Product_image.SaveAs(Server.MapPath(path));
            }

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SP_Product";

            cmd.Parameters.AddWithValue("@Action", 1);
            cmd.Parameters.AddWithValue("@Product_name", Product_name.Text);
            cmd.Parameters.AddWithValue("@Category_id", ddlCategory.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@Product_price", Product_price.Text);
            cmd.Parameters.AddWithValue("@Product_stock", Product_stock.Text);
            cmd.Parameters.AddWithValue("@Product_image", path);
            cmd.Parameters.AddWithValue("@Product_description", Product_discription.Text);
            cmd.Parameters.AddWithValue("@Product_status", "Available");

            int i = ob.SP_nonquery(cmd);
            if (i != 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "toast",
                    "showAdminToast('Product Added!','The product has been listed in the store successfully.','success');", true);
                // Clear form
                Product_name.Text = ""; Product_price.Text = ""; Product_stock.Text = "";
                Product_discription.Text = "";
                ddlCategory.SelectedIndex = 0;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "toast",
                    "showAdminToast('Failed to Add','Something went wrong. Please check your inputs and try again.','error');", true);
            }
        }
    }
}