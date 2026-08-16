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
    public partial class My_Oders : System.Web.UI.Page
    {
        ConClass ob = new ConClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["orderGroupID"]))
                {
                    string orderGroupID = Request.QueryString["orderGroupID"];
                    lblbillid.Text = orderGroupID;
                    userdetails();
                    itemdisplay();
                    totalamount();
                }
                else
                {
                    Response.Redirect("uindex.aspx");
                    return;
                }
            }
        }

        public void userdetails()
        {
            int orderGroupID = Convert.ToInt32(Request.QueryString["orderGroupID"]);
            int uid = Convert.ToInt32(Session["uid"]);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = @"SELECT u.user_name,u.user_email, u.User_address,u.User_phone,u.User_pincode
                                FROM Order_tab o INNER JOIN User_tab u
                                ON o.User_id=u.User_id
                                WHERE o.User_id=@uid AND o.Order_status='Paid' AND o.OrderGroupID=@groupid";
            cmd.Parameters.AddWithValue("@uid", uid);
            cmd.Parameters.AddWithValue("@groupid", orderGroupID);
            SqlDataReader dr = ob.SP_Reader(cmd);
            while (dr.Read())
            {
                lblname.Text = dr["user_name"].ToString();
                lblemail.Text = dr["user_email"].ToString();
                lblnumber.Text = dr["User_phone"].ToString();
                lbladdress.Text = dr["User_address"].ToString();
                lblpincode.Text = dr["User_pincode"].ToString();
            }

        }
        public void itemdisplay()
        {
            int orderGroupID = Convert.ToInt32(Request.QueryString["orderGroupID"]);

            int uid = Convert.ToInt32(Session["uid"]);
            SqlCommand billcmd = new SqlCommand();
            billcmd.CommandText = @"select p.Product_image,p.Product_name,o.Quantity,o.SubTotal 
                                            from Order_tab as o 
                                            join Product_tab p ON o.Product_id = p.Product_id
                                            WHERE User_id = @uid AND Order_status='Paid' AND o.OrderGroupID=@groupid";
            billcmd.Parameters.AddWithValue("@uid", uid);
            billcmd.Parameters.AddWithValue("@groupid", orderGroupID);
            DataSet ds = ob.SP_Adapter(billcmd);
            gvbill.DataSource = ds;
            gvbill.DataBind();
        }

        public void totalamount()
        {
            int uid = Convert.ToInt32(Session["uid"]);
            int orderGroupID = Convert.ToInt32(Request.QueryString["orderGroupID"]);

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = @"SELECT ISNULL(SUM(p.Product_price * o.Quantity), 0)
                                FROM Order_tab as o 
                                INNER JOIN Product_tab p
                                ON o.Product_id = p.Product_id
                                WHERE User_id = @uid
                                AND Order_status='Paid' AND o.OrderGroupID=@groupid";

            cmd.Parameters.AddWithValue("@uid", uid);
            cmd.Parameters.AddWithValue("@groupid", orderGroupID);
            object result = ob.SP_Scalar(cmd);

            lbltotal.Text = result != null ? result.ToString() : "0.00";
        }
    }
}