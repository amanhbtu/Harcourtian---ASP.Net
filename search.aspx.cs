using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class search : System.Web.UI.Page
{
    Connection co= new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["s"] != "" && Request.QueryString["s"] != null)
            {
                txtbsearch.Text = Request.QueryString["s"].ToString();
                show();
            }
        }
    }
    protected void show()
    {
        String txt = txtbsearch.Text.ToString();
        txt=txt.Replace(" ", "%%");
        String stt = srch();
        co.connect();
        SqlDataAdapter da = new SqlDataAdapter(stt, co.con);
        DataSet ds = new DataSet();
        da.Fill(ds, "harcourt");
        repeatersearch.DataSource = ds.Tables[0].DefaultView;
        repeatersearch.DataBind();
        co.disconnect();
    }
    protected String srch()
    {
        int i;
        String words = txtbsearch.Text.Trim().ToString();
        String[] arr = null;
        arr = words.Split(' ', ',', '.');
        String stt = "select tblusr.usr,document.id,document.name,document.type,document.course,document.branch,document.year,document.dview,document.ddownload,document.url,document.datetime from document,tblusr where ((";
        for (i = 0; i < arr.Length; i++)
        {
            String txt = arr[i];
            stt = stt + "document.name like '%" + txt + "%' or document.type like '%" + txt + "%' or document.course like '%" + txt + "%' or document.branch like '%" + txt + "%'";
            if (i + 1 < arr.Length)
                stt = stt + ") and( ";
        }
        stt = stt + ")) and document.usrid=tblusr.id and document.veri='true'";
        return stt;
    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        String txt = txtbsearch.Text.Trim().ToString();
        if (txt != "" && txt != null)
            show();
        txtbsearch.Focus();
        txtbsearch.Text = txt.ToString();
    }
}