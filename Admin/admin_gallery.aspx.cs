using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Drawing;
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
    String maxid;
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
        String stt = "delete from img_folder where id=" + id;
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
        String stt = "SELECT * FROM img_folder";
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
        string stt = "select * from img_folder where id=" + id + "";
        SqlCommand cmd = new SqlCommand(stt, co.con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                name = dr["name"].ToString();
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
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string name = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "name"));
            ImageButton imgbtn = (ImageButton)e.Row.FindControl("deletebutton");
            if (imgbtn != null)
            {
                imgbtn.Attributes.Add("onclick", "javasript:return confirm_delete('" + name + "')");
            }
        }
    }
    protected void btninsert_Click(object sender, EventArgs e)
    {
        co.connect();
        if (btninsert.Text == "Add")
        {
            String name = txtbname.Text.Trim().ToString();
            String dis = txtbdis.Text.Trim().ToString();
            String stt = "insert into img_folder(name,img,detail) values('"+name+"','"+imageimg.ImageUrl.ToString()+"','"+dis+"')";
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
            String name = txtbname.Text.Trim().ToString();
            String dis = txtbdis.Text.Trim().ToString();
            String stt = "update img_folder set  name='" + name + "',dis='" + dis + "',img='" + imageimg.ImageUrl.ToString() + "' where id='" + gvfee.DataKeys[gvfee.EditIndex].Value + "'";
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
    public int imgcheck()
    {
        if (fileuimg.HasFile)
        {
            int x = fileuimg.PostedFile.ContentLength;
            x = x / 1024;
            if (Checkfile(fileuimg.FileName) == true)
            {
                //to check file format
                if (x < 300)
                {
                    if (btninsert.Text == "Add")
                    {
                        fileuimg.SaveAs(Server.MapPath("~/images/" + maxid + Path.GetExtension(fileuimg.FileName)));
                    }
                    else if (btninsert.Text == "Update")
                    {
                        fileuimg.SaveAs(Server.MapPath("~/images/" + gvfee.DataKeys[gvfee.EditIndex].Value + Path.GetExtension(fileuimg.FileName)));
                    }
                    return 1;
                }
                else
                {
                    lblpic.Text = "Incorrect Size";
                    return 0;
                }
            }
            else
            {
                lblpic.Text = "Incorrect Format";
                return 0;
            }
        }
        else
        {
            lblpic.Text = "Choose Image";
            SetFocus(fileuimg);
            return 0;
        }

    }
    public bool Checkfile(String z)
    {
        String ext = Path.GetExtension(z);
        switch (ext)
        {
            case ".gif":
                return true;
            case ".jpg":
                return true;
            case ".png":
                return true;
            case ".jpeg":
                return true;
            default:
                return false;
        }

    }
    public int chk_tools()
    {
        int r = 10;
        return r;
    }
    protected void btnimgupload_Click(object sender, EventArgs e)
    {
        maxid = get_maxid();
        if (imgcheck() == 1)
        {
            if (btninsert.Text == "Add")
            {
                imageimg.ImageUrl = "~/images/" + maxid + Path.GetExtension(fileuimg.FileName);
            }
            else if (btninsert.Text == "Update")
            {
                imageimg.ImageUrl = "~/images/" + gvfee.DataKeys[gvfee.EditIndex].Value + Path.GetExtension(fileuimg.FileName);
            }
            lblpic.Text = "";
        }
    }
    protected void editing(int id)
    {
        if (id > 0)
        {
            co.connect();
            string stt = "select * from img_folder where id=" + id + "";
            SqlCommand cmd = new SqlCommand(stt, co.con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    
                }
            }
            co.disconnect();
        }
        if (id == 0)
        {
        }
    }
    public String get_maxid()
    {
        int val = 0;
        co.connect();
        String stt = "Select max(id) from img_folder";
        SqlCommand cmd = new SqlCommand(stt, co.con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
                val = Convert.ToInt32(dr[0]);
        }
        String id = (val + 1).ToString();
        co.disconnect();
        return (id);
    }
}