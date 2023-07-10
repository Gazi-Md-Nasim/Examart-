using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class addPhoto : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-SC7TE2P\SQLEXPRESS;Initial Catalog=LogInSystem;Integrated Security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user"]==null)
            {
                Response.Redirect("~/createNew.aspx");
            }
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            if (!fin.HasFile)
            {
                message.Text = "Please choose an image";
            }
            else
            {
                
                String extension = Path.GetExtension(fin.FileName);
                try 
                {
                    String curr_image = Request.MapPath("~/"+pictureName());
                if(System.IO.File.Exists(curr_image))
                    {
                        System.IO.File.Delete(curr_image);
                    }
                fin.SaveAs(Server.MapPath("~/profilepic/") + Path.GetFileName("User" + Session["user"].ToString() + extension));
                String pic = "profilepic/" + Path.GetFileName("User" + Session["user"].ToString() + extension);

                 if (sqlCon.State == System.Data.ConnectionState.Closed)
                    {
                        sqlCon.Open();
                    }
                SqlCommand sqlcmd1 = new SqlCommand("UPDATE UserRecord SET ProfilePic='" + pic + "' WHERE LogInID = '" + Session["user"].ToString() + "'", sqlCon);
                sqlcmd1.ExecuteNonQuery();
                sqlCon.Close();
                    if (Session["admin"] == null)
                    {
                        Session["admin"] = "no";
                    }
                Response.Redirect("~/Home.aspx");
                }
                catch (Exception)
                {
                    message.Text = "Please choose a low resolution image with an extention if JPG, JPEG, PNG";
                }
            }
        }

        String pictureName()
        {

            String id = Session["user"].ToString();
            String picName = "";
            if(sqlCon.State == System.Data.ConnectionState.Closed)
            {
                sqlCon.Open();
            }
            SqlCommand sqlcmd = new SqlCommand("SELECT ProfilePic FROM UserRecord WHERE LogInID = '" + id + "'", sqlCon);//LogInCheck
            SqlDataReader da = sqlcmd.ExecuteReader();
            while (da.Read())
            {
                picName = da.GetValue(0).ToString();
            }
            sqlCon.Close();
            return picName;
        }
    }
}