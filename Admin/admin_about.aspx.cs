using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Admin_admin_about : System.Web.UI.Page
{
    public Connection co = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            school_detail();
        }
    }
    protected void school_detail()
    {
        
    }
    protected void btnaboutus_Click(object sender, EventArgs e)
    {
        
    }
    protected void btnabtupdate_Click(object sender, EventArgs e)
    {
        String abt = txtb_abtschool.Text.Trim().ToString();
        String mob = txtbmobile.Text.Trim().ToString();
        String email = txtbemail.Text.Trim().ToLower().ToString();
        co.connect();
        String stt = "update school_detail set contact_no='" + mob + "',email='" + email + "',about_school='" + abt + "'";
        SqlCommand cmd = new SqlCommand(stt, co.con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                lblmsgabt.Text = "Detail's Updated Succesfully";
            }
        }
        co.disconnect();
        txtb_abtschool.Enabled = false;
        txtbemail.Enabled = false;
        txtbmobile.Enabled = false;
        btnabtedit.Visible = true;
        btnabtupdate.Visible = false;
    }
    public void pimgcheck()
    {
        //if (imgp_upload.HasFile)
        //{
        //    int x = imgp_upload.PostedFile.ContentLength;
        //    x = x / 1024;
        //    if (Checkfile(imgp_upload.FileName) == true)
        //    {
        //        //to check file format
        //        if (x < 1024)
        //        {
        //            imgp_upload.SaveAs(Server.MapPath("~/images/staff_principal" + Path.GetExtension(imgp_upload.FileName)));
        //            return 1;
        //        }
        //        else
        //        {
        //            lbl_pmsg.Text = "Incorrect Size";
        //            return 0;
        //        }
        //    }
        //    else
        //    {
        //        lbl_pmsg.Text = "Incorrect Format";
        //        return 0;
        //    }
        //}
        //else
        //{
        //    lbl_pmsg.Text = "Choose Image";
        //    SetFocus(imgp_upload);
        //    return 0;
        //}

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
}