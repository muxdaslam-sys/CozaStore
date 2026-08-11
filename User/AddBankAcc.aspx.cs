using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Ecom_Project.User
{
    public partial class AddBankAcc : System.Web.UI.Page
    {
        ConClass ob = new ConClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null || Session["logtype"] == null || Session["logtype"].ToString() != "user")
            {
                Response.Redirect("~/Login.aspx");
                return;
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            int uid = Convert.ToInt32(Session["uid"]);

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = @"INSERT INTO account_tab
                        VALUES (@uid, @name, @number, @balance)";

            cmd.Parameters.AddWithValue("@uid", uid);
            cmd.Parameters.AddWithValue("@name", tbname.Text);
            cmd.Parameters.AddWithValue("@number", tbnumber.Text);
            cmd.Parameters.AddWithValue("@balance", tbbalance.Text);

            ob.SP_nonquery(cmd);

            Response.Redirect("Checkout.aspx");
        }
    }
}