<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
                     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- login-page -->
	<div class="login">
		<div class="login-grids">
			<div class="col-md-12 log">
					 <h3 class="tittle">Login <i class="glyphicon glyphicon-lock"></i></h3>
					 <p>Welcome, Please Enter the Following to Continue.</p>
					 <h5>Email:</h5>
                     <asp:TextBox class="logtxt" ID="txtbusr" runat="server" Width="270px"></asp:TextBox>
						 <br /><br /><h5>Password:</h5>
                     <asp:TextBox class="logtxt" ID="txtbpass" runat="server" TextMode="Password" Width="270px"></asp:TextBox>
                     
                     <br /><br /><asp:Button Class="logbtn" ID="btnlog" runat="server" Width="100px" Text="Login" onclick="btnlog_Click" />
                     <br /><br /><a href="mailverification.aspx?new=true">Forgot Password ?</a><asp:Label ID="lblmsg" runat="server" ForeColor="Red" Text=""></asp:Label>
		<h3 class="tittle">New Registration <i class="glyphicon glyphicon-file"></i></h3>
					<p>Sign Up To Get Access To The Restricted Features Of This Site and Able To Upload Papers, Notes and Envolve In Discussion.</p>
					<a href="registration.aspx" class="hvr-bounce-to-bottom button">Create An Account</a>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
<!-- //login-page -->
</asp:Content>

