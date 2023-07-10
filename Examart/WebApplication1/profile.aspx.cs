using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{    public partial class profile : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-SC7TE2P\SQLEXPRESS;Initial Catalog=LogInSystem;Integrated Security=true");
        String picture="";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user"]==null)
             {
                 Response.Redirect("~/login.aspx");
             }
            Info();
        }
       
        protected void Info()
        {
            String nme = "";
            String pic = "";
            String mail = "";
            String department = "";
            String university = "";
            String address = "";
            String id = Session["user"].ToString();
            if (sqlCon.State == System.Data.ConnectionState.Closed)
            {
                sqlCon.Open();
            }
            SqlCommand sqlcmd = new SqlCommand("SELECT Name,ProfilePic,Email,Department,University,Address FROM UserRecord WHERE LogInID = '" + id + "'", sqlCon);//LogInCheck
            SqlDataReader da = sqlcmd.ExecuteReader();
            while (da.Read())
            {
                nme = da.GetValue(0).ToString();
                pic = da.GetValue(1).ToString();
                mail = da.GetValue(2).ToString();
                department = da.GetValue(3).ToString();
                university = da.GetValue(4).ToString();
                address = da.GetValue(5).ToString();
            }
            da.Close();
            sqlCon.Close();
            name.Text = nme;
            email.Text = mail;
            image.ImageUrl = pic;
            dept.Text = department;
            varsity.Text = university;
            adrs.Text = address;
            picture = pic;
        }

        protected void out_Click(object sender, EventArgs e)
        {
            Session.Remove("user");
            Response.Redirect("~/login.aspx");
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            String id = Session["user"].ToString();
            sqlCon.Open();
            SqlCommand sqlcmd = new SqlCommand("DELETE FROM UserRecord WHERE LogInID = '" + id + "'", sqlCon);
            sqlcmd.ExecuteNonQuery();
            sqlCon.Close();
            sqlCon.Open();
            SqlCommand dropTable = new SqlCommand("DROP TABLE User"+id, sqlCon);
            dropTable.ExecuteNonQuery();
            sqlCon.Close();
            picture = Server.MapPath("~/"+picture);
            if(System.IO.File.Exists(picture))
            {
                System.IO.File.Delete(picture);
            }
            Session.Remove("user");
            Response.Redirect("~/login.aspx");
        }

        protected void upload_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/addPhoto.aspx");
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/updateInfo.aspx");
        }
    }
}