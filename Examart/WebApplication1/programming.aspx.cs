using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class programming : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["page"] = "~/programming.aspx";
            if (Session["user"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            
        }
    }
}