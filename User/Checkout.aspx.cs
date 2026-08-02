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
    public partial class Checkout : System.Web.UI.Page
    {
        ConClass ob= new ConClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                int uid =Convert.ToInt32(Session["uid"]);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = @"SELECT COUNT(*) 
                                     FROM Cart_tab 
                                     WHERE User_id = @uid 
                                     AND Cart_status = 1";
                cmd.Parameters.AddWithValue("@uid",uid);
                int count = Convert.ToInt32(ob.SP_Scalar(cmd));
                if (count > 0)
                {
                    userdetails();
                    itemdisplay();
                    totalamount();
                }
                else
                {
                    Response.Redirect("Shopping-Cart.aspx");
                    return;
                }
            }
        }

        public void userdetails()
        {
            int uid = Convert.ToInt32(Session["uid"]);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = @"select user_name,user_email,User_address,User_phone,User_pincode
                                            from user_tab
                                            WHERE User_id = @uid ";
            cmd.Parameters.AddWithValue("@uid", uid);
            SqlDataReader dr = ob.SP_Reader(cmd);
            while (dr.Read())
            {
                lblname.Text = dr["user_name"].ToString();
                lblemail.Text= dr["user_email"].ToString();
                lblnumber.Text = dr["User_phone"].ToString();
                lbladdress.Text = dr["User_address"].ToString();
                lblpincode.Text = dr["User_pincode"].ToString();
            }
        }
        public void itemdisplay()
        {
            int uid = Convert.ToInt32(Session["uid"]);
            SqlCommand billcmd = new SqlCommand();
            billcmd.CommandText = @"select p.Product_image,p.Product_name,c.Quantity,c.SubTotal 
                                            from Cart_tab as c 
                                            join Product_tab p ON c.Product_id = p.Product_id
                                            WHERE User_id = @uid AND Cart_status = 1";
            billcmd.Parameters.AddWithValue("@uid", uid);
            DataSet ds = ob.SP_Adapter(billcmd);
            gvcheckout.DataSource = ds;
            gvcheckout.DataBind();
        }
        public void totalamount()
        {
            int uid = Convert.ToInt32(Session["uid"]);

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = @"SELECT ISNULL(SUM(p.Product_price * c.Quantity), 0)
                                FROM Cart_tab c
                                INNER JOIN Product_tab p
                                ON c.Product_id = p.Product_id
                                WHERE c.User_id = @uid
                                AND c.Cart_status = 1";

            cmd.Parameters.AddWithValue("@uid", uid);

            object result = ob.SP_Scalar(cmd);

            lbltotal.Text = result.ToString();
        }


        protected void btnconfirm_Click(object sender, EventArgs e)
        {
            insert_order();
        }
        public void insert_order()
        {
            int uid = Convert.ToInt32(Session["uid"]);

            // Get next OrderGroupID
            SqlCommand groupCmd = new SqlCommand();
            groupCmd.CommandText = @"SELECT ISNULL(MAX(OrderGroupID),0)+1
                                     FROM Order_tab";

            int orderGroupID = Convert.ToInt32(ob.SP_Scalar(groupCmd));

            // Get all cart items
            SqlCommand cartCmd = new SqlCommand();
            cartCmd.CommandText = @"SELECT Product_id, Quantity, SubTotal FROM Cart_tab
                                    WHERE User_id=@uid AND Cart_status=1";

            cartCmd.Parameters.AddWithValue("@uid", uid);

            DataSet ds = ob.SP_Adapter(cartCmd);

            // Insert each cart item into Order_tab
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                SqlCommand orderCmd = new SqlCommand();

                orderCmd.CommandText = @"INSERT INTO Order_tab (User_id,Product_id,Quantity, SubTotal,Order_status, Order_Date, OrderGroupID)
                                         VALUES (@uid, @pid, @qty, @subtotal, 'New Order',GETDATE(), @groupid)";

                orderCmd.Parameters.AddWithValue("@uid", uid);
                orderCmd.Parameters.AddWithValue("@pid", row["Product_id"]);
                orderCmd.Parameters.AddWithValue("@qty", row["Quantity"]);
                orderCmd.Parameters.AddWithValue("@subtotal", row["SubTotal"]);
                orderCmd.Parameters.AddWithValue("@groupid", orderGroupID);

                ob.SP_nonquery(orderCmd);
            }

            // Insert into Payment_tab
            SqlCommand paymentCmd = new SqlCommand();

            paymentCmd.CommandText = @"INSERT INTO Payment_tab (User_id, GrandTotal, Payment_date,OrderGroupID)
                                       VALUES (@uid,@total,GETDATE(),@groupid)";

            paymentCmd.Parameters.AddWithValue("@uid", uid);
            paymentCmd.Parameters.AddWithValue("@total", Convert.ToDecimal(lbltotal.Text));
            paymentCmd.Parameters.AddWithValue("@groupid", orderGroupID);

            ob.SP_nonquery(paymentCmd);

            // Clear cart
            SqlCommand updateCmd = new SqlCommand();

            updateCmd.CommandText = @"UPDATE Cart_tab SET Cart_status=0
                                      WHERE User_id=@uid
                                      AND Cart_status=1";

            updateCmd.Parameters.AddWithValue("@uid", uid);

            ob.SP_nonquery(updateCmd);

            // Redirect
            Response.Redirect("Billing.aspx?orderGroupID=" + orderGroupID);

        }
    }
}