<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ARBannerMaster.Master" AutoEventWireup="true" CodeBehind="TourismList.aspx.cs" Inherits="Obtravel.Arabic.TourismList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script src="../Scripts/jquery-ui-1.8.20.custom.min.js" type="text/javascript"></script>
    <link href="../style/arjquery-ui-1.8.20.custom.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <h1>
        قائمة الرحلات</h1>
    <div class="clear10px">
    </div>
    <div class="right" style="width:100%">
    <asp:Panel ID="uiPanelAllLists" runat="server">
         <asp:DataList ID="uiDataListCurrentLists" runat="server" RepeatColumns="2" 
            RepeatDirection="Horizontal" RepeatLayout="Table" CellSpacing="10" 
            Width="876px" style="direction:rtl">
            <ItemStyle VerticalAlign="Top" />
            <ItemTemplate>
                <div style="float:right; width:125px;">
                    <a href='TourismList.aspx?TID=<%# Eval("ID") %>'>
                    <asp:Image ID="uiImageTourismList" runat="server" 
                        ImageUrl='<%# Eval("arImagePath") %>' Width="125px" />
                    </a>
                </div>
                <div style="float:right;width: 265px;margin-right:10px;">
                    <h4>
                        <a class="title" href='TourismList.aspx?TID=<%# Eval("ID") %>'>
                        <%# Eval("arTitle") %></a>
                    </h4>
                    <%# Eval("arBrief") %>
                    <div>
                        <div class="btn">
                            <a href='TourismList.aspx?TID=<%# Eval("ID") %>'>قراءة المزيد</a>
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
                            <div class="TourismControls AdminCP" style="width :175px;">
                            <div class="btn">
                            <a href="#" id="opener">حجز</a>
                            </div>
                            <div class="btn">
                                <a href="TourismList.aspx">عودة</a>
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
                     <asp:Label ID="uiLabelMessage" runat="server" Text="تم إرسال الحجز بنجاح، سوف نتصل بك قريبا." 
                        Font-Bold="True" ForeColor="Lime" Visible="False"></asp:Label>
                </li>
            </ul>
        </div>

         <div id="dialog" title="حجز" style="direction:rtl">
        
             <div class="smallleft" style="width: 105px;">
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
             <div class="smallleft" style="width: 105px;">
                الإسم *</div>
            <div class="smallrightHeight">
           <asp:TextBox ID="uiTextBoxName" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
              <div style="float: left; margin-left: 45px; margin-top: 8px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="من فضلك أدخل الإسم"
                    ControlToValidate="uiTextBoxName" ForeColor="#C76E1F" ValidationGroup="Contact"
                    Display="Dynamic"></asp:RequiredFieldValidator></div>
            
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 105px;">
                البريد الإلكترونى</div>
            <div class="smallrightHeight">
                <asp:TextBox ID="uiTextBoxEmail" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
            <div style="float: left; margin-left: 45px; margin-top: 8px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="من فضلك أدخل البريد الإلكترونى"
                    ControlToValidate="uiTextBoxEmail" ForeColor="#C76E1F" ValidationGroup="Contact"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="خطأ فى البريد الإلكترونى"
                    ValidationGroup="Contact" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ControlToValidate="uiTextBoxEmail" ForeColor="#C76E1F" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 105px;">
                الشارع</div>
            <div class="smallrightHeight">
           <asp:TextBox ID="uiTextBoxStreet" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
                          
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 105px;">
                المدينة</div>
            <div class="smallrightHeight">
           <asp:TextBox ID="uiTextBoxCity" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
                          
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 105px;">
                الرقم البريدى</div>
            <div class="smallrightHeight">
                <asp:TextBox ID="uiTextBoxPostalCode" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
            <div style="float: left; margin-left: 45px; margin-top: 8px;">
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="أرقام فقط"
                    ValidationGroup="Contact" ValidationExpression="^[-+]?(\d)+$" ControlToValidate="uiTextBoxPostalCode"
                    ForeColor="#C76E1F" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 105px;">
                البلد *</div>
            <div class="smallrightHeight">
           <asp:TextBox ID="uiTextBoxCountry" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
              <div style="float: left; margin-left: 45px; margin-top: 8px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="من فضلك أدخل البلد"
                    ControlToValidate="uiTextBoxCountry" ForeColor="#C76E1F" ValidationGroup="Contact"
                    Display="Dynamic"></asp:RequiredFieldValidator></div>
            
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 105px;">
                التليفون</div>
            <div class="smallrightHeight">
                <asp:TextBox ID="uiTextBoxTelephone" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
            <div style="float: left; margin-left: 45px; margin-top: 8px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="من فضلك أدخل التليفون"
                    ControlToValidate="uiTextBoxTelephone" ForeColor="#C76E1F" ValidationGroup="Contact"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="أرقام فقط"
                    ValidationGroup="Contact" ValidationExpression="^[-+]?(\d)+$" ControlToValidate="uiTextBoxTelephone"
                    ForeColor="#C76E1F" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 105px;">
                الموبايل</div>
            <div class="smallrightHeight">
                <asp:TextBox ID="uiTextBoxMobile" runat="server" ValidationGroup="Contact"></asp:TextBox></div>
            <div style="float: left; margin-left: 45px; margin-top: 8px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="من فضلك أدخل الموبايل"
                    ControlToValidate="uiTextBoxMobile" ForeColor="#C76E1F" ValidationGroup="Contact"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="أرقام فقط"
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
                        OnClick="uiLinkButtonSubmit_Click">إرسال</asp:LinkButton>
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
