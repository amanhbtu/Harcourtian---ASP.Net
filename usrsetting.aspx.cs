using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class usrsetting : System.Web.UI.Page
{
    String usr;
    Connection co = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usrid"] != "" && Session["usrid"] != null)
        {
            usr = Session["usrid"].ToString();
        }
        else
            Response.Redirect("login.aspx?r=usrsetting.aspx");
        if (!IsPostBack)
        {
            txtbcont.ForeColor = txtbdob.ForeColor = txtbfname.ForeColor= txtbemail.ForeColor = System.Drawing.Color.Black;
            txtbcont.BorderColor = txtbdob.BorderColor = txtbfname.BorderColor = System.Drawing.Color.White;
            usrdet();
        }
    }
    protected void btnedit_Click(object sender, EventArgs e)
    {
        if (txtbfname.Text != "" && txtbcont.Text != "" && txtbdob.Text != "")
        {
            if (btnedit.Text == "Edit")
            {
                lblmsg.Text = "";
                txtbcpass.Text = "";
                panelpass.Visible = false;
                txtbcont.ReadOnly = false;
                txtbdob.ReadOnly = false;
                txtbfname.ReadOnly = false;
                RegularExpressionValidator2.Enabled = true;
                txtbcont.BorderColor = txtbdob.BorderColor = txtbfname.BorderColor = System.Drawing.Color.Black;
                btnedit.Text = "Update";
                LinkButton1.Visible = true;
            }
            else
            {
                txtbcont.ReadOnly = true;
                txtbdob.ReadOnly = true;
                txtbfname.ReadOnly = true;
                RegularExpressionValidator2.Enabled = false;
                txtbcont.BorderColor = txtbdob.BorderColor = txtbfname.BorderColor = System.Drawing.Color.White;
                btnedit.Text = "Edit";
                String stt = "update tblusr set usr=N'" + co.encode(txtbfname.Text.ToString().ToUpper()) + "',dob=N'" + co.encode(Convert.ToDateTime(txtbdob.Text).ToShortDateString()) + "',cont=N'" + co.encode(txtbcont.Text.ToString()) + "' where id='" + usr + "'";
                co.connect();
                SqlCommand cmd = new SqlCommand(stt, co.con);
                int result = cmd.ExecuteNonQuery();
                co.disconnect();
                if (result > 0)
                {
                    usrdet();
                    lblmsg.Text = "Details Updated Succesfully";
                }
                else
                {
                    lblmsg.Text = "Details Not Updated Succesfully";
                }
            }
        }
        else
        {
            SetFocus(txtbfname);
            lblmsg.Text = "All Field Required";
        }
    }
    
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        txtbcont.ReadOnly = true;
        txtbdob.ReadOnly = true;
        txtbfname.ReadOnly = true;
        RegularExpressionValidator2.Enabled = false;
        txtbcont.BorderColor = txtbdob.BorderColor = txtbfname.BorderColor = System.Drawing.Color.White;
        btnedit.Text = "Edit";
        panelpass.Visible = true;
        LinkButton1.Visible = false;
        lblmsg.Text = "";
    }
    protected void usrdet()
    {
        String stt = "select * from tblusr where id='" + usr + "'";
        co.connect();
        SqlCommand cmd = new SqlCommand(stt, co.con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                txtbfname.Text = co.decode(dr[1].ToString());
                txtbdob.ReadOnly = true;
                txtbdob.Text = co.decode(dr[2].ToString());
                txtbemail.Text = co.decode(dr[4].ToString());
                if (dr["veri"].ToString() == "true")
                {
                    lnkbtnveri.Visible = false;
                    txtbemail.Text += " (Verfied)";
                }
                else
                {
                    btnedit.Visible = false;
                    btnreg.Visible = false;
                    LinkButton1.Visible = false;
                    lnkbtnveri.Visible = true;
                    txtbemail.Text += " (Unverfied)";
                } txtbcont.Text = co.decode(dr[5].ToString());
            }
        }
        co.disconnect();
    }
    protected void btnreg_Click(object sender, EventArgs e)
    {
        if (txtbpass.Text != "" && txtbcpass.Text != "")
        {
            String pass = "";
            String stt = "select pass from tblusr where id='" + usr + "'";
            co.connect();
            SqlCommand cmd = new SqlCommand(stt, co.con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    pass = dr["pass"].ToString();
                }
            }
            co.disconnect();

            if (txtbcpass.Text == co.decode(pass))
            {
                stt = "update tblusr set pass=N'" + co.encode(txtbpass.Text.ToString()) + "' where id='" + usr + "'";
                co.connect();
                cmd = new SqlCommand(stt, co.con);
                int result = cmd.ExecuteNonQuery();
                co.disconnect();
                if (result > 0)
                {
                    lblmsg.Text = "Password Updated Succesfully";
                    LinkButton1.Visible = true;
                    panelpass.Visible = false;
                }
                else
                {
                    lblmsg.Text = "Password Not Updated Succesfully";
                }
            }
            else
            {
                lblmsg.Text = "Current Password Do Not Match";
            }
        }
        else
        {
            lblmsg.Text = "Password Field Are Required";
        }
    }
        
}