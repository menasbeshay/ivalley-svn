<%@ Page Title="Contact us" Language="C#" MasterPageFile="~/MasterPages/Inner.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Website.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="javascripts/jquery.validationEngine-en.js" type="text/javascript"></script>
    <script src="javascripts/jquery.validationEngine.js" type="text/javascript"></script>
    <link href="stylesheets/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
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
               By contacting our sales team … by mail or phone we will be always ready to handle your request.<br />
               Heliopolis, Cairo Egypt. -  0020 1228404078.  sales@i-valley.com.
               </p>
            
            <div class="large-6 columns">
            <ul>
                
                <li>Michael H. Youssef <br /> Business Development Manager
                <br /> michael@i-valley.com <br /> 0020 1228404078</li>
                <li>Mena S. Beshay <br /> Chief Technical Officer <br />

                mena@i-valley.com <br /> 0020 100356608</li>
                
                </ul>
                </div>

                <div class="large-6 columns">
            <ul>
                
                <li>Wael O. El Badry <br /> Technical Analyst & Engagement Manager <br /> wael@i-valley.com <br /> 0020 1222465656 </li>
                <li>Ahmed Reda <br /> Sales Manager <br />
                ahmed@i-valley.com <br /> 0020 1228670277</li>

                </ul>
                </div>
                
                also you can contact us by :
                <ul style="list-style:none;">
                    <li style="float:left;margin:5px;">
                        <img src="images/facebook.png" style="vertical-align:middle" />
                        <a href="http://www.facebook.com/IvalleySoftware">IvalleySoftware</a></li>
                    <li style="float: left; margin: 5px;">
                        <img src="images/twitter.png" style="vertical-align: middle" />
                        <a href="http://twitter.com/ivalley1">Ivalley1</a></li>
                    <li style="float: left; margin: 5px;">
                        <img src="images/skype.png" style="vertical-align: middle" />
                        I-Valley</li>
                </ul>
        </div>
        <div id="contactForm" class="large-6 columns">
            <h2>
                Contact Form</h2>
            <div class="large-12 columns inputContainer">
                <p>
                    Name:</p>
                <label class="forName" for="name">
                </label>
                <asp:TextBox ID="uiTextBoxName" runat="server" class="validate[required]"></asp:TextBox>
            </div>
            <div class="large-12 columns inputContainer">
                <p>
                    Email:</p>
                <label class="forEmail" for="eMail">
                </label>
                <asp:TextBox ID="uiTextBoxMail" runat="server" class="validate[required,custom[email]]"></asp:TextBox>
            </div>
            <div class="large-12 columns inputContainer">
                <p>
                    Message:</p>
                <label class="forMessage" for="message">
                </label>
                <asp:TextBox ID="uiTextBoxMsg" runat="server" class="validate[required]"></asp:TextBox>
            </div>
            <div class="large-12 columns submitContainer">
                <asp:Button ID="uiButtonsubmit" runat="server" Text="Send &gt;" />                
            </div>
        </div>
    </div>
    <!--Project Image Toogle-->
    <script type="text/javascript">
  	$(document).ready(function(e) {        
        $("form").validationEngine();
    });
  </script>
</asp:Content>
