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
    public partial class Product : System.Web.UI.Page
    {
        ConClass ob = new ConClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategories();
                int categoryId = Convert.ToInt32(Request.QueryString["categoryId"]);
                if (categoryId!= 0)
                {
                    BindProductsByCategory(categoryId);
                }
                else
                {
                    BindAllProducts();
                }
            }
        }

        private void BindCategories()
        {
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = @"SELECT Category_id, Category_name
                                FROM Category_tab
                                WHERE Category_status = @status";

            cmd.Parameters.AddWithValue("@status", "available");

            DataSet ds = ob.SP_Adapter(cmd);

            DL_cat.DataSource = ds;
            DL_cat.DataBind();
        }

        // Show all products
        private void BindAllProducts()
        {
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = @"SELECT Product_id, Product_image,Product_name,Product_description,Product_price
                                FROM Product_tab
                                WHERE Product_status = @status";

            cmd.Parameters.AddWithValue("@status", "available");

            DataSet ds = ob.SP_Adapter(cmd);

            DL_Product.DataSource = ds;
            DL_Product.DataBind();
        }

        // Show products from selected category
        private void BindProductsByCategory(int categoryId)
        {
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = @"SELECT Product_id,
                               Product_image,
                               Product_name,
                               Product_description,
                               Product_price
                        FROM Product_tab
                        WHERE Product_status = @status
                        AND Category_id = @CategoryId";

            cmd.Parameters.AddWithValue("@status", "available");
            cmd.Parameters.AddWithValue("@CategoryId", categoryId);

            DataSet ds = ob.SP_Adapter(cmd);

            DL_Product.DataSource = ds;
            DL_Product.DataBind();
        }

        protected void BtnAll_Click(object sender, EventArgs e)
        {
            BindAllProducts();
        }

        protected void ImageButton1_Command(object sender, CommandEventArgs e)
        {
            string ProductId = e.CommandArgument.ToString();

            Response.Redirect("Product-Details.aspx?ProductId=" + ProductId);
        }


        protected void BtnCat_Command(object sender, CommandEventArgs e)
        {
            int categoryId = Convert.ToInt32(e.CommandArgument);

            BindProductsByCategory(categoryId);
        }

        protected void TxtSearch_TextChanged(object sender, EventArgs e)
        {
            // Placeholder: code your search text change logic here later
        }
    }
}