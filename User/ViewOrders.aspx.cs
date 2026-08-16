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
    public partial class ViewOrders : System.Web.UI.Page
    {
        ConClass ob = new ConClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int uid = Convert.ToInt32(Session["uid"]);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = @"SELECT COUNT(*) FROM Order_tab WHERE User_id = @uid AND Order_status = 'Paid'";
                cmd.Parameters.AddWithValue("@uid", uid);
                int count = Convert.ToInt32(ob.SP_Scalar(cmd));
                if (count > 0)
                {
                    lbl_msg.Visible = false;
                    loadorders();
                }
                else
                {
                    lbl_msg.Visible = true;
                    lbl_msg.Text = "There Are No Orders Right Now";
                }
            }
        }
        public void loadorders()
        {
            int uid = Convert.ToInt32(Session["uid"]);

            SqlCommand outer_cmd = new SqlCommand();
            outer_cmd.CommandText = @"select DISTINCT OrderGroupID,Order_Date,SubTotal from Order_tab 
                                            WHERE User_id = @uid AND Order_status = 'Paid'";
            outer_cmd.Parameters.AddWithValue("@uid", uid);
            DataSet ds_outer = ob.SP_Adapter(outer_cmd);
            DL_outer.DataSource = ds_outer;
            DL_outer.DataBind();

        }

        protected void DL_outer_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Get the OrderGroupID of the current outer item
                int orderGroupID = Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "OrderGroupID"));

                // Find the inner DataList
                DataList DL_inner = (DataList)e.Item.FindControl("DL_inner");

                int uid = Convert.ToInt32(Session["uid"]);

                SqlCommand inner_cmd = new SqlCommand();

                inner_cmd.CommandText = @"SELECT  p.Product_image,  p.Product_name, o.Quantity
                                          FROM Order_tab AS o INNER JOIN Product_tab AS p ON o.Product_id = p.Product_id
                                           WHERE o.User_id = @uid  AND o.Order_status = 'Paid' AND o.OrderGroupID = @OrderGroupID";

                inner_cmd.Parameters.AddWithValue("@uid", uid);
                inner_cmd.Parameters.AddWithValue("@OrderGroupID", orderGroupID);

                DataSet ds_inner = ob.SP_Adapter(inner_cmd);

                DL_inner.DataSource = ds_inner;
                DL_inner.DataBind();
            }
        }

        protected void btn_viewBill_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            string orderGroupID = btn.CommandArgument;

            Response.Redirect("Billing.aspx?orderGroupID=" + orderGroupID);
        }

       
        protected void btn_feedback_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string orderGroupID = btn.CommandArgument;
            // 1. Store orderGroupID in your HiddenField inside the chat panel
            hf_ordergroupid.Value = orderGroupID;
            // 2. Fetch and bind feedback chat messages for this order group & user
            LoadChatHistory(orderGroupID);
            // 3. Make chat panel visible
            Panel1.Visible = true;
        }
        protected void btn_send_Click(object sender, EventArgs e)
        {
            // 1. PREVENT EMPTY MESSAGES: Stops blank or space-only ("   ") messages from being saved to the database.
            //    Also checks that the hidden order ID field is present before processing.
            if (string.IsNullOrWhiteSpace(tb_msg.Text) || string.IsNullOrEmpty(hf_ordergroupid.Value))
            {
                return;
            }
            int uid = Convert.ToInt32(Session["uid"]);
            // 2. PREVENT PAGE RELOADS & CRASHES: Safely converts the hidden field value to an integer.
            //    If the hidden field is invalid or empty, int.TryParse returns false instead of throwing 
            //    a FormatException (which crashes the UpdatePanel and forces a full page reload).
            if (!int.TryParse(hf_ordergroupid.Value, out int orderGroupID))
            {
                return;
            }
            string feedbackMessage = tb_msg.Text.Trim();
            // 3. DATABASE INSERTION: Inserts the valid feedback message into Feedback_tab table.
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = @"INSERT INTO Feedback_tab (User_id, Product_id, Feedback_message, Feedback_reply, Feedback_status) VALUES (@uid, @productId, @message, '', 'Pending')";
            cmd.Parameters.AddWithValue("@uid", uid);
            cmd.Parameters.AddWithValue("@productId", orderGroupID);
            cmd.Parameters.AddWithValue("@message", feedbackMessage);

            int result = ob.SP_nonquery(cmd);

            // 4. REFRESH CHAT STREAM: Reloads and binds the updated message list for this order.
            LoadChatHistory(orderGroupID.ToString());
        }
        public void LoadChatHistory(string orderGroupId)
        {
            // 1. Clear previous text from the message input box
            tb_msg.Text = "";
            int uid = Convert.ToInt32(Session["uid"]);
            // 2. FETCH USER NAME: Retrieve the logged-in user's name to construct the header greeting
            SqlCommand ucmd = new SqlCommand();
            ucmd.CommandText = @"SELECT User_name FROM User_tab WHERE User_id = @uid";
            ucmd.Parameters.AddWithValue("@uid", uid);
            string name = ob.SP_Scalar(ucmd);

            // Display header greeting message
            lbl_welcome.Text = "Welcome, " + name + "! How can I help you?";
            // 3. FETCH CHAT MESSAGES: Query message history between this user & admin for the current order group
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = @"SELECT u.User_name, f.Feedback_message, f.Feedback_reply 
                         FROM Feedback_tab f 
                         JOIN User_tab u ON f.User_id = u.User_id 
                         WHERE f.User_id = @uid AND f.Product_id = @Product_id 
                         ORDER BY f.Feedback_id ASC";
            cmd.Parameters.AddWithValue("@uid", uid);
            cmd.Parameters.AddWithValue("@Product_id", orderGroupId);
            DataSet ds = ob.SP_Adapter(cmd);
            // Track whether the automated "received message" response has been assigned
            bool replyMessageShown = false;
            // 4. AUTOMATED BOT RESPONSE: Attach confirmation text to the first unreplied message only
            if (ds.Tables.Count > 0)
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    string reply = Convert.ToString(row["Feedback_reply"]);
                    // If admin hasn't replied yet and no auto-reply has been shown, set the automated message
                    if (string.IsNullOrEmpty(reply) && !replyMessageShown)
                    {
                        row["Feedback_reply"] = "We’ve received your message. Our team will get back to you shortly.";
                        replyMessageShown = true; // Ensures it is only shown once for the pending message batch
                    }
                    else if (string.IsNullOrEmpty(reply))
                    {
                        // Leave empty so no blank admin bubble is rendered
                        row["Feedback_reply"] = "";
                    }
                }
            }
            // 5. BIND MESSAGES: Bind dataset to the chat DataList control to render messages on screen
            DL_chat.DataSource = ds;
            DL_chat.DataBind();

        }

        protected void btn_close_click(object sender, EventArgs e)
        {
            tb_msg.Text = "";
            Panel1.Visible = false;
            hf_ordergroupid.Value = "";
        }
    }

}