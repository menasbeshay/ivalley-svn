<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ArInner.Master" AutoEventWireup="true" CodeBehind="webdevelopment.aspx.cs" Inherits="Website.ar.services.webdevelopment" %>
<%@ Register src="../../controls/RequestService.ascx" tagname="RequestService" tagprefix="uc1" %>
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
    <div id="banner" class="webdevelopmentBanner">
        <p style="color: #a82743;">
            تطوير مواقع الانترنت</p>
        <span>
        <p>
                W</p>
        </span>
    </div>
    <div id="InnerContentWrapper" class="row">
        <div class="citer">
            <p>
                مع <span class="CompanyName">I-Valley</span> لديك خيارات متعددة
                 لتطوير حلول الويب الخاصة 
                بك, لدينا مجموعات تطوير الشبكة تركز ليس 
                فقط في تطوير الموقع ولكن أيضا نحن مهتمون
                 في القيام تطوير تطبيق النظام عبر نظام
                 ويب مثل هذه أتمتة المكاتب، وثيقة الأرشفة,
                بوابات, حلول نظم ادارات المحتوى واكثر  لدينا  حلول الإنترنت لدينا مقسمة إلى الخدمات التالية:
            </p>
            <div class="large-6 columns webDev" style="padding: 5px; border-right: 2px solid #a82743">
                <h4>
                    تطوير مخصص لمواقع الانترنت</h4>
                <p>
                    <br />انها العديد من الفوائد لعملك لتطوير احتياجات عملك في مثل هذه البرامج,
                    <span class="CompanyName">I-Valley</span> تساعدك على القيام بذلك عن طريق توفير انها 
                    خبرة في تفصيل احتياجاتك في مجال البرمجيات لتنفيذ احتياجاتك, ونحن نفعل ذلك بطريقة مهنية من خلال تنفيذ دورة حياة تطوير البرمجيات كامله:
                </p>
                <div class="clear-fix">
                </div>
                <div style="width: 100%; text-align: center;">
                    <img src="../../images/8-services/w1.png" /></div>
                <div class="clear-fix">
                </div>
                <p>
                    فى قسم التطوير المخصص لمواقع الانترنت يمكننا تنفيذ اى فكرة توحي لك من أجل ترقية وتعزيز عملك مثل هذه:
                    </p>
                <ul style="margin-left:10px;list-style-position:inside !important;">
                    <li>تطوير مخصص لمواقع الانترنت</li>
                    <li>التشغيل الآلي للمكاتب </li>
                    <li>إدارة العمليات التجارية </li>
                    <li>حفظ وارشفة المستندات </li>
                    <li>إدارة علاقات العملاء (CRM) </li>
                    <li>تخطيط موارد المؤسسات (ERP)</li>
                </ul>
                <br />
                <p>
                    كل ما عليك القيام بة هو الاتصال بفريق المبيعات عن طريق تقديم طلب الخدمة ثم بعد 
                    ذالك نستطيع ان نتعامل مع الطلب الخاص بك المقدم من الرحلة الاولى فى دائرة الطلبات حتى
                     نقوب بنشر وتسليم منتجك . 
                    
                    <div id="buttons">
                        <a class="largeButton" id="requestButton" style="margin-left:120px;width:190px;cursor:pointer;line-height:0px">Requesting service
                        </a>
                        <div class="clear-fix" style="height: 15px;">
                        </div>
                </div>
                    
                    أيضا يمكنك معرفة المزيد حول ما لدينا من خلال زيارة:
                    <div class="clear-fix" style="height: 15px;">
                </div>
                <div id="buttons">
                    <div class="clear-fix" style="height: 5px;">
                    </div>
                    <a class="largeButton" style="margin-left: 70px; width: 320px; line-height: 0px"
                            href="Technologies.aspx">الادوات والتقنيات الى نحن على علم بها
                        </a>
                    <div class="clear-fix" style="height: 5px;">
                    </div>
                    <a class="largeButton" style="margin-left: 100px; width: 230px; line-height: 0px"
                            href="../Portfolio.aspx">استمتع مع محفظة أعمالنا</a>
                </div>
                </p>
            </div>
            <div class="large-6 columns webDev" style="padding: 5px;">
                <h4>
                    تخصص مواقع نظم ادارة المحتوى 
                </h4>
                <p>
                    <br />باختيارك قسم تخصيص نظم ادارة المحتوى تكون قد وضعت يدك على اسرع, واسهل ,وارخص , واقوى ,وسيلة لتطوير 
                    موقع مقع المؤسسة الخاص بك . و مع مواقع نظم ادارة المحتوى يمكن ان يكون لديك ما يلى :
                </p>
                <ul style="margin-left: 20px;">
                    <li>إدارة محتويات موقع الويب الخاص بك والبيانات بما في ذلك (منتجات - المعارض - محتويات HTML).</li>
                    <li>اضافة اقسام جديدة للموقع بدون العودة مطور الموقع</li>
                    <li>إضافة صفحات جديدة مع محتوياتها.</li>
                    <li>تحسين كامل لمحركات البحث لمحتويات موقعك </li>
                    <li>تصميم قوالب مرنة (يمكنك تغيير تصميم موقع الويب الخاص بك كامل باقل جهد ممكن)</li>
                    <li>I-valley سوف توفر دليل كامل لادارة الموقع الخاص بك من اجل ان يتمكن فريق لادارة كل شيء من دون 
                    دفع اى مصاريف اضافية. </li>
                </ul>
                <div class="clear-fix">
                </div>
                <br />
                <div style="width: 100%; text-align: center;">
                    <img src="../../images/8-services/wordpress-icon.png" style="width: 100px" />
                    <img src="../../images/8-services/DNN1.png" style="width: 100px" />
                    <img src="../../images/8-services/joomla.png" style="width: 100px" />
                    <div class="clear-fix">
                    </div>
                </div>
                <div class="clear-fix" style="height:10px;">
                </div>
                <p>
                    <span class="CompanyName">I-Valley</span> يمكن ان تزود تخصيص تطوير مواقع ادارة المحتوى بالتقنيات الثلاثة التالية : 
                </p>
                <ul style="margin-left: 20px;">
                    <li>Joomla</li>
                    <li>WordPress</li>
                    <li>DotNetNuke</li>
                </ul>
                <p>
                    من أجل البدء في الحصول على هذه الخدمة من <span class="CompanyName">I-Valley</span> انت بحاجة الى تخطى الثلاثة مراحل الاتية:
                </p>
                <ol style="margin-left: 20px;">
                    <li>قم باختيار قالب التصميم الذى يعجبك</li>
                    <li>قم باختيار فئة الاسعار المناسبة لك</li>
                    <li>قم بطلب الخدة من <span class="CompanyName">I-Valley</span></li>
                </ol>
                <div id="buttons" style="margin-left:160px;">
                    <div class="clear-fix" style="height: 5px;">
                    </div>
                    <a class="largeButton" style="width: 250px; line-height: 0px" 
                        href="CMSWizard.aspx">ابداء الموقع الاكترونى الخاص بك من الان</a>
                </div>
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
