<%@ Page Title="طلب إنشاء موقع" Language="C#" MasterPageFile="~/MasterPages/ArInner.Master" AutoEventWireup="true" CodeBehind="CMSWizard.aspx.cs" Inherits="Website.ar.services.CMSWizard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../javascripts/jquery.smartWizard-2.0.min.js" type="text/javascript"></script>
    <link href="../../stylesheets/ar_smart_wizard.css" rel="stylesheet" type="text/css" />
    <script src="../../javascripts/jquery.validationEngine-en.js" type="text/javascript"></script>
    <script src="../../javascripts/jquery.validationEngine.js" type="text/javascript"></script>
    <link href="../../stylesheets/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('#wizard').smartWizard({ transitionEffect: 'slide', onFinish: onFinishCallback, onLeaveStep: leaveAStepCallback, onShowStep: scrollUp, labelNext: 'التالى', labelFinish: 'إنهاء', labelPrevious: 'السابق' });

            function onFinishCallback() {
                $('form').submit();
            }

            function leaveAStepCallback(obj) {
                var step_num = obj.attr('rel');
                return validateSteps(step_num);
            }

            function scrollUp() {
                $('html, body').animate({
                    scrollTop: 0
                }, 'slow');
            }

            $("form").validationEngine();
        });

        function validateSteps(step) {
            var isStepValid = true;
            if (step == 1) {
                if ($('#<%= HiddenFieldTemplateID.ClientID %>').val() == '') {
                    isStepValid = false;
                    $('#wizard').smartWizard('showMessage', 'من فضلك اختر التصميم فى خطوة رقم ' + step + ' وقم بالضغط على التالى.');
                    $('#wizard').smartWizard('setError', { stepnum: step, iserror: true });
                } else {
                    $('#wizard').smartWizard('setError', { stepnum: step, iserror: false });
                }
            }

            if (step == 2) {
                if ($('#<%= HiddenFieldPricePlanName.ClientID %>').val() == '') {
                    isStepValid = false;
                    $('#wizard').smartWizard('showMessage', 'من فضلك اختر السعر المناسب فى الخطوة رقم ' + step + ' وقم بالضغط على التالى.');
                    $('#wizard').smartWizard('setError', { stepnum: step, iserror: true });
                } else {
                    $('#wizard').smartWizard('setError', { stepnum: step, iserror: false });
                }
            }

            return isStepValid;
        }

        $(document).ready(function () {
            $("#portfolio-list2 li .hoverdiv").click(function (event) {
                $('#portfolio-list2 > li .hoverdiv').removeClass("templateHover");
                $(this).addClass("templateHover");
                var templateid = $(this).attr('id');
                var template = $(this).attr('data-id');
                $('#templateName').html(template);
                var imgsrc = $("#imagename_" + templateid).attr("src");
                $("#templateimage").attr("src", imgsrc);
                $('#<%= HiddenFieldTemplateID.ClientID %>').val(templateid);
                return false;
            });


            $(".BuyLink").click(function (event) {
                $('.BuyLink').removeClass("PriceSelected");
                $(this).addClass("PriceSelected");
                var price = $(this).attr('id');
                $('#price').removeClass("Silver");
                $('#price').removeClass("Golden");
                $('#price').removeClass("Bronze");
                $('#price').addClass(price);
                /*$('#uiTextBoxPricePlan.ClientID').val(price);*/
                $('#<%= HiddenFieldPricePlanName.ClientID %>').val(price);
                return false;
            });

        });
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="banner" style="background: none; height: 30px; padding-top: 30px; margin-top: 20px">
        <span style="border-radius: 12px; -moz-border-radius: 12px; -webkit-border-radius: 12px;
            width: 388px; left: 38%; height: 68px; bottom: -35px;">
            <p style="border-radius: 10px; -moz-border-radius: 10px; -webkit-border-radius: 10px;
                width: 380px; height: 60px; line-height: 60px;">
                طلب تنفيذ موقع </p>
        </span>
    </div>
    <div id="InnerContentWrapper" class="row">
        <div id="wizard" class="swMain">
            <ul>
                <li><a href="#step-1">
                    <label class="stepNumber">
                        1</label>
                    <span class="stepDesc">خطوة 1<br />
                        <small>اختر التصميم المناسب </small></span></a></li>
                <li><a href="#step-2">
                    <label class="stepNumber">
                        2</label>
                    <span class="stepDesc">خطوة 2<br />
                        <small>اختر العرض المناسب</small> </span></a></li>
                <li><a href="#step-3">
                    <label class="stepNumber">
                        3</label>
                    <span class="stepDesc">خطوة 3<br />
                        <small>اطلب الخدمة من I-Valley</small> </span></a></li>
            </ul>
            <div id="step-1">
                <h2 class="StepTitle">
                    اختر التصميم المناسب</h2>
                <!-- start templates -->
                <div id="portfolioWrapp2" class="row">
                    <%--<div id="portfolioNav" class="large-12 columns">
                    <ul id="portfolio-filter" class="clear-fix">
                        <li><a href="Portfolio.aspx" class="current">All</a></li>
                        <li><a rel="design" href="#design" class="">Design</a></li>
                        <li><a rel="webDesign" href="#webDesign" class="">Web Design</a></li>
                        <li><a rel="photography" href="#photography" class="">Photography</a></li>
                    </ul>
                </div>--%>
                    <div id="portfolioContainer" class="large-12 columns">
                        <ul id="portfolio-list2" class="clear-fix">
                            <!-- ITEM 1-->
                            <li class="design" style="display: list-item;">
                                <div class="imageSlide" style="overflow: hidden;">
                                    <ul class="imagesContainer clear-fix sliderCont1">
                                        <li>
                                            <img src="../../../images/portfolio/templates/thumbs/1.png" width="288" alt="Image Name"
                                                id="imagename_Site1"></li>
                                    </ul>
                                    <div class="hoverdiv" id="Site1" data-id="Travel">
                                        <div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="large-2 columns portLinks">
                                    <a href="../../images/portfolio/templates/1.gif" rel="prettyPhoto">Loupe</a> <a href="http://site1.i-valley.com"
                                        target="_blank">Link</a>
                                </div>
                                <div class="large-10 columns portContent" style="float: right; text-align: right;
                                    padding-right: 25px;">
                                    <h2>
                                        <a href="http://site1.i-valley.com" target="_blank">السفر</a></h2>
                                    <p>
                                        جيد جداً لمواقع السياحة والسفر</p>
                                </div>
                            </li>
                            <!-- ITEM 2-->
                            <li class="photography" style="display: list-item;">
                                <div class="imageSlide">
                                    <ul class="imagesContainer clear-fix sliderCont2">
                                        <li>
                                            <img src="../../images/portfolio/templates/thumbs/2.png" width="288" alt="Image Name"
                                                id="imagename_Site2"></li>
                                    </ul>
                                    <div class="hoverdiv" id="Site2" data-id="Business & shopping">
                                        <div>
                                        </div>
                                    </div>
                                </div>
                                <div class="large-2 columns portLinks">
                                    <a href="../../images/portfolio/templates/2.gif" rel="prettyPhoto">Loupe</a> <a href="http://site2.i-valley.com"
                                        target="_blank">Link</a>
                                </div>
                                <div class="large-10 columns portContent" style="float: right; text-align: right;
                                    padding-right: 25px;">
                                    <h2>
                                        <a href="http://site2.i-valley.com" target="_blank">الأعمال والتسوق</a></h2>
                                    <p>
                                        جيد جداً لمواقع للتسوق والتجارة الإلكترونية
                                    </p>
                                </div>
                                
                            </li>
                            <!-- ITEM 3-->
                            <li class="webDesign" style="display: list-item;">
                                <div class="imageSlide">
                                    <ul class="imagesContainer clear-fix sliderCont3">
                                        <li>
                                            <img src="../../images/portfolio/templates/thumbs/3.png" width="288" alt="Image Name"
                                                id="imagename_Site3"></li>
                                    </ul>
                                    <div class="hoverdiv" id="Site3" data-id="Business">
                                        <div>
                                        </div>
                                    </div>
                                </div>
                                <div class="large-2 columns portLinks">
                                    <a href="../../images/portfolio/templates/3.gif" rel="prettyPhoto">Loupe</a> <a href="http://site3.i-valley.com"
                                        target="_blank">Link</a>
                                </div>
                                <div class="large-10 columns portContent" style="float: right; text-align: right;
                                    padding-right: 25px;">
                                    <h2>
                                        <a href="http://site3.i-valley.com" target="_blank">الأعمال والتجارة</a></h2>
                                    <p>
                                        مناسب لشركات الأعمال والتجارة 
                                    </p>
                                </div>
                                
                            </li>
                            <!-- ITEM 4-->
                            <li class="photography" style="display: list-item;">
                                <div class="imageSlide">
                                    <ul class="imagesContainer clear-fix sliderCont4">
                                        <li>
                                            <img src="../../images/portfolio/templates/thumbs/4.png" width="288" alt="Image Name"
                                                id="imagename_Site4"></li>
                                    </ul>
                                    <div class="hoverdiv" id="Site4" data-id="Business">
                                        <div>
                                        </div>
                                    </div>
                                </div>
                                <div class="large-2 columns portLinks">
                                    <a href="../../images/portfolio/templates/4.gif" rel="prettyPhoto">Loupe</a> <a href="http://site4.i-valley.com"
                                        target="_blank">Link</a>
                                </div>
                                <div class="large-10 columns portContent" style="float: right; text-align: right;
                                    padding-right: 25px;">
                                    <h2>
                                        <a href="http://site4.i-valley.com" target="_blank">الأعمال والتجارة</a></h2>
                                    <p>
                                        مناسب لشركات الأعمال والتجارة</p>
                                </div>
                               
                            </li>
                            <!-- ITEM 5-->
                            <li class="webDesign" style="display: list-item;">
                                <div class="imageSlide">
                                    <ul class="imagesContainer clear-fix sliderCont5">
                                        <li>
                                            <img src="../../images/portfolio/templates/thumbs/5.png" width="288" alt="Image Name"
                                                id="imagename_Site5"></li>
                                    </ul>
                                    <div class="hoverdiv" id="Site5" data-id="Business & shopping">
                                        <div>
                                        </div>
                                    </div>
                                </div>
                                <div class="large-2 columns portLinks">
                                    <a href="../../images/portfolio/templates/5.gif" rel="prettyPhoto">Loupe</a> <a href="http://site5.i-valley.com"
                                        target="_blank">Link</a>
                                </div>
                                <div class="large-10 columns portContent" style="float: right; text-align: right;
                                    padding-right: 25px;">
                                    <h2>
                                        <a href="http://site5.i-valley.com" target="_blank">الأعمال والتسوق</a></h2>
                                    <p>
                                        جيد جداً لمواقع للتسوق والتجارة الإلكترونية</p>
                                </div>
                                
                            </li>
                            <!-- ITEM 6-->
                            <li class="design" style="display: list-item;">
                                <div class="imageSlide">
                                    <ul class="imagesContainer clear-fix sliderCont6">
                                        <li>
                                            <img src="../../images/portfolio/templates/thumbs/6.png" width="288" alt="Image Name"
                                                id="imagename_Site6"></li>
                                    </ul>
                                    <div class="hoverdiv" id="Site6" data-id="Online store">
                                        <div>
                                        </div>
                                    </div>
                                </div>
                                <div class="large-2 columns portLinks">
                                    <a href="../../images/portfolio/templates/6.gif" rel="prettyPhoto">Loupe</a> <a href="http://site6.i-valley.com"
                                        target="_blank">Link</a>
                                </div>
                                <div class="large-10 columns portContent" style="float: right; text-align: right;
                                    padding-right: 25px;">
                                    <h2>
                                        <a href="http://site6.i-valley.com" target="_blank">متجر إلكترونى</a></h2>
                                    <p>
                                        جيد جداً لمواقع للتسوق والتجارة الإلكترونية</p>
                                </div>
                                
                            </li>
                            <!-- ITEM 7-->
                            <li class="photography" style="display: list-item;">
                                <div class="imageSlide">
                                    <ul class="imagesContainer clear-fix sliderCont7">
                                        <li>
                                            <img src="../../images/portfolio/templates/thumbs/7.png" width="288" alt="Image Name"
                                                id="imagename_Site7"></li>
                                    </ul>
                                    <div class="hoverdiv" id="Site7" data-id="Fashion & Learning">
                                        <div>
                                        </div>
                                    </div>
                                </div>
                                <div class="large-2 columns portLinks">
                                    <a href="../../images/portfolio/templates/7.gif" rel="prettyPhoto">Loupe</a> <a href="http://site7.i-valley.com"
                                        target="_blank">Link</a>
                                </div>
                                <div class="large-10 columns portContent" style="float: right; text-align: right;
                                    padding-right: 25px;">
                                    <h2>
                                        <a href="http://site7.i-valley.com" target="_blank">التعليم</a></h2>
                                    <p>
                                        مناسب للمدارس والجامعات والمواقع التعليمية
                                    </p>
                                </div>
                                
                            </li>
                            <!-- ITEM 8-->
                            <li class="design" style="display: list-item;">
                                <div class="imageSlide">
                                    <ul class="imagesContainer clear-fix sliderCont8">
                                        <li>
                                            <img src="../../images/portfolio/templates/thumbs/8.png" width="288" alt="Image Name"
                                                id="imagename_Site8"></li>
                                    </ul>
                                    <div class="hoverdiv" id="Site8" data-id="Gallery">
                                        <div>
                                        </div>
                                    </div>
                                </div>
                                <div class="large-2 columns portLinks">
                                    <a href="../../images/portfolio/templates/8.gif" rel="prettyPhoto">Loupe</a> <a href="http://site8.i-valley.com"
                                        target="_blank">Link</a>
                                </div>
                                <div class="large-10 columns portContent" style="float: right; text-align: right;
                                    padding-right: 25px;">
                                    <h2>
                                        <a href="http://site8.i-valley.com" target="_blank">معرض</a></h2>
                                    <p>
                                        مناسب لعرض الأعمال الفنية لـمعرض ، أتيليه أو بازارات.</p>
                                </div>
                                
                            </li>
                            <!-- ITEM 9-->
                            <li class="webDesign" style="display: list-item;">
                                <div class="imageSlide">
                                    <ul class="imagesContainer clear-fix sliderCont9">
                                        <li>
                                            <img src="../../images/portfolio/templates/thumbs/9.png" width="288" alt="Image Name"
                                                id="imagename_Site9"></li>
                                    </ul>
                                    <div class="hoverdiv" id="Site9" data-id="Technology">
                                        <div>
                                        </div>
                                    </div>
                                </div>
                                <div class="large-2 columns portLinks">
                                    <a href="../../images/portfolio/templates/9.gif" rel="prettyPhoto">Loupe</a> <a href="http://site9.i-valley.com"
                                        target="_blank">Link</a>
                                </div>
                                <div class="large-10 columns portContent" style="float: right; text-align: right;
                                    padding-right: 25px;">
                                    <h2>
                                        <a href="http://site9.i-valley.com" target="_blank">تكنولوجيا</a></h2>
                                    <p>
                                        مناسب لعرض المنتجات الإلكترونية وتوفير عروض لعملائك</p>
                                </div>
                                
                            </li>
                            <!-- ITEM 10-->
                            <li class="webDesign" style="display: list-item;">
                                <div class="imageSlide">
                                    <ul class="imagesContainer clear-fix sliderCont9">
                                        <li>
                                            <img src="../../images/portfolio/templates/thumbs/10.png" width="288" alt="Image Name"
                                                id="imagename_Site10"></li>
                                    </ul>
                                    <div class="hoverdiv" id="Site10" data-id="E-commerce">
                                        <div>
                                        </div>
                                    </div>
                                </div>
                                <div class="large-2 columns portLinks">
                                    <a href="../../images/portfolio/templates/10.gif" rel="prettyPhoto">Loupe</a> <a
                                        href="http://site10.i-valley.com" target="_blank">Link</a>
                                </div>
                                <div class="large-10 columns portContent" style="float: right; text-align: right;
                                    padding-right: 25px;">
                                    <h2>
                                        <a href="http://site10.i-valley.com" target="_blank">التجارة الإلكترونية </a>
                                    </h2>
                                    <p>
                                        جيد جداً لمواقع للتسوق والتجارة الإلكترونية</p>
                                </div>
                                
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- end templates -->
                <div class="clear-fix">
                </div>
            </div>
            <div id="step-2">
                <h2 class="StepTitle">
                    اختر العرض المناسب</h2>
                <div class="clear-fix" style="height: 40px;">
                </div>
                <div class="cols-4">
                    <div class="pricing_box" style="background: none; border: none; width: 40%;">
                        <div style="height: 68px">
                        </div>
                        <ul class="features">
                            <li class="even"><strong class="yes">عدد الصفحات </strong></li>
                            <li class="odd"><strong class="yes">Search Engine Optimization (SEO)</strong></li>
                            <li class="even"><strong class="yes">فيس بوك و تويتر  </strong></li>
                            <li class="odd"><strong class="yes">معرض صور </strong></li>
                            <li class="even"><strong class="yes">معرض منتجات</strong></li>
                            <li class="odd"><strong class="yes">تسويق بالنشرة الإلكترونية</strong></li>
                            <li class="even"><strong class="yes">تعديل التصميم الأساسى</strong></li>
                            <li class="odd"><strong class="yes">تدريب لإدارة الموقع عن طريق لوحة تحكم</strong></li>
                            <li class="even"><strong class="yes">صفحة وظائف</strong></li>
                            <li class="odd"><strong class="yes">صفحة طلبات</strong></li>
                            <li class="even"><strong class="yes">عروض ودعاية داخل الموقع</strong>
                            </li>
                            <li class="odd"><strong class="yes">
                                <div style="line-height: normal; width: 93%; display: block; float: left; margin-top: 3px;
                                    ">
                                   إستضافة الموقع
                                    <br />
                                    (مساحة غير محدودة – حسابات بريد إلكترونى غير محدودة)</div>
                            </strong></li>
                            <li class="even"><strong class="yes">Develop custom section</strong></li>
                        </ul>
                    </div>
                    <div class="pricing_box radius-right">
                        <div class="header">
                            <span>برونز</span></div>
                        <ul>
                            <li class="even" style="direction:rtl;"><strong class="yes">10 صفحات</strong></li>
                            <li class="odd"><strong class="yes"></strong></li>
                            <li class="even"><strong class="yes"></strong></li>
                            <li class="odd"><strong class="yes"></strong></li>
                            <li class="even"><strong class="no"></strong></li>
                            <li class="odd"><strong class="no"></strong></li>
                            <li class="even"><strong class="no"></strong></li>
                            <li class="odd"><strong class="yes"></strong></li>
                            <li class="even"><strong class="no"></strong></li>
                            <li class="odd"><strong class="no"></strong></li>
                            <li class="even"><strong class="no"></strong></li>
                            <li class="odd"><strong class="yes"></strong></li>
                            <li class="even"><strong>قابل للتفاوض</strong></li>
                        </ul>
                        <h3>
                            1750 EGP</h3>
                        <p class="button">
                            <a href="#" class="BuyLink" id="Bronze">إختر</a></p>
                    </div>
                    <div class="pricing_box large radius-left">
                        <div class="header">
                            <span>فضى</span>
                        </div>
                        <ul>
                            <li class="even" style="direction: rtl;"><strong class="yes">15 صفحة</strong></li>
                            <li class="odd"><strong class="yes"></strong></li>
                            <li class="even"><strong class="yes"></strong></li>
                            <li class="odd"><strong class="yes"></strong></li>
                            <li class="even"><strong class="yes"></strong></li>
                            <li class="odd"><strong class="no"></strong></li>
                            <li class="even"><strong class="no"></strong></li>
                            <li class="odd"><strong class="yes"></strong></li>
                            <li class="even"><strong class="no"></strong></li>
                            <li class="odd"><strong class="no"></strong></li>
                            <li class="even"><strong class="no"></strong></li>
                            <li class="odd"><strong class="yes"></strong></li>
                            <li class="even"><strong>قابل للتفاوض</strong></li>
                        </ul>
                        <h3>
                            2750 EGP</h3>
                        <p class="button">
                            <a href="#" class="BuyLink" id="Silver">إختر</a></p>
                    </div>
                    <div class="pricing_box radius-right">
                        <div class="header">
                            <span>ذهبى</span></div>
                        <ul>
                            <li class="even"><strong class="yes">عدد غير محدود</strong></li>
                            <li class="odd"><strong class="yes"></strong></li>
                            <li class="even"><strong class="yes"></strong></li>
                            <li class="odd"><strong class="yes"></strong></li>
                            <li class="even"><strong class="yes"></strong></li>
                            <li class="odd"><strong class="yes"></strong></li>
                            <li class="even"><strong class="yes"></strong></li>
                            <li class="odd"><strong class="yes"></strong></li>
                            <li class="even"><strong class="yes"></strong></li>
                            <li class="odd"><strong class="yes"></strong></li>
                            <li class="even"><strong class="yes"></strong></li>
                            <li class="odd"><strong class="yes"></strong></li>
                            <li class="even"><strong>قابل للتفاوض</strong></li>
                        </ul>
                        <h3>
                            4750 EGP</h3>
                        <p class="button">
                            <a href="#" class="BuyLink" id="Golden">إختر</a></p>
                    </div>
                    <div class="clear-fix">
                    </div>
                </div>
                <div class="clear-fix" style="height: 15px;">
                </div>
                <div style="padding: 5px; font: normal bold 16px normal 'times new ramon'; direction:rtl;text-align:right; color: #ff0000">
                    • سوف تدفع فقط 500 جنيه كل عام على استضافة وصيانة بداية من العام المقبل من التعاقد
                    (السنة الأولى مجانا)</div>
                <div class="clear-fix">
                </div>
            </div>
            <div id="step-3">
                <h2 class="StepTitle">
                    اطلب الخدمة من I-Valley</h2>
                <div id="contactForm" class="large-6 columns" style="float:right;">
                    <div class="large-12 columns inputContainer">
                        <p>
                            الأسم:</p>
                        <label class="forName" for="name">
                        </label>
                        <asp:TextBox ID="uiTextBoxName" runat="server" class="validate[required]"></asp:TextBox>
                    </div>
                    <div class="large-12 columns inputContainer">
                        <p>
                            الخط الأرضى:</p>
                        <label class="forName" for="tele1">
                        </label>
                        <asp:TextBox ID="uiTextBoxLand" runat="server" class="validate[custom[number]]"></asp:TextBox>
                    </div>
                    <div class="large-12 columns inputContainer">
                        <p>
                            الموبايل:</p>
                        <label class="forName" for="tele2">
                        </label>
                        <asp:TextBox ID="uiTextBoxTele" runat="server" class="validate[required,custom[number]]"></asp:TextBox>
                    </div>
                    <div class="large-12 columns inputContainer">
                        <p>
                            الشركة:</p>
                        <label class="forName" for="company">
                        </label>
                        <asp:TextBox ID="uiTextBoxCompany" runat="server"></asp:TextBox>
                    </div>
                    <div class="large-12 columns inputContainer">
                        <p>
                            البريد الإلكترونى:</p>
                        <label class="forEmail" for="eMail">
                        </label>
                        <asp:TextBox ID="uiTextBoxMail" runat="server" class="validate[required,custom[email]]"></asp:TextBox>
                    </div>
                </div>
                <div class="large-6 columns" style="padding: 20px;float:right;">
                    <h3 style="direction:rtl;text-align:right;">
                        التصميم : <span id="templateName"></span>
                    </h3>
                    <div style="text-align: right;">
                        <img src="" id="templateimage" alt="" style="border-radius: 10px; -moz-border-radius: 10px;
                            -webkit-border-radius: 10px;" />
                        <div id="price" style="position: absolute; width: 120px; height: 200px; top: 55%;
                            right: 50%;">
                        </div>
                    </div>
                </div>
                <div class="clear-fix">
                </div>
            </div>
        </div>
        <asp:HiddenField ID="HiddenFieldTemplateID" runat="server" />
        <asp:HiddenField ID="HiddenFieldPricePlanName" runat="server" />
    </div>
</asp:Content>
