<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="usrsetting.aspx.cs" Inherits="usrsetting" %>


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
<!-- register -->
			<div class="sign-up-form">
				 <h3 class="tittle">Setting <i class="glyphicon glyphicon-file"></i></h3>
					<p></p>
				<div class="sign-up">
					 <h3 class="tittle reg">Personal Information <i class="glyphicon glyphicon-user"></i></h3>
					<div class="sign-u">
						<div class="sign-up1">
							<h4 class="a">User Name :</h4>
						</div>
						<div class="sign-up2">
                            <asp:TextBox ID="txtbfname" ValidationGroup="pers" runat="server" MaxLength="25" ReadOnly="True"></asp:TextBox>
                        </div>
						<div class="clearfix"> </div>
					</div>
					
                    <div class="sign-u">
						<div class="sign-up1">
							<h4 class="b">Date of Birth :</h4>
						</div>
						<div class="sign-up2">

							<asp:TextBox ID="txtbdob" ValidationGroup="pers" runat="server"  
                                ReadOnly="True"></asp:TextBox>
                        </div>
						<div class="clearfix"> </div>
					</div>
                    <div class="sign-u">
						<div class="sign-up1">
							<h4 class="c">Mobile Number :</h4>
						</div>
						<div class="sign-up2">
							<asp:TextBox ID="txtbcont" ValidationGroup="pers" runat="server" ReadOnly="True" MaxLength="13"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="pers" runat="server" ForeColor="Red" ErrorMessage="Invalid Mobile Number" ControlToValidate="txtbcont" ValidationExpression="^([0|\+[0-9]{1,5})?([6-9][0-9]{9})$" Enabled="False"></asp:RegularExpressionValidator>
                        </div>
						<div class="clearfix"> </div>
					</div>
					<div class="sign-u">
						<div class="sign-up1">
							<h4 class="c">Email Address :</h4>
						</div>
						<div class="sign-up2">
                       <asp:TextBox ID="txtbemail" runat="server" BorderColor="White" ReadOnly="True" ValidationGroup="pers" MaxLength="50"></asp:TextBox><asp:LinkButton
                           ID="lnkbtnveri" runat="server" PostBackUrl="~/mailverification.aspx" Font-Bold="True" Font-Size="Larger">  Verify Now</asp:LinkButton>
                         </div>
						<div class="clearfix"> </div>
					</div>
                    <asp:Button ID="btnedit" runat="server" ValidationGroup="pers" Text="Edit" onclick="btnedit_Click" />
                     <br /><asp:LinkButton ID="LinkButton1" ForeColor="Blue" runat="server" onclick="LinkButton1_Click">Change Password</asp:LinkButton>
                    </div>
                <asp:Panel ID="panelpass" Visible="false" runat="server">
                <div class="sign-up">
					 <h3 class="tittle reg">Change Password <i class="glyphicon glyphicon-user"></i></h3>
					<div class="sign-u">
						<div class="sign-up1">
							<h4 class="a">Current Password* :</h4>
						</div>
						<div class="sign-up2">
                            <asp:TextBox ValidationGroup="pass" ID="txtbcpass" runat="server" MaxLength="50"></asp:TextBox>
                        </div>
						<div class="clearfix"> </div>
					</div>
					<div class="sign-u">
						<div class="sign-up1">
							<h4 class="d">New Password*:</h4>
						</div>
						<div class="sign-up2">
                            <asp:TextBox ValidationGroup="pass" ID="txtbpass" runat="server" Text="Password" TextMode="Password" onfocus="if (this.value == 'Password') {this.value = '';};" onblur="if (this.value == '') {this.value = 'Password';}" MaxLength="50"></asp:TextBox>
                            <asp:RegularExpressionValidator ValidationGroup="pass" ID="RegularExpressionValidator3" ForeColor="Red" runat="server" ErrorMessage="Password Must Be Atleast 8 Digit Long" ControlToValidate="txtbpass" ValidationExpression="^.{8,50}$" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </div>
						<div class="clearfix"> </div>
					</div>
					<div class="sign-u">
						<div class="sign-up1">
							<h4>Confirm Password*:</h4>
						</div>
						<div class="sign-up2">
							<asp:TextBox ID="txtbpass1" ValidationGroup="pass" runat="server" Text="Password" TextMode="Password" onfocus="if (this.value == 'Password') {this.value = '';};" onblur="if (this.value == '') {this.value = 'Password';}" MaxLength="50"></asp:TextBox>
                            <asp:CompareValidator ValidationGroup="pass" ID="CompareValidator1" ForeColor="Red" runat="server" ErrorMessage="Password Not Match" ControlToValidate="txtbpass1" ControlToCompare="txtbpass" Display="Dynamic" SetFocusOnError="True"></asp:CompareValidator>
                            </div>
						<div class="clearfix"> </div>
					</div>
                    <asp:Button ID="btnreg" ValidationGroup="pass" runat="server" Text="Change" onclick="btnreg_Click" />
                    </div> 
                </asp:Panel>
                <asp:Label ID="lblmsg" ForeColor="Red" runat="server" Text=""></asp:Label>
			</div>
<!-- //register -->
</ContentTemplate>
</asp:UpdatePanel>
    
</asp:Content>

