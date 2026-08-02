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
    public partial class Shopping_Cart : System.Web.UI.Page
    {
        ConClass ob = new ConClass();
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadcart();
            }
        }

        public void loadcart()
        {
            int uid = Convert.ToInt32(Session["uid"]);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = @"SELECT p.Product_id,p.Product_image, p.Product_name, p.Product_description, p.Product_price, p.Product_stock, c.Quantity
                                FROM Cart_tab c INNER JOIN Product_tab p ON c.Product_id = p.Product_id
                                WHERE c.User_id = @uid AND c.Cart_status = 1;";

            cmd.Parameters.AddWithValue("@uid", uid);

            DataSet ds = ob.SP_Adapter(cmd);
            DataList1.DataSource = ds;
            DataList1.DataBind();

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
 
                lblcartmsg.Visible = false;
                lblcartmsg.Text = "";
                totalamount();
            }
            else
            {

                lblcartmsg.Visible = true;
                lblcartmsg.Text = "Your cart is empty";
                lblTotal.Text = "0";
            }

            // Update cart count badge on header
            SqlCommand countCmd = new SqlCommand();
            countCmd.CommandText = @"SELECT ISNULL(SUM(Quantity), 0) FROM Cart_tab WHERE User_id = @uid AND Cart_status = 1";
            countCmd.Parameters.AddWithValue("@uid", uid);
            int totalQty = Convert.ToInt32(ob.SP_Scalar(countCmd));

            ScriptManager.RegisterStartupScript(this, GetType(), "updateCartBadgeCartPage",
                $"document.querySelectorAll('.icon-header-noti').forEach(function(el) {{ el.setAttribute('data-notify', '{totalQty}'); }});", true);
        }

        protected void btnplus_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            DataListItem item = (DataListItem)btn.NamingContainer;

            TextBox txt = (TextBox)item.FindControl("txtbQty");
            HiddenField pid = (HiddenField)item.FindControl("hfpid");
            HiddenField pname = (HiddenField)item.FindControl("hfpname");
            HiddenField stock = (HiddenField)item.FindControl("hfstock");

            int qty = Convert.ToInt32(txt.Text);
            string name = pname.Value;
            int availableStock =Convert.ToInt32(stock.Value);


            // Check available stock
            if (qty < availableStock)
            {
                qty++;

                SqlCommand cmd = new SqlCommand();

                cmd.CommandText = @"
                    UPDATE Cart_tab
                    SET Quantity = @qty
                    WHERE Product_id = @pid
                    AND User_id = @uid
                    AND Cart_status = 1";

                cmd.Parameters.AddWithValue("@qty", qty);
                cmd.Parameters.AddWithValue("@pid", pid.Value);
                cmd.Parameters.AddWithValue("@uid", Session["uid"]);

                ob.SP_nonquery(cmd);

                loadcart();
            }
            else
            {
                //lblstockmsg.Visible = true;
                string alertText = "Only " + availableStock + " items available for " + name;
                lblstockmsg.Text = alertText;

                string jsMsg = alertText.Replace("'", "\\'");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "stockAlert", "showPdToast('Stock Limit Reached', '" + jsMsg + "', 'error');", true);
            }
        }

    

        protected void btnminus_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            DataListItem item = (DataListItem)btn.NamingContainer;


            TextBox txt = (TextBox)item.FindControl("txtbQty");

            HiddenField pid = (HiddenField)item.FindControl("hfpid");

            //lblstockmsg.Visible = false;

            int qty = Convert.ToInt32(txt.Text);


            // Don't allow quantity below 1
            if (qty > 1)
            {
                qty--;

                SqlCommand cmd = new SqlCommand();

                cmd.CommandText = @"
                    UPDATE Cart_tab
                    SET Quantity = @qty
                    WHERE Product_id = @pid
                    AND User_id = @uid
                    AND Cart_status = 1";

                cmd.Parameters.AddWithValue("@qty", qty);
                cmd.Parameters.AddWithValue("@pid", pid.Value);
                cmd.Parameters.AddWithValue("@uid", Session["uid"]);

                ob.SP_nonquery(cmd);

                loadcart();
            }
        }

        public void totalamount()
        {
            int uid = Convert.ToInt32(Session["uid"]);

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = @"
                SELECT ISNULL(SUM(p.Product_price * c.Quantity), 0)
                FROM Cart_tab c
                INNER JOIN Product_tab p
                    ON c.Product_id = p.Product_id
                WHERE c.User_id = @uid
                AND c.Cart_status = 1";

            cmd.Parameters.AddWithValue("@uid", uid);

            object result = ob.SP_Scalar(cmd);

            lblTotal.Text = result.ToString();
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            DataListItem item = (DataListItem)btn.NamingContainer;
            HiddenField pname = (HiddenField)item.FindControl("hfpname");
            string name = pname.Value;

            int pid = Convert.ToInt32(btn.CommandArgument);
            int uid = Convert.ToInt32(Session["uid"]);

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = @"DELETE FROM Cart_tab
                        WHERE Product_id = @pid
                        AND User_id = @uid";

            cmd.Parameters.AddWithValue("@pid", pid);
            cmd.Parameters.AddWithValue("@uid", uid);

            ob.SP_nonquery(cmd);

            loadcart();

            string jsMsg = (name + " has been removed from your cart").Replace("'", "\\'");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "itemRemovedAlert", "showPdToast('Item Removed', '" + jsMsg + "', 'warning');", true);
        }


        protected void btncheckout_Click(object sender, EventArgs e)
        {
            int uid = Convert.ToInt32(Session["uid"]);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = @"SELECT COUNT(*) 
                                     FROM Cart_tab 
                                     WHERE User_id = @uid 
                                     AND Cart_status = 1";
            cmd.Parameters.AddWithValue("@uid", uid);
            int count = Convert.ToInt32(ob.SP_Scalar(cmd));
            if (count > 0)
            {
                Response.Redirect("Checkout.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "stockAlert", "showPdToast('Your Cart Is Empty','Please Add Itmes To Your Cart', 'error');", true);

            }

        }
    }
}