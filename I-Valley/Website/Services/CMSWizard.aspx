<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Inner.Master" AutoEventWireup="true" CodeBehind="CMSWizard.aspx.cs" Inherits="Website.Services.CMSWizard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../javascripts/jquery.smartWizard-2.0.min.js" type="text/javascript"></script>
    <link href="../stylesheets/smart_wizard.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('#wizard').smartWizard({ transitionEffect: 'slide', onFinish: onFinishCallback, onLeaveStep: leaveAStepCallback });

            function onFinishCallback() {
                $('form').submit();
            }

            function leaveAStepCallback(obj) {
                var step_num = obj.attr('rel');
                return validateSteps(step_num);
            }
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
                var template = $(this).attr('id');
                $('#templateName').html(template);
                var imgsrc = $("#imagename_" + template).attr("src");
                $("#templateimage").attr("src", imgsrc);
                $('#<%= HiddenFieldTemplateID.ClientID %>').val(template);
                return false;
            });


            $(".BuyLink").click(function (event) {
                $('.BuyLink').removeClass("PriceSelected");
                $(this).addClass("PriceSelected");
                var price = $(this).attr('id');
                $('#price').addClass(price);
                /*$('#uiTextBoxPricePlan.ClientID').val(price);*/
                $('#<%= HiddenFieldPricePlanName.ClientID %>').val(price);
                return false;
            });

        });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div id="banner" style="background:none;height:30px;padding-top:30px;">
        
        <span style="border-radius: 12px; -moz-border-radius: 12px; -webkit-border-radius: 12px;
            width: 388px;left:38%;height:68px;bottom:-35px;">
            <p style="border-radius:10px;-moz-border-radius:10px;-webkit-border-radius:10px;width:380px;height:60px;line-height:60px;">
                Cms website request</p>
        </span>
    </div>
    <div id="InnerContentWrapper" class="row">
       

    <div id="wizard" class="swMain">
        <ul>
            <li><a href="#step-1">
                <label class="stepNumber">
                    1</label>
                <span class="stepDesc">Step 1<br />
                    <small>Choose your template design </small> </span></a></li>
            <li><a href="#step-2">
                <label class="stepNumber">
                    2</label>
                <span class="stepDesc">Step 2<br />
                    <small>Choose your price package</small> </span></a></li>
            <li><a href="#step-3">
                <label class="stepNumber">
                    3</label>
                <span class="stepDesc">Step 3<br />
                    <small>Request Service from I-Valley</small> </span></a></li>
            
        </ul>
        <div id="step-1">
            <h2 class="StepTitle">
                Choose your template design</h2>
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
                                        <img src="../images/portfolio/portfolio-img1.jpg" width="312" height="215" alt="Image Name" id="imagename_Template1"></li>
                                   
                                </ul>
                                <div class="hoverdiv" id="Template1">
                                <div></div>
                                </div>
                            </div>
                            <div class="large-10 columns portContent">
                                <h2>
                                    <a href="project.html">Project Title</a><span class="titleDivide">|</span> <span
                                        class="portCategorie">Design</span></h2>
                                <p>
                                    Nisi integer tristique placerat sed, velit! Porta odio dolor odio tincidunt. Porta
                                    magna?</p>
                            </div>
                            <div class="large-2 columns portLinks">
                                <a href="blog-post-img1.jpg" rel="prettyPhoto">Loupe</a> <a href="project.html">Link</a>
                            </div>
                        </li>
                        <!-- ITEM 2-->
                        <li class="photography" style="display: list-item;">
                            <div class="imageSlide">
                                <ul class="imagesContainer clear-fix sliderCont2">
                                    <li>
                                        <img src="../images/portfolio/portfolio-img2.jpg" width="312" height="215" alt="Image Name"
                                            id="imagename_Template2"></li>
                                    
                                </ul>
                                <div class="hoverdiv" id="Template2">
                                    <div>
                                    </div>
                                </div>
                            </div>
                            <div class="large-10 columns portContent">
                                <h2>
                                    <a href="project.html">Project Title</a><span class="titleDivide">|</span> <span
                                        class="portCategorie">Photography</span></h2>
                                <p>
                                    Nisi integer tristique placerat sed, velit! Porta odio dolor odio tincidunt. Porta
                                    magna?</p>
                            </div>
                            <div class="large-2 columns portLinks">
                                <a href="blog-post-img1.jpg" rel="prettyPhoto">Loupe</a> <a href="project.html">Link</a>
                            </div>
                        </li>
                        <!-- ITEM 3-->
                        <li class="webDesign" style="display: list-item;">
                            <div class="imageSlide">
                                <ul class="imagesContainer clear-fix sliderCont3" >
                                    <li>
                                        <img src="../images/portfolio/portfolio-img3.jpg" width="312" height="215" alt="Image Name"
                                            id="imagename_Template3"></li>
                                    
                                </ul>
                                <div class="hoverdiv" id="Template3">
                                    <div>
                                    </div>
                                </div>
                            </div>
                            <div class="large-10 columns portContent">
                                <h2>
                                    <a href="project.html">Project Title</a><span class="titleDivide">|</span> <span
                                        class="portCategorie">Web Design</span></h2>
                                <p>
                                    Nisi integer tristique placerat sed, velit! Porta odio dolor odio tincidunt. Porta
                                    magna?</p>
                            </div>
                            <div class="large-2 columns portLinks">
                                <a href="blog-post-img1.jpg" rel="prettyPhoto">Loupe</a> <a href="project.html">Link</a>
                            </div>
                        </li>
                        <!-- ITEM 4-->
                        <li class="photography" style="display: list-item;">
                            <div class="imageSlide">
                                <ul class="imagesContainer clear-fix sliderCont4">
                                    <li>
                                        <img src="../images/portfolio/portfolio-img4.jpg" width="312" height="215" alt="Image Name"
                                            id="imagename_Template4"></li>
                                    
                                </ul>
                                <div class="hoverdiv" id="Template4">
                                    <div>
                                    </div>
                                </div>
                            </div>
                            <div class="large-10 columns portContent">
                                <h2>
                                    <a href="project.html">Project Title</a><span class="titleDivide">|</span> <span
                                        class="portCategorie">Photography</span></h2>
                                <p>
                                    Nisi integer tristique placerat sed, velit! Porta odio dolor odio tincidunt. Porta
                                    magna?</p>
                            </div>
                            <div class="large-2 columns portLinks">
                                <a href="blog-post-img1.jpg" rel="prettyPhoto">Loupe</a> <a href="project.html">Link</a>
                            </div>
                        </li>
                        <!-- ITEM 5-->
                        <li class="webDesign" style="display: list-item;">
                            <div class="imageSlide">
                                <ul class="imagesContainer clear-fix sliderCont5">
                                    <li>
                                        <img src="../images/portfolio/portfolio-img5.jpg" width="312" height="215" alt="Image Name"
                                            id="imagename_Template5"></li>
                                    
                                </ul>
                                <div class="hoverdiv" id="Template5">
                                    <div>
                                    </div>
                                </div>
                            </div>
                            <div class="large-10 columns portContent">
                                <h2>
                                    <a href="project.html">Project Title</a><span class="titleDivide">|</span> <span
                                        class="portCategorie">Web Design</span></h2>
                                <p>
                                    Nisi integer tristique placerat sed, velit! Porta odio dolor odio tincidunt. Porta
                                    magna?</p>
                            </div>
                            <div class="large-2 columns portLinks">
                                <a href="blog-post-img1.jpg" rel="prettyPhoto">Loupe</a> <a href="project.html">Link</a>
                            </div>
                        </li>
                        <!-- ITEM 6-->
                        <li class="design" style="display: list-item;">
                            <div class="imageSlide">
                                <ul class="imagesContainer clear-fix sliderCont6">
                                    <li>
                                        <img src="../images/portfolio/portfolio-img6.jpg" width="312" height="215" alt="Image Name"
                                            id="imagename_Template6"></li>
                                   
                                </ul>
                                <div class="hoverdiv" id="Template6">
                                    <div>
                                    </div>
                                </div>
                            </div>
                            <div class="large-10 columns portContent">
                                <h2>
                                    <a href="project.html">Project Title</a><span class="titleDivide">|</span> <span
                                        class="portCategorie">Design</span></h2>
                                <p>
                                    Nisi integer tristique placerat sed, velit! Porta odio dolor odio tincidunt. Porta
                                    magna?</p>
                            </div>
                            <div class="large-2 columns portLinks">
                                <a href="blog-post-img1.jpg" rel="prettyPhoto">Loupe</a> <a href="project.html">Link</a>
                            </div>
                        </li>
                        <!-- ITEM 7-->
                        <li class="photography" style="display: list-item;">
                            <div class="imageSlide">
                                <ul class="imagesContainer clear-fix sliderCont7">
                                    <li>
                                        <img src="../images/portfolio/portfolio-img7.jpg" width="312" height="215" alt="Image Name"
                                            id="imagename_Template7"></li>
                                    
                                </ul>
                                <div class="hoverdiv" id="Template7">
                                    <div>
                                    </div>
                                </div>
                            </div>
                            <div class="large-10 columns portContent">
                                <h2>
                                    <a href="project.html">Project Title</a><span class="titleDivide">|</span> <span
                                        class="portCategorie">Photography</span></h2>
                                <p>
                                    Nisi integer tristique placerat sed, velit! Porta odio dolor odio tincidunt. Porta
                                    magna?</p>
                            </div>
                            <div class="large-2 columns portLinks">
                                <a href="blog-post-img1.jpg" rel="prettyPhoto">Loupe</a> <a href="project.html">Link</a>
                            </div>
                        </li>
                        <!-- ITEM 8-->
                        <li class="design" style="display: list-item;">
                            <div class="imageSlide">
                                <ul class="imagesContainer clear-fix sliderCont8">
                                    <li>
                                        <img src="../images/portfolio/portfolio-img8.jpg" width="312" height="215" alt="Image Name"
                                            id="imagename_Template8"></li>
                                   
                                </ul>
                                <div class="hoverdiv" id="Template8">
                                    <div>
                                    </div>
                                </div>
                            </div>
                            <div class="large-10 columns portContent">
                                <h2>
                                    <a href="project.html">Project Title</a><span class="titleDivide">|</span> <span
                                        class="portCategorie">Design</span></h2>
                                <p>
                                    Nisi integer tristique placerat sed, velit! Porta odio dolor odio tincidunt. Porta
                                    magna?</p>
                            </div>
                            <div class="large-2 columns portLinks">
                                <a href="blog-post-img1.jpg" rel="prettyPhoto">Loupe</a> <a href="project.html">Link</a>
                            </div>
                        </li>
                        <!-- ITEM 8-->
                        <li class="webDesign" style="display: list-item;">
                            <div class="imageSlide">
                                <ul class="imagesContainer clear-fix sliderCont9">
                                    <li>
                                        <img src="../images/portfolio/portfolio-img9.jpg" width="312" height="215" alt="Image Name"
                                            id="imagename_Template9"></li>
                                   
                                </ul>
                                <div class="hoverdiv" id="Template9">
                                    <div ></div>
                                </div>
                            </div>
                            <div class="large-10 columns portContent">
                                <h2>
                                    <a href="project.html">Project Title</a><span class="titleDivide">|</span> <span
                                        class="portCategorie">Web Design</span></h2>
                                <p>
                                    Nisi integer tristique placerat sed, velit! Porta odio dolor odio tincidunt. Porta
                                    magna?</p>
                            </div>
                            <div class="large-2 columns portLinks">
                                <a href="blog-post-img1.jpg" rel="prettyPhoto">Loupe</a> <a href="project.html">Link</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- end templates -->

        </div>
        <div id="step-2">
            <h2 class="StepTitle">
                Choose your price package</h2>
           <div class="clear-fix" style="height:40px;"></div>
            <div class="cols-4">
                <div class="pricing_box" style="background:none;border:none;width:40%;">
                    <div style="height:68px"></div>
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
                        <li class="even"><strong class="yes">Products promotions & Sale offers </strong></li>
                        <li class="odd" ><strong class="yes"><div style="line-height:normal;width:80%;display:block;float:right;margin-right:52px;margin-top:15px;">Web hosting <br />(unlimited space – unlimited mail boxes)</div></strong></li>
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
                <div class="clear-fix" >
                </div>
            </div>
            <div class="clear-fix" style="height:15px;"></div>
            <div style="padding: 5px; font: normal bold 16px normal 'times new ramon'; color: #ff0000">• You will pay only 500 EGP each year for hosting and maintenance start from the
            next year of contracting (first year free)</div>
        </div>
        <div id="step-3">
            <h2 class="StepTitle">
                Request Service from I-Valley</h2>
           
           <div id="contactForm" class="large-6 columns">               
               <div class="large-12 columns inputContainer">
                   <p>
                       Name:</p>
                   <label class="forName" for="name">
                   </label>
                   <asp:TextBox ID="uiTextBoxName" runat="server"></asp:TextBox>
               </div>
               <div class="large-12 columns inputContainer">
                   <p>
                       Land line:</p>
                   <label class="forName" for="tele1">
                   </label>
                   <asp:TextBox ID="uiTextBoxLand" runat="server"></asp:TextBox>
               </div>
               <div class="large-12 columns inputContainer">
                   <p>
                       Mobile:</p>
                   <label class="forName" for="tele2">
                   </label>
                   <asp:TextBox ID="uiTextBoxTele" runat="server"></asp:TextBox>
               </div>
               <div class="large-12 columns inputContainer">
                   <p>
                       Company:</p>
                   <label class="forName" for="company">
                   </label>
                   <asp:TextBox ID="uiTextBoxComapny" runat="server"></asp:TextBox>
               </div>
               <div class="large-12 columns inputContainer">
                   <p>
                       Email:</p>
                   <label class="forEmail" for="eMail">
                   </label>
                   <asp:TextBox ID="uiTextBoxMail" runat="server"></asp:TextBox>
               </div>
           </div>
            <div class="large-6 columns" style="padding :20px;">
                <h3>
                Template : <span id="templateName"></span>
                </h3>
                
                <div>
                    <img src="" id="templateimage" alt="" style="border-radius: 10px; -moz-border-radius: 10px;
                        -webkit-border-radius: 10px;" />
                        <div id="price" style="position:absolute;width:120px;height:200px;top:55%;left:50%;"></div> 
                </div>
            </div>
        </div>
        
    </div>        
        <asp:HiddenField ID="HiddenFieldTemplateID" runat="server" />
        <asp:HiddenField ID="HiddenFieldPricePlanName" runat="server" />
        <asp:HiddenField ID="HiddenFieldPricePlanID" runat="server" />
    </div>

</asp:Content>
