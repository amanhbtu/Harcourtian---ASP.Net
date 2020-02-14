using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.IO;
using System.Net.Mail;

public partial class login : System.Web.UI.Page
{
    Connection co = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usrid"] != null && Session["usrid"] != "")
        {
            String r = Request.QueryString["r"];
            if (r != "" && r != null)
                Response.Redirect(r);
            else
                Response.Redirect("index.aspx");
        }
        if (Session["msg"] != null && Session["msg"] != "")
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + Session["msg"] + "');", true);
            Session["msg"] = "";
        }
        String q = Request.QueryString["usr"];
        if (q != null && q != "")
        {
            txtbusr.Text = q;
            if(Session["new"]=="true")
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Please Check Your Inbox To Verify Your Email');", true);
            Session["new"] = false;
        }
        if (!IsPostBack)
        {
            SetFocus(txtbusr);
        }
    }
    protected void btnlog_Click(object sender, EventArgs e)
    {
        String usr = txtbusr.Text;
        String pass = txtbpass.Text;
        String mail = "";
        String status = "";
        String stt = "select id,email,veri from tblusr where email=N'" + co.encode(usr) + "' and pass =N'"+co.encode(pass)+"'";
        co.connect();
        SqlCommand cmd = new SqlCommand(stt, co.con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                Session["usrid"] = dr[0].ToString();
                mail = co.decode(dr[1].ToString());
                status = dr[2].ToString();
            }
            if (status == "true")
            {
                String r=Request.QueryString["r"];
                if (r != "" && r != null)
                    Response.Redirect(r);
                else
                    Response.Redirect("index.aspx");
            }
            else
                Response.Redirect("mailverification.aspx?mail=" + mail);
        }
        else
            lblmsg.Text = "Incorrect Email or Password";
        co.disconnect();
    }
    
}