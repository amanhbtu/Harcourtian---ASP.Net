<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="detail.aspx.cs" Inherits="view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="col-md-12">
<span class="detail" style="color:Red;"><asp:Label ID="lbltitle" runat="server" Text=""></asp:Label></span>
<table width="100%">
<tr><td width="40%" class="detail">File Type : </td><td><asp:Label ID="lbltype" runat="server" Text=""></asp:Label></td></tr>
<tr><td width="40%" class="detail">University : </td><td><asp:Label ID="lbluni" runat="server" Text=""></asp:Label></td></tr>
<tr><td width="40%" class="detail">Course : </td><td><asp:Label ID="lblcourse" runat="server" Text=""></asp:Label></td></tr>
<tr><td width="40%" class="detail">Branch : </td><td><asp:Label ID="lblbranch" runat="server" Text=""></asp:Label></td></tr>
<tr><td width="40%" class="detail">Semester : </td><td><asp:Label ID="lblyear" runat="server" Text=""></asp:Label></td></tr>
<tr><td width="40%" class="detail">Author <i class="glyphicon glyphicon-user"></i>  </td><td><asp:Label ID="lbluser" runat="server" Text=""></asp:Label></td></tr>
<tr><td width="40%" class="detail">Views <i class="glyphicon glyphicon-eye-open"></i>  </td><td><asp:Label ID="lblview" runat="server" Text=""></asp:Label></td></tr>
<tr><td width="40%" class="detail">Downloads <i class="glyphicon glyphicon-download-alt"></i>  </td><td><asp:Label ID="lbldown" runat="server" Text=""></asp:Label></td></tr>
</table>
       
<center>
    <asp:HiddenField ID="HiddenField1" runat="server" Value="" />
    <asp:ImageButton ID="ImageButton1" height="70px" runat="server" 
        ImageUrl="~/images/ezgif.com-crop.gif" onclick="ImageButton1_Click" /></center><br />
        <div id="pdf">
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
        <h3>Related Links</h3>
    <asp:Repeater ID="repeaterrelated" runat="server">
    <ItemTemplate>
    <a href='<%#"detail.aspx?file="+Eval("id") %>'>
        <asp:Label ID="Label2" runat="server" Text='<%#"-->"+Eval("name")+", "+Eval("type")+", "+Eval("course") %>'></asp:Label>
        </a>
    </ItemTemplate>
    </asp:Repeater>
</div>
</asp:Content>

