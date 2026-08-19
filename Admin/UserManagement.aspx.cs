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
    public partial class UserManagement : System.Web.UI.Page
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
            cmd.CommandText = @"SELECT User_id, User_name, User_age, User_address, User_phone, User_email, User_pincode, User_status FROM User_tab";

            DataSet ds = ob.SP_Adapter(cmd);
            GV_User.DataSource = ds;
            GV_User.DataBind();
        }

        protected void btn_sus_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int uid = Convert.ToInt32(btn.CommandArgument);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = @"update User_tab set User_status='Suspended' where User_id=@uid";
            cmd.Parameters.AddWithValue("@uid", uid);
            ob.SP_nonquery(cmd);
            GridBind();
        }

        protected void btn_access_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int uid = Convert.ToInt32(btn.CommandArgument);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = @"update User_tab set User_status='Active' where User_id=@uid";
            cmd.Parameters.AddWithValue("@uid", uid);
            ob.SP_nonquery(cmd);
            GridBind();
        }
    }
}