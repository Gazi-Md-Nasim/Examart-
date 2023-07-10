using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class adminlist : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-SC7TE2P\SQLEXPRESS;Initial Catalog=LogInSystem;Integrated Security=true");

        public Button Sender { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            else if (Session["admin"].ToString().Equals("no"))
            {
                Response.Redirect("~/Home.aspx");
            }
            profileView();
            if (!Page.IsPostBack)
            {
                repeaterView("");
            }

        }
        protected void profileView()
        {
            String pic = "";
            String id = Session["user"].ToString();
            if (sqlCon.State == System.Data.ConnectionState.Closed)
            {
                sqlCon.Open();
            }
            SqlCommand sqlcmd = new SqlCommand("SELECT ProfilePic FROM UserRecord WHERE LogInID = '" + id + "'", sqlCon);
            SqlDataReader da = sqlcmd.ExecuteReader();
            while (da.Read())
            {
                pic = da.GetValue(0).ToString();
            }
            da.Close();
            sqlCon.Close();
            if (!pic.Equals(""))
            {
                image.ImageUrl = pic;
            }
            else
            {
                image.ImageUrl = "examart.png";
            }
        }

        protected void repeaterView(String pass)
        {
            String command = "";
            if (pass.Equals("") || pass.ToLower().Equals("all"))
            {
                command = "select LogInID, Name, Email, ProfilePic, Department, University, Address from UserRecord where LogInID in (Select id from AdminList)";
            }
            else
            {
                command = "select LogInID, Name, Email, ProfilePic, Department, University, Address from UserRecord where LogInID in (select id from AdminList) and Name='" + pass + "'";
            }
            if (sqlCon.State == ConnectionState.Closed)
            {
                sqlCon.Open();
            }
            SqlDataAdapter sqlda = new SqlDataAdapter(command, sqlCon);
            DataTable dt = new DataTable();
            sqlda.Fill(dt);
            sqlCon.Close();
            Repeat.DataSource = dt;
            Repeat.DataBind();
            
        }




        protected void searchbtn_Click(object sender, EventArgs e)
        {
            String search = searchtext.Text.Trim().ToLower();
            repeaterView(search);
            searchtext.Text = "";
        }


        protected void delbtn_Click(object sender, EventArgs e)
        {
            String id = Convert.ToString((sender as Button).CommandArgument);
            if (!id.Equals(""))
            {
                if (sqlCon.State == System.Data.ConnectionState.Closed)
                {
                    sqlCon.Open();
                }

                SqlCommand sql = new SqlCommand("delete from AdminList where id='" + id + "' and Email !='examart086@gmail.com'", sqlCon);
                sql.ExecuteNonQuery();
                repeaterView("");
            }
        }
    }
}