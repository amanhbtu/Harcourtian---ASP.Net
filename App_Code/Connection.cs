using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.IO;
using System.Net.Mail;



public class Connection
{
    public SqlConnection con = new SqlConnection("workstation id=harcourtian.mssql.somee.com;packet size=4096;user id=harcoutian_SQLLogin_1;pwd=7hsf325muj;data source=harcourtian.mssql.somee.com;persist security info=False;initial catalog=harcourtian");
    public Connection()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public void connect()
    {
        con.Open();
    }
    public void disconnect()
    {
        con.Close();
    }
    public void sendsms()
    {
        // use the API URL here  
        string strUrl = "http://api.mVaayoo.com/mvaayooapi/MessageCompose?user=amanlovi1122@gmail.com:sms@aman1&senderID=TEST SMS&receipientno=918299237887&dcs=0&msgtxt=Thank You For Registration To Us&state=4 ";
        // Create a request object  
        WebRequest request = HttpWebRequest.Create(strUrl);
        // Get the response back  
        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        Stream s = (Stream)response.GetResponseStream();
        StreamReader readStream = new StreamReader(s);
        string dataString = readStream.ReadToEnd();
        response.Close();
        s.Close();
        readStream.Close();
    }
    public void sendmail(String to,String msg,String sub)
    {
        MailMessage mm = new MailMessage("teamhungerhail@gmail.com", to);
        mm.Subject = sub;
        mm.Body = msg;
        mm.IsBodyHtml = false;
        SmtpClient smtp = new SmtpClient("smtp.gmail.com,587");
        smtp.Host = "smtp.gmail.com";
        smtp.EnableSsl = true;
        NetworkCredential NetworkCred = new NetworkCredential("teamhungerhail@gmail.com", "Blackteeth@152000");
        smtp.UseDefaultCredentials = true;
        smtp.Credentials = NetworkCred;
        smtp.Port = 587;
        smtp.Send(mm);
        //for alert
        //ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);
    }
    public String otp()
    {
        string alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        string small_alphabets = "abcdefghijklmnopqrstuvwxyz";
        string numbers = "1234567890";
        string characters = numbers+small_alphabets+alphabets;
        int length = 6;
        string otp = string.Empty;
        for (int i = 0; i < length; i++)
        {
            string character = string.Empty;
            do
            {
                int index = new Random().Next(0, characters.Length);
                character = characters.ToCharArray()[index].ToString();
            } while (otp.IndexOf(character) != -1);
            otp += character;
        }
        return otp;
    }
    public String encode(String data)
    {
        char[] b = new char[50];
        b = data.ToCharArray();
        String c = "";
        int i, len;
        len = b.Length;
        for (i = 0; i < len; i++)
        {
            c = c + Convert.ToChar(b[i] * (i + 2));
        }
        return c;
    }
    public String decode(String data)
    {
        char[] b = new char[50];
        b = data.ToCharArray();
        String c = "";
        int i, len;
        len = data.Length;
        for (i = 0; i < len; i++)
        {
            c = c + Convert.ToChar(b[i] / (i + 2));
        }
        return c;
    }
    public String mmdd2ddmm(string date)
    {
        string[] dates = date.Split('/');
        return(string.Format("{0}/{1}/{2}", dates[1], dates[0], dates[2]).ToString().ToString());
    }
}