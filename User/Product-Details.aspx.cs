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
    public partial class Product_Details : System.Web.UI.Page
    {
        ConClass ob = new ConClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int ProductId = Convert.ToInt32(Request.QueryString["ProductId"]);
                if (ProductId != 0)
                {
                    showproduct(ProductId);
                }
                else
                {
                    Response.Redirect("~/User/Product.aspx");
                    return;
                }
            }
        }

        private void showproduct(int ProductId)
        {
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = @"SELECT Product_id, Product_image, Product_name, Product_description, Product_price, Product_stock
                                FROM Product_tab where Product_id=@ProductId";

            cmd.Parameters.AddWithValue("@ProductId", ProductId);
            txtbstock.Text = "1";

            SqlDataReader dr = ob.SP_Reader(cmd);
            while (dr.Read())
            {
                Image1.ImageUrl = dr["Product_image"].ToString();
                lblpname.Text = dr["Product_name"].ToString();
                lblpdis.Text = dr["Product_description"].ToString();
                lblpprice.Text = dr["Product_price"].ToString();
                hft.Value = dr["Product_stock"].ToString();

                // Initial total = price × 1
                lbltotal.Text = dr["Product_price"].ToString();
            }
            dr.Close();
        }

        protected void btnplus_Click(object sender, EventArgs e)
        {
            int qty = Convert.ToInt32(txtbstock.Text);
            int stock = Convert.ToInt32(hft.Value);
            decimal price = Convert.ToDecimal(lblpprice.Text);

            if (qty < stock)
            {
                qty++;
                txtbstock.Text = qty.ToString();

                decimal total = price * qty;
                lbltotal.Text = total.ToString();

                lblmsg.Text = "";
            }
            else
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "Only " + stock + " items available.";
                ScriptManager.RegisterStartupScript(this, GetType(), "toast",
                    "showPdToast('Stock Limit', 'Only " + stock + " items available.', 'error');", true);
            }
        }

        protected void btnminus_Click(object sender, EventArgs e)
        {
            int qty = Convert.ToInt32(txtbstock.Text);
            decimal price = Convert.ToDecimal(lblpprice.Text);

            if (qty > 1)
            {
                qty--;
                txtbstock.Text = qty.ToString();
            }

            decimal total = price * qty;
            lbltotal.Text = total.ToString();

            lblmsg.Text = "";
        }

        protected void btnaddtocart_Click(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            int userId = Convert.ToInt32(Session["uid"]);
            int productId = Convert.ToInt32(Request.QueryString["ProductId"]);
            int qty = Convert.ToInt32(txtbstock.Text);
            int stock = Convert.ToInt32(hft.Value);
            decimal price = Convert.ToDecimal(lblpprice.Text);

            // Stock validation
            if (qty > stock)
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "Only " + stock + " items available.";
                ScriptManager.RegisterStartupScript(this, GetType(), "toast",
                    "showPdToast('Stock Limit', 'Only " + stock + " items available.', 'error');", true);
                return;
            }

            // Check product already exists in cart
            SqlCommand checkcmd = new SqlCommand();

            checkcmd.CommandText = @"SELECT COUNT(*) 
                                     FROM Cart_tab 
                                     WHERE User_id = @uid 
                                     AND Product_id = @pid 
                                     AND Cart_status = 1";

            checkcmd.Parameters.AddWithValue("@uid", userId);
            checkcmd.Parameters.AddWithValue("@pid", productId);

            int count = Convert.ToInt32(ob.SP_Scalar(checkcmd));

            if (count > 0)
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "Product already added to cart.";
                ScriptManager.RegisterStartupScript(this, GetType(), "toast",
                    "showPdToast('Already in Cart', 'Product already added to cart.', 'error');", true);
                return;
            }

            // Calculate subtotal
            decimal subtotal = price * qty;

            // Insert into cart
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = @"INSERT INTO Cart_tab
                                (User_id, Product_id, Quantity, SubTotal, Cart_status, Cart_Date)
                                VALUES
                                (@uid, @pid, @qty, @subtotal, 1, GETDATE())";

            cmd.Parameters.AddWithValue("@uid", userId);
            cmd.Parameters.AddWithValue("@pid", productId);
            cmd.Parameters.AddWithValue("@qty", qty);
            cmd.Parameters.AddWithValue("@subtotal", subtotal);

            int i = ob.SP_nonquery(cmd);

            if (i > 0)
            {
                lblmsg.ForeColor = System.Drawing.Color.Green;
                lblmsg.Text = "Added to cart successfully.";

                // Calculate updated cart count
                SqlCommand countCmd = new SqlCommand();
                countCmd.CommandText = @"SELECT ISNULL(SUM(Quantity), 0) FROM Cart_tab WHERE User_id = @uid AND Cart_status = 1";
                countCmd.Parameters.AddWithValue("@uid", userId);
                int cartCount = Convert.ToInt32(ob.SP_Scalar(countCmd));

                string jsCode = $"showPdToast('Success!', 'Added to cart successfully.', 'success'); document.querySelectorAll('.icon-header-noti').forEach(function(el) {{ el.setAttribute('data-notify', '{cartCount}'); }});";
                ScriptManager.RegisterStartupScript(this, GetType(), "toast", jsCode, true);
            }
            else
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "Failed to add to cart.";
                ScriptManager.RegisterStartupScript(this, GetType(), "toast",
                    "showPdToast('Failed', 'Failed to add to cart.', 'error');", true);
            }
        }
    }
}