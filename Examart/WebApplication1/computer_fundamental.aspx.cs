using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class computer_fundamental : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["page"] = "~/computer_fundamental.aspx";
            if (Session["user"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
        }
    }
}