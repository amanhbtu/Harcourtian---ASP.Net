<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

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
<Triggers>
<asp:AsyncPostBackTrigger ControlID="btncont" /></Triggers>
                        <ContentTemplate>

<div class="contact">
<div class="col-md-12">
<!--- ads--->
</div>
	   <h3 class="tittle">Find Us <i class="glyphicon glyphicon-map-marker"></i></h3>
		<div class="contact-left">
			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3570.8117777939756!2d80.30554175376895!3d26.49400454562778!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xa632793a3bcf1b33!2sHBTU!5e0!3m2!1sen!2sin!4v1514930479644" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
		</div>
		<div class="contact-right">
			<p class="phn-bottom">HBTU
					<span>Harcourt Butler Technical University</span></p>
			<p class="lom">Nawabganj Kanpur,<br />Uttar Pradesh - 208002</p>
		</div>
		<div class="clearfix"> </div>
                        
		<div class="contact-left1">
			<h3>Contact Us With <span>Any Questions</span></h3>
			<div class="in-left">
					
                    <asp:TextBox ID="txtbusr" runat="server" 
                        onfocus="if (this.value == 'Enter Your Name') {this.value ='';}" 
                        onblur="if (this.value == '') {this.value ='Enter Your Name';}" 
                        Text="Enter Your Name" MaxLength="50"></asp:TextBox>
                        <br />
					<asp:TextBox ID="txtbemail" runat="server" 
                        onfocus="if (this.value == 'Enter Your Email') {this.value ='';}" 
                        onblur="if (this.value == '') {this.value ='Enter Your Email';}" 
                        Text="Enter Your Email" MaxLength="50"></asp:TextBox>
		     		<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="Invalid Email" ControlToValidate="txtbemail" ForeColor="Red" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="txtbcont" runat="server" 
                        onfocus="if (this.value == 'Enter Your Contact Number') {this.value ='+91';}" 
                        onblur="if (this.value == '+91'||this.value=='') {this.value ='Enter Your Contact Number';}" 
                        Text="Enter Your Contact Number" MaxLength="13"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Mobile Number"  ControlToValidate="txtbcont" ForeColor="Red" 
                        ValidationExpression="^([0|\+[0-9]{1,5})?([6-9][0-9]{9})$"></asp:RegularExpressionValidator>
				
				
			</div>
			<div class="in-right">
                    <asp:TextBox ID="txtbmsg" runat="server" 
                        onfocus="if (this.value == 'Message') {this.value ='';}" 
                        onblur="if (this.value == '') {this.value ='Message';}" Text="Message" 
                        TextMode="MultiLine" MaxLength="100"></asp:TextBox>
               
                        <asp:Button ID="btncont" runat="server" Text="Submit" onclick="btncont_Click" />
                        <asp:Label ID="lblmsg" runat="server" Text="" ForeColor="Red"></asp:Label>
                        
            </div>
            <div class="clearfix"> </div>
		</div>
		
        <div class="clearfix"> </div>
<!-- //contact -->
			</div>
            </ContentTemplate>
            </asp:UpdatePanel>
</asp:Content>

