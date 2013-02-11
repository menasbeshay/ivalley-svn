<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ARBannerMaster.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Obtravel.Arabic.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>إتصل بنا </h1>
    <div class="contactus">
        <div class="left">
        </div>
        <div class="right">
            <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
            <div class="clear10px"></div>
            <h2>يمكنك أيضاً زيارتنا:</h2>
                       
            <div id="map_canvas" style="width:640px; height:480px"></div>  
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
    function initialize() {
        var latlng = new google.maps.LatLng(30.05496, 31.3538);
        var settings = {
            zoom: 16,
            center: latlng,
            mapTypeControl: true,
            mapTypeControlOptions: { style: google.maps.MapTypeControlStyle.DROPDOWN_MENU },
            navigationControl: true,
            navigationControlOptions: { style: google.maps.NavigationControlStyle.SMALL },
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };


        var map = new google.maps.Map(document.getElementById("map_canvas"), settings);
        var contentString = '<div id="contentarea">' +
					'<div id="siteNotice">' +
					'</div>' +
					'<h1 >On Board Travel</h1>' +
					'</div>';
        var infowindow = new google.maps.InfoWindow({
            content: contentString,
            maxWidth: 400
        });

        var companyPos = new google.maps.LatLng(30.05496, 31.3538);
        var companyMarker = new google.maps.Marker({
            position: companyPos,
            map: map,
            title: "On Board Travel"
        });

        google.maps.event.addListener(companyMarker, 'click', function () {
            infowindow.open(map, companyMarker);
        });

    }
    initialize();    
</script>
            
            <div class="clear10px"></div>
            <h2>
               راسلنا : </h2>
            <div class="clear10px">
            </div>
            <asp:Label ID="uiLabelSuccess" runat="server" Text="شكرا على اتصالك بـ (أون بورد ترافيل) سوف يتم إرسال الرد على رسالتك 
في أقرب وقت ممكن ..." Font-Bold="True" ForeColor="#66FF99" Visible="False"></asp:Label>
            <asp:Label ID="uiLabelFail" runat="server" Text="عفواً حدث خطأ. يرجى المحاولة مرة أخرى في وقت لاحق."
                Font-Bold="True" ForeColor="#C76E1F" Visible="False"></asp:Label>
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 75px;">
                القسم </div>
            <div class="smallrightHeight">
                <asp:DropDownList ID="uiDropDownListSection" runat="server" ValidationGroup="Contact">
                    <asp:ListItem Value="-1">إختر ...</asp:ListItem>
                    <asp:ListItem Value="0">رحلات وبرامج </asp:ListItem>
                    <asp:ListItem Value="1">حج وعمرة</asp:ListItem>
                    <asp:ListItem Value="2">حجز طيران</asp:ListItem>
                    <asp:ListItem Value="3">سياحة داخلية</asp:ListItem>
                    <asp:ListItem Value="4">سؤال آخر </asp:ListItem>
                </asp:DropDownList></div>
            <div style="float: RIGHT; margin-left: 135px; margin-top: 8px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorsection" runat="server" ErrorMessage="من فضلك إختر القسم"
                    ControlToValidate="uiDropDownListSection" ForeColor="#C76E1F" ValidationGroup="Contact"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                
            </div>
            <div class="clear10px">
            </div>
             <div class="smallleft" style="width: 75px;">
                اللقب</div>
            <div class="smallrightHeight">
              
              <asp:DropDownList ID="uiDropDownListTitle" runat="server" ValidationGroup="Contact">
                    <asp:ListItem Value="-1">إختر ...</asp:ListItem>
                    <asp:ListItem Value="Mr">السيد</asp:ListItem>
                    <asp:ListItem Value="Ms">السيدة</asp:ListItem>
                    <asp:ListItem Value="Mrs">الأنسة</asp:ListItem>
                    <asp:ListItem Value="Dr">الدكتور</asp:ListItem>
                    <asp:ListItem Value="Other">أخرى</asp:ListItem>
                </asp:DropDownList></div>
              
            
            <div class="clear10px">
            </div>
             <div class="smallleft" style="width: 75px;">
                الاٌسم *</div>
            <div class="smallrightHeight">
           <asp:TextBox ID="uiTextBoxName" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
              <div style="float: right; margin-left: 35px; margin-top: 8px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ErrorMessage="من فضلك أدخل الإسم"
                    ControlToValidate="uiTextBoxName" ForeColor="#C76E1F" ValidationGroup="Contact"
                    Display="Dynamic"></asp:RequiredFieldValidator></div>
            
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 75px;">
                البريد الإلكترونى *</div>
            <div class="smallrightHeight">
                <asp:TextBox ID="uiTextBoxEmail" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
            <div style="float: right; margin-left: 35px; margin-top: 8px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="من فضلك أدخل البريد الإلكترونى"
                    ControlToValidate="uiTextBoxEmail" ForeColor="#C76E1F" ValidationGroup="Contact"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="خطأ فى البريدالإلكترونى"
                    ValidationGroup="Contact" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ControlToValidate="uiTextBoxEmail" ForeColor="#C76E1F" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 75px;">
                الشارع</div>
            <div class="smallrightHeight">
           <asp:TextBox ID="uiTextBoxStreet" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
                          
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 75px;">
                المدينة</div>
            <div class="smallrightHeight">
           <asp:TextBox ID="uiTextBoxCity" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
                          
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 75px;">
                 الرقم البريدى *</div>
            <div class="smallrightHeight">
                <asp:TextBox ID="uiTextBoxPostalCode" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
            <div style="float: right; margin-left: 35px; margin-top: 8px;">
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="أرقام فقط"
                    ValidationGroup="Contact" ValidationExpression="^[-+]?(\d)+$" ControlToValidate="uiTextBoxPostalCode"
                    ForeColor="#C76E1F" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 75px;">
                البلد *</div>
            <div class="smallrightHeight">
           <asp:TextBox ID="uiTextBoxCountry" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
              <div style="float: right; margin-left: 35px; margin-top: 8px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCountry" runat="server" ErrorMessage="من فضلك أدخل البلد"
                    ControlToValidate="uiTextBoxCountry" ForeColor="#C76E1F" ValidationGroup="Contact"
                    Display="Dynamic"></asp:RequiredFieldValidator></div>
            
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 75px;">
                التليفون *</div>
            <div class="smallrightHeight">
                <asp:TextBox ID="uiTextBoxTelephone" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
            <div style="float: right; margin-left: 35px; margin-top: 8px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="من فضلك أدخل التليفون"
                    ControlToValidate="uiTextBoxTelephone" ForeColor="#C76E1F" ValidationGroup="Contact"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="أرقام فقط"
                    ValidationGroup="Contact" ValidationExpression="^[-+]?(\d)+$" ControlToValidate="uiTextBoxTelephone"
                    ForeColor="#C76E1F" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 75px;">
                الموبايل *</div>
            <div class="smallrightHeight">
                <asp:TextBox ID="uiTextBoxMobile" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
            <div style="float: right; margin-left: 35px; margin-top: 8px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorMobile" runat="server" ErrorMessage="من فضلك أدخل الموبايل"
                    ControlToValidate="uiTextBoxMobile" ForeColor="#C76E1F" ValidationGroup="Contact"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="أرقام فقط"
                    ValidationGroup="Contact" ValidationExpression="^[-+]?(\d)+$" ControlToValidate="uiTextBoxMobile"
                    ForeColor="#C76E1F" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div class="clear10px">
            </div>            
            <div class="smallleft" style="width: 75px">
                الموضوع *</div>
            <div class="smallrightHeight">
                <asp:TextBox ID="uiTextBoxSubject" runat="server" ValidationGroup="Contact" Columns="30"
                    Rows="6" TextMode="MultiLine"></asp:TextBox></div>
            <div style="float: right; margin-right: 135px; margin-top: 8px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="من فضلك أدخل الموضوع"
                    ControlToValidate="uiTextBoxSubject" ForeColor="#C76E1F" ValidationGroup="Contact"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="clear10px">
            </div>
            <div class="smallleft">
                &nbsp;</div>
            <div class="smallrightHeight ">
                <div class="btn">
                    <asp:LinkButton ID="uiLinkButtonSubmit" runat="server" ValidationGroup="Contact"
                        OnClick="uiLinkButtonSubmit_Click">إرسال</asp:LinkButton>
                </div>
            </div>
            <div class="clear10px">
            </div>
        </div>
    </div>
</asp:Content>
