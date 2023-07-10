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
    public partial class engineering : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-SC7TE2P\SQLEXPRESS;Initial Catalog=LogInSystem;Integrated Security=true");
        String pageNAme = "ENGINEERING";
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["page"] = "~/engineering.aspx";
            if (Session["user"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            if (Session["admin"].ToString().Equals("no"))
            {
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
            String pname = pageNAme.ToLower();
            if (sqlCon.State == ConnectionState.Closed)
            {
                sqlCon.Open();
            }
            if (st.Equals("") || st.Equals("all"))
            {
                command = "SELECT * FROM " + pname + " order by department";
            }
            else
            {
                command = "SELECT * FROM " + pname + " where Name='"+st+"'order by department";
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
            String name = examName.Text.Trim().ToUpper();
            String link = examLink.Text.Trim().ToLower();
            String dept = examdept.Text.Trim().ToUpper();

            if (!name.Equals("") && !link.Equals("") && imgup.HasFile && !dept.Equals(""))
            {
                if (sqlCon.State == System.Data.ConnectionState.Closed)
                {
                    sqlCon.Open();
                }
                SqlCommand sqlcmd1 = new SqlCommand("SELECT COUNT(*) FROM "+pageNAme.ToLower()+" WHERE Name='" + name + "'", sqlCon);
                String check = sqlcmd1.ExecuteScalar().ToString();
                String path = Server.MapPath(pageNAme.ToUpper()+"/");

                if (check.Equals("0"))
                {
                    String extension = Path.GetExtension(imgup.FileName);
                    try
                    {
                        imgup.SaveAs( path + Path.GetFileName(name + extension));
                        String img = pageNAme.ToUpper() + "/" + Path.GetFileName(name + extension);

                        
                        SqlCommand cmd = new SqlCommand("INSERT INTO " + pageNAme.ToLower() + " (Name,link,picture,department) values(@name,@link,@image,@dept)", sqlCon);
                        cmd.Parameters.AddWithValue("@name", name);
                        cmd.Parameters.AddWithValue("@link", link);
                        cmd.Parameters.AddWithValue("@image", img);
                        cmd.Parameters.AddWithValue("@dept", dept);
                        cmd.ExecuteNonQuery();
                        name = "";
                        link = "";
                        dept = "";
                        sqlCon.Close();
                        Response.Redirect(Request.Url.AbsoluteUri);

                    }
                    catch (Exception)
                    {
                        secMessage.Text = "Error";
                    }
                }
                else
                {
                    secMessage.Text = "Already exist";
                }
            }
            else
            {
                secMessage.Text = "Please provide all the information";
            }
        }

        protected void secdelbtn_Click(object sender, EventArgs e)
        {
            String name = delexam.Text.Trim().ToUpper();
            String image = "";
            if (!name.Equals(""))
            {
                if (sqlCon.State == System.Data.ConnectionState.Closed)
                {
                    sqlCon.Open();
                }
                SqlCommand sqlcmd1 = new SqlCommand("SELECT COUNT(*) FROM " + pageNAme.ToLower() + " WHERE Name='" + name + "'", sqlCon);
                String check = sqlcmd1.ExecuteScalar().ToString();

                if (!check.Equals("0"))
                {
                    SqlCommand sqlcmd = new SqlCommand("SELECT picture from " + pageNAme.ToLower() + " where Name='" + name + "'", sqlCon);//LogInCheck
                    SqlDataReader da = sqlcmd.ExecuteReader();
                    while (da.Read())
                    {
                        image = da.GetValue(0).ToString();
                    }
                    da.Close();
                    String path = Server.MapPath("~/" + image);
                    if (File.Exists(path))
                    {
                        File.Delete(path);
                    }
                    SqlCommand cmd = new SqlCommand("delete from " + pageNAme.ToLower() + " where Name='" + name+"'", sqlCon);
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