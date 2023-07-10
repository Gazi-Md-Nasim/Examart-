using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{

    public partial class Home : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-SC7TE2P\SQLEXPRESS;Initial Catalog=LogInSystem;Integrated Security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["page"] = "~/Home.aspx";
            if (Session["user"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            if (Session["admin"].ToString().Equals("no"))
            {
                HyperLink1.Visible = false;
                HyperLink2.Visible = false;
                Tab.Visible = false;
            }
            secMessage.Text = "";
            profileView();
            ViewList("");
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

        protected void ViewList(String st)
        {
            String command = "";
            if (sqlCon.State == ConnectionState.Closed)
            {
                sqlCon.Open();
            }
            if(st.Equals("") || st.Equals("all"))
            {
                command = "SELECT * FROM section order by Name";
            }
            else
            {
                command = "SELECT * FROM section where Name='"+st+"'  order by Name";
            }
            SqlDataAdapter sqlda = new SqlDataAdapter(command, sqlCon);
            DataTable dt = new DataTable();
            sqlda.Fill(dt);
            sqlCon.Close();
            ListView.DataSource = dt;
            ListView.DataBind();
        }

        protected void secaddbtn_Click(object sender, EventArgs e)
        {
            String name = secName.Text.Trim().ToUpper();
            String link = secLink.Text.Trim().ToLower();
            if(!name.Equals("") && !link.Equals("") && imgup.HasFile)
            { String path = Server.MapPath("~/" + name);
                if(!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                    String extension = Path.GetExtension(imgup.FileName);
                    try
                    {
                        imgup.SaveAs(Server.MapPath("~/") + Path.GetFileName(name + extension));
                        String img = Path.GetFileName(name + extension);

                        if (sqlCon.State == System.Data.ConnectionState.Closed)
                        {
                            sqlCon.Open();
                        }
                        SqlCommand cmd = new SqlCommand("INSERT INTO section (Name,link,picture) values(@name,@link,@image)", sqlCon);
                        cmd.Parameters.AddWithValue("@name", name);
                        cmd.Parameters.AddWithValue("@link", link);
                        cmd.Parameters.AddWithValue("@image", img);
                        cmd.ExecuteNonQuery();
                        SqlCommand tableCreate = new SqlCommand("CREATE TABLE "+name.ToLower()+" (Name varchar(max),link varchar(max), picture varchar(max), department varchar(max))", sqlCon);
                        tableCreate.ExecuteNonQuery();
                        sqlCon.Close();
                        name = "";
                        link = "";
                    Response.Redirect(Request.Url.AbsoluteUri);
                        
                    }
                    catch (Exception)
                    {
                        secMessage.Text = "Error";
                    }
                }
                else
                {
                    secMessage.Text = "Section " + name + " already exist";
                }
            }
            else
            {
                secMessage.Text = "Please provide all the information";
            }
        }

        protected void secdelbtn_Click(object sender, EventArgs e)
        {
            String name = delSection.Text.Trim().ToUpper();
            String image = "";
            if (!name.Equals(""))
            {
                String path = Server.MapPath("~/" + name);
                if (Directory.Exists(path))
                {
                    Directory.Delete(path);


                    if (sqlCon.State == System.Data.ConnectionState.Closed)
                    {
                        sqlCon.Open();
                    }
                    SqlCommand sqlcmd = new SqlCommand("SELECT picture from section where Name='" + name.ToUpper() + "'", sqlCon);//LogInCheck
                    SqlDataReader da = sqlcmd.ExecuteReader();
                    while (da.Read())
                    {
                        image = da.GetValue(0).ToString();
                    }
                    da.Close();
                    path = Server.MapPath("~/" + image);
                    if (File.Exists(path))
                    {
                        File.Delete(path);
                    }
                    SqlCommand cmd = new SqlCommand("drop table " + name.ToLower(), sqlCon);
                    cmd.ExecuteNonQuery();
                    cmd = new SqlCommand("delete from section where Name='" + name.ToUpper() + "'", sqlCon);
                    cmd.ExecuteNonQuery();
                    sqlCon.Close();
                    Response.Redirect(Request.Url.AbsoluteUri);
                }
                else
                {
                    secMessage.Text = "NO Record found!";
                }
            }
            else
            {
                secMessage.Text = "Plese provide the information";
            }
        }

        protected void searchbtn_Click(object sender, EventArgs e)
        {
            String search = searchtext.Text.Trim().ToLower();
            ViewList(search);
            searchtext.Text = "";
        }
    }
}