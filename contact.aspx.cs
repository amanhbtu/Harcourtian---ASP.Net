using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

public partial class contact : System.Web.UI.Page
{
    Connection co = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btncont_Click(object sender, EventArgs e)
    {
        if (chck()==0)
        {
            int userid = 0;
            if (Session["usrid"] != null && Session["usrid"].ToString() != "")
                userid=Convert.ToInt32(Session["usrid"]);
            String name = txtbusr.Text.Trim().ToUpper().ToString();
            String email = txtbemail.Text.Trim().ToString().ToLower();
            String mob = txtbcont.Text.Trim().ToString();
            String msg = txtbmsg.Text.Trim().ToString();
            String stt;
            if (userid > 0)
            {
                stt = "insert into tblqury(usrid,usr,email,cont,msg,m_read) values(" + userid + ",'" + name + "','" + email + "','" + mob + "','" + msg + "','unread');";
            }
            else
            {
                stt = "insert into tblqury(usrid,usr,email,cont,msg,m_read) values('0','" + name + "','" + email + "','" + mob + "','" + msg + "','unread');";
            }
            co.connect();
            SqlCommand cmd = new SqlCommand(stt, co.con);
            int result = cmd.ExecuteNonQuery();
            co.disconnect();
            if (result > 0)
            {
                lblmsg.ForeColor = Color.Blue;
                stt = "select top 1 id from tblqury where cont='"+txtbcont.Text.Trim()+"' and email='" + txtbemail.Text.ToString().Trim().ToLower() + "' and usr='" + txtbusr.Text.ToString().Trim() + "' order by id desc";
                co.connect();
                cmd = new SqlCommand(stt, co.con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                    }
                }
                co.disconnect();
                co.sendmail(txtbemail.Text.Trim(),"We get your message to us we will soon contact with you as soon as possible.\nThank You\nTeam Harcourtians","Harcourtian-Contact Us");
                lblmsg.Text = "Mail Sent Succesfully To Us We Soon Response To Your Mail";
            }
            else
            {
                lblmsg.ForeColor = Color.Red;
                lblmsg.Text = "Mail Not Sent Succesfully To Us";
            }
            txtbemail.Text = "Enter Your Email";
            txtbmsg.Text = "Message";
            txtbusr.Text = "Enter Your Name";
            txtbcont.Text = "Enter Your Contact Number";
        }
    }
   protected int chck()
    {
        int count = 0;
        if (txtbusr.Text == "Enter Your Name" || txtbusr.Text == "")
        {
            lblmsg.Text = "Please Enter Your Name, ";
            count++;
        }
        if (txtbemail.Text == "Enter Your Email" || txtbusr.Text == "")
        {
            lblmsg.Text =lblmsg.Text+"Please Enter Your Email Address, ";
            count++;
        }
        if (txtbusr.Text == lblmsg.Text + "Message" || txtbusr.Text == "")
        {
            lblmsg.Text = lblmsg.Text + "There Must Be a Message, ";
            count++;
        }
        if (txtbmsg.Text.Length > 100)
        {
            lblmsg.Text = "Message Size Should Be Maximum 100 Characters";
            count++;
        }
        return count;
    }

}