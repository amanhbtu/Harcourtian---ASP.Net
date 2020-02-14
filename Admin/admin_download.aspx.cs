using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;

public partial class Admin_admin_download : System.Web.UI.Page
{

    public Connection co = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            show();
        }
    }
    protected void gv_delete(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gvfee.DataKeys[e.RowIndex].Values["id"].ToString());
        String stt = "delete from download where id=" + id;
        String name = showname(id);
        co.connect();
        SqlCommand cmd = new SqlCommand(stt, co.con);
        int result = cmd.ExecuteNonQuery();
        if (result > 0)
            lblmsg.Text = name + "'s Details Deleted Succesfully";
        else
            lblmsg.Text = name + "'s Details Deleted Unsuccesfully";
        co.disconnect();
        show();
    }
    protected void show()
    {
        co.connect();
        String stt = "SELECT * FROM download";
        SqlCommand cmd = new SqlCommand(stt, co.con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        co.disconnect();
        if (ds.Tables[0].Rows.Count > 0)
        {
            gvfee.RowStyle.ForeColor = Color.Blue;
            gvfee.DataSource = ds;
            gvfee.DataBind();
        }
    }
    protected String showname(int id)
    {
        co.connect();
        String name = "";
        string stt = "select * from download where id=" + id + "";
        SqlCommand cmd = new SqlCommand(stt, co.con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                name = dr["title"].ToString();
            }
        }
        co.disconnect();
        return (name);
    }
    protected void gv_edit(object sender, GridViewEditEventArgs e)
    {
        gvfee.EditIndex = e.NewEditIndex;
        int id = Convert.ToInt32(gvfee.DataKeys[e.NewEditIndex].Value);
        editing(id);
        show();
    }
    protected void gv_canceledit(object sender, GridViewCancelEditEventArgs e)
    {
        editing(0);
        gvfee.EditIndex = -1;
        show();
    }
    protected void gv_update(object sender, GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(gvfee.DataKeys[e.RowIndex].Values["id"].ToString());
        TextBox title = (TextBox)gvfee.Rows[e.RowIndex].FindControl("txtbename");
        TextBox link = (TextBox)gvfee.Rows[e.RowIndex].FindControl("txtbetype");
        String stt = ""; //"update staff_detail set course='" + course.Text.Trim().ToUpper() + "', year='" + year.Text.Trim().ToUpper() + "',sem='" + sem.Text.Trim().ToUpper() + "',sub='" + sub.Text.Trim().ToUpper() + "',stu_cat='" + cat.Text.Trim().ToUpper() + "',reg_fee='" + r_fee.Text.Trim().ToUpper() + "'  where id='" + id + "'";
        co.connect();
        SqlCommand cmd = new SqlCommand(stt, co.con);
        int result = cmd.ExecuteNonQuery();
        co.disconnect();
        if (result > 0)
        {
            gvfee.EditIndex = -1;
            show();
            lblmsg.ForeColor = Color.Green;
            lblmsg.Text = "Data Updated Succesfully";
        }
        else
        {
            lblmsg.ForeColor = Color.Red;
            lblmsg.Text = "Data Not Updated Succesfully";
        }
    }
    protected void gv_rowdatabound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string name = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "title"));
            ImageButton imgbtn = (ImageButton)e.Row.FindControl("deletebutton");
            if (imgbtn != null)
            {
                imgbtn.Attributes.Add("onclick", "javasript:return confirm_delete('" + name + "')");
            }
        }
    }
    protected void editing(int id)
    {
        if (id > 0)
        {
            co.connect();
            string stt = "select * from download where id=" + id + "";
            SqlCommand cmd = new SqlCommand(stt, co.con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    txtb_ltitle.Text = dr["title"].ToString();
                    txtb_link.Text = dr["link"].ToString();
                }
            }
            btninsert.Text = "Update";
            co.disconnect();
        }
        if (id == 0)
        {
            txtb_ltitle.Text = "";
            txtb_link.Text = "";
        }
    }
    public String get_maxid()
    {
        String val = "";
        co.connect();
        String stt = "Select max(id) from download";
        SqlCommand cmd = new SqlCommand(stt, co.con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
                val = dr[0].ToString();
        }
        co.disconnect();
        return (val + 1);
    }
    protected void btninsert_Click1(object sender, EventArgs e)
    {
        co.connect();
        if (btninsert.Text == "Insert")
        {
            String stt = "insert into download (title,link) values('" + txtb_ltitle.Text.Trim() + "','" + txtb_link.Text.Trim() + "')";
            SqlCommand cmd = new SqlCommand(stt, co.con);
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                lblmsg.ForeColor = Color.Green;
                lblmsg.Text = "DATA INSERTED";
            }
            else
            {
                lblmsg.ForeColor = Color.Red;
                lblmsg.Text = "DATA NOT INSERTED";
            }
        }
        if (btninsert.Text == "Update")
        {
            String title = txtb_ltitle.Text.Trim().ToString();
            String link = txtb_link.Text.Trim().ToString();
            String stt = "update download set title='" + title + "',link='" + link + "' where id='" + gvfee.DataKeys[gvfee.EditIndex].Value + "'";
            SqlCommand cmd = new SqlCommand(stt, co.con);
            int result = cmd.ExecuteNonQuery();
            co.disconnect();
            if (result > 0)
            {
                gvfee.EditIndex = -1;
                show();
                lblmsg.ForeColor = Color.Green;
                lblmsg.Text = "Data Updated Succesfully";
            }
            else
            {
                lblmsg.ForeColor = Color.Red;
                lblmsg.Text = "Data Not Updated Succesfully";
            }
            btninsert.Text = "Insert";
        }
        co.disconnect();
        editing(0);
        show();
    }
}