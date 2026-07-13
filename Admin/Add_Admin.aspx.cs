using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecom_Project.Admin
{
    public partial class Admin : System.Web.UI.Page
    {
        ConClass obj = new ConClass();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sel = "select max(reg_id) from login_tab";
            string maxregid = obj.Scalar(sel);
            int reg_id = 0;
            if (maxregid == "")
            {
                reg_id = 1;
            }
            else
            {
                int newregid = Convert.ToInt32(maxregid);
                reg_id = newregid + 1;
            }

            string ins = "insert into admin_tab values(" + reg_id + ",'" + tbname.Text + "','" + tbemail.Text + "')";
            int i = obj.Non_query(ins);
            if (i == 1)
            {
                string inslog = "insert into login_tab(Reg_id, username, password,Logtype) values(" + reg_id + ",'" + tbuna.Text + "','" + tbpwd.Text + "','admin')";
                int j = obj.Non_query(inslog);
                if (i == 1 && j == 1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "toast",
                        "showAdminToast('Admin Registered!','New administrator account has been created successfully.','success');", true);
                    // Clear form
                    tbname.Text = ""; tbemail.Text = ""; tbuna.Text = ""; tbpwd.Text = "";
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "toast",
                    "showAdminToast('Registration Failed','Unable to register admin. Please try again.','error');", true);
            }
        }
    }
}