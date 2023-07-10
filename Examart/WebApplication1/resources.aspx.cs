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
    public partial class resources : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-SC7TE2P\SQLEXPRESS;Initial Catalog=LogInSystem;Integrated Security=true");
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["page"] = "~/resources.aspx";
            if (Session["user"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            else if(Session["admin"].ToString().Equals("no"))
            {
                Table.Visible = false;
            }
            view();
            profileView();
        }
        protected void addfile_Click(object sender, EventArgs e)
        {
            String name = subnameadd.Text.Trim().ToUpper();
            String dept = deptadd.Text.Trim().ToUpper();
            sqlCon.Open();
            SqlCommand search = new SqlCommand("SELECT COUNT(*) FROM resources WHERE Name = '" + name + "'", sqlCon);
            String output = search.ExecuteScalar().ToString();
            sqlCon.Close();

            if (!fileup.HasFile || dept=="" || name=="")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please choose a pdf and fill all the informations')", true);
            }
            else if(output=="1")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('File is already in the record')", true);
                subnameadd.Text = "";
                deptadd.Text = "";
            }
            else
            {

                String extension = Path.GetExtension(fileup.FileName);
                try
                {
                    fileup.SaveAs(Server.MapPath("~/resources/") + Path.GetFileName(name + extension));
                    String file = "resources/" + Path.GetFileName(name + extension);

                    if (sqlCon.State == System.Data.ConnectionState.Closed)
                     {
                         sqlCon.Open();
                     }
                    SqlCommand cmd = new SqlCommand("INSERT INTO resources (Name,Department,Location) values(@name,@dept,@loc)", sqlCon);
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@dept", dept);
                    cmd.Parameters.AddWithValue("@loc", file);
                    cmd.ExecuteNonQuery();
                    sqlCon.Close();
                    subnameadd.Text = "";
                    deptadd.Text = "";
                    name = "";
                    dept = "";
                    Response.Redirect(Request.Url.AbsoluteUri);
                    
                }
                catch (Exception)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Select a pdf')", true);
                }

            }
        }
        protected void deletefile_Click(object sender, EventArgs e)
        {
            string name = subnamedel.Text.Trim().ToUpper();
            String loc = "";
            try
            {
                if (sqlCon.State == System.Data.ConnectionState.Closed)
                {
                    sqlCon.Open();
                }
                SqlCommand sqlcmd = new SqlCommand("SELECT Location FROM resources WHERE Name = '" + name + "'", sqlCon);
                SqlDataReader da = sqlcmd.ExecuteReader();
                while (da.Read())
                {
                    loc = da.GetValue(0).ToString();
                }
                da.Close();
                sqlcmd = new SqlCommand("DELETE FROM resources WHERE Name = '"+name+"'", sqlCon);
                sqlcmd.ExecuteNonQuery();
                loc = Server.MapPath("~/"+loc);
                if (System.IO.File.Exists(loc))
                {
                System.IO.File.Delete(loc);
                }
                
                subnamedel.Text = "";
                name = "";
                loc = "";
                Response.Redirect(Request.Url.AbsoluteUri);
                sqlCon.Close();
            }
            catch(Exception)
            {
               ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Not Found!!')", true);
            }
            
        }
        protected void view()
        {
            sqlCon.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM resources order by Name", sqlCon);
            sda.SelectCommand = cmd;
            sda.Fill(ds, "resources");
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