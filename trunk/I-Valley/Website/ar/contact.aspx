<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ArInner.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Website.ar.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="banner" class="contact">
        <p style="color: #a82743" class="ui-datepicker-rtl">
            اتصل بنا</p>
        <span>
        <p class="ui-datepicker-rtl">
                C</p>
        </span>
    </div>
     <div id="contactWrapp" class="row">
        <div id="contactForm" class="large-6 columns">
            <h2 class="ui-datepicker-rtl">
               اتصل بنا</h2>
            <div class="large-12 columns inputContainer">
                <p class="ui-datepicker-rtl">
                    الاسم:</p>
                <label class="forName" for="name">
                </label>
                <asp:TextBox ID="uiTextBoxName" runat="server" class="validate[required]"></asp:TextBox>
            </div>
            <div class="large-12 columns inputContainer">
                <p class="ui-datepicker-rtl">
                    البريد الاكترونى:</p>
                <label class="forEmail" for="eMail">
                </label>
                <asp:TextBox ID="uiTextBoxMail" runat="server" class="validate[required,custom[email]]"></asp:TextBox>
            </div>
            <div class="large-12 columns inputContainer">
                <p class="ui-datepicker-rtl">
                    نص الرسالة:</p>
                <label class="forMessage" for="message">
                </label>
                <asp:TextBox ID="uiTextBoxMsg" runat="server" class="validate[required]"></asp:TextBox>
            </div>
            <div class="large-12 columns submitContainer">
                <asp:Button ID="uiButtonsubmit" runat="server" Text="&lt; ارسل" OnClick="uiButtonsubmit_Click" />
            </div>
        </div>
   
        <div id="contactInfo" class="large-6 columns" style="direction: rtl">
            <h2 class="ui-datepicker-rtl">
                معلومات الاتصال</h2>
            <img src="../images/contact/map.jpg" />
            <p class="ui-datepicker-rtl">
                للاتصال بفريق المبيعات لدينا عن طريق البريد أو الهاتف ...وسوف نكون دائما على 
                استعداد للرد على طلبك.</p>
            <ul style="text-align:right;">
                <li class="ui-datepicker-rtl">العنوان: هيليوبلس (مصر الجديدة), القاهرة , مصر.</li>
                <li class="ui-datepicker-rtl">التليفون: 0020 1228404078.</li>
                <li class="ui-datepicker-rtl">البريد الاكترونى: sales@i-valley.com.</li>
                <li class="ui-datepicker-rtl">Business Development Manager : michael@i-valley.com</li>
                <li class="ui-datepicker-rtl">Chief Technical Officer : Mena@i-valley.com</li>
                <li class="ui-datepicker-rtl">Sales Manager : sales@i-valley.com</li>
                <li class="ui-datepicker-rtl">HR Manager : HR@i-valley.com - jobs@i-valley.com</li>
            </ul>
            كما يمكنكم التواصل معنا عبر : 
            <ul style="list-style: none;direction:rtl;">
                <li style="float: right; ">
                    
                    <a href="http://www.facebook.com/IvalleySoftware">IvalleySoftware</a>
                    <img src="../images/facebook.png" style="vertical-align: middle;padding:5px;" /></li>
                <li style="float: right; margin: 5px;">
                    
                    <a href="http://twitter.com/ivalley1">Ivalley1</a><img src="../images/twitter.png"
                        style="vertical-align: middle; padding: 5px;" /></li>
                <li style="float: right; margin: 5px;">
                    
                    I-Valley<img src="../images/skype.png" style="vertical-align: middle; padding: 5px;" /></li>
            </ul>
        </div>
    
    </div>

    <!--Project Image Toogle-->
    <script type="text/javascript">
  	$(document).ready(function(e) {        
        $("form").validationEngine();
    });
  </script>
</asp:Content>
