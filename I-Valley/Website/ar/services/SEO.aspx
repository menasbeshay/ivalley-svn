<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ArInner.Master" AutoEventWireup="true" CodeBehind="SEO.aspx.cs" Inherits="Website.ar.services.SEO" %>

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
            تحسين محركات البحث</p>
        <span>
        <p>
                S</p>
        </span>
    </div>
    <div id="InnerContentWrapper" class="row">
        <div class="citer">
            <p>
                تحسين محرك البحث&nbsp; هو عملية لتحسين حجم و / أو نوعية كمية الزوار إلى موقع الويب من 
                محركات البحث، عن طريق نتائج البحث الطبيعية من خلال زيادة المواقف من موقع على 
                شبكة الإنترنت في محركات البحث,باستخدام تحليل دقيق وتقنيات البحث.موقع على 
                الانترنت يحتاج إلى أن تكون مكتوبة بطريقة ويعتبر أن تكون ودية لمحركات البحث,اذا 
                كان الموقع الاكترونى مفهرسا (مقروء) لدى محركات البحث كان لديه فرصة اكبر ليكون 
                ضمن نتائج جيدة فى ناتج صفخات محركات البحث . ا ,ان الخطوة الاكثر اهمية من تحسين 
                محركات البحث فو ان نفهم كيفية عمل الية محركات البحث&nbsp; I-Valley تعرف ما هي 
                محركات البحث التي تبحث عنها وما التقنيات التي تعطي مصداقية أكبر إلى.تحسين محركات 
                البحث الشركات والوكالات ليس فقط زيادة حركة المرور إلى مواقعها على شبكة الإنترنت، 
                ولكن أيضا زيادة المبيعات ولدت شبكة الإنترنت، بدعم من نوعية حركة المرور وأهميتها 
                للمجتمعات المشترين المحتملين.</p>
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
