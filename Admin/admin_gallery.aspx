<%@ Page Title="Gallery Setting" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="admin_gallery.aspx.cs" Inherits="Admin_admin_gallery" %>

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
            class="fa-inverse">Gallery Setting</h1>
    <br />
    </td>
    </tr>

    <tr>
    <td colspan="2">
        <table width="100%">
        <tr>
        <td class="style1" width="30%">Folder Name :
        </td>
        <td class="style5" width="40%">
            <asp:TextBox ID="txtbname" runat="server" ValidationGroup="form"></asp:TextBox>   
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtbname" 
                ErrorMessage="Please Enter Folder's Name" SetFocusOnError="True" 
                ValidationGroup="form"></asp:RequiredFieldValidator> 
        </td>
        <td rowspan="8" width="30%">
        Choose Folder Image(Size Should Not Be More Than 300Kb)<br /> 
            <asp:Image ID="imageimg" runat="server" Height="120px" Width="110px" />
            <asp:FileUpload ID="fileuimg" runat="server" />
            <asp:Button ID="btnimgupload" runat="server" Text="Upload" 
                ValidationGroup="imgupload" Height="28px" onclick="btnimgupload_Click" />
                <asp:Label ID="lblpic" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
       
        <tr>
        <td class="style1">
            Discription :
        
        </td>
        <td>
            <asp:TextBox ID="txtbdis" runat="server" TextMode="MultiLine" 
                ValidationGroup="form"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtbdis" 
                ErrorMessage="Please Enter Discription About Folder" SetFocusOnError="True" 
                ValidationGroup="form"></asp:RequiredFieldValidator>
        </td>
        </tr>
        
        <tr>
        <td></td>
        <td>
            <asp:Button ID="btninsert" runat="server" Text="Add" 
                onclick="btninsert_Click" Width="73px" ValidationGroup="form" />
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
                          Width="100%" AllowPaging="True" BackColor="#CCCCCC" 
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

        
        <asp:TemplateField HeaderText="Folder's Name">
        
<ItemTemplate>
<asp:Label ID="lblname" runat="server" Text='<%#Eval("name") %>'/>
</ItemTemplate>
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="Discription">
        
<ItemTemplate>
<asp:Label ID="lbldis" runat="server" Text='<%#Eval("detail") %>'/>
</ItemTemplate>
        </asp:TemplateField>

        
        <asp:TemplateField HeaderText="Folder's Image">
        
<ItemTemplate>
 <asp:Image ID="img" runat="server" Height="80px" 
                        ImageUrl='<%#Eval("img") %>' Width="70px" />
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

