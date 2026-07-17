using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecom_Project
{
    public partial class Login : System.Web.UI.Page
    {
        ConClass obj = new ConClass();

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Login_Click(object sender, EventArgs e)
        {
            string sel_loginid = "select count(reg_id) from login_tab where username='" + ltb1.Text + "' and password ='" + ltb2.Text + "'";
            int i = Convert.ToInt32(obj.Scalar(sel_loginid).ToString());
            if (i == 1)
            {
                string selid = "select reg_id from login_tab where username='" + ltb1.Text + "' and password ='" + ltb2.Text + "'";
                string getid = obj.Scalar(selid);
                Session["uid"] = getid;

                string sel_logtype = "select logtype from login_tab where username='" + ltb1.Text + "' and password ='" + ltb2.Text + "'";
                string get_logtype = obj.Scalar(sel_logtype);
                if (get_logtype == "admin")
                {
                    Response.Redirect("~/Admin/Admin_HomePage.aspx");
                }
                else if (get_logtype == "user")
                {
                    Response.Redirect("~/User/uindex.aspx");
                }
            }
            else
            {
                lbl_loginsuccess.Visible = true;
                lbl_loginsuccess.CssClass = "feedback-message feedback-danger";
                lbl_loginsuccess.Text = "Invalid Username or Password";
            }
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            stb7_una.Visible = false;
            lblsuccess.Visible = false;
            string check_user = "select count(reg_id) from login_tab where username='" + stb7.Text + "'";
            int find = Convert.ToInt32(obj.Scalar(check_user));
            if (find == 0) 
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

                string ins = "insert into user_tab values(" + reg_id + ",'" + stb1.Text + "','" + stb2.Text + "','" + stb3.Text + "','" + stb4.Text + "','" + stb5.Text + "','" + stb6.Text + "','Active')";
                int i = obj.Non_query(ins);
                if (i == 1)
                {
                    string inslog = "insert into login_tab(Reg_id, username, password,Logtype) values(" + reg_id + ",'" + stb7.Text + "','" + stb8.Text + "','user')";
                    int j = obj.Non_query(inslog);
                    if (i == 1 && j == 1)
                    {
                        lblsuccess.Visible = true;
                        lblsuccess.CssClass = "feedback-message feedback-success";
                        lblsuccess.Text = "Successfully Registered! Please login to your account";
                        
                        stb1.Text = "";
                        stb2.Text = "";
                        stb3.Text = "";
                        stb4.Text = "";
                        stb5.Text = "";
                        stb6.Text = "";
                        stb7.Text = "";
                        stb8.Text = "";
                    }
                }
                else
                {
                    lblsuccess.Visible = true;
                    lblsuccess.CssClass = "feedback-message feedback-danger";
                    lblsuccess.Text = "Account creation failed. Please try again.";
                    stb8.Attributes["value"] = stb8.Text;
                }
            }
            else
            {
                stb7_una.Visible = true;
                stb7_una.Text = "Username already exists";

                lblsuccess.Visible = true;
                lblsuccess.CssClass = "feedback-message feedback-danger";
                lblsuccess.Text = "Account creation failed. User already exist.";
                stb8.Attributes["value"] = stb8.Text;
            }
            
        }
    }
}