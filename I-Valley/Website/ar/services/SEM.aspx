<%@ Page Title="تسويق عبر محركات البحث" Language="C#" MasterPageFile="~/MasterPages/ArInner.Master"
    AutoEventWireup="true" CodeBehind="SEM.aspx.cs" Inherits="Website.ar.services.SEM" %>

<%@ Register Src="../../controls/RequestService.ascx" TagName="RequestService" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            direction: ltr
        }
    </style>
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
        <p class="style1">
            تسويق عبر محركات البحث (SEM)</p>
        <span>
        <p class="style1">
                S</p>
        </span>
    </div>
    <div id="InnerContentWrapper" class="row" >
        <div class="citer">
            <p class="style1">
        التسيوق عبر محركات البحث هو شكل من أشكال التسويق الإلكتروني التي تسعى إلى تعزيز المواقع 
        من خلال زيادة وجودها في صفحات نتائج محرك البحث من خلال استخدام الإعلانات السياقية,
         من خلال الاعلانات المدفوعة واعلانات الدفع بالكليلك. صفحات نتائج محركات البحث الروابط الاعلانية التى تظهر فى اولى 
         فى صفحات نتائج محركات البحث فى مبرع ملون بالاخضر&nbsp; ويمكن ان نتون فى العمود الايمن فى  
                صفحات نتائج محركات البحث
          يعرض محرك بحث الإعلانات في استجابة لاستعلام البحث
           الأولي والمعلن, اعلانات الدفع بالكليلك هى التى . تجعل تلك الاعلانات فعالة بالنسبة للشركات الاصغر حجما. التسويق عبر محركات البحث يتم توفيرة من عديد من الشركات مع عديد من المزايا:
             </p>
            <ul >
                <li class="style1" float:right>القدرة على االاستهداف (القدرة على تقديم العرض المناسب للمستخدم المناسب في الوقت المناسب)</li>
                <li class="style1">السرعة</li>
                <li class="style1">نتائج ملموسة </li>
                <li class="style1">المرونة</li>
                <li class="style1">تقليل وقت الانتاج وانخفاض التكلفة </li>
                <li class="style1">ارتفاع العائد على الاستثمار نسبة الى وسائل الاعلام الاخرى</li>
            </ul>
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
