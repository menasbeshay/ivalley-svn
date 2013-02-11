 <%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ENBanner.Master" AutoEventWireup="true" CodeBehind="TourismList.aspx.cs" Inherits="Obtravel.TourismList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/jquery-ui-1.8.20.custom.min.js" type="text/javascript"></script>
    <link href="style/jquery-ui-1.8.20.custom.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>
       List of packages</h1>
    <div class="clear10px">
    </div>
    <div class="right" style="width:100%">
    <asp:Panel ID="uiPanelAllLists" runat="server">
        
        <asp:DataList ID="uiDataListCurrentLists" runat="server" RepeatColumns="2" 
            RepeatDirection="Horizontal" RepeatLayout="Table" CellSpacing="10" 
            Width="876px">
            <ItemStyle VerticalAlign="Top" />
            <ItemTemplate>
                <div style="float:left; width:125px;">
                    <a href='TourismList.aspx?TID=<%# Eval("ID") %>'>
                    <asp:Image ID="uiImageTourismList" runat="server" 
                        ImageUrl='<%# Eval("ImagePath") %>' Width="125px" />
                    </a>
                </div>
                <div style="float:left;width: 265px;margin-left:10px;">
                    <h4>
                        <a class="title" href='TourismList.aspx?TID=<%# Eval("ID") %>'>
                        <%# Eval("Title") %></a>
                    </h4>
                    <%# Eval("Brief") %>
                    <div>
                        <div class="btn">
                            <a href='TourismList.aspx?TID=<%# Eval("ID") %>'>Read more</a>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            
        </asp:DataList>
    </asp:Panel>
    <asp:Panel ID="uiPanelViewTourismList" runat="server">
        <div class="services">
            <ul>
                <li>
                    <div class="img Tourism">
                        <asp:Image ID="uiImageTourismList" runat="server" /></div>
                    <div class="serv_data" style="width:73%">
                        <h4>
                            <asp:Label ID="uiLabelTitle" runat="server" ></asp:Label></h4>
                            <div class="TourismControls AdminCP" style="width :125px;">
                            <div class="btn">
                            <a href="#" id="opener">Book</a>
                            </div>
                            <div class="btn">
                                <a href="TourismList.aspx">Back</a>
                            </div>   
                        </div>
                        <asp:Literal ID="uiLiteralBrief" runat="server"></asp:Literal>
                        
                    </div>
                    <div class="clear">
                    </div>
                    <div>
                        <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
                    </div>
                    <div class="clear">
                    </div>
                    <asp:Label ID="uiLabelMessage" runat="server" Text="Booking Sent successfully, we'll contact you soon." 
                        Font-Bold="True" ForeColor="Lime" Visible="False"></asp:Label>
                </li>
            </ul>
        </div>

        <div id="dialog" title="Book">
        
             <div class="smallleft" style="width: 105px;">
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
             <div class="smallleft" style="width: 105px;">
                Name *</div>
            <div class="smallrightHeight">
           <asp:TextBox ID="uiTextBoxName" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
              <div style="float: left; margin-left: 45px; margin-top: 8px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required"
                    ControlToValidate="uiTextBoxName" ForeColor="#C76E1F" ValidationGroup="Contact"
                    Display="Dynamic"></asp:RequiredFieldValidator></div>
            
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 105px;">
                E-mail</div>
            <div class="smallrightHeight">
                <asp:TextBox ID="uiTextBoxEmail" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
            <div style="float: left; margin-left: 45px; margin-top: 8px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required"
                    ControlToValidate="uiTextBoxEmail" ForeColor="#C76E1F" ValidationGroup="Contact"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Incorrect e-mail address"
                    ValidationGroup="Contact" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ControlToValidate="uiTextBoxEmail" ForeColor="#C76E1F" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 105px;">
                Street</div>
            <div class="smallrightHeight">
           <asp:TextBox ID="uiTextBoxStreet" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
                          
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 105px;">
                City</div>
            <div class="smallrightHeight">
           <asp:TextBox ID="uiTextBoxCity" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
                          
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 105px;">
                Postal Code</div>
            <div class="smallrightHeight">
                <asp:TextBox ID="uiTextBoxPostalCode" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
            <div style="float: left; margin-left: 45px; margin-top: 8px;">
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Numbers only"
                    ValidationGroup="Contact" ValidationExpression="^[-+]?(\d)+$" ControlToValidate="uiTextBoxPostalCode"
                    ForeColor="#C76E1F" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 105px;">
                Country *</div>
            <div class="smallrightHeight">
           <asp:TextBox ID="uiTextBoxCountry" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
              <div style="float: left; margin-left: 45px; margin-top: 8px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required"
                    ControlToValidate="uiTextBoxCountry" ForeColor="#C76E1F" ValidationGroup="Contact"
                    Display="Dynamic"></asp:RequiredFieldValidator></div>
            
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 105px;">
                Telephone</div>
            <div class="smallrightHeight">
                <asp:TextBox ID="uiTextBoxTelephone" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
            <div style="float: left; margin-left: 45px; margin-top: 8px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required"
                    ControlToValidate="uiTextBoxTelephone" ForeColor="#C76E1F" ValidationGroup="Contact"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Numbers only"
                    ValidationGroup="Contact" ValidationExpression="^[-+]?(\d)+$" ControlToValidate="uiTextBoxTelephone"
                    ForeColor="#C76E1F" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 105px;">
                Mobile</div>
            <div class="smallrightHeight">
                <asp:TextBox ID="uiTextBoxMobile" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
            <div style="float: left; margin-left: 45px; margin-top: 8px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required"
                    ControlToValidate="uiTextBoxMobile" ForeColor="#C76E1F" ValidationGroup="Contact"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Numbers only"
                    ValidationGroup="Contact" ValidationExpression="^[-+]?(\d)+$" ControlToValidate="uiTextBoxMobile"
                    ForeColor="#C76E1F" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div class="clear10px">
            </div>
             <div class="smallleft" style="width: 105px;">
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

        <script type="text/javascript">
            $("#dialog").dialog({
                autoOpen: false,
                show: "blind",
                hide: "explode",
                width: "550px",
                modal: true
            });

            $("#dialog").parent().appendTo(jQuery('form:first'));

            $("#opener").click(function () {
                $("#dialog").dialog("open");                
                return false;
            });
        </script>

    </asp:Panel>
    </div>
</asp:Content>
