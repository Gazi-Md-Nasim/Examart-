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
    public partial class feed_back : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-SC7TE2P\SQLEXPRESS;Initial Catalog=LogInSystem;Integrated Security=true");
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            emt.Visible = false;
            Session["page"] = "~/feed_back.aspx";
            if (Session["user"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            show();
            profileView();
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            if (CommentBox.Text.Equals(""))
            {
               emt.Visible = true;
               emt.Text = "Comment box must not be empty";
            }
            else
            {
               emt.Visible = false;
                string name = "";
                String id = Session["user"].ToString();
                if (sqlCon.State == System.Data.ConnectionState.Closed)
                {
                    sqlCon.Open();
                }
                SqlCommand sqlcmd = new SqlCommand("SELECT Name FROM UserRecord WHERE LogInID = '" + id + "'", sqlCon);
                SqlDataReader da = sqlcmd.ExecuteReader();
                while (da.Read())
                {
                    name = da.GetValue(0).ToString();
                }
                da.Close();
                cmd = new SqlCommand("INSERT INTO CommentTable (Name,Date,Comment) values(@name,@date,@comment)", sqlCon);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@Date", DateTime.Now);
                cmd.Parameters.AddWithValue("@comment", CommentBox.Text);
                cmd.ExecuteNonQuery();
                Response.Redirect(Request.Url.AbsoluteUri);
                sqlCon.Close();
            }
        }
        protected void show()
        {
            sqlCon.Open();
            cmd = new SqlCommand("SELECT * FROM CommentTable order by Date desc", sqlCon);
            sda.SelectCommand = cmd;
            sda.Fill(ds, "commentTable");
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
            sqlCon.Close();
        }
        private void profileView()
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
    }
}