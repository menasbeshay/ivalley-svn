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
            <iframe width="470" height="150" frameborder="0" scrolling="no" marginheight="0"
                marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Heliopolis,+Cairo+Governorate,+Egypt&amp;aq=0&amp;oq=he&amp;sll=30.059915,31.26202&amp;sspn=0.23742,0.308647&amp;ie=UTF8&amp;hq=&amp;hnear=Heliopolis,+Cairo+Governorate,+Egypt&amp;t=m&amp;ll=30.091227,31.322622&amp;spn=0.00557,0.020127&amp;z=15&amp;output=embed">
            </iframe>            
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
