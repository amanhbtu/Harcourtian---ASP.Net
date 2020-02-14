using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["msg"] != null && Session["msg"] != "")
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + Session["msg"] + "');", true);
            Session["msg"] = "";
        }
    }
}