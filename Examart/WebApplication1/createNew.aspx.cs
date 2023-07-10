using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class createNew : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-SC7TE2P\SQLEXPRESS;Initial Catalog=LogInSystem;Integrated Security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                clear();
                message.Text = "";
            }
        }
        void clear()
        {
            name.Text = "";
            email.Text = "";
            pass.Text = "";
            repass.Text = "";
        }
        protected void btn_Click(object sender, EventArgs e)
        {
            String mail = email.Text.Trim();
            String nme = name.Text.Trim();
            String dept = department.Text.Trim();
            String university = varsity.Text.Trim();
            String adrs = address.Text.Trim();
            String password = pass.Text.Trim();
            String repassword = repass.Text.Trim();
            if (sqlCon.State == System.Data.ConnectionState.Closed)
            {
                sqlCon.Open();
            }
            SqlCommand sqlcmd1 = new SqlCommand("SELECT COUNT(*) FROM UserRecord WHERE Email = '" + mail + "'", sqlCon);//LogInCheck
            String output = sqlcmd1.ExecuteScalar().ToString();
            sqlCon.Close();
            if (output == "1")
            {
                message.Text = "The email is already used";
            }
            else
            {
                if (mail.Equals("") || nme.Equals("") || password.Equals("") || repassword.Equals(""))
                {
                    message.Text = "Name, Email, passwords must not be blanks";
                }
                else if(!password.Equals(repassword))
                {
                    message.Text = "Passwords should be same";
                }
                else
                {
                    sqlCon.Open();
                    Session["name"] = nme;
                    Session["mail"] = mail;
                    Session["dept"] = dept;
                    Session["varsity"] = university;
                    Session["adrs"] = adrs;
                    Session["pass"] = password;
                    Session["status"] = "createNew";
                    sendEmail(mail);
                    Response.Redirect("~/forgotnext.aspx");//enter the link of next page
                }
            }
            clear();
        }
        protected void sendEmail(String email)
        {
            try
            {
                String code = RandomCodeGenerator().ToString();
                MailMessage mailMessage = new MailMessage("examart086@gmail.com", email);
                mailMessage.Subject = "Generated code";
                mailMessage.Body = code;
                Session["Code"] = code;
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                smtpClient.Credentials = new System.Net.NetworkCredential("examart086@gmail.com", "examart#01#");
                smtpClient.EnableSsl = true;
                smtpClient.Send(mailMessage);
            }
            catch (Exception e)
            {
                message.Text = "Invalid Email";
            }
        }
        protected int RandomCodeGenerator()
        {
            Random random = new Random();
            int i = random.Next(100000, 999999);
            return i;
        }
    }
}