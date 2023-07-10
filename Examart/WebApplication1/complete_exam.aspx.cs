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
    public partial class complete_exam : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-SC7TE2P\SQLEXPRESS;Initial Catalog=LogInSystem;Integrated Security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
             Session["page"] = "~/complete_exam.aspx";
            if (Session["user"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            GridView();
            profileView();
        }
        void GridView()
        {
            if (sqlCon.State == ConnectionState.Closed)
            {
                sqlCon.Open();
            }
            SqlDataAdapter sqlda = new SqlDataAdapter("SELECT * FROM User" + Session["user"].ToString(), sqlCon);
            DataTable dt = new DataTable();
            sqlda.Fill(dt);
            sqlCon.Close();
            grid.DataSource = dt;
            grid.DataBind();
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