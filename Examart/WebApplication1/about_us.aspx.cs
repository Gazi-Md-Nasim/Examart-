using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class about_us : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                profileView();
            }
            else
            {
                image.Visible = false;
            }
        }
        private void profileView()
        {
            SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-SC7TE2P\SQLEXPRESS;Initial Catalog=LogInSystem;Integrated Security=true");
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