<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_login.aspx.cs" Inherits="admin_Default" %>

<html">
<head runat="server">
<link rel="Stylesheet" type="text/css" href="../StyleSheet1.css" />
    <title>Login</title>
    <style type="text/css">
        .style5
        {
            text-align: right;
            font-size: medium;
            font-weight: bold;
            
            width: 50%;
        }
        .style6
        {
            height: 108px;
        }
        .style7
        {
            text-align: left;
        }
        .style8
        {
            font-size: x-large;
        }
        .style9
        {
            text-align: right;
            font-size: x-large;
            font-weight: bold;
            width: 50%;
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table width="100%">
    <tr>
    <td align="center"><br /><br /><br />
    <table width="80%">
    <tr>
    <td colspan="2" class="style6">
    <h1 align="center" 
            style="text-align: center; background-color: #D95459; color: #FFFFFF; font-family: Arial, Helvetica, sans-serif;">ADMIN LOG IN</h1>
    <br /><br /><br />
    </td>
    </tr>
    <tr>
    <td class="style9">Username :</td>
    
    <td class="style7"><asp:TextBox ID="txtb_usern" runat="server" Width="167px" 
            CssClass="style8"></asp:TextBox></td>
    </tr>
    <tr>
    <td class="style5"></td>
    
    <td class="style7"></td>
    </tr>
    <tr>
    <td class="style9">Password :
        </td>
    <td class="style7">
        <asp:TextBox ID="txtb_userp" runat="server" Width="168px" TextMode="Password" 
            CssClass="style8"></asp:TextBox></td>
    </tr>
    <tr>
    <td></td>
    
    <td class="style7"></td>
    </tr>
    <tr>
    <td></td>
    
    <td class="style7">
        <asp:Button ID="btn_login" runat="server" Text="Login" 
            onclick="btn_login_Click" style="font-weight: 700; background-color: #D95459; color: #FFFFFF;" 
            Width="101px" CssClass="style8" />
        <asp:Label ID="lblerror" runat="server" ForeColor="Red" CssClass="style8"></asp:Label>
        </td>
    </tr>
    </table>
    </td>
    </tr>
    </table>
    </div>
    </form>
</body>
</html>
