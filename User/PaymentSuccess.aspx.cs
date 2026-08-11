using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecom_Project.User
{
    public partial class PaymentSuccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Request.QueryString["orderGroupID"] != null)
                {
                    string orderGroupID = Request.QueryString["orderGroupID"];
                    lblid.Text= orderGroupID;
                    
                }
                else
                {
                    Response.Redirect("uindex.aspx");
                    return;
                }

            }
        }
    }
}