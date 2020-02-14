using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class view : System.Web.UI.Page
{
    Connection co = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        int file=Convert.ToInt32(Request.QueryString["file"]);
        if (file >0)
        {
            String stt = "select * from document,tblusr where document.id="+file+" and tblusr.id=document.usrid";
            co.connect();
            SqlCommand cmd = new SqlCommand(stt, co.con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lbltitle.Text = dr["name"].ToString();
                    lbltype.Text = dr["type"].ToString();
                    lbluni.Text = dr["uni"].ToString();
                    lblcourse.Text = dr["course"].ToString();
                    lbluser.Text = co.decode(dr["usr"].ToString());
                    lblbranch.Text = dr["branch"].ToString();
                    lblyear.Text = dr["year"].ToString();
                    lblview.Text = dr["dview"].ToString();
                    lbldown.Text = dr["ddownload"].ToString();
                    HiddenField1.Value = dr["url"].ToString();
                    string embed = "<object data=\"{0}\" type=\"application/pdf\" width=\"100%\" height=\"100%\">";
                    embed += "If you are unable to view file,";
                    embed += " download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
                    embed += "</object>";

                }
            }
            co.disconnect();
            int a = Convert.ToInt32(lblview.Text);
            a++;
            stt = "update document set dview=" + a + " where id=" + file + ";";
                ;
            co.connect();
            cmd = new SqlCommand(stt, co.con);
            int result = cmd.ExecuteNonQuery();
            co.disconnect();
            show();
        }
        else
            Response.Redirect("search.aspx");
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        String file = Request.QueryString["file"].ToString();
        int a = Convert.ToInt32(lbldown.Text);
        a++;
        String link = HiddenField1.Value.Remove(0,0).ToString();
        String stt = "update document set ddownload=" + a + " where id=" + file + ";";
        co.connect();
        SqlCommand cmd = new SqlCommand(stt, co.con);
        int result = cmd.ExecuteNonQuery();
        co.disconnect();
        Response.Write( "<script> window.open( '"+link+"','_blank' ); </script>");
    }
    protected void show()
    {
        String stt = "select top 10 document.id,document.name,document.type,document.course,document.url from document where (document.course='"+lblcourse.Text+"' or document.branch ='"+lblbranch.Text+"' ) and document.veri='true'";
        co.connect();
        SqlDataAdapter da = new SqlDataAdapter(stt, co.con);
        DataSet ds = new DataSet();
        da.Fill(ds, "harcourt");
        repeaterrelated.DataSource = ds.Tables[0].DefaultView;
        repeaterrelated.DataBind();
        co.disconnect();
    }
}