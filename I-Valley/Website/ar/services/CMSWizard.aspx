<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ArInner.Master" AutoEventWireup="true" CodeBehind="CMSWizard.aspx.cs" Inherits="Website.ar.services.CMSWizard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../javascripts/jquery.smartWizard-2.0.min.js" type="text/javascript"></script>
    <link href="../../stylesheets/ar_smart_wizard.css" rel="stylesheet" type="text/css" />
    <script src="../../javascripts/jquery.validationEngine-en.js" type="text/javascript"></script>
    <script src="../../javascripts/jquery.validationEngine.js" type="text/javascript"></script>
    <link href="../../stylesheets/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('#wizard').smartWizard({ transitionEffect: 'slide', onFinish: onFinishCallback, onLeaveStep: leaveAStepCallback, labelNext: 'التالى', labelFinish: 'إنهاء', labelPrevious: 'السابق' });

            function onFinishCallback() {
                $('form').submit();
            }

            function leaveAStepCallback(obj) {
                var step_num = obj.attr('rel');
                return validateSteps(step_num);
            }

            $("form").validationEngine();
        });

        function validateSteps(step) {
            var isStepValid = true;
            if (step == 1) {
                if ($('#<%= HiddenFieldTemplateID.ClientID %>').val() == '') {
                    isStepValid = false;
                    $('#wizard').smartWizard('showMessage', 'Please select template in step' + step + ' and click next.');
                    $('#wizard').smartWizard('setError', { stepnum: step, iserror: true });
                } else {
                    $('#wizard').smartWizard('setError', { stepnum: step, iserror: false });
                }
            }

            if (step == 2) {
                if ($('#<%= HiddenFieldPricePlanName.ClientID %>').val() == '') {
                    isStepValid = false;
                    $('#wizard').smartWizard('showMessage', 'Please price plan in step' + step + ' and click next.');
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
                Cms website request</p>
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
                                <div class="large-10 columns portContent">
                                    <h2>
                                        <a href="http://site1.i-valley.com" target="_blank">Travel</a></h2>
                                    <p>
                                        Best fit for tourism & travel websites</p>
                                </div>
                                <div class="large-2 columns portLinks">
                                    <a href="../../images/portfolio/templates/1.gif" rel="prettyPhoto">Loupe</a> <a href="http://site1.i-valley.com"
                                        target="_blank">Link</a>
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
                                <div class="large-10 columns portContent">
                                    <h2>
                                        <a href="http://site2.i-valley.com" target="_blank">Business & shopping</a></h2>
                                    <p>
                                        Best fit for shopping products & e-commerce
                                    </p>
                                </div>
                                <div class="large-2 columns portLinks">
                                    <a href="../../images/portfolio/templates/2.gif" rel="prettyPhoto">Loupe</a> <a href="http://site2.i-valley.com"
                                        target="_blank">Link</a>
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
                                <div class="large-10 columns portContent">
                                    <h2>
                                        <a href="http://site3.i-valley.com" target="_blank">Business</a></h2>
                                    <p>
                                        Standard view for business companies website style
                                    </p>
                                </div>
                                <div class="large-2 columns portLinks">
                                    <a href="../../images/portfolio/templates/3.gif" rel="prettyPhoto">Loupe</a> <a href="http://site3.i-valley.com"
                                        target="_blank">Link</a>
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
                                <div class="large-10 columns portContent">
                                    <h2>
                                        <a href="http://site4.i-valley.com" target="_blank">Business</a></h2>
                                    <p>
                                        Standard view for business companies website style</p>
                                </div>
                                <div class="large-2 columns portLinks">
                                    <a href="../../images/portfolio/templates/4.gif" rel="prettyPhoto">Loupe</a> <a href="http://site4.i-valley.com"
                                        target="_blank">Link</a>
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
                                <div class="large-10 columns portContent">
                                    <h2>
                                        <a href="http://site5.i-valley.com" target="_blank">Business & shopping</a></h2>
                                    <p>
                                        Best fit for shopping products & e-commerce</p>
                                </div>
                                <div class="large-2 columns portLinks">
                                    <a href="../../images/portfolio/templates/5.gif" rel="prettyPhoto">Loupe</a> <a href="http://site5.i-valley.com"
                                        target="_blank">Link</a>
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
                                <div class="large-10 columns portContent">
                                    <h2>
                                        <a href="http://site6.i-valley.com" target="_blank">Online store</a></h2>
                                    <p>
                                        Best fit for shopping products & e-commerce</p>
                                </div>
                                <div class="large-2 columns portLinks">
                                    <a href="../../images/portfolio/templates/6.gif" rel="prettyPhoto">Loupe</a> <a href="http://site6.i-valley.com"
                                        target="_blank">Link</a>
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
                                <div class="large-10 columns portContent">
                                    <h2>
                                        <a href="http://site7.i-valley.com" target="_blank">Fashion & Learning</a></h2>
                                    <p>
                                        perfect for schools, educational sites, and universities.
                                    </p>
                                </div>
                                <div class="large-2 columns portLinks">
                                    <a href="../../images/portfolio/templates/7.gif" rel="prettyPhoto">Loupe</a> <a href="http://site7.i-valley.com"
                                        target="_blank">Link</a>
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
                                <div class="large-10 columns portContent">
                                    <h2>
                                        <a href="http://site8.i-valley.com" target="_blank">Gallery</a></h2>
                                    <p>
                                        Perfect for view & higlights your business images for gallery shops, Atelier & Bazaars
                                        .</p>
                                </div>
                                <div class="large-2 columns portLinks">
                                    <a href="../../images/portfolio/templates/8.gif" rel="prettyPhoto">Loupe</a> <a href="http://site8.i-valley.com"
                                        target="_blank">Link</a>
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
                                <div class="large-10 columns portContent">
                                    <h2>
                                        <a href="http://site9.i-valley.com" target="_blank">Technology</a></h2>
                                    <p>
                                        Perfect for list your technology items in order to make good offers for your customers</p>
                                </div>
                                <div class="large-2 columns portLinks">
                                    <a href="../../images/portfolio/templates/9.gif" rel="prettyPhoto">Loupe</a> <a href="http://site9.i-valley.com"
                                        target="_blank">Link</a>
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
                                <div class="large-10 columns portContent">
                                    <h2>
                                        <a href="http://site10.i-valley.com" target="_blank">E-commerce </a>
                                    </h2>
                                    <p>
                                        Best fit for shopping products & e-commerce</p>
                                </div>
                                <div class="large-2 columns portLinks">
                                    <a href="../../images/portfolio/templates/10.gif" rel="prettyPhoto">Loupe</a> <a href="http://site10.i-valley.com"
                                        target="_blank">Link</a>
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
                            <li class="even"><strong class="yes">Number of pages </strong></li>
                            <li class="odd"><strong class="yes">Search Engine Optimization (SEO)</strong></li>
                            <li class="even"><strong class="yes">Facebook and Twitter Link </strong></li>
                            <li class="odd"><strong class="yes">Image Gallery</strong></li>
                            <li class="even"><strong class="yes">Product Gallery </strong></li>
                            <li class="odd"><strong class="yes">News Letter marketing </strong></li>
                            <li class="even"><strong class="yes">Design Customization</strong></li>
                            <li class="odd"><strong class="yes">Website Admin training </strong></li>
                            <li class="even"><strong class="yes">Careers page </strong></li>
                            <li class="odd"><strong class="yes">Inquiry page</strong></li>
                            <li class="even"><strong class="yes">Products promotions & Sale offers </strong>
                            </li>
                            <li class="odd"><strong class="yes">
                                <div style="line-height: normal; width: 80%; display: block; float: right; margin-right: 52px;
                                    margin-top: 15px;">
                                    Web hosting
                                    <br />
                                    (unlimited space – unlimited mail boxes)</div>
                            </strong></li>
                            <li class="even"><strong class="yes">Develop custom section</strong></li>
                        </ul>
                    </div>
                    <div class="pricing_box radius-right">
                        <div class="header">
                            <span>Bronze</span></div>
                        <ul>
                            <li class="even"><strong class="yes">10 Pages</strong></li>
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
                            <li class="even"><strong>Negotiable</strong></li>
                        </ul>
                        <h3>
                            1750 EGP</h3>
                        <p class="button">
                            <a href="#" class="BuyLink" id="Bronze">Select</a></p>
                    </div>
                    <div class="pricing_box large radius-left">
                        <div class="header">
                            <span>Silver</span>
                        </div>
                        <ul>
                            <li class="even"><strong class="yes">15 Pages</strong></li>
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
                            <li class="even"><strong>Negotiable</strong></li>
                        </ul>
                        <h3>
                            2750 EGP</h3>
                        <p class="button">
                            <a href="#" class="BuyLink" id="Silver">Select</a></p>
                    </div>
                    <div class="pricing_box radius-right">
                        <div class="header">
                            <span>Golden</span></div>
                        <ul>
                            <li class="even"><strong class="yes">Unlimited pages</strong></li>
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
                            <li class="even"><strong>Negotiable</strong></li>
                        </ul>
                        <h3>
                            4750 EGP</h3>
                        <p class="button">
                            <a href="#" class="BuyLink" id="Golden">Select</a></p>
                    </div>
                    <div class="clear-fix">
                    </div>
                </div>
                <div class="clear-fix" style="height: 15px;">
                </div>
                <div style="padding: 5px; font: normal bold 16px normal 'times new ramon'; color: #ff0000">
                    • You will pay only 500 EGP each year for hosting and maintenance start from the
                    next year of contracting (first year free)</div>
                <div class="clear-fix">
                </div>
            </div>
            <div id="step-3">
                <h2 class="StepTitle">
                    اطلب الخدمة من I-Valley</h2>
                <div id="contactForm" class="large-6 columns">
                    <div class="large-12 columns inputContainer">
                        <p>
                            Name:</p>
                        <label class="forName" for="name">
                        </label>
                        <asp:TextBox ID="uiTextBoxName" runat="server" class="validate[required]"></asp:TextBox>
                    </div>
                    <div class="large-12 columns inputContainer">
                        <p>
                            Land line:</p>
                        <label class="forName" for="tele1">
                        </label>
                        <asp:TextBox ID="uiTextBoxLand" runat="server" class="validate[custom[number]]"></asp:TextBox>
                    </div>
                    <div class="large-12 columns inputContainer">
                        <p>
                            Mobile:</p>
                        <label class="forName" for="tele2">
                        </label>
                        <asp:TextBox ID="uiTextBoxTele" runat="server" class="validate[required,custom[number]]"></asp:TextBox>
                    </div>
                    <div class="large-12 columns inputContainer">
                        <p>
                            Company:</p>
                        <label class="forName" for="company">
                        </label>
                        <asp:TextBox ID="uiTextBoxCompany" runat="server"></asp:TextBox>
                    </div>
                    <div class="large-12 columns inputContainer">
                        <p>
                            Email:</p>
                        <label class="forEmail" for="eMail">
                        </label>
                        <asp:TextBox ID="uiTextBoxMail" runat="server" class="validate[required,custom[email]]"></asp:TextBox>
                    </div>
                </div>
                <div class="large-6 columns" style="padding: 20px;">
                    <h3>
                        Template : <span id="templateName"></span>
                    </h3>
                    <div>
                        <img src="" id="templateimage" alt="" style="border-radius: 10px; -moz-border-radius: 10px;
                            -webkit-border-radius: 10px;" />
                        <div id="price" style="position: absolute; width: 120px; height: 200px; top: 55%;
                            left: 50%;">
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
