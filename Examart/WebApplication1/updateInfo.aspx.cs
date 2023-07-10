using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class updateInfo : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-SC7TE2P\SQLEXPRESS;Initial Catalog=LogInSystem;Integrated Security=true");
        String id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user"]==null)
            {
                Response.Redirect("~/login.aspx");
            }
            else
            {
                id = Session["user"].ToString();
            }
            if (!IsPostBack)
            {
                nameBox.Text = "";
                nameBox.Visible = false;
                btnChangeName.Visible = false;
                passBox.Text = "";
                newPassBox.Text = "";
                reNewPassBox.Text = "";
                deptbox.Text = "";
                varsitybox.Text = "";
                adrsbox.Text = "";
                deptbox.Visible = false;
                varsitybox.Visible = false;
                adrsbox.Visible = false;
                passBox.Visible = false;
                newPassBox.Visible = false;
                reNewPassBox.Visible = false;
                btnChangePass.Visible = false;
                deptchangebtn.Visible = false;
                varsitychangebtn.Visible = false;
                adrschangebtn.Visible = false;
            }

        }


        protected void btnPass_Click(object sender, EventArgs e)
        {
            passBox.Visible = true;
            newPassBox.Visible = true;
            reNewPassBox.Visible = true;
            btnChangePass.Visible = true;
        }

        protected void btnChangeName_Click(object sender, EventArgs e)
        {
            String newName = nameBox.Text.Trim(); ;
            if (!newName.Equals(""))
            {
                updater("Name",newName);
                message.Text = "Name is Updated";
            }
            else
            {
                message.Text = "Empty Name box";
            }
        }

        protected void btnChangePass_Click(object sender, EventArgs e)
        {
            String pass = passBox.Text.Trim();
            String newPass = newPassBox.Text.Trim();
            String rePass = reNewPassBox.Text.Trim();
            String realPass = "";
            if (sqlCon.State == System.Data.ConnectionState.Closed)
            {
                sqlCon.Open();
            }
            SqlCommand sqlcmd = new SqlCommand("SELECT Password FROM UserRecord WHERE LogInID = '" + id + "'", sqlCon);//LogInCheck
            SqlDataReader da = sqlcmd.ExecuteReader();
            while (da.Read())
            {
                realPass = da.GetValue(0).ToString();
            }
            sqlCon.Close();
            if(pass.Equals(realPass))
            {
                if(newPass.Equals("") || rePass.Equals("") || (!newPass.Equals(rePass)))
                {
                    message.Text = "New passWord boxes cannot be empty or Passwords should be same";
                }
                else
                {
                    updater("Password",newPass);
                    message.Text = "Password is Updated";
                }
            }
            else
            {
                message.Text = "Incorrect Password";
            }
        }

        protected void btnName_Click(object sender, EventArgs e)
        {
            nameBox.Visible = true;
            btnChangeName.Visible = true;
        }

        protected void btnDept_Click(object sender, EventArgs e)
        {
            deptbox.Visible = true;
            deptchangebtn.Visible = true;
        }

        protected void btnVarsity_Click(object sender, EventArgs e)
        {
            varsitybox.Visible = true;
            varsitychangebtn.Visible = true;
        }

        protected void btnAdrs_Click(object sender, EventArgs e)
        {
            adrsbox.Visible = true;
            adrschangebtn.Visible = true;
        }
        protected void updater(String name, String value)
        {
            if (sqlCon.State == System.Data.ConnectionState.Closed)
            {
                sqlCon.Open();
            }
            SqlCommand sqlcmd1 = new SqlCommand("UPDATE UserRecord SET "+name+"='" + value + "' WHERE LogInID = '" + id + "'", sqlCon);
            sqlcmd1.ExecuteNonQuery();
            sqlCon.Close();
        }

        protected void btnChangeDept_Click(object sender, EventArgs e)
        {
            String newDept= deptbox.Text.Trim();
            if (!newDept.Equals(""))
            {
                updater("DEpartment",newDept);
                message.Text = "Department Updated";
            }
            else
            {
                message.Text = "Empty Department box";
            }
        }

        protected void btnChangevarsity_Click(object sender, EventArgs e)
        {
            String newvarsity = varsitybox.Text.Trim();
            if (!newvarsity.Equals(""))
            {
                updater("University",newvarsity);
                message.Text = "University Updated";
            }
            else
            {
                message.Text = "Empty University box";
            }
        }

        protected void btnChangeAdrs_Click(object sender, EventArgs e)
        {
            String newadrs = adrsbox.Text.Trim();
            if (!newadrs.Equals(""))
            {
                updater("Address",newadrs);
                message.Text = "Address Updated";
            }
            else
            {
                message.Text = "Empty Address box";
            }
        }
    }
}