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
    public partial class Product : System.Web.UI.Page
    {
        ConClass ob = new ConClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SP_Product";
                cmd.Parameters.AddWithValue("@Action", 4);
                DataSet ds = ob.SP_Adapter(cmd);
                GV_product.DataSource = ds;
                GV_product.DataBind();
            }
        }

        protected void GV_product_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int PId = Convert.ToInt32(GV_product.DataKeys[e.NewEditIndex].Value);

            Response.Redirect("Edit_Product.aspx?id=" + PId);
        }
    }
}