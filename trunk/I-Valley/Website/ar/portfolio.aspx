<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ArInner.Master" AutoEventWireup="true" CodeBehind="portfolio.aspx.cs" Inherits="Website.ar.portfolio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="banner" style="background: none; height: 30px; padding-top: 30px; margin-top: 20px">
        <span style="border-radius: 12px; -moz-border-radius: 12px; -webkit-border-radius: 12px;
            width: 388px; left: 38%; height: 68px; bottom: -35px;">
            <p style="border-radius: 10px; -moz-border-radius: 10px; -webkit-border-radius: 10px;
                width: 380px; height: 60px; line-height: 60px;">
                أعمالنا السابقه</p>
        </span>
    </div>
    <div id="portfolioWrapp" class="row">
        <div id="portfolioNav" class="large-12 columns">
            <ul id="portfolio-filter" class="clear-fix">
                <li><a href="#all" class="current">الكل</a></li>
                <li><a rel="businesswebsites" href="#businesswebsites" class="">مواقع تجارية</a></li>
                <li><a rel="systemdevelopment" href="#systemdevelopment" class="">أنظمة</a></li>
                <li><a rel="Outsourcing" href="#Outsourcing" class="">برمجه عن بعد</a></li>
            </ul>
        </div>
        <div id="portfolioContainer" class="large-12 columns">
            <ul id="portfolio-list" class="clear-fix">
                <!-- ITEM 1-->
                <li class="businesswebsites" style="display: list-item;">
                    <div class="imageSlide" style="overflow: hidden;">
                        <ul class="imagesContainer clear-fix sliderCont1">
                            <li>
                                <img src="../images/portfolio/images/thumbs/1.gif" width="288" alt="Image Name"></li>
                        </ul>
                    </div>
                    
                    <div class="large-2 columns portLinks">
                        <a href="../images/portfolio/images/1.gif" rel="prettyPhoto">Loupe</a> <a target="_blank"
                            href="http://www.obtravel-eg.com">Link</a>
                            
                    </div>
                    <div class="large-10 columns portContent" style="float:right;text-align:right;padding-right:25px;">
                        <h2>
                           <span class="portCategorie">مواقع تجارية</span> <span class="titleDivide">|</span><a target="_blank" href="http://www.obtravel-eg.com/">Obtravel</a>
                            </h2>
                            <p>موقع شركة السياحه و العروض السياحيه اون بورد ترافيل</p>
                    </div>
                </li>
                <!-- ITEM 2-->
                <li class="systemdevelopment" style="display: list-item;">
                    <div class="imageSlide">
                        <ul class="imagesContainer clear-fix sliderCont2">
                            <li>
                                <img src="../images/portfolio/images/thumbs/12.gif" width="288" alt="Image Name"></li>
                        </ul>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="../images/portfolio/images/12.gif" rel="prettyPhoto">Loupe</a> <a target="_blank"
                            href="http://ifinance.i-valley.com">Link</a>
                    </div>
                    <div class="large-10 columns portContent" style="float: right; text-align: right;
                        padding-right: 25px;">
                        <h2>
                          <span class="portCategorie">System Development</span>  <span class="titleDivide">|</span> 
                            <a target="_blank" href="http://ifinance.i-valley.com">I-Finance</a>
                            </h2>
                            <p>برنامج ادارة الماليات و المخازن داخل الشركات و المؤسسات المتوسطة الحجم</p>
                    </div>
                    
                </li>
                <!-- ITEM 3-->
                <li class="Outsourcing" style="display: list-item;">
                    <div class="imageSlide">
                        <ul class="imagesContainer clear-fix sliderCont3">
                            <li>
                                <img src="../images/portfolio/images/thumbs/8.gif" width="288" alt="Image Name"></li>
                        </ul>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="../images/portfolio/images/8.gif" rel="prettyPhoto">Loupe</a> <a target="_blank"
                            href="http://www.euroinvestor.dk/">Link</a>
                    </div>
                    <div class="large-10 columns portContent" style="float: right; text-align: right;
                        padding-right: 25px;">
                        <h2>
                            <span class="portCategorie">Outsourcing</span><span class="titleDivide">|</span>
                            <a target="_blank" href="http://www.euroinvestor.dk/">Euroinvestor</a>
                            </h2>
                            <p>موقع تحليلات بورصة الاتحاد الاوربى و التجاره الالكترونيه و التبادل التجارى</p>
                    </div>
                    
                </li>
                <!-- ITEM 4-->
                <li class="businesswebsites" style="display: list-item;">
                    <div class="imageSlide" style="overflow: hidden;">
                        <ul class="imagesContainer clear-fix sliderCont1">
                            <li>
                                <img src="../images/portfolio/images/thumbs/3.gif" width="288" alt="Image Name"></li>
                        </ul>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="../images/portfolio/images/3.gif" rel="prettyPhoto">Loupe</a> <a target="_blank"
                            href="http://www.glologistics.com">Link</a>
                    </div>
                    <div class="large-10 columns portContent" style="float: right; text-align: right;
                        padding-right: 25px;">
                        <h2>
                            <span class="portCategorie">مواقع تجارية</span> <span
                                class="titleDivide">|</span><a target="_blank" href="http://www.glologistics.com/">Glologistics</a></h2>
                                <p>موقع شركة جلوبال لوجيستك و هو دليل لكل شركات الشحن و مزود بمحرك بحث مميز</p>
                    </div>
                    
                </li>
                <!-- ITEM 5-->
                <li class="systemdevelopment" style="display: list-item;">
                    <div class="imageSlide">
                        <ul class="imagesContainer clear-fix sliderCont2">
                            <li>
                                <img src="../images/portfolio/images/thumbs/11.gif" width="288" alt="Image Name"></li>
                        </ul>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="../images/portfolio/images/11.gif" rel="prettyPhoto">Loupe</a> <a target="_blank"
                            href="http://midwestapp.i-valley.com">Link</a>
                    </div>
                    <div class="large-10 columns portContent" style="float: right; text-align: right;
                        padding-right: 25px;">
                        <h2>
                         <span class="portCategorie">System Development</span>   <span class="titleDivide">|</span><a
                             target="_blank" href="http://midwestapp.i-valley.com">I-Flights</a>
                            </h2>
                            <p>برنامج ميكنة خطوط الطيران بكل اقسام الشركه متضمنا جميع التقارير الرسميه المطلوبه من السلطه</p>
                    </div>
                    
                </li>
                <!-- ITEM 6-->
                <li class="Outsourcing" style="display: list-item;">
                    <div class="imageSlide">
                        <ul class="imagesContainer clear-fix sliderCont3">
                            <li>
                                <img src="../images/portfolio/images/thumbs/7.gif" width="288" alt="Image Name"></li>
                        </ul>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="../images/portfolio/images/7.gif" rel="prettyPhoto">Loupe</a> <a target="_blank"
                            href="http://www.zmags.com/">Link</a>
                    </div>
                    <div class="large-10 columns portContent" style="float: right; text-align: right;
                        padding-right: 25px;">
                        <h2>
                          <span class="portCategorie">Outsourcing</span>  <span class="titleDivide">|</span><a
                              target="_blank" href="http://www.zmags.com/">Zmags</a>
                            </h2>
                            <p>موقع التصفح الالكترونى و المجله الشهيره زد ماج ذو التعاملات واسعة النطاق</p>
                    </div>
                    
                </li>
                <!-- ITEM 7-->
                <li class="businesswebsites" style="display: list-item;">
                    <div class="imageSlide" style="overflow: hidden;">
                        <ul class="imagesContainer clear-fix sliderCont1">
                            <li>
                                <img src="../images/portfolio/images/thumbs/2.gif" width="288" alt="Image Name"></li>
                        </ul>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="../images/portfolio/images/2.gif" rel="prettyPhoto">Loupe</a> <a target="_blank"
                            href="http://www.anbaermia.com/">Link</a>
                    </div>
                    <div class="large-10 columns portContent" style="float: right; text-align: right;
                        padding-right: 25px;">
                        <h2>
                           <span class="portCategorie">مواقع تجارية</span> <span class="titleDivide">|</span><a
                               target="_blank" href="http://www.anbaermia.com/">Anba Ermia</a>
                            </h2>
                            <p>الموقع الرسمى لنيافة الانبا ارميا الاسقف العام و سكرتير البابا تواضروس بابا الاقباط الارثوذكس</p>
                    </div>
                    
                </li>
                <!-- ITEM 8-->
                <li class="Outsourcing" style="display: list-item;">
                    <div class="imageSlide">
                        <ul class="imagesContainer clear-fix sliderCont3">
                            <li>
                                <img src="../images/portfolio/images/thumbs/5.gif" width="288" alt="Image Name"></li>
                        </ul>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="../images/portfolio/images/5.gif" rel="prettyPhoto">Loupe</a> <a target="_blank"
                            href="http://www.airfare.com/">Link</a>
                    </div>
                    <div class="large-10 columns portContent" style="float: right; text-align: right;
                        padding-right: 25px;">
                        <h2>
                           <span class="portCategorie">Outsourcing</span> <span class="titleDivide">|</span><a
                               target="_blank" href="http://www.airfare.com/">Airfare</a>
                            </h2>
                            <p>موقع اير فير لحجوزات الطيران .. حجز لحظى للرحلات بارخص الاسعار </p>
                    </div>
                    
                </li>
                <!-- ITEM 9-->
                <li class="businesswebsites" style="display: list-item;">
                    <div class="imageSlide" style="overflow: hidden;">
                        <ul class="imagesContainer clear-fix sliderCont1">
                            <li>
                                <img src="../images/portfolio/images/thumbs/4.gif" width="288" alt="Image Name"></li>
                        </ul>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="../images/portfolio/images/4.gif" rel="prettyPhoto">Loupe</a> <a target="_blank"
                            href="http://www.ybc-madina.com/">Link</a>
                    </div>
                    <div class="large-10 columns portContent" style="float: right; text-align: right;
                        padding-right: 25px;">
                        <h2>
                          <span class="portCategorie">مواقع تجارية</span>  <span class="titleDivide">|</span><a
                              target="_blank" href="http://www.ybc-madina.com/">YBC-madina</a>
                            </h2>
                            <p>لجنة الشباب بالغرفه التجاريه السعوديه </p>
                    </div>
                    
                </li>
                <!-- ITEM 10-->
                <li class="Outsourcing" style="display: list-item;">
                    <div class="imageSlide">
                        <ul class="imagesContainer clear-fix sliderCont3">
                            <li>
                                <img src="../images/portfolio/images/thumbs/9.gif" width="288" alt="Image Name"></li>
                        </ul>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="../images/portfolio/images/9.gif" rel="prettyPhoto">Loupe</a> <a target="_blank"
                            href="http://www.comoto.com/">Link</a>
                    </div>
                    <div class="large-10 columns portContent" style="float: right; text-align: right;
                        padding-right: 25px;">
                        <h2>
                            <span class="portCategorie">Outsourcing</span><span class="titleDivide">|</span>
                            <a target="_blank" href="http://www.comoto.com/">Comoto</a>
                            </h2>
                            <p>موقع التظيف الاكثر شهره فى التعامل مع جميع التخصصات على مستوى العالم</p>
                    </div>
                    
                </li>
                <!-- ITEM 11-->
                <li class="Outsourcing" style="display: list-item;">
                    <div class="imageSlide">
                        <ul class="imagesContainer clear-fix sliderCont3">
                            <li>
                                <img src="../images/portfolio/images/thumbs/6.gif" width="288" alt="Image Name"></li>
                        </ul>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="../images/portfolio/images/6.gif" rel="prettyPhoto">Loupe</a> <a target="_blank"
                            href="http://www.comozap.com/">Link</a>
                    </div>
                    <div class="large-10 columns portContent" style="float: right; text-align: right;
                        padding-right: 25px;">
                        <h2>
                            <span class="portCategorie">Outsourcing</span><span class="titleDivide">|</span>
                            <a target="_blank" href="http://www.comozap.com/">Comozap</a>
                            </h2>
                            <p>موقع التظيف الاكثر شهره فى التعامل مع متخصصى الساب على مستوى العالم</p>
                    </div>
                    
                </li>
                <!-- ITEM 12-->
                <li class="Outsourcing" style="display: list-item;">
                    <div class="imageSlide">
                        <ul class="imagesContainer clear-fix sliderCont3">
                            <li>
                                <img src="../images/portfolio/images/thumbs/10.gif" width="288" alt="Image Name"></li>
                        </ul>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="../images/portfolio/images/10.gif" rel="prettyPhoto">Loupe</a> <a target="_blank"
                            href="http://http://linkedhunters.dk/.dk/">Link</a>
                    </div>
                    <div class="large-10 columns portContent" style="float: right; text-align: right;
                        padding-right: 25px;">
                        <h2>
                           <span class="portCategorie">Outsourcing</span> <span class="titleDivide">|</span><a
                               target="_blank" href="http://linkedhunters.dk/">Linked hunters</a>
                            </h2>
                            <p>ملتقى الصيادين الدينماركيين  ... من مواقع التواصل الاجتماعى </p>
                    </div>
                    
                </li>
            </ul>
        </div>
    </div>
</asp:Content>
