using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;


public partial class regitration : System.Web.UI.Page
{
    Connection co = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            caldob.Visible = false;
            SetFocus(txtbfname);
        }
    }
    protected void btnreg_Click(object sender, EventArgs e)
    {
        if (chck() == 0)
        {
            String name = txtbfname.Text.Trim().ToUpper().ToString();
            if(txtblname.Text!="LAST NAME")
                name=name+" "+ txtblname.Text.Trim().ToUpper().ToString();
            String email = txtbemail.Text.Trim().ToString();
            String mob = co.encode(txtbcont.Text.Trim().ToString());
            String pass = co.encode(txtbpass.Text.Trim().ToString());
            String dob = co.encode(txtbdob.Text.ToString());
            String stt;
            stt = "insert into tblusr(usr,dob,email,cont,pass,veri) values (N'" + co.encode(name) + "',N'" + dob + "',N'" + co.encode(email) + "',N'" + mob + "',N'" + pass + "','false')";
            co.connect();
            SqlCommand cmd = new SqlCommand(stt, co.con);
            int result = cmd.ExecuteNonQuery();
            co.disconnect();
            if (result > 0)
            {
                verification(email);
                Session["new"] = "true";
                Response.Redirect("login.aspx?usr="+email);
            }
            else
            {
                lblmsg.ForeColor = Color.Red;
                lblmsg.Text = "Something Goes Wrong";
            }
        }
    }
    protected int chck()
    {
        int count = 0;
        if ((txtblname.Text == "Last Name" || txtblname.Text == "") && (txtbfname.Text == "First Name" || txtbfname.Text == ""))
        {
            lblmsg.Text = "</br/>Complete Name Required, ";
            count++;
        }
        if (txtbemail.Text == "Email Address" || txtbemail.Text == "")
        {
            lblmsg.Text = lblmsg.Text + "</br/>Email Address Required ";
            count++;
        }

        if (txtbdob.Text != ""&&txtbdob.Text != null)
        {
            try {
                string date = txtbdob.Text.ToString();
                string[] dates = date.Split('/');
                DateTime year = DateTime.Parse(string.Format("{0}/{1}/{2}", dates[1], dates[0], dates[2]));
                if (year.Year > 2010)
                {
                    lblmsg.Text = lblmsg.Text + "</br/>Invalid Date of Birth ";
                    count++;
                }
            }
            catch
            {
                lblmsg.Text = lblmsg.Text + "</br/>Date of Birth Must be in dd/mm/yyyy";
            }
            
        }
        else
        {
            lblmsg.Text = lblmsg.Text + "</br/>Invalid Date of Birth ";
            count++;
        }

        if (txtbemail.Text == "Mobile Number" || txtbemail.Text == "")
        {
            lblmsg.Text = lblmsg.Text + "</br/>Mobile Number Required ";
            count++;
        }
        if (txtbpass.Text == "Password" || txtbpass.Text == "")
        {
            lblmsg.Text = lblmsg.Text + "</br/>Password Required ";
            count++;
        }

        String stt = "select * from tblusr where email=N'"+co.encode(txtbemail.Text)+"'";
        co.connect();
        SqlCommand cmd = new SqlCommand(stt, co.con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('This Email Id is Already Registered With Us Please Login To Continue or Click Forget Password');", true);
            lblmsg.Text = "<br/>This Email Id is Already Registered With Us Please Login To Continue or Click Forget Password";
            count++;
        }
        co.disconnect();
       return count;
    }
    protected void verification(String email)
    {
        String otp = co.otp();
        String stt = "insert into tblemail(email,vcode) values(N'" + co.encode(email) + "',N'" + co.encode(otp) + "');";
        co.connect();
        SqlCommand cmd = new SqlCommand(stt, co.con);
        int result = cmd.ExecuteNonQuery();
        co.disconnect();
        co.sendmail(email, "Your One Time Password is\n" + otp + "\n\nEDUCATION POINT PROVIDE YOU Syllabus, Previous Year Papers and Notes,\nWelcome To Our Expending Family", "Verification Needed");
                
    }

    protected void caldob_SelectionChanged(object sender, EventArgs e)
    {
        txtbdob.Text = co.mmdd2ddmm(caldob.SelectedDate.ToShortDateString());
        caldob.Visible = false;
        opencal.Visible = true;
    }
    protected void opencal_Click(object sender, EventArgs e)
    {
        caldob.Visible = true;
        opencal.Visible = false;
    }
}