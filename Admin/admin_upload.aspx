<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="admin_upload.aspx.cs" Inherits="Admin_admin_upload" %>

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
                ShowFooter="False" PageSize="15">

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
<asp:Label ID="lblname" runat="server" Text='<%#Eval("name") %>'/>
</ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Course">
        
<ItemTemplate>
<asp:Label ID="lblcourse" runat="server" Text='<%#Eval("course") %>'/>
</ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Email">
        
<ItemTemplate>
<asp:Label ID="lblbranch" runat="server" Text='<%#Eval("branch") %>'/>
</ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Year">
        
<ItemTemplate>
<asp:Label ID="lblyear" runat="server" Text='<%#Eval("year") %>'/>
</ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Verified">
        
<ItemTemplate>
<asp:Label ID="lblveri" runat="server" Text='<%#Eval("veri") %>'/>
</ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Detail">
        
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
</div>    
    </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <div class="clearfix"></div>
</asp:Content>

