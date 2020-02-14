<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="regitration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="css/style.css" type="text/css" />
<style type="text/css">
                     .logbtn
                     {
                         border-radius:5px;
                         font-size:20px;
                         font-weight:600;
                     background-color:#4a245e;
                     border-color:#4a245e;
                     color:White;
                     }
                     .logbtn:hover
                     {
                     background-color:#ec6349;
                     border-color:#ec6349;
                     }
                     .logtxt
                     {
                         border-radius:3px;
                     }
                     .modal1
{
    position: fixed;
    z-index: 999;
    height: 100%;
    width: 100%;
    top: 0;
    left:0;
    background-color: white;
    opacity: 0.95;
    -moz-opacity: 0.8;
}
.center1
{
    text-align:center;
    z-index: 1000;
    margin: 200px auto;
    padding: 10px;
    width: 130px;
    background-color: White;
    border-radius: 10px;
    opacity: 2;
}
.load1
{
    height: 128px;
    width: 128px;
}
                     </style>
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
<Triggers>
<asp:AsyncPostBackTrigger ControlID="btnreg" /></Triggers>
                        <ContentTemplate>
          
<!-- register -->
			<div class="sign-up-form">
				 <h3 class="tittle">Registration <i class="glyphicon glyphicon-inbox"></i></h3>
					<p>Sign Up To Get Access To The Restricted Features Of This Site and Able To Upload Papers, Notes and Envolve In Discussion.</p>
				<div class="sign-up">
					 <h3 class="tittle reg">Personal Information <i class="glyphicon glyphicon-user"></i></h3>
					<div class="sign-u">
						<div class="sign-up1">
							<h4 class="a">First Name* :</h4>
						</div>
						<div class="sign-up2">
                            <asp:TextBox ID="txtbfname" runat="server" onfocus="if (this.value == 'First Name') {this.value = '';};" onblur="if (this.value == '') {this.value = 'First Name';}" MaxLength="25" Text="First Name"></asp:TextBox>
                        </div>
						<div class="clearfix"> </div>
					</div>
					<div class="sign-u">
						<div class="sign-up1">
							<h4 class="b">Last Name* :</h4>
						</div>
						<div class="sign-up2">
							<asp:TextBox ID="txtblname" runat="server"  onfocus="if (this.value == 'Last Name') {this.value = '';};" onblur="if (this.value == '') {this.value = 'Last Name';}" MaxLength="25" Text="Last Name"></asp:TextBox>
                        </div>
						<div class="clearfix"> </div>
					</div>
                    <div class="sign-u">
						<div class="sign-up1">
							<h4 class="b">Date of Birth* :</h4>
                            
						</div>
						<div class="sign-up2">
                            
							<asp:TextBox ID="txtbdob" runat="server"  
                               TextMode="SingleLine" Text="dd/mm/yyyy" ForeColor="Gray" CausesValidation="True" ReadOnly="true"></asp:TextBox>
                            <asp:LinkButton ID="opencal" ForeColor="#F26649" runat="server" CausesValidation="False" OnClick="opencal_Click">Change Date</asp:LinkButton>                               
                            <asp:Panel ID="Panel1" runat="server">
                                <asp:DropDownList ID="dropd_cal_month"  runat="server"></asp:DropDownList><asp:DropDownList ID="dropd_cal_year" runat="server"></asp:DropDownList>
                                <asp:Calendar ID="caldob" runat="server" OnSelectionChanged="caldob_SelectionChanged"></asp:Calendar>
                            </asp:Panel>
                            
                        
                        </div>
						<div class="clearfix"> </div>
					</div>
                    <div class="sign-u">
						<div class="sign-up1">
							<h4 class="c">Mobile Number* :</h4>
						</div>
						<div class="sign-up2">
							<asp:TextBox ID="txtbcont" runat="server"  onfocus="if (this.value == 'Mobile Number') {this.value = '+91';};" onblur="if (this.value == '+91') {this.value = 'Mobile Number';}" MaxLength="13" Text="Mobile Number"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ErrorMessage="Invalid Mobile Number" ControlToValidate="txtbcont" ValidationExpression="^([0|\+[0-9]{1,5})?([6-9][0-9]{9})$"></asp:RegularExpressionValidator>
                        </div>
						<div class="clearfix"> </div>
					</div>
					
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
					 <h3 class="tittle reg">Login Information <i class="glyphicon glyphicon-off"></i></h3>
					<div class="sign-u">
						<div class="sign-up1">
							<h4 class="d">Password*:</h4>
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
							<asp:TextBox ID="txtbcpass" runat="server" Text="Password" TextMode="Password" onfocus="if (this.value == 'Password') {this.value = '';};" onblur="if (this.value == '') {this.value = 'Password';}" MaxLength="50"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" ForeColor="Red" runat="server" ErrorMessage="Password Not Match" ControlToValidate="txtbcpass" ControlToCompare="txtbpass" Display="Dynamic" SetFocusOnError="True"></asp:CompareValidator>
                            </div>
						<div class="clearfix"> </div>
					</div>
                    <asp:Button ID="btnreg" Class="logbtn" runat="server" Width="120px" Text="Register" onclick="btnreg_Click" />
                    <asp:Label ID="lblmsg" ForeColor="Red" runat="server" Text=""></asp:Label>
				</div>
			</div>
<!-- //register -->
</ContentTemplate>
</asp:UpdatePanel>
<!-- //login-page -->
</asp:Content>

