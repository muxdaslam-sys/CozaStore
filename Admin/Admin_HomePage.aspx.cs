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
    public partial class Admin_HomePage : System.Web.UI.Page
    {
        ConClass ob = new ConClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboardStats();
                LoadRecentOrders();
                LoadLowStockItems();
            }
        }

        private void LoadDashboardStats()
        {
            try
            {
                // 1. Total Revenue from Paid Orders
                SqlCommand cmdRevenue = new SqlCommand("SELECT ISNULL(SUM(SubTotal), 0) FROM Order_tab WHERE Order_status='Paid'");
                string revenueStr = ob.SP_Scalar(cmdRevenue);
                decimal revenue = 0;
                decimal.TryParse(revenueStr, out revenue);
                lblTotalRevenue.Text = "&#8377;" + revenue.ToString("N0");

                // 2. Total Orders
                SqlCommand cmdOrders = new SqlCommand("SELECT COUNT(*) FROM Order_tab WHERE Order_status='Paid'");
                string ordersStr = ob.SP_Scalar(cmdOrders);
                int totalOrders = 0;
                int.TryParse(ordersStr, out totalOrders);
                lblTotalOrders.Text = totalOrders.ToString("N0");

                // Calculate Average Order Value (AOV)
                if (totalOrders > 0)
                {
                    decimal aov = revenue / totalOrders;
                    lblAOV.Text = "&#8377;" + aov.ToString("N0");
                }
                else
                {
                    lblAOV.Text = "&#8377;0";
                }

                // 3. Total Products & Low Stock Items
                SqlCommand cmdProducts = new SqlCommand("SELECT COUNT(*) FROM Product_tab");
                lblTotalProducts.Text = ob.SP_Scalar(cmdProducts);

                SqlCommand cmdLowStock = new SqlCommand("SELECT COUNT(*) FROM Product_tab WHERE Product_stock <= 10");
                lblLowStockCount.Text = ob.SP_Scalar(cmdLowStock);

                // 4. Registered Users
                SqlCommand cmdUsers = new SqlCommand("SELECT COUNT(*) FROM User_tab");
                lblTotalUsers.Text = ob.SP_Scalar(cmdUsers);

                // 5. Pending Support Inquiries
                try
                {
                    SqlCommand cmdSupport = new SqlCommand("SELECT COUNT(*) FROM Feedback_tab WHERE Feedback_status='pending'");
                    lblPendingSupport.Text = ob.SP_Scalar(cmdSupport);
                }
                catch
                {
                    lblPendingSupport.Text = "0";
                }

                // 6. Categories & Admins Count
                SqlCommand cmdCat = new SqlCommand("SELECT COUNT(*) FROM Category_tab");
                string totalCategories = ob.SP_Scalar(cmdCat);
                lblActiveCategories.Text = totalCategories;
                lblBoxCategories.Text = totalCategories;

                SqlCommand cmdAdmin = new SqlCommand("SELECT COUNT(*) FROM Admin_tab");
                lblBoxAdmins.Text = ob.SP_Scalar(cmdAdmin);
            }
            catch
            {
                lblTotalRevenue.Text = "&#8377;0";
                lblTotalOrders.Text = "0";
                lblAOV.Text = "&#8377;0";
                lblTotalProducts.Text = "0";
                lblLowStockCount.Text = "0";
                lblTotalUsers.Text = "0";
                lblPendingSupport.Text = "0";
                lblActiveCategories.Text = "0";
                lblBoxCategories.Text = "0";
                lblBoxAdmins.Text = "0";
            }
        }

        private void LoadRecentOrders()
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = @"SELECT TOP 8 o.OrderGroupID, u.User_name, u.User_email, p.Product_name, o.Quantity, o.SubTotal, o.Order_status, o.Order_Date
                                    FROM Order_tab o 
                                    INNER JOIN User_tab u ON o.User_id = u.User_id
                                    INNER JOIN Product_tab p ON o.Product_id = p.Product_id
                                    WHERE o.Order_status = 'Paid' 
                                    ORDER BY o.Order_Date DESC, o.OrderGroupID DESC";

                DataSet ds = ob.SP_Adapter(cmd);
                GV_RecentOrders.DataSource = ds;
                GV_RecentOrders.DataBind();
            }
            catch
            {
                // Graceful fallback
            }
        }

        private void LoadLowStockItems()
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = @"SELECT TOP 5 Product_id, Product_name, Product_stock, Product_price, Product_image 
                                    FROM Product_tab 
                                    WHERE Product_stock <= 10 
                                    ORDER BY Product_stock ASC";

                DataSet ds = ob.SP_Adapter(cmd);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    rptrLowStock.DataSource = ds;
                    rptrLowStock.DataBind();
                    pnlLowStockList.Visible = true;
                    pnlLowStockEmpty.Visible = false;
                }
                else
                {
                    pnlLowStockList.Visible = false;
                    pnlLowStockEmpty.Visible = true;
                }
            }
            catch
            {
                pnlLowStockList.Visible = false;
                pnlLowStockEmpty.Visible = true;
            }
        }
    }
}