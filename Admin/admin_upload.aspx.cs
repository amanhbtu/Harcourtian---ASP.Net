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

public partial class Admin_admin_upload : System.Web.UI.Page
{
    public Connection co = new Connection();
    static String search = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnupdate.Attributes.Add("onclick", "javasript:return confirm_delete()");
            show();
        }
    }

    protected void show()
    {
        co.connect();
        String stt = "SELECT * FROM document " + search;
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
        string stt = "select * from document where id=" + id;
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
            
        }
    }
    protected void btninsert_Click(object sender, EventArgs e)
    {
        co.connect();
        String stt = "update document set veri='" + radbveri.SelectedValue + "' where id=" + gvfee.DataKeys[gvfee.EditIndex].Value;
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
            string stt = "select * from document where id=" + id + "";
            SqlCommand cmd = new SqlCommand(stt, co.con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    radbveri.SelectedValue = dr["veri"].ToString();
                    radbveri.Visible = btnupdate.Visible = true;
                    btnupdate.Text = "Update";
                }
            }
            co.disconnect();
        }
        if (id == 0)
        {
            radbveri.Visible = btnupdate.Visible = false;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        search = "";
        String t = co.encode(TextBox1.Text.Trim().ToString());
        search = "where name like N'" + t + "%' or type like N'" + t + "%' or course like N'" + t + "%' or branch like N'" + t + "%' or id like N'" + t + "%' or usrid like N'" + t + "%'";
        show();
    }

}
