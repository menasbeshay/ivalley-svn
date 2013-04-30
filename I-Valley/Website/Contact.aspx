<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Inner.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Website.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="banner" class="contact">
        <p style="color: #a82743">
            Contact Us</p>
        <span>
            <p>
                C</p>
        </span>
    </div>
    <div id="contactWrapp" class="row">
        <div id="contactInfo" class="large-6 columns">
            <h2>
                Contact Info</h2>
            <img src="images/contact/map.jpg" />
            <p>
               By contacting our sales team … by mail or phone we will be always ready to handle your request.</p>
            <p>
            <ul>
                <li>Address: Heliopolis, Cairo Egypt.</li>
                <li>Phone: 0020 1228404078.</li>
                <li>Email: sales@i-valley.com.</li>
                </ul>
                </p>
        </div>
        <div id="contactForm" class="large-6 columns">
            <h2>
                Contact Form</h2>
            <div class="large-12 columns inputContainer">
                <p>
                    Name:</p>
                <label class="forName" for="name">
                </label>
                <asp:TextBox ID="uiTextBoxName" runat="server"></asp:TextBox>
            </div>
            <div class="large-12 columns inputContainer">
                <p>
                    Email:</p>
                <label class="forEmail" for="eMail">
                </label>
                <asp:TextBox ID="uiTextBoxMail" runat="server"></asp:TextBox>
            </div>
            <div class="large-12 columns inputContainer">
                <p>
                    Message:</p>
                <label class="forMessage" for="message">
                </label>
                <asp:TextBox ID="uiTextBoxMsg" runat="server"></asp:TextBox>
            </div>
            <div class="large-12 columns submitContainer">
                <asp:Button ID="uiButtonsubmit" runat="server" Text="Send &gt;" />                
            </div>
        </div>
    </div>
    <!--Project Image Toogle-->
    <script type="text/javascript">
  	$(document).ready(function(e) {
        $('.thumbLinks a').click(function(e) {
			var imgSrc = $(this).attr('href');
            e.preventDefault();
			
			$('#projectInfo img').attr('src', imgSrc);
        });
    });
  </script>
</asp:Content>
