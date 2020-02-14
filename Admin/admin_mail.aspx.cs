using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_admin_mail : System.Web.UI.Page
{
    public Connection co = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        showdata();
    }
    protected void showdata()
    {
        showmsg();
        showdeletemsg();
        showunreadmsg();
        showsentmsg();
        det();
    }
    protected void showmsg()
    {
        co.connect();
        String stt = "select id,usr,LEFT(msg,50) as msg,email,m_read,datetime from tblqury where m_read!='delete' and m_read!='deleted' and m_read!='sent' order by datetime desc";
        SqlDataAdapter da = new SqlDataAdapter(stt, co.con);
        DataSet ds = new DataSet();
        da.Fill(ds, "study_world");
        repeaterinbox.DataSource = ds.Tables[0].DefaultView;
        repeaterinbox.DataBind();
        co.disconnect();
    }
    protected void showsentmsg()
    {
        co.connect();
        String stt = "select id,usr,LEFT(msg,50) as msg,email,m_read,datetime from tblqury where m_read='sent' order by datetime desc";
        SqlDataAdapter da = new SqlDataAdapter(stt, co.con);
        DataSet ds = new DataSet();
        da.Fill(ds, "study_world");
        repeatersent.DataSource = ds.Tables[0].DefaultView;
        repeatersent.DataBind();
        co.disconnect();
    }
    protected void repeatersent_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "delete_sentmail") //breakpoint on this line
        {
            int mid = Convert.ToInt32(e.CommandArgument);
            co.connect();
            String stt = "update tblqury set m_read='delete' where id='" + mid + "'";
            SqlCommand cmd = new SqlCommand(stt, co.con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                }
            }
        }
        co.disconnect();
        showdata();
    }
    protected void det()
    {
        int a = 0;
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
            lblunreadmsg.Text = a.ToString();
        co.disconnect();
    }
    protected void repeaterinbox_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "delete_inboxmail") //breakpoint on this line
        {
            int mid = Convert.ToInt32(e.CommandArgument);
            co.connect();
            String stt = "update tblqury set m_read='delete' where id='" + mid + "'";
            SqlCommand cmd = new SqlCommand(stt, co.con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                }
            }
        }
        co.disconnect();
        showdata();
    }
    protected void btn_send_mail_Click(object sender, EventArgs e)
    {
        String email = txtbemail.Text.ToString().Trim().ToLower();
        String sub = txtbsubject.Text.ToString().Trim();
        String msg = txtbmsg.Text.ToString().Trim()+"\nTeam Harcourtian\n"+DateTime.Now.Date;
        co.sendmail(email, msg, sub);
        txtbemail.Text = "Email Address"; txtbmsg.Text = "Message..."; txtbsubject.Text = "Subject";
        String stt = "insert into tblqury(usrid,usr,email,cont,msg,m_read) values('Admin','Harcourtian','" + email + "','9044443341','" + msg + "','sent');";
        co.connect();
        SqlCommand cmd = new SqlCommand(stt, co.con);
        int result = cmd.ExecuteNonQuery();
        co.disconnect();
    }
    protected void showdeletemsg()
    {
        co.connect();
        String stt = "select id,usr,LEFT(msg,50) as msg,email,m_read,datetime from tblqury where m_read='delete'  order by datetime desc";
        SqlDataAdapter da = new SqlDataAdapter(stt, co.con);
        DataSet ds = new DataSet();
        da.Fill(ds, "study_world");
        repeaterdelete.DataSource = ds.Tables[0].DefaultView;
        repeaterdelete.DataBind();
        co.disconnect();
    }
    protected void repeaterdelete_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "delete_deletemail") //breakpoint on this line
        {
            int mid = Convert.ToInt32(e.CommandArgument);
            co.connect();
            String stt = "update tblqury set m_read='deleted' where id='" + mid + "'";
            SqlCommand cmd = new SqlCommand(stt, co.con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                }
            }
            co.disconnect();
            showdata();
        }
        if (e.CommandName == "restore_deletemail") //breakpoint on this line
        {
            int mid = Convert.ToInt32(e.CommandArgument);
            co.connect();
            String stt = "update tblqury set m_read='read' where id='" + mid + "'";
            SqlCommand cmd = new SqlCommand(stt, co.con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                }
            }
            co.disconnect();
            showdata();
        }
    }
    protected void showunreadmsg()
    {
        co.connect();
        String stt = "select id,usr,LEFT(msg,50) as msg,email,m_read,datetime from tblqury where m_read='unread' order by datetime desc";
        SqlDataAdapter da = new SqlDataAdapter(stt, co.con);
        DataSet ds = new DataSet();
        da.Fill(ds, "study_world");
        repeaterunread.DataSource = ds.Tables[0].DefaultView;
        repeaterunread.DataBind();
        co.disconnect();
    }
    protected void repeaterunread_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "delete_unreadmail") //breakpoint on this line
        {
            int mid = Convert.ToInt32(e.CommandArgument);
            co.connect();
            String stt = "update tblqury set m_read='delete' where id='" + mid+"'";
            SqlCommand cmd = new SqlCommand(stt, co.con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                }
            }
        }
        co.disconnect();
        showdata();
    }
}