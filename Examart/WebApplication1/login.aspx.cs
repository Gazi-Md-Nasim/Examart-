using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-SC7TE2P\SQLEXPRESS;Initial Catalog=LogInSystem;Integrated Security=true");
        String check = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                clear();
            }
            if(Session["user"] != null)
            {
                if (Session["page"] == null)
                {
                    Response.Redirect("~/Home.aspx");
                }
                else
                {
                    Response.Redirect(Session["page"].ToString());
                }
            }

        }
        public void clear()
        {
            email.Text = "";
            pass.Text = "";
        }
        protected void button_Click(object sender, EventArgs e)
        {
            if (sqlCon.State == System.Data.ConnectionState.Closed)
            {
                sqlCon.Open();
            }
            SqlCommand sqlcmd = new SqlCommand("SELECT LogInID FROM UserRecord WHERE Email = '" + email.Text + "' AND Password = '" + pass.Text + "'", sqlCon);//LogInCheck
             SqlDataReader da = sqlcmd.ExecuteReader();
             while (da.Read())
             {
                 check = da.GetValue(0).ToString();
             }
            da.Close();
            sqlCon.Close();
            sqlCon.Open();
            SqlCommand sqlcmd1 = new SqlCommand("SELECT COUNT(*) FROM UserRecord WHERE Email = '" + email.Text + "' AND Password = '" + pass.Text + "'", sqlCon);//LogInCheck

            String output = sqlcmd1.ExecuteScalar().ToString();
            if(output == "1")
            {
                sqlcmd1 = new SqlCommand("SELECT COUNT(*) FROM AdminList WHERE id='" + check + "'", sqlCon);
                String adminCheck = sqlcmd1.ExecuteScalar().ToString();
                if(!adminCheck.Equals("0"))
                {
                    Session["admin"] = "yes";
                }
                else
                {
                    Session["admin"] = "no";
                }

                Session["user"] = check;
                createCookies();
                if (Session["page"] == null)
                {
                    Response.Redirect("~/Home.aspx");
                }
                else
                {
                    Response.Redirect(Session["page"].ToString());
                }
            }
            else
            {
                message.Text = "!Oops, Incorrect Email or Password";
            }
            sqlCon.Close();
            clear();
        }
        
        protected void createCookies()
        {
            HttpCookie cookie = new HttpCookie("mycookie");
            cookie.Value = email.Text;
            cookie.Expires = DateTime.Now.AddSeconds(30);
            Response.Cookies.Add(cookie);
        }
    }
}