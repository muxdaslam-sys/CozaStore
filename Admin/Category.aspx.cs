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
    public partial class Category : System.Web.UI.Page
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
                GV_category.DataSource = ds;
                GV_category.DataBind();
            }
        }

        protected void GV_category_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int categoryId = Convert.ToInt32(GV_category.DataKeys[e.NewEditIndex].Value);

            Response.Redirect("Edit_Category.aspx?id=" + categoryId);
        }
    }
}