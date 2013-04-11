<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Inner.Master" AutoEventWireup="true" CodeBehind="Portfolio.aspx.cs" Inherits="Website.Portfolio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="banner">
        <p>
            Portfolio</p>
        <span>
            <p>
                P</p>
        </span>
    </div>

    <div id="portfolioWrapp" class="row">
        <div id="portfolioNav" class="large-12 columns">
            <ul id="portfolio-filter" class="clear-fix">
                <li><a href="Portfolio.aspx" class="current">All</a></li>
                <li><a rel="design" href="#design"
                    class="">Design</a></li>
                <li><a rel="webDesign" href="#webDesign"
                    class="">Web Design</a></li>
                <li><a rel="photography" href="#photography"
                    class="">Photography</a></li>
            </ul>
        </div>
        <div id="portfolioContainer" class="large-12 columns">
            <ul id="portfolio-list" class="clear-fix">
                <!-- ITEM 1-->
                <li class="design" style="display: list-item;">
                    <div class="imageSlide" style="overflow: hidden;">
                        <ul class="imagesContainer clear-fix sliderCont1">
                            <li>
                                <img src="images/portfolio/portfolio-img1.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img1.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img1.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img1.jpg" width="312" height="215" alt="Image Name"></li>
                        </ul>
                        <div class="slider-nav1 slider-nav" style="">
                            <button type="button"  class="prevBtn" data-dir="prev">
                                Previous</button>
                            <button type="button"  class="nextBtn" data-dir="next">
                                Next</button>
                        </div>
                    </div>
                    <div class="large-10 columns portContent">
                        <h2>
                            <a href="project.html">Project Title</a><span
                                class="titleDivide">|</span> <span class="portCategorie">Design</span></h2>
                        <p>
                            Nisi integer tristique placerat sed, velit! Porta odio dolor odio tincidunt. Porta
                            magna?</p>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="blog-post-img1.jpg" rel="prettyPhoto">
                            Loupe</a> <a href="project.html">Link</a>
                    </div>
                </li>
                <!-- ITEM 2-->
                <li class="photography" style="display: list-item;">
                    <div class="imageSlide">
                        <ul class="imagesContainer clear-fix sliderCont2" style="margin-left: 0px;">
                            <li>
                                <img src="images/portfolio/portfolio-img2.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img2.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img2.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img2.jpg" width="312" height="215" alt="Image Name"></li>
                        </ul>
                        <div class="slider-nav2 slider-nav" style="">
                            <button type="button"  class="prevBtn" data-dir="prev">
                                Previous</button>
                            <button type="button"  class="nextBtn" data-dir="next">
                                Next</button>
                        </div>
                    </div>
                    <div class="large-10 columns portContent">
                        <h2>
                            <a href="project.html">Project Title</a><span
                                class="titleDivide">|</span> <span class="portCategorie">Photography</span></h2>
                        <p>
                            Nisi integer tristique placerat sed, velit! Porta odio dolor odio tincidunt. Porta
                            magna?</p>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="blog-post-img1.jpg" rel="prettyPhoto">
                            Loupe</a> <a href="project.html">Link</a>
                    </div>
                </li>
                <!-- ITEM 3-->
                <li class="webDesign" style="display: list-item;">
                    <div class="imageSlide">
                        <ul class="imagesContainer clear-fix sliderCont3" style="margin-left: -624px;">
                            <li>
                                <img src="images/portfolio/portfolio-img3.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img3.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img3.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img3.jpg" width="312" height="215" alt="Image Name"></li>
                        </ul>
                        <div class="slider-nav3 slider-nav" style="">
                            <button type="button"  class="prevBtn" data-dir="prev">
                                Previous</button>
                            <button type="button"  class="nextBtn" data-dir="next">
                                Next</button>
                        </div>
                    </div>
                    <div class="large-10 columns portContent">
                        <h2>
                            <a href="project.html">Project Title</a><span
                                class="titleDivide">|</span> <span class="portCategorie">Web Design</span></h2>
                        <p>
                            Nisi integer tristique placerat sed, velit! Porta odio dolor odio tincidunt. Porta
                            magna?</p>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="blog-post-img1.jpg" rel="prettyPhoto">
                            Loupe</a> <a href="project.html">Link</a>
                    </div>
                </li>
                <!-- ITEM 4-->
                <li class="photography" style="display: list-item;">
                    <div class="imageSlide">
                        <ul class="imagesContainer clear-fix sliderCont4">
                            <li>
                                <img src="images/portfolio/portfolio-img4.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img4.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img4.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img4.jpg" width="312" height="215" alt="Image Name"></li>
                        </ul>
                        <div class="slider-nav4 slider-nav" style="">
                            <button type="button"  class="prevBtn" data-dir="prev">
                                Previous</button>
                            <button type="button"  class="nextBtn" data-dir="next">
                                Next</button>
                        </div>
                    </div>
                    <div class="large-10 columns portContent">
                        <h2>
                            <a href="project.html">Project Title</a><span
                                class="titleDivide">|</span> <span class="portCategorie">Photography</span></h2>
                        <p>
                            Nisi integer tristique placerat sed, velit! Porta odio dolor odio tincidunt. Porta
                            magna?</p>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="blog-post-img1.jpg" rel="prettyPhoto">
                            Loupe</a> <a href="project.html">Link</a>
                    </div>
                </li>
                <!-- ITEM 5-->
                <li class="webDesign" style="display: list-item;">
                    <div class="imageSlide">
                        <ul class="imagesContainer clear-fix sliderCont5">
                            <li>
                                <img src="images/portfolio/portfolio-img5.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img5.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img5.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img5.jpg" width="312" height="215" alt="Image Name"></li>
                        </ul>
                        <div class="slider-nav5 slider-nav" style="">
                            <button type="button"  class="prevBtn" data-dir="prev">
                                Previous</button>
                            <button type="button"  class="nextBtn" data-dir="next">
                                Next</button>
                        </div>
                    </div>
                    <div class="large-10 columns portContent">
                        <h2>
                            <a href="project.html">Project Title</a><span
                                class="titleDivide">|</span> <span class="portCategorie">Web Design</span></h2>
                        <p>
                            Nisi integer tristique placerat sed, velit! Porta odio dolor odio tincidunt. Porta
                            magna?</p>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="blog-post-img1.jpg" rel="prettyPhoto">
                            Loupe</a> <a href="project.html">Link</a>
                    </div>
                </li>
                <!-- ITEM 6-->
                <li class="design" style="display: list-item;">
                    <div class="imageSlide">
                        <ul class="imagesContainer clear-fix sliderCont6">
                            <li>
                                <img src="images/portfolio/portfolio-img6.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img6.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img6.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img6.jpg" width="312" height="215" alt="Image Name"></li>
                        </ul>
                        <div class="slider-nav6 slider-nav" style="">
                            <button type="button"  class="prevBtn" data-dir="prev">
                                Previous</button>
                            <button type="button"  class="nextBtn" data-dir="next">
                                Next</button>
                        </div>
                    </div>
                    <div class="large-10 columns portContent">
                        <h2>
                            <a href="project.html">Project Title</a><span
                                class="titleDivide">|</span> <span class="portCategorie">Design</span></h2>
                        <p>
                            Nisi integer tristique placerat sed, velit! Porta odio dolor odio tincidunt. Porta
                            magna?</p>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="blog-post-img1.jpg" rel="prettyPhoto">
                            Loupe</a> <a href="project.html">Link</a>
                    </div>
                </li>
                <!-- ITEM 7-->
                <li class="photography" style="display: list-item;">
                    <div class="imageSlide">
                        <ul class="imagesContainer clear-fix sliderCont7">
                            <li>
                                <img src="images/portfolio/portfolio-img7.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img7.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img7.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img7.jpg" width="312" height="215" alt="Image Name"></li>
                        </ul>
                        <div class="slider-nav7 slider-nav" style="">
                            <button type="button"  class="prevBtn" data-dir="prev">
                                Previous</button>
                            <button type="button"  class="nextBtn" data-dir="next">
                                Next</button>
                        </div>
                    </div>
                    <div class="large-10 columns portContent">
                        <h2>
                            <a href="project.html">Project Title</a><span
                                class="titleDivide">|</span> <span class="portCategorie">Photography</span></h2>
                        <p>
                            Nisi integer tristique placerat sed, velit! Porta odio dolor odio tincidunt. Porta
                            magna?</p>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="blog-post-img1.jpg" rel="prettyPhoto">
                            Loupe</a> <a href="project.html">Link</a>
                    </div>
                </li>
                <!-- ITEM 8-->
                <li class="design" style="display: list-item;">
                    <div class="imageSlide">
                        <ul class="imagesContainer clear-fix sliderCont8">
                            <li>
                                <img src="images/portfolio/portfolio-img8.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img8.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img8.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img8.jpg" width="312" height="215" alt="Image Name"></li>
                        </ul>
                        <div class="slider-nav8 slider-nav" style="">
                            <button type="button"  class="prevBtn" data-dir="prev">
                                Previous</button>
                            <button type="button"  class="nextBtn" data-dir="next">
                                Next</button>
                        </div>
                    </div>
                    <div class="large-10 columns portContent">
                        <h2>
                            <a href="project.html">Project Title</a><span
                                class="titleDivide">|</span> <span class="portCategorie">Design</span></h2>
                        <p>
                            Nisi integer tristique placerat sed, velit! Porta odio dolor odio tincidunt. Porta
                            magna?</p>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="blog-post-img1.jpg" rel="prettyPhoto">
                            Loupe</a> <a href="project.html">Link</a>
                    </div>
                </li>
                <!-- ITEM 8-->
                <li class="webDesign" style="display: list-item;">
                    <div class="imageSlide">
                        <ul class="imagesContainer clear-fix sliderCont9">
                            <li>
                                <img src="images/portfolio/portfolio-img9.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img9.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img9.jpg" width="312" height="215" alt="Image Name"></li>
                            <li>
                                <img src="images/portfolio/portfolio-img9.jpg" width="312" height="215" alt="Image Name"></li>
                        </ul>
                        <div class="slider-nav9 slider-nav" style="">
                            <button type="button"  class="prevBtn" data-dir="prev">
                                Previous</button>
                            <button type="button"  class="nextBtn" data-dir="next">
                                Next</button>
                        </div>
                    </div>
                    <div class="large-10 columns portContent">
                        <h2>
                            <a href="project.html">Project Title</a><span
                                class="titleDivide">|</span> <span class="portCategorie">Web Design</span></h2>
                        <p>
                            Nisi integer tristique placerat sed, velit! Porta odio dolor odio tincidunt. Porta
                            magna?</p>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="blog-post-img1.jpg" rel="prettyPhoto">
                            Loupe</a> <a href="project.html">Link</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function (e) {
            var slider = new Slider($('.sliderCont1'), $('.slider-nav1'));
            var slider2 = new Slider($('.sliderCont2'), $('.slider-nav2'));
            var slider3 = new Slider($('.sliderCont3'), $('.slider-nav3'));
            var slider4 = new Slider($('.sliderCont4'), $('.slider-nav4'));
            var slider5 = new Slider($('.sliderCont5'), $('.slider-nav5'));
            var slider6 = new Slider($('.sliderCont6'), $('.slider-nav6'));
            var slider7 = new Slider($('.sliderCont7'), $('.slider-nav7'));
            var slider8 = new Slider($('.sliderCont8'), $('.slider-nav8'));
            var slider9 = new Slider($('.sliderCont9'), $('.slider-nav9'));

            slider.container.parent().css('overflow', 'hidden');

            slider.nav.show().find('button').on('click', function () {
                slider.setCurrent($(this).data('dir'));
                slider.transition();
            });

            slider2.nav.show().find('button').on('click', function () {
                slider2.setCurrent($(this).data('dir'));
                slider2.transition();
            });

            slider3.nav.show().find('button').on('click', function () {
                slider3.setCurrent($(this).data('dir'));
                slider3.transition();
            });

            slider4.nav.show().find('button').on('click', function () {
                slider4.setCurrent($(this).data('dir'));
                slider4.transition();
            });

            slider5.nav.show().find('button').on('click', function () {
                slider5.setCurrent($(this).data('dir'));
                slider5.transition();
            });

            slider6.nav.show().find('button').on('click', function () {
                slider6.setCurrent($(this).data('dir'));
                slider6.transition();
            });

            slider7.nav.show().find('button').on('click', function () {
                slider7.setCurrent($(this).data('dir'));
                slider7.transition();
            });

            slider8.nav.show().find('button').on('click', function () {
                slider8.setCurrent($(this).data('dir'));
                slider8.transition();
            });

            slider9.nav.show().find('button').on('click', function () {
                slider9.setCurrent($(this).data('dir'));
                slider9.transition();
            });
        });
  </script>
</asp:Content>
