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
    public partial class forgotnext : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-SC7TE2P\SQLEXPRESS;Initial Catalog=LogInSystem;Integrated Security=true");
        String check = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                message.Text = "";
                box.Text = "";
                message.Visible = false;
                Button1.Visible = false;
            }
            if(Session["status"]==null)
            {
                Response.Redirect("~/login.aspx");
            }
        }

        protected void btn2_Click(object sender, EventArgs e)
        {
            String code = "";
            String getcode = "";
            if (Session["code"] != null)
            {
                getcode = Session["code"].ToString().Trim();
            }
            code=getcode;
            String dept = Session["dept"].ToString();
            String varsity = Session["varsity"].ToString();
            String adrs = Session["adrs"].ToString();
            if (box.Text.Trim().Equals(code))
            {
                String mail = Session["mail"].ToString();
                

                if (Session["status"].ToString().Equals("createNew"))
                {
                    String nme = Session["name"].ToString();
                    String password = Session["pass"].ToString();
                    if (sqlCon.State == System.Data.ConnectionState.Closed)
                    {
                        sqlCon.Open();
                    }
                    SqlCommand sqlCmd = new SqlCommand("userInsertAndUpdate", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@LogInID", 0);
                    sqlCmd.Parameters.AddWithValue("@Name", nme);
                    sqlCmd.Parameters.AddWithValue("@Email", mail);
                    sqlCmd.Parameters.AddWithValue("@Password", password);
                    sqlCmd.Parameters.AddWithValue("@Department", dept);
                    sqlCmd.Parameters.AddWithValue("@University", varsity);
                    sqlCmd.Parameters.AddWithValue("@Address", adrs);
                    sqlCmd.ExecuteNonQuery();
                    sqlCon.Close();
                    Session.Remove("pass");
                    Session.Remove("name");
                    sqlCon.Open();
                    SqlCommand sqlcmd = new SqlCommand("SELECT LogInID FROM UserRecord WHERE Email = '" + mail + "'", sqlCon);//LogInCheck
                    SqlDataReader da = sqlcmd.ExecuteReader();
                    while (da.Read())
                    {
                        check = da.GetValue(0).ToString();
                    }
                    sqlCon.Close();
                    Session["user"] = check;
                    sqlCon.Open();
                    SqlCommand createTable = new SqlCommand("CREATE TABLE User"+check+" (ExamName varchar(50),Marks varchar(50),Status varchar(50))", sqlCon);
                    createTable.ExecuteNonQuery();
                    sqlCon.Close();
                    Session.Remove("status");
                    Session.Remove("mail");
                    Session.Remove("dept");
                    Session.Remove("varsity");
                    Session.Remove("adrs");
                    Response.Redirect("~/addPhoto.aspx");
                }

                else
                {
                    if (sqlCon.State == System.Data.ConnectionState.Closed)
                    {
                        sqlCon.Open();
                    }
                    SqlCommand sqlcmd = new SqlCommand("SELECT LogInID FROM UserRecord WHERE Email = '" + mail + "'", sqlCon);//LogInCheck
                    SqlDataReader da = sqlcmd.ExecuteReader();
                    while (da.Read())
                    {
                        check = da.GetValue(0).ToString();
                    }
                    sqlCon.Close();
                    Session["user"] = check;
                    Session.Remove("mail");
                    Session.Remove("status");
                    Response.Redirect("~/Home.aspx");
                }
                }
            else
                {
                    message.Visible = true;
                    message.Text = "Incorrect Code";
                    Button1.Visible = true;
                }
            
            Session.Remove("code");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String mail = Session["mail"].ToString().Trim();
            sendEmail(mail);
        }

        public void sendEmail(String email)
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
            catch(Exception e)
            {
                message.Text = "Invalid Email";
            }
        }
        public int RandomCodeGenerator()
        {
            Random random = new Random();
            int i = random.Next(100000, 999999);
            return i;
        }
    }
}