using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;


namespace Ecom_Project.Admin
{
    public partial class UserSupport : System.Web.UI.Page
    {
        ConClass ob = new ConClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                panel_chat.Visible = false;
                GridBind();
            }
        }
        public void GridBind()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = @"select distinct u.User_name,Product_id , Feedback_status from Feedback_tab f  
                                    join User_tab u on f.User_id=u.User_id  where Feedback_status='pending' order by Product_id desc";
            DataSet ds = ob.SP_Adapter(cmd);
            gv_usersSupport.DataSource = ds;
            gv_usersSupport.DataBind();
        }
        public void LoadChatHistory()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = @"SELECT u.User_name, f.Feedback_message, f.Feedback_reply 
                         FROM Feedback_tab f 
                         JOIN User_tab u ON f.User_id = u.User_id 
                         WHERE  f.Product_id = @Product_id
                         ORDER BY f.Feedback_id ASC";
            int Product_id = Convert.ToInt32(hf_pid.Value);
            cmd.Parameters.AddWithValue("@Product_id", Product_id);
            DataSet ds = ob.SP_Adapter(cmd);
            DL_chat.DataSource = ds;
            DL_chat.DataBind();
        }

        protected void btn_reply_Click(object sender, EventArgs e)
        {
            panel_chat.Visible = true;
            Button btn = (Button)sender;
            hf_pid.Value = btn.CommandArgument;
            LoadChatHistory();
        }

        protected void btn_mail_Click(object sender, EventArgs e)
        {
            panel_email.Visible = true;
        }

        protected void btn_Send_Click(object sender, EventArgs e)
        {
            int Product_id = Convert.ToInt32(hf_pid.Value);
            string reply = tbx_reply.Text;

            SqlCommand cmd1 = new SqlCommand();

            cmd1.CommandText = @"UPDATE Feedback_tab SET Feedback_reply = @reply
                                 WHERE Feedback_id = (SELECT MAX(Feedback_id) FROM Feedback_tab WHERE Product_id = @Product_id);
                                 UPDATE Feedback_tab SET Feedback_status = 'Replied'
                                 WHERE Product_id = @Product_id AND Feedback_status = 'Pending';";

            cmd1.Parameters.AddWithValue("@Product_id", Product_id);
            cmd1.Parameters.AddWithValue("@reply", reply);
            ob.SP_nonquery(cmd1);
            LoadChatHistory();
            tbx_reply.Text = "";
            GridBind();
        }

        protected void btn_close_Click(object sender, EventArgs e)
        {
            hf_pid.Value = "";
            panel_chat.Visible = false;
        }

        protected void btn_sendMail_Click(object sender, EventArgs e)
        {
            MailMessage mail = new MailMessage();

            mail.From = new MailAddress("muxd.aslam@gmail.com");
            mail.To.Add(tb_to.Text);
            mail.Subject = tb_subject.Text;
            mail.Body = tb_message.Text;

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);

            smtp.EnableSsl = true;
            smtp.Credentials = new NetworkCredential(
                "muxd.aslam@gmail.com",
                "fnrq hjcx ihew mvbv"
            );

            try
            {
                smtp.Send(mail);
                lbl_success.Text = "Email Sent Successfully!";
                lbl_success.ForeColor = System.Drawing.Color.Green;
                lbl_success.Visible = true;
                tb_to.Text = "";
                tb_subject.Text = "";
                tb_message.Text = "";
            }
            catch (Exception ex)
            {
                lbl_success.Text = "Failed to send email: " + ex.Message;
                lbl_success.ForeColor = System.Drawing.Color.Red;
                lbl_success.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            panel_email.Visible = false;
        }
    }
}