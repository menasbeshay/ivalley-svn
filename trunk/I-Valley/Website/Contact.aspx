<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Inner.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Website.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="banner">
        <p>
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
            <img src="images/contact/googleMap.png" alt="Google Map">
            <p>
                Et dis elementum. Amet velit! Urna tincidunt? Odio aenean eros phasellus, a auctor
                purus, sit platea, urna dapibus urna dictumst dignissim.</p>
            <p>
                Risus velit, in ultrices aenean elementum, augue nunc lundium eu dictumst phasellus
                a cum integer? Penatibus enim penatibus sed proin.</p>
        </div>
        <div id="contactForm" class="large-6 columns">
            <h2>
                Contact Form</h2>
            <div class="large-12 columns inputContainer">
                <p>
                    Name:</p>
                <label class="forName" for="name">
                </label>
                <input type="text" name="email" id="name">
            </div>
            <div class="large-12 columns inputContainer">
                <p>
                    Email:</p>
                <label class="forEmail" for="eMail">
                </label>
                <input type="email" name="email" id="eMail">
            </div>
            <div class="large-12 columns inputContainer">
                <p>
                    Message:</p>
                <label class="forMessage" for="message">
                </label>
                <input type="text" name="message" id="message">
            </div>
            <div class="large-12 columns submitContainer">
                <input type="submit" value="Send &gt;">
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
