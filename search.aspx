<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdateProgress runat="server" id="PageUpdateProgress" DynamicLayout="true">
            <ProgressTemplate>
           <div class="modal1">
             <div class="center1">
               <img  class="load1" alt="" src="images/loader.gif" /><h3>Loading...</h3>
             </div>
           </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
    <%--<div class="col-md-4" style="padding:1%;"><h4>Type</h4>
        <asp:DropDownList Width="90%" ID="dropd_search_type" runat="server">
            <asp:ListItem>---Select---</asp:ListItem>
            <asp:ListItem>Previous Year Paper</asp:ListItem>
            <asp:ListItem>Syllabus</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="col-md-4" style="padding:1%;"><h4>Course</h4>
        <asp:DropDownList Width="90%" ID="dropd_search_course" runat="server"
            AutoPostBack="True">
        <asp:ListItem>---Select---</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="col-md-4" style="padding:1%;"><h4>Branch</h4>
        <asp:DropDownList Width="90%" ID="dropd_search_branch" runat="server" 
            AutoPostBack="True">
        <asp:ListItem>---Select---</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="col-md-4" style="padding:1%;"><h4>Semester</h4>
        <asp:DropDownList Width="90%" ID="dropd_search_sem" runat="server">
        <asp:ListItem>---Select---</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="clearfix"></div>
    <h3 style="text-align:center;">or</h3>
    --%>
    
    <div class="col-md-6" style="padding:1%;">
        <asp:TextBox Width="90%" ID="txtbsearch" onfocus="if (this.value == 'Search...') {this.value = '';};" onblur="if (this.value == '') {this.value = 'Search...';}" MaxLength="25" Text="Search..." runat="server"></asp:TextBox>
    </div>
    <div class="col-md-6" style="padding:1%;">
        <asp:Button Width="50%" ID="btnsearch" runat="server" Text="Search" 
            onclick="btnsearch_Click" />
            <div class="col-md-12">
    <asp:Label ID="lblmsg" runat="server"  ForeColor="Red" Text="" Font-Bold="True"></asp:Label>
     </div>
    </div><asp:Repeater ID="repeatersearch" runat="server">
                            <HeaderTemplate><h3 style="text-align:center;padding-top:10px">Search Result</h3><br /></HeaderTemplate>
                            <ItemTemplate>
                            <a href='<%#"detail.aspx?file="+Eval("id") %>'>
                          <div class="col-md-12">
                                    <h4 style="color:Red; padding-bottom:5px; padding-top:5px;"><asp:Label ID="lblname" runat="server" Text='<%#Eval("name") %>'></asp:Label></h4>
                                    </div>
                                <div class="col-md-6">
                                   <table  width="100%"> <tr><td style="font-weight: 700; vertical-align:text-top; color:Blue;" width="45%">Type :</td><td width="60%"><asp:Label ID="lbltype" runat="server" Text='<%#Eval("type") %>'></asp:Label></td></tr></table>
                                </div>
                                <div class="col-md-6">
                                  <table  width="100%"> <tr><td style="font-weight: 700; color:Blue; vertical-align:text-top;" width="45%">Course :</td><td width="60%"><asp:Label ID="lblcourse" runat="server" Text='<%#Eval("course") %>'></asp:Label></td></tr></table>
                                 </div>
                                <div class="col-md-6">
                                    <table  width="100%"> <tr><td style="font-weight: 700; color:Blue; vertical-align:text-top;" width="45%">Branch :</td><td width="60%"><asp:Label ID="lblbranch" runat="server" Text='<%#Eval("branch") %>'></asp:Label></td></tr></table>
                                 </div>
                                <div class="col-md-6">
                                    <table  width="100%"> <tr><td style="font-weight: 700; color:Blue; vertical-align:text-top;" width="45%">Semester :</td><td width="60%"><asp:Label ID="lblsemester" runat="server" Text='<%#Eval("year") %>'></asp:Label></td></tr></table>
                                 </div>
                                <div class="col-md-6">
                                    <table  width="100%"> <tr><td style="font-weight: 700; color:Blue; vertical-align:text-top;" width="45%">Upload Date :</td><td width="60%"><asp:Label ID="lbldate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"datetime","{0:mm/dd/yyyy}") %>'></asp:Label></td></tr></table>
                                 </div>
                                 <div class="col-md-6">
                                    <table  width="100%"> <tr><td style="font-weight: 700; color:Blue; vertical-align:text-top;" width="45%">Total Views :</td><td width="60%"><asp:Label ID="lbldview" runat="server" Text='<%#Eval("dview")%>'></asp:Label></td></tr></table>
                                 </div>
                                <div class="col-md-6">
                                    <table  width="100%"> <tr><td style="font-weight: 700; color:Blue; vertical-align:text-top;" width="45%">Total Downloads :</td><td width="60%"><asp:Label ID="lblddownload" runat="server" Text='<%#Eval("ddownload") %>'></asp:Label></td></tr></table>
                                 </div>
                                 </a>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                            <a href='<%#"detail.aspx?file="+Eval("id") %>'>
                          <div class="col-md-12">
                                    <h4 style="color:Red; padding-bottom:5px; padding-top:5px;"><asp:Label ID="lblname" runat="server" Text='<%#Eval("name") %>'></asp:Label></h4>
                                    </div>
                                <div class="col-md-6">
                                   <table  width="100%"> <tr><td style="font-weight: 700; vertical-align:text-top; color:Blue;" width="45%">Type :</td><td width="60%"><asp:Label ID="lbltype" runat="server" Text='<%#Eval("type") %>'></asp:Label></td></tr></table>
                                </div>
                                <div class="col-md-6">
                                  <table  width="100%"> <tr><td style="font-weight: 700; color:Blue; vertical-align:text-top;" width="45%">Course :</td><td width="60%"><asp:Label ID="lblcourse" runat="server" Text='<%#Eval("course") %>'></asp:Label></td></tr></table>
                                 </div>
                                <div class="col-md-6">
                                    <table  width="100%"> <tr><td style="font-weight: 700; color:Blue; vertical-align:text-top;" width="45%">Branch :</td><td width="60%"><asp:Label ID="lblbranch" runat="server" Text='<%#Eval("branch") %>'></asp:Label></td></tr></table>
                                 </div>
                                <div class="col-md-6">
                                    <table  width="100%"> <tr><td style="font-weight: 700; color:Blue; vertical-align:text-top;" width="45%">Semester :</td><td width="60%"><asp:Label ID="lblsemester" runat="server" Text='<%#Eval("year") %>'></asp:Label></td></tr></table>
                                 </div>
                                <div class="col-md-6">
                                    <table  width="100%"> <tr><td style="font-weight: 700; color:Blue; vertical-align:text-top;" width="45%">Upload Date :</td><td width="60%"><asp:Label ID="lbldate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"datetime","{0:mm/dd/yyyy}") %>'></asp:Label></td></tr></table>
                                 </div>
                                 <div class="col-md-6">
                                    <table  width="100%"> <tr><td style="font-weight: 700; color:Blue; vertical-align:text-top;" width="45%">Total Views :</td><td width="60%"><asp:Label ID="lbldview" runat="server" Text='<%#Eval("dview")%>'></asp:Label></td></tr></table>
                                 </div>
                                <div class="col-md-6">
                                    <table  width="100%"> <tr><td style="font-weight: 700; color:Blue; vertical-align:text-top;" width="45%">Total Downloads :</td><td width="60%"><asp:Label ID="lblddownload" runat="server" Text='<%#Eval("ddownload") %>'></asp:Label></td></tr></table>
                                 </div>
                                 </a>
                            </AlternatingItemTemplate>
                            <SeparatorTemplate>
                            <hr style="height:1px; width:100%; padding:1; background-color:Black; color:Black;"/>
                            </SeparatorTemplate>
                            </asp:Repeater>
     </ContentTemplate>
     </asp:UpdatePanel>
</asp:Content>

