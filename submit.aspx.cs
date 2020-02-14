using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Windows.Forms;

public partial class submit : System.Web.UI.Page
{
    Connection co = new Connection();
    String usr;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usrid"] != "" && Session["usrid"] != null)
        {
            usr = Session["usrid"].ToString();
        }
        else
            Response.Redirect("login.aspx?r=submit.aspx");

        if (!IsPostBack)
        {
            SetFocus(dropd_search_type);
            int i;
            for (i = 1; i <= 8; i++)
                dropd_search_sem.Items.Add(i.ToString());
            String stt = "select distinct course from tblcourse";
            co.connect();
            SqlCommand cmd = new SqlCommand(stt, co.con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    dropd_search_course.Items.Add(dr[0].ToString());
                }
            }
            co.disconnect();

        }

    }
    protected void dropd_search_course_SelectedIndexChanged(object sender, EventArgs e)
    {
        dropd_search_branch.Items.Clear();
        dropd_search_branch.Items.Add("---Select---");
        dropd_search_sem.Items.Clear();
        dropd_search_sem.Items.Add("---Select---");
        String stt = "select distinct branch from tblcourse where course='" + dropd_search_course.SelectedItem.Text + "'";
        co.connect();
        SqlCommand cmd = new SqlCommand(stt, co.con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                dropd_search_branch.Items.Add(dr[0].ToString());
            }
        }
        co.disconnect();
    }
    protected void dropd_search_branch_SelectedIndexChanged(object sender, EventArgs e)
    {
        int i, j = 0;
        dropd_search_sem.Items.Clear();
        dropd_search_sem.Items.Add("---Select---");
        String stt = "select distinct sem from tblcourse where course='" + dropd_search_course.SelectedItem.Text + "' and branch='" + dropd_search_branch.SelectedItem.Text + "'";
        co.connect();
        SqlCommand cmd = new SqlCommand(stt, co.con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                j = Convert.ToInt32(dr[0].ToString());
            }
        }
        co.disconnect();
        for (i = 1; i <= j; i++)
            dropd_search_sem.Items.Add(i.ToString());
    }
    protected void savefile()
    {
        String year = dropd_search_sem.SelectedItem.Text.ToString();
        String usrid = usr;
        String course = dropd_search_course.SelectedItem.Text.ToString();
        String filename = txtbname.Text.Trim();
        String url = txtburl.Text.Trim();
        String type = dropd_search_type.SelectedItem.Text.ToString();
        String branch = dropd_search_branch.SelectedItem.Text.ToString();
        String stt;
        stt = "insert into document (name,uni,type,course,branch,year,dview,ddownload,usrid,url,veri) values ('"+filename+"','Harcourt Bulter Technical University','" + type + "','" + course + "','" + branch + "','" + year + "',0,0,'" + usrid + "','" + url + "','false')";
        co.connect();
        SqlCommand cmd = new SqlCommand(stt, co.con);
        int result = cmd.ExecuteNonQuery();
        co.disconnect();
        if (result > 0)
        {
            lblmsg.Text = "Status: Link Send To Us, We Will Soon Processed It.";
            txtbname.Text = txtburl.Text = "";
            dropd_search_branch.SelectedIndex = dropd_search_course.SelectedIndex = dropd_search_sem.SelectedIndex = dropd_search_type.SelectedIndex = 0;
        }
        else
        {
            lblmsg.Text = "Status: Something Went Wrong.";
        }
    }
    protected void btnupload_Click(object sender, EventArgs e)
    {
        bool Test = true;
        String url = txtburl.Text.ToString();
        WebResponse response;
        try
        {
            Uri urlCheck = new Uri(url);
            WebRequest request = WebRequest.Create(urlCheck);
            request.Timeout = 15000;

            response = request.GetResponse();
        }
        catch (Exception)
        {
            Test = false;
        }

        if (Test == false)
            lblmsg.Text = "URL do not exist. \n Use 'http://' as prefix or enter correct URL";
        else
            savefile();
    }
}