<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="submit.aspx.cs" Inherits="submit" %>

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

    <div class="col-md-4" style="padding:1%;"><h4>Type</h4>
        <asp:DropDownList Width="90%" ID="dropd_search_type" runat="server">
            <asp:ListItem>---Select---</asp:ListItem>
            <asp:ListItem>Previous Year Paper</asp:ListItem>
            <asp:ListItem>Notes</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="col-md-4" style="padding:1%;"><h4>Course</h4>
        <asp:DropDownList Width="90%" ID="dropd_search_course" runat="server" 
            onselectedindexchanged="dropd_search_course_SelectedIndexChanged" 
            AutoPostBack="True">
        <asp:ListItem>---Select---</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="col-md-4" style="padding:1%;"><h4>Branch</h4>
        <asp:DropDownList Width="90%" ID="dropd_search_branch" runat="server" 
            AutoPostBack="True" 
            onselectedindexchanged="dropd_search_branch_SelectedIndexChanged">
        <asp:ListItem>---Select---</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="col-md-4" style="padding:1%;"><h4>Semester</h4>
        <asp:DropDownList Width="90%" ID="dropd_search_sem" runat="server">
        <asp:ListItem>---Select---</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="col-md-4" style="padding:1%;"><h4>File Name</h4>
        <asp:TextBox ID="txtbname" Width="90%"  runat="server"></asp:TextBox>
    </div>
    <div class="col-md-4" style="padding:1%;"><h4>File URL</h4>
        <asp:TextBox Width="90%" ID="txtburl" runat="server"></asp:TextBox>
    </div>
    <div class="col-md-4" style="padding:1%;">
        <asp:Button Width="90%" ID="btnupload" runat="server" Text="Upload" Height="30px"
            BackColor="#F26649" ForeColor="White" BorderColor="#F26649" 
            onclick="btnupload_Click" />
    </div>
    <div class="clearfix"></div><br />
    <div class="col-md-12">
    <asp:Label ID="lblmsg" runat="server"  ForeColor="Red" Text="" Font-Bold="True"></asp:Label>
    <br /><br />
    <h4>Entered URL</h4><br />
    <h5 style="color:red;">
    1) Must be correct and have valid contents. 
    </h5><br />
    <h5 style="color:red;">
    2) Use right name and detail so that it will easily searched by others.
    </h5><br />
    <h5 style="color:red;">
    3) This document will live once admin approve it.
    </h5><br />
    </div>
    
    <div class="clearfix"></div><br />
     <h3 style="color:Navy;">ABOUT THE UNIVERSITY</h3><br />
     <h4 >
     <div style=" font-weight:400; text-align:justify; border-bottom:5; border-bottom-color:#F26649; padding-bottom:20px; border-style: none none solid none; border-bottom-width: 5px;">
     Harcourt Butler Technical University Kanpur has been established in year 2016 by the Government of Uttar Pradesh with a view for making it a leading Residential University to become a Centre of Excellence with focus on Research and Development and Incubation in the field of Engineering, Technology, Basic & Applied Sciences, Humanities, Social Science & Management Architecture and other professional courses. HBTU aims to promote studies, research & innovation in Engineering areas of higher education, to enhance skill development through continuing education programme and knowledge and to achieve excellence in higher Technical education.   
        </div>
        </h4>
         <br />
         <h3 style="color:Navy;">
             THE RIGHT TO INFORMATION ACT – 2005</h3>
         <br />
         <h4>
         <div style=" font-weight:400; text-align:justify; border-bottom:5; border-bottom-color:#F26649; padding-bottom:20px; border-style: none none solid none; border-bottom-width: 5px;">
         1. WHAT IS RIGHT TO INFORMATION ACT 2005?<br />1.1 The Government of India has 
         enacted “The Right to Information Act 2005” which has come into effect w.e.f. 
         12.10.2005 to provide for setting out the practical regime of right to 
         information for citizens to secure access to information under the control of 
         Public Authorities in order to promote transparency and accountability in the 
         working of Public authorities.
         <br /><br />2. WHAT DOES RIGHT TO INFORMATION MEAN?<br />2.1 It 
         includes the right to access to the information which is held by or under the 
         control of any public authority and includes the right to inspect the works, 
         documents, records, take notes, extracts or certified copies of documents or 
         records and take certified samples of the materials and obtain information in 
         the form of printouts diskettes, floppies, tapes, video cassettes or in any 
         other electronic mode or through printouts.
         <br /><br />3. WHO CAN ASK FOR INFORMATION?<br />3.1 
         Subject to the provisions of the Act, all citizens have the right to 
         information. Since as per the Act information can be furnished only to citizens 
         of India , the applicant for request will have to give citizen status. The 
         applicant for request should also give contact details (postal address, 
         telephone number, Fax number, e-mail address )<br /><br />4. WHICH INFORMATION IS EXEMPT 
         FROM DISCLOSURE?<br />4.1 The Act provides under Sections 8 and 9, certain categories 
         of information that are exempt from disclosure to the citizens. The citizens may 
         therefore, refer to the aforesaid sections of the Act before submitting a 
         request for information.<br /><br />5. PROCEDURE FOR REQUEST FOR INFORMATION:<br />5.1 A request 
         seeking information shall be made to Central Public Information Officer in 
         writing or through electronic means in English or Hindi or in the Official 
         Language of the area in which application is made, specifying the particulars of 
         information sought for along with the prescribed fee. Reasonable assistance 
         shall be rendered to reduce the oral request to writing.<br /><br />6. PAYMENT OF 
         PRESCRIBED FEE:<br />6.1 A request for obtaining information under sub-section (1) of 
         Section 6 shall be accompanied by an application fee of rupees ten (Rs. 10/-) by 
         way of cash against proper receipt or by demand draft or bankers cheque payable 
         to the Bank and or by Indian Postal Order.<br />6.2 For providing the information 
         under sub-section (1) of Section 7, the fee shall be charged by way of cash 
         against proper receipt or by demand draft or bankers cheque payable to the Bank 
         at the following rates :- Rupees two (Rs. 2/-) for each page (in A4 or A3 size 
         paper) created or copied Actual charge or cost price of a copy in larger size 
         paper Actual cost or price for samples or models; and For inspection of records, 
         no fee for the first hour and a fee of rupees five (Rs. 5/-) for each subsequent 
         hour (or fraction thereof)<br />6.3 For providing the information under sub-section 
         (5) of Section 7 the fee shall be charged by way of cash against proper receipt 
         or by demand draft or bankers cheque payable to the Bank at the following rates 
         :- For information provided in diskette or floppy rupees fifty (Rs. 50/-) per 
         diskette or floppy : and For information provided in printed form at the price 
         fixed for such publication or rupees two (Rs. 2/-) per page of photocopy for 
         extracts from the publication.<br />6.4 If further fees representing the cost of 
         providing information is determined, then the same will be intimated in writing 
         with calculation details of how the amount has been arrived at.<br />6.5 Exemption 
         for payment of Application Fee and cost of expenditure incurred in providing the 
         information, in certain cases. Applicants who are below poverty line are 
         exempted.<br /><br />7. PROCESSING OF REQUEST AND GROUNDS FOR REJECTION IN CERTAIN CASES :
         <br />7.1 The CPIO shall process the request for providing the information and dispose 
         of the same either by providing the information or rejecting the request within 
         the time.<br />7.2 Central Public Information Officer may reject a Request for 
         information where such a request for providing access would involve an 
         infringement of copyright subsisting in a person other than the State.<br />7.3 
         PARTIAL DISCLOSURE OF INFORMATION: Access may be provided to that part of the 
         record, which does not contain any information, which is exempt from disclosure, 
         and which can reasonably be severed from any part that contains exempt 
         information.
         </div>
         </h4>
        </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>

