<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="admin_about.aspx.cs" Inherits="Admin_admin_about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style1
        {
            padding:5px;
            vertical-align:text-top;
            font-size: medium;
            font-weight: bold;
            text-align: right;
        }
        .btn
        {
            margin:5px;
            width:100px;
            border:0;
            color:White;
            background-color:#D95459;
            border-radius:5px;
        }
        .btn:hover
        {
            color:#D95459;
            font-weight:600;
            background-color:inherit;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
           
            <div>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                <ContentTemplate>
                <div class="schoolname" style="cursor:pointer" >
	                   <h4 style="text-align:left;padding-left:15px">About Us</h4>
                  </div>
                  <table width="100%">
                  <tr>
                  <td class="style1" width="20%">Email :</td><td width="80%" style="padding: 5px"><asp:TextBox ID="txtbemail" runat="server" Enabled="False"></asp:TextBox></td>
                  </tr>
                  <tr>
                  <td class="style1">Mobile :</td><td style="padding: 5px"><asp:TextBox ID="txtbmobile" runat="server" Enabled="False"></asp:TextBox></td>
                  </tr>
                  <tr>
                  <td class="style1" >About :</td>
                  <td>
                      <asp:TextBox ID="txtb_abtschool" runat="server" Height="200px" 
                          TextMode="MultiLine" ToolTip="Principal's Message" Width="70%" 
                          Enabled="False"></asp:TextBox>
                  </td>
                  </tr>
                  <tr><td></td><td>
                  <asp:Button ID="btnabtedit" runat="server" Text="Edit" onclick="btnaboutus_Click" class="btn"/>
                  <asp:Button ID="btnabtupdate" runat="server" Text="Update" Visible="false" 
                          onclick="btnabtupdate_Click" class="btn"/>
                      <asp:Label ID="lblmsgabt" runat="server" Text=""></asp:Label>
                  </td></tr>
                  </table>
                </ContentTemplate>
                </asp:UpdatePanel>
                  
                
            </div>
                 
</asp:Content>

