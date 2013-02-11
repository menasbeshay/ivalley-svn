<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ENBanner.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Obtravel.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Contact Us</h1>
    <div class="contactus">
        <div class="left">
        </div>
        <div class="right">
            <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
            <div class="clear10px"></div>
            <h2>also you can visit us</h2>
                       
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
                Contact Form:</h2>
            <div class="clear10px">
            </div>
            <asp:Label ID="uiLabelSuccess" runat="server" Text="Thank you for contacting the On Board Travel
A reply to your message will be sent to you
As soon as possible...
" Font-Bold="True" ForeColor="#66FF99" Visible="False"></asp:Label>
            <asp:Label ID="uiLabelFail" runat="server" Text="Error submitting your question. Please try again later."
                Font-Bold="True" ForeColor="#C76E1F" Visible="False"></asp:Label>
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 65px;">
                Section </div>
            <div class="smallrightHeight">
                <asp:DropDownList ID="uiDropDownListSection" runat="server" ValidationGroup="Contact">
                    <asp:ListItem Value="-1">Select...</asp:ListItem>
                    <asp:ListItem Value="0">Tours, Trips, Packages and Programs</asp:ListItem>
                    <asp:ListItem Value="1">Umrah and Hadj</asp:ListItem>
                    <asp:ListItem Value="2">Flight Booking</asp:ListItem>
                    <asp:ListItem Value="3">Domestic Tourism</asp:ListItem>
                    <asp:ListItem Value="4">General question</asp:ListItem>
                </asp:DropDownList></div>
            <div style="float: left; margin-left: 135px; margin-top: 8px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required"
                    ControlToValidate="uiDropDownListSection" ForeColor="#C76E1F" ValidationGroup="Contact"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                
            </div>
            <div class="clear10px">
            </div>
             <div class="smallleft" style="width: 65px;">
                Title</div>
            <div class="smallrightHeight">
              
              <asp:DropDownList ID="uiDropDownListTitle" runat="server" ValidationGroup="Contact">
                    <asp:ListItem Value="-1">Select...</asp:ListItem>
                    <asp:ListItem Value="Mr">Mr</asp:ListItem>
                    <asp:ListItem Value="Ms">Ms</asp:ListItem>
                    <asp:ListItem Value="Mrs">Mrs</asp:ListItem>
                    <asp:ListItem Value="Dr">Dr</asp:ListItem>
                    <asp:ListItem Value="Miss">Miss</asp:ListItem>
                    <asp:ListItem Value="Master">Master</asp:ListItem>
                    <asp:ListItem Value="Madam">Madam</asp:ListItem>
                    <asp:ListItem Value="Other">Other</asp:ListItem>
                </asp:DropDownList></div>
              
            
            <div class="clear10px">
            </div>
             <div class="smallleft" style="width: 65px;">
                Name *</div>
            <div class="smallrightHeight">
           <asp:TextBox ID="uiTextBoxName" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
              <div style="float: left; margin-left: 35px; margin-top: 8px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required"
                    ControlToValidate="uiTextBoxName" ForeColor="#C76E1F" ValidationGroup="Contact"
                    Display="Dynamic"></asp:RequiredFieldValidator></div>
            
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 65px;">
                E-mail *</div>
            <div class="smallrightHeight">
                <asp:TextBox ID="uiTextBoxEmail" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
            <div style="float: left; margin-left: 35px; margin-top: 8px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required"
                    ControlToValidate="uiTextBoxEmail" ForeColor="#C76E1F" ValidationGroup="Contact"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Incorrect e-mail address"
                    ValidationGroup="Contact" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ControlToValidate="uiTextBoxEmail" ForeColor="#C76E1F" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 65px;">
                Street</div>
            <div class="smallrightHeight">
           <asp:TextBox ID="uiTextBoxStreet" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
                          
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 65px;">
                City</div>
            <div class="smallrightHeight">
           <asp:TextBox ID="uiTextBoxCity" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
                          
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 65px;">
                Postal Code</div>
            <div class="smallrightHeight">
                <asp:TextBox ID="uiTextBoxPostalCode" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
            <div style="float: left; margin-left: 35px; margin-top: 8px;">
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Numbers only"
                    ValidationGroup="Contact" ValidationExpression="^[-+]?(\d)+$" ControlToValidate="uiTextBoxPostalCode"
                    ForeColor="#C76E1F" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 65px;">
                Country *</div>
            <div class="smallrightHeight">
           <asp:TextBox ID="uiTextBoxCountry" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
              <div style="float: left; margin-left: 35px; margin-top: 8px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required"
                    ControlToValidate="uiTextBoxCountry" ForeColor="#C76E1F" ValidationGroup="Contact"
                    Display="Dynamic"></asp:RequiredFieldValidator></div>
            
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 65px;">
                Telephone *</div>
            <div class="smallrightHeight">
                <asp:TextBox ID="uiTextBoxTelephone" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
            <div style="float: left; margin-left: 35px; margin-top: 8px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required"
                    ControlToValidate="uiTextBoxTelephone" ForeColor="#C76E1F" ValidationGroup="Contact"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Numbers only"
                    ValidationGroup="Contact" ValidationExpression="^[-+]?(\d)+$" ControlToValidate="uiTextBoxTelephone"
                    ForeColor="#C76E1F" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 65px;">
                Mobile *</div>
            <div class="smallrightHeight">
                <asp:TextBox ID="uiTextBoxMobile" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
            <div style="float: left; margin-left: 35px; margin-top: 8px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required"
                    ControlToValidate="uiTextBoxMobile" ForeColor="#C76E1F" ValidationGroup="Contact"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Numbers only"
                    ValidationGroup="Contact" ValidationExpression="^[-+]?(\d)+$" ControlToValidate="uiTextBoxMobile"
                    ForeColor="#C76E1F" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div class="clear10px">
            </div>
            
            <div class="smallleft" style="width: 65px;">
                Message *</div>
            <div class="smallrightHeight">
                <asp:TextBox ID="uiTextBoxSubject" runat="server" ValidationGroup="Contact" Columns="30"
                    Rows="6" TextMode="MultiLine"></asp:TextBox></div>
            <div style="float: left; margin-left: 135px; margin-top: 8px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required"
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
                        OnClick="uiLinkButtonSubmit_Click">Submit</asp:LinkButton>
                </div>
            </div>
            <div class="clear10px">
            </div>
        </div>
    </div>
</asp:Content>
