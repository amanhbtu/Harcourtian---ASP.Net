using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_MasterPageAdmin : System.Web.UI.MasterPage
{
    public Connection co = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usrname"] == null || Session["usrname"] == "")
        {
            Response.Redirect("admin_login.aspx");
        }
        Det();
        msgdet();
    }
    protected void btnlogout_Click(object sender, EventArgs e)
    {
        Session["usrname"] = "";
        Response.Redirect("admin_login.aspx");
    }
    protected void Det()
    {
        int a=0;
        co.connect();
            String stt = "select m_read from tblqury where m_read='unread'";
            SqlCommand cmd = new SqlCommand(stt, co.con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    a++;
                }
            }
            lblnewmsg.Text = a.ToString();
        co.disconnect();
    }
    protected void msgdet()
    {
        co.connect();
        String stt = "select * from tblqury where m_read='unread' order by datetime desc";
        SqlDataAdapter da = new SqlDataAdapter(stt, co.con);
        DataSet ds = new DataSet();
        da.Fill(ds, "harcourt");
        repeatermsg.DataSource = ds.Tables[0].DefaultView;
        repeatermsg.DataBind();
        co.disconnect();
    }
}
