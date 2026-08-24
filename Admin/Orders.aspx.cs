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
    public partial class Orders : System.Web.UI.Page
    {
        ConClass ob = new ConClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = @"SELECT o.OrderGroupID, u.User_name, p.Product_name, o.Quantity, o.SubTotal, o.Order_status, o.Order_Date
                                    FROM Order_tab o JOIN User_tab u ON o.User_id=u.User_id
                                    JOIN Product_tab p ON o.Product_id=p.Product_id
                                    WHERE o.Order_status='Paid' ORDER BY o.Order_Date DESC";
                DataSet ds = ob.SP_Adapter(cmd);
                GV_orders.DataSource = ds;
                GV_orders.DataBind();
            }

        }
    }
}