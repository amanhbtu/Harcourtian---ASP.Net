<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="admin_user.aspx.cs" Inherits="Admin_admin_gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="../css/style.css" rel="Stylesheet" type="text/css" />
<link href='//fonts.googleapis.com/css?family=Open+Sans:700,700italic,800,300,300italic,400italic,400,600,600italic' rel='stylesheet' type='text/css' />

<script type="text/javascript"">
    function confirm_delete() {
        var result = confirm('Are You Sure To Update');
        if (result) {
            return true;
        }
        else {
            return false;
        }
    }

    </script>
    <style type="text/css">
        .style1
        {
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
    <ProgressTemplate>
    <div class="modal1">
             <div class="center1">
               <img  class="load1" alt="" src="../images/loader.gif" /><h3>Loading...</h3>
             </div>
           </div>
    </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <div style=" min-height:500px;">
        <asp:Panel ID="Panel1" runat="server">
        <div class="col-md-12">
        <h1 align="center" style="text-align: center; background-color: #D95459" 
            class="fa-inverse">Profile<span style="float:right; padding:5px"><asp:ImageButton 
                ID="ImageButton1" runat="server" ImageUrl="~/images/close.png" 
                BackColor="#d95459" BorderColor="#D95459" onclick="ImageButton1_Click"></asp:ImageButton></span></h1>
<table width="100%">
<tr><td width="40%" class="detail">Name :</td><td><asp:Label ID="lblusr" runat="server" Text=""></asp:Label></td></tr>
<tr><td width="40%" class="detail">Date of Birth : </td><td><asp:Label ID="lbldob" runat="server" Text=""></asp:Label></td></tr>
<tr><td width="40%" class="detail">Contact : </td><td><asp:Label ID="lblcont" runat="server" Text=""></asp:Label></td></tr>
<tr><td width="40%" class="detail">Email : </td><td><asp:Label ID="lblmail" runat="server" Text=""></asp:Label></td></tr>
<tr><td width="40%" class="detail">Verified : </td><td><asp:Label ID="lblveri" runat="server" Text=""></asp:Label></td></tr>
<tr><td width="40%" class="detail">Regitration Date : </td><td><asp:Label ID="lblregdate" runat="server" Text=""></asp:Label></td></tr>
<tr><td width="40%" class="detail">Total Submits :</td><td><asp:Label ID="lblsubmit" runat="server" Text=""></asp:Label></td></tr>
<tr><td width="40%" class="detail">Block Status :</td><td>
    <asp:Label ID="lblblock" runat="server" Text=""></asp:Label>
</td></tr>
</table>
       
<asp:HiddenField ID="HiddenField1" runat="server" Value="" />
    <br /><h3>Recent Uploads</h3>
    <asp:Repeater ID="repeaterpost" runat="server">
    <ItemTemplate>
    <a href='<%#"detail.aspx?file="+Eval("id") %>'>
        <asp:Label ID="Label2" runat="server" Text='<%#"-->"+Eval("name")+", "+Eval("type")+", "+Eval("course") %>'></asp:Label>
        </a>
    </ItemTemplate>
    <SeparatorTemplate><br /></SeparatorTemplate>
    </asp:Repeater>
    <div class="clearfix"></div>
</div>
        </asp:Panel>
        
        <asp:Panel ID="Panel2" runat="server">
        
    <table width="100%">
    <tr>
    <td colspan="2" class="style6">
    <h1 align="center" style="text-align: center; background-color: #D95459" 
            class="fa-inverse">User Details</h1>
    <br />
    </td>
    </tr>
<tr>
        <td valign="top" class="style1" width="70px">
            Verified :
            </td>
        <td>
            <asp:RadioButtonList ID="radbveri" runat="server"  Visible="false"
                RepeatDirection="Horizontal" RepeatLayout="Flow">
                <asp:ListItem Value="true">True</asp:ListItem>
                <asp:ListItem Value="false">False</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        </tr>
        <tr>
        <td class="style1" width="100px">
             Blocked :
        </td>
        <td class="style1">
            <asp:RadioButtonList ID="radbblock" runat="server" 
                RepeatDirection="Horizontal" RepeatLayout="Flow"  Visible="false">
                <asp:ListItem Value="true">True</asp:ListItem>
                <asp:ListItem Value="false">False</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        </tr>
        <tr>
        <td width="70px">
        </td>
        <td>
            <asp:Button ID="btnupdate" runat="server" Text="Update" 
                onclick="btninsert_Click" Width="73px" ValidationGroup="form" 
                Visible="false" />
               <asp:Label ID="lblmsg" runat="server"></asp:Label>
        </td>
        </tr>
        <tr>
        <td>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Search" onclick="Button1_Click" />
                </td>
                </tr>
    <tr>
    <td colspan="2">
        <asp:GridView ID="gvfee" DataKeyNames="id" runat="server" 
               AutoGenerateColumns="False" onrowediting="gv_edit"
                                onrowcancelingedit="gv_canceledit" 
               onrowdatabound="gv_rowdatabound" Width="100%" AllowPaging="True" BackColor="#CCCCCC" 
                                BorderColor="#999999" BorderStyle="Solid" 
                BorderWidth="3px" CaptionAlign="Top" 
                                CellPadding="4" CellSpacing="2" 
                EnableModelValidation="True" Font-Bold="False" 
                                ForeColor="Black"
                ShowFooter="False" PageSize="15" onrowupdating="gvfee_RowUpdating">

        <Columns>
        
        <asp:TemplateField HeaderText="Tools">
        <ItemTemplate>
        <asp:ImageButton ID="editbutton" runat="server" CommandName="edit" ToolTip="Edit" 
                Height="20px" Width="20px" ImageUrl="~/Admin/images/Edit.jpg" 
                CausesValidation="False" />
        </ItemTemplate>
        <EditItemTemplate>
<asp:ImageButton ID="cancelbutton" runat="server" CommandName="cancel" 
                ImageUrl="~/Admin/images/Cancel.jpg" ToolTip="Cancel" Height="20px" 
                Width="20px" CausesValidation="False" />
        </EditItemTemplate>
        </asp:TemplateField>

        
        <asp:TemplateField HeaderText="Name">
        
<ItemTemplate>
<asp:Label ID="lblname" runat="server" Text='<%#Eval("usr") %>'/>
</ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="DOB">
        
<ItemTemplate>
<asp:Label ID="lbldob" runat="server" Text='<%#Eval("dob") %>'/>
</ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Email">
        
<ItemTemplate>
<asp:Label ID="lblmail" runat="server" Text='<%#Eval("email") %>'/>
</ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Mobile">
        
<ItemTemplate>
<asp:Label ID="lblmobile" runat="server" Text='<%#Eval("cont") %>'/>
</ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Blocked">
        
<ItemTemplate>
<asp:Label ID="lblblock" runat="server" Text='<%#Eval("block") %>'/>
</ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Profile">
        
<ItemTemplate></a><asp:LinkButton ID="linkbtnlink" CommandName="update"
    runat="server">Profile</asp:LinkButton>
</ItemTemplate>
        </asp:TemplateField>

</Columns>

                             <FooterStyle BackColor="#CCCCCC" />
                             <HeaderStyle BackColor="Black" Font-Bold="True" 
                ForeColor="White" />
                             <PagerSettings PageButtonCount="15" />
                             <PagerStyle BackColor="#CCCCCC" ForeColor="Black" 
                HorizontalAlign="Left" />
                             <RowStyle BackColor="White" />
                             <SelectedRowStyle BackColor="#000099" Font-Bold="True" 
                ForeColor="White" />

                         </asp:GridView>
    <hr />
    </td>
    </tr>
    </table>
</asp:Panel>
</div>    
    </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <div class="clearfix"></div>
</asp:Content>

