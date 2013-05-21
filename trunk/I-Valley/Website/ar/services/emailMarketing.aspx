<%@ Page Title="التسويق عبر البريد الإلكتروني" Language="C#" MasterPageFile="~/MasterPages/ArInner.Master"
    AutoEventWireup="true" CodeBehind="emailMarketing.aspx.cs" Inherits="Website.ar.services.emailMarketing" %>

<%@ Register Src="../../controls/RequestService.ascx" TagName="RequestService" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="requestForm" title="Request service">
        <uc1:RequestService ID="RequestService1" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div style="display: none;">
                    <asp:Button ID="uiButtonReset" runat="server" Text="Button" OnClick="uiButtonReset_Click" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div id="banner">
        <p>
            التسويق عبر البريد الإلكتروني</p>
        <span>
        <p>
                E</p>
        </span>
    </div>
    <div id="InnerContentWrapper" class="row">
        <div class="citer">
            <p>
        التسويق عبر البريد الإلكتروني هو شكل من أشكال التسويق المباشر، والذي يستخدم البريد الإلكتروني باعتباره وسائل التواصل التجاري. 
                و يمكن ارسال كمية من البريد الاكترونى الى عدد معين من العملاء ويمكن ان يكون العدد ضخم ويمكن جدولة تلك الايميلات  . 
                لدينا
        منتج جيد جدا لمساعدتك في إرسال رسائل بالجملة إلى أكثر من 10،000 من العملاء
مع رسائل غير محدودة كل يوم ... يمكنك الاتصال بنا للحصول على مزيد من المعلومات حول كيفية
استخدام برنامجنا للتسويق عبر البريد الإلكتروني.
            </p>
            <div style="float: right; width: 50%">
                <a style="display: block; float: right; margin: 5px;" href="../../images/8-services/mailmarketing/1.jpg"
                    rel="prettyPhoto">
                    <img src="../../images/8-services/mailmarketing/1.jpg" style="display: block; border: 2px solid #FF6600 !important;
                        border-radius: 5px !important; -moz-border-radius: 5px !important; -webkit-border-radius: 5px !important;
                        width: 120px; height: 120px" />
                </a><a style="display: block; float: right; margin: 5px;" href="../../images/8-services/mailmarketing/2.jpg"
                    rel="prettyPhoto">
                    <img src="../../images/8-services/mailmarketing/2.jpg" style="display: block; border: 2px solid #FF6600 !important;
                        border-radius: 5px !important; -moz-border-radius: 5px !important; -webkit-border-radius: 5px !important;
                        width: 120px; height: 120px" />
                </a><a style="display: block; float: right; margin: 5px;" href="../../images/8-services/mailmarketing/3.jpg"
                    rel="prettyPhoto">
                    <img src="../../images/8-services/mailmarketing/3.jpg" style="display: block; border: 2px solid #FF6600 !important;
                        border-radius: 5px !important; -moz-border-radius: 5px !important; -webkit-border-radius: 5px !important;
                        width: 120px; height: 120px" />
                </a><a style="display: block; float: right; margin: 5px;" href="../../images/8-services/mailmarketing/4.jpg"
                    rel="prettyPhoto">
                    <img src="../../images/8-services/mailmarketing/4.jpg" style="display: block; border: 2px solid #FF6600 !important;
                        border-radius: 5px !important; -moz-border-radius: 5px !important; -webkit-border-radius: 5px !important;
                        width: 120px; height: 120px" />
                </a><a style="display: block; float: right; margin: 5px;" href="../../images/8-services/mailmarketing/5.jpg"
                    rel="prettyPhoto">
                    <img src="../../images/8-services/mailmarketing/5.jpg" style="display: block; border: 2px solid #FF6600 !important;
                        border-radius: 5px !important; -moz-border-radius: 5px !important; -webkit-border-radius: 5px !important;
                        width: 120px; height: 120px" />
                </a><a style="display: block; float: right; margin: 5px;" href="../../images/8-services/mailmarketing/6.jpg"
                    rel="prettyPhoto">
                    <img src="../../images/8-services/mailmarketing/6.jpg" style="display: block; border: 2px solid #FF6600 !important;
                        border-radius: 5px !important; -moz-border-radius: 5px !important; -webkit-border-radius: 5px !important;
                        width: 120px; height: 120px" />
                </a>
            </div>
            <div style="float: right; width: 49%; border: 3px solid #FF6600 !important; border-radius: 15px !important;
                -moz-border-radius: 15px !important; -webkit-border-radius: 15px !important;
                padding: 15px; text-align: center; font-weight: bold; font-size: 18px;">
                يمكنك الحصول على كل هذه المزايا بالإضافة إلى إرسال 10000 رسالة
                <br />
                فقط بـ 100 جنيه مصرى شهرياً
                <div id="buttons" style="margin: 0 auto; width: 380px;">
                    <a class="largeButton" id="requestButton" style="font-weight: normal; margin-top: 5px;
                        cursor: pointer; line-height: 0px">طلب خدمة </a>
                    <div class="clear-fix" style="height: 5px;">
                    </div>
                </div>
                <div class="clear-fix">
                </div>
            </div>
            <div class="clear-fix">
            </div>
        </div>
        
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            var dlg = $("#requestForm").dialog({
                autoOpen: false,
                width: 400,
                modal: true,
                close: function (event, ui) { $("#<%= uiButtonReset.ClientID %>").click(); }

            });

            dlg.parent().appendTo($("form:first"));

            $("#requestButton")
      .click(function () {
          $("#requestForm").dialog("open");
      });


        });
    </script>
    <style type="text/css">
#requestForm select{display:block !important;}
</style>
</asp:Content>
