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
    public partial class Admins : System.Web.UI.Page
    {
        ConClass ob = new ConClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridBind();
            }
        }
        public void GridBind()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = @"SELECT a.Admin_name, a.Admin_email, l.username, l.password
                                FROM Admin_tab a INNER JOIN login_tab l ON a.Admin_id = l.reg_id";

            DataSet ds = ob.SP_Adapter(cmd);
            GV_admin.DataSource = ds;
            GV_admin.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add_Admin.aspx");
        }
    }
}