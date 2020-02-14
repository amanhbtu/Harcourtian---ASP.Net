<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="admin_download.aspx.cs" Inherits="Admin_admin_download" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript"">
    function confirm_delete(ename) {
        var result = confirm('Are You Sure To Delete ' + ename + ' Permanantly');
        if (result) {
            return true;
        }
        else {
            return false;
        }
    }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
    <table width="100%">
    
    <tr>
    <td colspan="2" class="style6">
    <h1 align="center" style="text-align: center; background-color: #D95459" 
            class="fa-inverse">Download's Links</h1>
    <br />
    </td>
    </tr>
    <tr>
    <td colspan="2">
        <table width="100%">
        <tr>
        <td class="style1">
            Link Title :
        </td>
        <td>
            <asp:TextBox ID="txtb_ltitle" runat="server" Width="150px" ValidationGroup="form"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtb_ltitle" ErrorMessage="Please Enter Link Title" 
                SetFocusOnError="True" ValidationGroup="form"></asp:RequiredFieldValidator>
        </td>
        </tr>
        <tr>
        <td valign="top" class="style1">
            Link :
        </td>
        <td class="style5">
            <asp:TextBox ID="txtb_link" runat="server"
                Width="150px" ValidationGroup="form"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtb_link" 
                ErrorMessage="Please Enter Link" SetFocusOnError="True" 
                ValidationGroup="form"></asp:RequiredFieldValidator>
        </td>
        </tr>
        <tr>
        <td></td>
        <td>
            <asp:Button ID="btninsert" runat="server" Text="Insert"  Width="73px" 
                ValidationGroup="form" onclick="btninsert_Click1" />
               <asp:Label ID="lblmsg" runat="server"></asp:Label>
        </td>
        </tr>
        </table>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <hr />
       <asp:Panel ID="panel2" runat="server" class="fullw" style="text-align: left">
        <asp:GridView ID="gvfee" DataKeyNames="id" runat="server" AutoGenerateColumns="False"
                            onrowdeleting="gv_delete" onrowediting="gv_edit"
                                onrowcancelingedit="gv_canceledit" onrowdatabound="gv_rowdatabound" 
                         onrowupdating="gv_update" Width="100%" AllowPaging="True" BackColor="#CCCCCC" 
                                BorderColor="#999999" BorderStyle="Solid" 
                BorderWidth="3px" CaptionAlign="Top" 
                                CellPadding="4" CellSpacing="2" 
                EnableModelValidation="True" Font-Bold="False" 
                                ForeColor="Black"
                ShowFooter="False">

        <Columns>
        
        <asp:TemplateField HeaderText="Tools">
        <ItemTemplate>
        <asp:ImageButton ID="editbutton" runat="server" CommandName="edit" ToolTip="Edit" Height="20px" Width="20px" ImageUrl="~/Admin/images/Edit.jpg" CausesValidation="False" />
        <asp:ImageButton ID="deletebutton" runat="server" CommandName="delete" ToolTip="Delete" Height="20px" Width="20px" ImageUrl="~/Admin/images/delete.jpg" CausesValidation="False" />
        </ItemTemplate>
        <EditItemTemplate>
<asp:ImageButton ID="cancelbutton" runat="server" CommandName="cancel" ImageUrl="~/Admin/images/Cancel.jpg" ToolTip="Cancel" Height="20px" Width="20px" CausesValidation="False" />
        </EditItemTemplate>
        </asp:TemplateField>

        
        <asp:TemplateField HeaderText="Link Title">
        
<ItemTemplate>
<asp:Label ID="lblcourse" runat="server" Text='<%#Eval("title") %>'/>
</ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Link Address">
        
<ItemTemplate>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Eval("link") %>'>
<asp:Label ID="lblcat" runat="server" Text='<%#Eval("link") %>'/>
</asp:HyperLink>
</ItemTemplate>
        </asp:TemplateField>

</Columns>

                             <FooterStyle BackColor="#CCCCCC" />
                             <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                             <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                             <RowStyle BackColor="White" />
                             <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />

                         </asp:GridView>
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
        </asp:Panel>
    </td>
    </tr>
    </table>
</div>
</asp:Content>

