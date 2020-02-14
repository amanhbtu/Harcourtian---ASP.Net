using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class MasterPage : System.Web.UI.MasterPage
{
    Connection co = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usrid"] != null && Session["usrid"].ToString() != "")
        {
            pnlusr.Visible = true;
            pnlbtn.Visible = false;
            pnlbtnreg.Visible = false;
            String stt = "select usr,veri,email from tblusr where id='" + Session["usrid"].ToString() + "'";
            co.connect();
            SqlCommand cmd = new SqlCommand(stt, co.con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lblusr.Text = co.decode(dr[0].ToString());
                }
            }
            co.disconnect();
        }
        else
        {
            pnlusr.Visible = false;
            pnlbtn.Visible = true;
            pnlbtnreg.Visible = true;
        }
    }
    protected void lnkbtnset_Click(object sender, EventArgs e)
    {
        Response.Redirect("usrsetting.aspx");
    }
    protected void lnkbtnlogout_Click(object sender, EventArgs e)
    {
        Session["usrid"] = "";
        pnlusr.Visible = false;
        pnlbtn.Visible = true;
        Response.Redirect("login.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (txtbs.Text.Trim() != "Search" &&txtbs.Text.Trim()!="")
            Response.Redirect("search.aspx?s=" + txtbs.Text.ToString());
    }
}
