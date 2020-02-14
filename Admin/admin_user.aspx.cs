using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;

public partial class Admin_admin_gallery : System.Web.UI.Page
{
    public Connection co = new Connection();
    static String search="";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Panel1.Visible = false;
            btnupdate.Attributes.Add("onclick", "javasript:return confirm_delete()");
            //Panel1.Visible = false;
            show();
        }
    }

    protected void show()
    {
        co.connect();
        String stt = "SELECT * FROM tblusr "+search;
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
        string stt = "select * from tblusr where id=" + id + " and block!='true'";
        SqlCommand cmd = new SqlCommand(stt, co.con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                name = dr["usr"].ToString();
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
    protected void gv_rowdatabound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.DataItem != null)
        {
            DataRowView dr = (DataRowView)e.Row.DataItem;
            String data = dr["usr"].ToString();
            e.Row.Cells[1].Text = co.decode(data);
            dr = (DataRowView)e.Row.DataItem;
            data = dr["dob"].ToString();
            e.Row.Cells[2].Text = co.decode(data);
            dr = (DataRowView)e.Row.DataItem;
            data = dr["cont"].ToString();
            e.Row.Cells[3].Text = co.decode(data);
            dr = (DataRowView)e.Row.DataItem;
            data = dr["email"].ToString();
            e.Row.Cells[4].Text = co.decode(data);

        }
    }
    protected void btninsert_Click(object sender, EventArgs e)
    {
        co.connect();
        String stt = "update tblusr set veri='" + radbveri.SelectedValue + "', block='" + radbblock.SelectedValue + "' where id=" + gvfee.DataKeys[gvfee.EditIndex].Value;
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
        co.disconnect();
        editing(0);
    }
    protected void editing(int id)
    {
        if (id > 0)
        {
            co.connect();
            string stt = "select * from tblusr where id=" + id + "";
            SqlCommand cmd = new SqlCommand(stt, co.con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    radbveri.SelectedValue = dr["veri"].ToString();
                    radbblock.SelectedValue = dr["block"].ToString();
                    radbblock.Visible = radbveri.Visible = btnupdate.Visible = true;
                    btnupdate.Text = "Update";
                }
            }
            co.disconnect();
        }
        if (id == 0)
        {
            radbblock.Visible = radbveri.Visible = btnupdate.Visible = false;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        search = "";
        String t=co.encode(TextBox1.Text.Trim().ToString());
        search = "where usr like N'" + t + "%' or email like N'" + t + "%' or cont like N'" + t + "%'";
        show();
    }

    protected void gvfee_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Panel2.Visible = false;
        Panel1.Visible = true;
        int c=0;
        int id = Convert.ToInt32(gvfee.DataKeys[e.RowIndex].Value.ToString());
        co.connect();
        String stt = "select * from tblusr where id=" + id;
        SqlCommand cmd = new SqlCommand(stt, co.con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                lblusr.Text = co.decode(dr["usr"].ToString());
                lblregdate.Text = dr["datetime"].ToString();
                if (dr["block"].ToString()=="true")
                lblblock.Text = "Yes";
                else
                lblblock.Text = "No";
                if (dr["veri"].ToString() == "true")
                    lblveri.Text = "Yes";
                else
                    lblveri.Text = "No";
                lbldob.Text = co.decode(dr["dob"].ToString());
                lblmail.Text = co.decode(dr["email"].ToString());
                lblcont.Text = co.decode(dr["cont"].ToString());
            }
        }
        co.disconnect();
        co.connect();
        stt = "select * from document where usrid=" + id;
        cmd = new SqlCommand(stt, co.con);
        dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                c++;
            }
        }
        lblsubmit.Text = c.ToString();
        co.disconnect();

        co.connect();
        stt = "select * from document where usrid='"+id+"' order by datetime desc";
        SqlDataAdapter da = new SqlDataAdapter(stt, co.con);
        DataSet ds = new DataSet();
        da.Fill(ds, "harcourt");
        repeaterpost.DataSource = ds.Tables[0].DefaultView;
        repeaterpost.DataBind();
        co.disconnect();
        show();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
        show();
    }
}