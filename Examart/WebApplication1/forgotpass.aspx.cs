using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-SC7TE2P\SQLEXPRESS;Initial Catalog=LogInSystem;Integrated Security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if(!IsPostBack)
            {
                email.Text = "";
            
            }
        }

        public void sendEmail(String email)
        {
            try
            {
                String code = RandomCodeGenerator().ToString();
                MailMessage mailMessage = new MailMessage("examart086@gmail.com", email);
                mailMessage.Subject = "Generated code";
                mailMessage.Body = code;
                Session["code"] = code;
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                smtpClient.Credentials = new System.Net.NetworkCredential("examart086@gmail.com", "examart#01#");
                smtpClient.EnableSsl = true;
                smtpClient.Send(mailMessage);
            }
            catch(Exception e)
            {
                message.Text = "Inavalid Email";
            }
        }
        public int RandomCodeGenerator()
        {
            Random random = new Random();
            int i = random.Next(100000,999999);
            return i;
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            String mail = email.Text;
            if (sqlCon.State == System.Data.ConnectionState.Closed)
            {
                sqlCon.Open();
            }
            SqlCommand sqlcmd1 = new SqlCommand("SELECT COUNT(*) FROM UserRecord WHERE Email = '" + mail + "'", sqlCon);//LogInCheck
            String output = sqlcmd1.ExecuteScalar().ToString();

            if (output == "1")
            {
                Session["mail"] = mail;
                Session["status"] = "forgot";
                sendEmail(mail);
                Response.Redirect("~/forgotnext.aspx");
            }
            else
            {
                message.Text = "There is no such Email";
            }
            sqlCon.Close();
            email.Text = "";
        }
    }
}