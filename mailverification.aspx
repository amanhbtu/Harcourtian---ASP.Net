<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="mailverification.aspx.cs" Inherits="mailverification" %>

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
				 <h3 class="tittle">
                     <asp:Label ID="Label1" runat="server" Text="Verify Your Email Address"></asp:Label> <i class="glyphicon glyphicon-mail"></i></h3>
					<p>One Time Password Will Send To Your Email To Verify It's You</p>
				<div class="sign-up">
					 
					<div class="sign-u">
						<div class="sign-up1">
							<h4 class="c">Email Address* :</h4>
						</div>
						<div class="sign-up2">
							<asp:TextBox ID="txtbemail" runat="server" onfocus="if (this.value == 'Email Address') {this.value = '';};" onblur="if (this.value == '') {this.value = 'Email Address';}" MaxLength="50" Text="Email Address"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" runat="server" ErrorMessage="Invalid Email Address" ControlToValidate="txtbemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </div>
						<div class="clearfix"> </div>
					</div>
                    <asp:Panel ID="pnlotp" Visible="false" runat="server">
                    <div class="sign-u">
						<div class="sign-up1">
							<h4 class="c">OTP* :</h4>
						</div>
						<div class="sign-up2">
							<asp:TextBox ID="txtbotp" runat="server" MaxLength="8"></asp:TextBox>
                            <br />
                            <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Resend OTP</asp:LinkButton>
                            </div>
						<div class="clearfix"> </div>
					</div>
                    </asp:Panel>
                    <asp:Panel ID="pnlpass" Visible="false" runat="server">
                    <div class="sign-u">
						<div class="sign-up1">
							<h4 class="d">New Password*:</h4>
						</div>
						<div class="sign-up2">
                            <asp:TextBox ID="txtbpass" runat="server" Text="Password" TextMode="Password" onfocus="if (this.value == 'Password') {this.value = '';};" onblur="if (this.value == '') {this.value = 'Password';}" MaxLength="50"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ForeColor="Red" runat="server" ErrorMessage="Password Must Be Atleast 8 Digit Long" ControlToValidate="txtbpass" ValidationExpression="^.{8,50}$" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </div>
						<div class="clearfix"> </div>
					</div>
					<div class="sign-u">
						<div class="sign-up1">
							<h4>Confirm Password*:</h4>
						</div>
						<div class="sign-up2">
							<asp:TextBox ID="txtbcpass" runat="server" Text="Password" TextMode="Password" onfocus="if (this.value == 'CPassword') {this.value = '';};" onblur="if (this.value == '') {this.value = 'CPassword';}" MaxLength="50"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" ForeColor="Red" runat="server" ErrorMessage="Password Not Match" ControlToValidate="txtbcpass" ControlToCompare="txtbpass" Display="Dynamic" SetFocusOnError="True"></asp:CompareValidator>
                            </div>
						<div class="clearfix"> </div>
					</div>
                    </asp:Panel>
					<asp:Button ID="btnotp" runat="server" Text="Send OTP" onclick="btnotp_Click" />
                    <br/><asp:Label ID="lblmsg" ForeColor="Red" runat="server" Text=""></asp:Label>
				</div>
			</div>
<!-- //register -->
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

