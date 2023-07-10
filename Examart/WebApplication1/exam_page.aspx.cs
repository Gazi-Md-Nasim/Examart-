using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class exam_page : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-SC7TE2P\SQLEXPRESS;Initial Catalog=LogInSystem;Integrated Security=true");
        double result = 0;
        String[] ans = {"Proton","3","Polycrystalline","Material","Arractive forces"};
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["page"] = "~/exam_page.aspx";
            if (Session["user"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            if (!IsPostBack)
            {
                Ques1.Text = "1. The example of matter is _________.";
                Ques2.Text = "2. How many types of matters?";
                Ques3.Text = "3. Order in ____________ solids is limited to few molecular distances.";
                Ques4.Text = "4. Substance which can’t be broken down any further by chemical methods into a simpler substance is?";
                Ques5.Text = "5. Which of the following force keep the atoms together?";
                Option1.RepeatLayout = RepeatLayout.Table;
                Option2.RepeatLayout = RepeatLayout.Table;
                Option3.RepeatLayout = RepeatLayout.Table;
                Option4.RepeatLayout = RepeatLayout.Table;
                Option5.RepeatLayout = RepeatLayout.Table;
                Label6.Text = "The Script will be automatically submitted after 1 minute.";
                Label1.Visible = false;
                Label2.Visible = false;
                Label3.Visible = false;
                Label4.Visible = false;
                Label5.Visible = false;
                grades.Visible = false;
                passFail.Visible = false;
                LinkButton2.Visible = false;
            }
            script(true);
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
               answerChecker();            
        }

        protected void script(bool b)
        {
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "startCountdown(0,1,00)", b);
        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/exam_page.aspx");
        }
        protected void answerChecker()
        {
            Message.Text = ""; 
            int count = 0;
            String status = "";
            Label6.Visible = false;
            Option1.Visible = false;
            Option2.Visible = false;
            Option3.Visible = false;
            Option4.Visible = false;
            Option5.Visible = false;

            Label1.Visible = true;
            Label2.Visible = true;
            Label3.Visible = true;
            Label4.Visible = true;
            Label5.Visible = true;

            Button1.Visible = false;

            grades.Visible = true;
            passFail.Visible = true;
            Label7.Visible = false;
            script(false);

            RadioButtonList[] selected = { Option1, Option2, Option3, Option4, Option5};
            Label[] label = { Label1, Label2, Label3, Label4, Label5 };
            String[] a = nullRemover(selected);
           
            for(int i=0; i<selected.Length; i++)
            {
                if(selected[i].SelectedIndex>-1 && a[i].Equals(ans[i].ToLower()))
                {
                    label[i].Text = "<p style='color:Green'>Right</p>";
                    count++;
                }
                else
                {
                    label[i].Text = "<p style='color:red'>Wrong</p>";
                }
            }

            result = ((double)count / (double)selected.Length) * 100;
            if (result >= 80)
            {
                grades.Text = "Grades: " + Math.Round(result) + "%";
                passFail.Text = "<p style='color:green'>Passed</p>";
                status = "Passed";
            }
            else
            {
                grades.Text = "<p style='color:red'>Grades: " + result + "%</p>";
                passFail.Text = "<p style='color:red'>Failed</p>";
                status = "Failed";
                LinkButton2.Visible = true;
            }

            String id = Session["user"].ToString();
            String record = "";
            if (sqlCon.State == System.Data.ConnectionState.Closed)
            {
                sqlCon.Open();
            }
            SqlCommand sqlcmd = new SqlCommand("SELECT Marks FROM user" + id + " WHERE ExamName='" + ExamName.Text + "'", sqlCon);//Select from user db
            SqlDataReader da = sqlcmd.ExecuteReader();
            while (da.Read())
            {
                record = da.GetValue(0).ToString();

            }
            da.Close();
            if (!record.Equals("") && Convert.ToInt32(record.Trim()) < result)
            {
                sqlcmd = new SqlCommand("UPDATE user" + id + " SET Marks='" + result.ToString() + "', Status='" + status + "' WHERE ExamName='" + ExamName.Text + "'", sqlCon);
                sqlcmd.ExecuteNonQuery();
            }
            else if (record.Equals(""))
            {
                sqlcmd = new SqlCommand("INSERT INTO user" + id + " (ExamName,Marks,Status) values('" + ExamName.Text + "','" + result.ToString() + "','" + status + "')", sqlCon);
                sqlcmd.ExecuteNonQuery();
            }
            sqlCon.Close();
        }

        protected String[] nullRemover(RadioButtonList[] selected)
        {
            String[] str = new String[selected.Length];
            for(int i=0;i<selected.Length;i++)
            {
                if(selected[i].SelectedIndex>-1)
                {
                    str[i] = selected[i].SelectedItem.Text.ToLower();
                }
                else
                {
                    str[i] = "";
                }
            }
            return str;
        }
    }
}