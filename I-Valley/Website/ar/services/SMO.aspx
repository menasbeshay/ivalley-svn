<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ArInner.Master" AutoEventWireup="true" CodeBehind="SMO.aspx.cs" Inherits="Website.ar.services.SMO" %>

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
            تحسين وسائل الاعلام الاجتماعية</p>
        <span>
        <p>
                S</p>
        </span>
    </div>
    <div id="InnerContentWrapper" class="row">
        <div class="citer">
            <p>
                تحسين وسائل الاعلام الاجتماعية هي مجموعة من الطرق لتوليد الدعاية من خلال
                تحسين وسائل الاعلام الاجتماعية هي مجموعة من الطرق لتوليد الدعاية من خلال وسائل الاعلام الاجتماعية,وشبكات التواصل الاجتماعية, واساليب تحسين وسائل الاعلام الاجتماعية  تشمل إضافة 
                قارئ ملخصات الويب، أزرار الأخبار الاجتماعية، والمدونات، ودمج وظائف المجتمع طرف ثالث مثل الصور وأشرطة الفيديو.
        شبكات التواصل الاجتماعى مثل بلوجز و فسيبوك ويوتيوب وتويتر وفليكتور وماى سباس - تحسين وسائل الاعلام الاجتماعية  تسمح لك بنشر رسالة ذات العلامات التجارية الخاصة بك
إلى العالم. للحصول على أفضل النتائج, <span class="CompanyName">I-Valley</span> تشجع على التفاعل المباشر بين مختلف العديد من منصات وسائل الإعلام الاجتماعية. وتستطيع العلامات التجارية والمستهلكين التواصل في ساحة مفتوحة، صادقة وبصورةشخصية، مما يعززوجود شركتك  على الإنترنت ويدفع حركة مرور الزوار إلى موقع الويب الخاص بك. .
            </p>
            <%--<div style="width: 49%; border: 3px solid #FF6600 !important; border-radius: 15px !important;
            -moz-border-radius: 15px !important; -webkit-border-radius: 15px !important;
            padding: 15px; text-align: center; font-weight: bold; font-size: 18px;">  --%>
            <div id="buttons" style="margin: 0 auto; width: 380px;">
                <a class="largeButton" id="requestButton" style="margin-left: 100px; margin-right: 100px;
                    margin-top: 5px; cursor: pointer; line-height: 0px">طلب خدمة </a>
                <div class="clear-fix" style="height: 5px;">
                </div>
            </div>
            <div class="clear-fix">
            </div>
            <%--</div>--%>
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
