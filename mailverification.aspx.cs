using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class mailverification : System.Web.UI.Page
{
    String usr = "";
    Connection co = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        String a=Request.QueryString["new"];
        if ((Session["usrid"] != "" && Session["usrid"]!=null) || a == "true")
        {
            if ((Session["usrid"] == "" || Session["usrid"] == null) && a == "true")
            {
                Label1.Text = "Reset Your Password";
            }
            if (Session["usrid"] != "" && Session["usrid"] != null && a != "true")
            {
                usr = Session["usrid"].ToString();
                String status = "";
                pnlotp.Visible = true;
                btnotp.Text = "Verify";
                txtbemail.ReadOnly = true;
                String stt = "select veri,email from tblusr where id=" + usr;
                co.connect();
                SqlCommand cmd = new SqlCommand(stt, co.con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txtbemail.Text = co.decode(dr[1].ToString());
                        status = dr[0].ToString();
                    }
                }
                co.disconnect();
                if (status == "true")
                    Response.Redirect("index.aspx");
            }
            if (Request.QueryString["new"] == "true" && Session["usrid"] != "" && Session["usrid"] != null)
            {
                Response.Redirect("usrsetting.aspx");
            }

        }
        else
            Response.Redirect("login.aspx");
        lblmsg.Text = "";
    }
    protected void btnotp_Click(object sender, EventArgs e)
    {
        if (btnotp.Text == "Send OTP")
        {
            mailchk();
        }

        else if (btnotp.Text == "Verify")
        {
            if (vali())
            {
                if (Session["usrid"] == null || Session["usrid"] == "")
                {
                    btnotp.Text = "Update";
                    pnlpass.Visible = true;
                }
                else
                {
                    String stt = "update tblusr set veri='true' where id='" + Session["usrid"] + "';";
                    co.connect();
                    SqlCommand cmd = new SqlCommand(stt, co.con);
                    int result = cmd.ExecuteNonQuery();
                    pnlotp.Visible = true;
                    LinkButton1.Visible = false;
                    co.disconnect();
                    pnlpass.Visible = pnlpass.Visible = false;
                    Session["msg"] ="Account Verified Succesfully";
                    Response.Redirect("index.aspx");
                }
            }
            else
            {
                lblmsg.Text = "Incorrect OTP";
            }
        }
        else if(Session["usrid"]==null||Session["usrid"]=="")
        {
            chngpass();
        }

    }
    protected bool vali()
    {
        String email = txtbemail.Text.ToString();
        String stt = "select * from tblemail where email=N'" + co.encode(email) + "' and vcode=N'"+co.encode(txtbotp.Text.ToString())+"'";
        co.connect();
        SqlCommand cmd = new SqlCommand(stt, co.con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            co.disconnect();
            return true;
        }
        else
        {
            co.disconnect();
            return false;
        }
    }
    protected void chngpass()
    {
        String stt = "update tblusr set pass=N'" + co.encode(txtbpass.Text.ToString()) + "' where email=N'" + co.encode(txtbemail.Text.ToString()) + "';";
        co.connect();
        SqlCommand cmd = new SqlCommand(stt, co.con);
        int result = cmd.ExecuteNonQuery();
        pnlotp.Visible = true;
        co.disconnect();
        lblmsg.Text = "";
        pnlpass.Visible = pnlotp.Visible = false;
        Session["msg"] = "Password Updated Succesfully";
        Response.Redirect("login.aspx");
    }
    protected void mailchk()
    {
        String otp = co.otp();
        String id="";
        String email = txtbemail.Text;
        if(Request.QueryString["new"]!="true")
        id = Session["usrid"].ToString();
        String stt = "select * from tblusr where email=N'" + co.encode(email) + "' and id ='" + id + "'";
        if(Request.QueryString["new"]=="true")
        stt = "select * from tblusr where email=N'" + co.encode(email) + "'";
        co.connect();
        SqlCommand cmd = new SqlCommand(stt, co.con);
        SqlDataReader dr = cmd.ExecuteReader();
        bool a=false;
        if (dr.HasRows)
            a=true;
        co.disconnect();
        
        if(a==true)
        {
            stt = "update tblemail set vcode=N'" + co.encode(otp) + "' where email=N'" + co.encode(txtbemail.Text.ToString()) +"';";
            co.connect();
            cmd = new SqlCommand(stt, co.con);
            int result = cmd.ExecuteNonQuery();
            pnlotp.Visible = true;
            co.sendmail(email, "Your One Time Password is\n" + otp + "\n\nEDUCATION POINT PROVIDE YOU Syllabus, Previous Year Papers and Notes,\nWelcome To Our Expending Family", "Email Verification | EduPoint");
            co.disconnect();
            btnotp.Text = "Verify";
        }
        else
        {
            pnlotp.Visible = false;
            if (Request.QueryString["new"] == "true")
                lblmsg.Text = "Email Not Found";
            else
                lblmsg.Text = "This Email Address Is Not Link With Your Account";
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        String otp = co.otp();
        String id = "";
        String email = txtbemail.Text;
        if (Request.QueryString["new"] != "true")
            id = Session["usrid"].ToString();
        String stt = "select * from tblusr where email=N'" + co.encode(email) + "' and id ='" + id + "'";
        if (Request.QueryString["new"] == "true")
            stt = "select * from tblusr where email=N'" + co.encode(email) + "'";
        co.connect();
        SqlCommand cmd = new SqlCommand(stt, co.con);
        SqlDataReader dr = cmd.ExecuteReader();
        bool a = false;
        if (dr.HasRows)
            a = true;
        co.disconnect();

        if (a == true)
        {
            stt = "update tblemail set vcode=N'" + co.encode(otp) + "' where email=N'" + co.encode(txtbemail.Text.ToString()) + "';";
            co.connect();
            cmd = new SqlCommand(stt, co.con);
            int result = cmd.ExecuteNonQuery();
            pnlotp.Visible = true;
            co.sendmail(email, "Your One Time Password is\n" + otp + "\n\nEDUCATION POINT PROVIDE YOU Syllabus, Previous Year Papers and Notes,\nWelcome To Our Expending Family", "Email Verification | EduPoint");
            co.disconnect();
            lblmsg.Text = "Email Sent To " + txtbemail.Text.ToString();
        }
        else
        {
            if (Request.QueryString["new"] == "true")
                lblmsg.Text = "Email Not Registered With US";
            else
                lblmsg.Text = "This Email Address Is Not Link With Your Account";
        }
    }
}