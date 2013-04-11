<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Inner.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Website.Services_page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="banner">
        <p>
            Services</p>
        <span>
            <p>
                S</p>
        </span>
    </div>
    <div id="services" class="row">
        <h2>
            Our Services</h2>
        <div id="servicesWrapper" class="large-12 columns">
            <div id="leftSide" class="large-6 columns">
                <div class="large-12 columns lService1 servContainer">
                    <h3>
                        Web Design</h3>
                    <p>
                        Et dis elementum. Amet velit! Urna tincidunt? Odio aenean eros phasellus, a auctor
                        purus, sit platea, urna dapibus urna dictumst.</p>
                    <p>
                        Risus velit, in ultrices aenean elementum, augue nunc lundium eudictumst phasellus
                        a cum integer? Penatibus enim penatibus.</p>
                    <a href="">&lt; &nbsp; View Portfolio
                        &nbsp; &gt;</a>
                </div>
                <div class="large-12 columns lService2 servContainer">
                    <h3>
                        SEO</h3>
                    <p>
                        Et dis elementum. Amet velit! Urna tincidunt? Odio aenean eros phasellus, a auctor
                        purus, sit platea, urna dapibus urna dictumst.</p>
                    <p>
                        Risus velit, in ultrices aenean elementum, augue nunc lundium eudictumst phasellus
                        a cum integer? Penatibus enim penatibus.</p>
                    <a href="">&lt; &nbsp; View Portfolio
                        &nbsp; &gt;</a>
                </div>
                <div class="large-12 columns lService3 servContainer">
                    <h3>
                        Mobile Apps</h3>
                    <p>
                        Et dis elementum. Amet velit! Urna tincidunt? Odio aenean eros phasellus, a auctor
                        purus, sit platea, urna dapibus urna dictumst.</p>
                    <p>
                        Risus velit, in ultrices aenean elementum, augue nunc lundium eudictumst phasellus
                        a cum integer? Penatibus enim penatibus.</p>
                    <a href="">&lt; &nbsp; View Portfolio
                        &nbsp; &gt;</a>
                </div>
            </div>
            <div id="rightSide" class="large-6 columns">
                <div class="large-12 columns rService servContainer">
                    <div class="large-12 columns lService4 servContainer">
                        <h3>
                            Photography</h3>
                        <p>
                            Et dis elementum. Amet velit! Urna tincidunt? Odio aenean eros phasellus, a auctor
                            purus, sit platea, urna dapibus urna dictumst.</p>
                        <p>
                            Risus velit, in ultrices aenean elementum, augue nunc lundium eudictumst phasellus
                            a cum integer? Penatibus enim penatibus.</p>
                        <a href="">&lt; &nbsp; View Portfolio
                            &nbsp; &gt;</a>
                    </div>
                    <div class="large-12 columns lService5 servContainer">
                        <h3>
                            Responsive</h3>
                        <p>
                            Et dis elementum. Amet velit! Urna tincidunt? Odio aenean eros phasellus, a auctor
                            purus, sit platea, urna dapibus urna dictumst.</p>
                        <p>
                            Risus velit, in ultrices aenean elementum, augue nunc lundium eudictumst phasellus
                            a cum integer? Penatibus enim penatibus.</p>
                        <a href="">&lt; &nbsp; View Portfolio
                            &nbsp; &gt;</a>
                    </div>
                    <div class="large-12 columns lService6 servContainer">
                        <h3>
                            Social Networks</h3>
                        <p>
                            Et dis elementum. Amet velit! Urna tincidunt? Odio aenean eros phasellus, a auctor
                            purus, sit platea, urna dapibus urna dictumst.</p>
                        <p>
                            Risus velit, in ultrices aenean elementum, augue nunc lundium eudictumst phasellus
                            a cum integer? Penatibus enim penatibus.</p>
                        <a href="">&lt; &nbsp; View Portfolio
                            &nbsp; &gt;</a>
                    </div>
                </div>
            </div>
            <div id="serviceSlider" class="large-12 columns">
                <span class="sliderWrapp">
                    <ul id="servSlider" class="clear-fix">
                        <li><a href="#">
                            <img src="images/8-services/slide1.png" alt=""></a></li>
                        <li><a href="#">
                            <img src="images/8-services/slide2.png" alt=""></a></li>
                        <li><a href="#">
                            <img src="images/8-services/slide3.png" alt=""></a></li>
                        <li><a href="#">
                            <img src="images/8-services/slide4.png" alt=""></a></li>
                        <li><a href="#">
                            <img src="images/8-services/slide1.png" alt=""></a></li>
                        <li><a href="#">
                            <img src="images/8-services/slide2.png" alt=""></a></li>
                        <li><a href="#">
                            <img src="images/8-services/slide3.png" alt=""></a></li>
                        <li><a href="#">
                            <img src="images/8-services/slide4.png" alt=""></a></li>
                    </ul>
                    <div class="sliderNav" id="slider-nav" style="">
                        <button class="prevBtnSlide" data-dir="prev" type="button">
                            Previous</button>
                        <button class="nextBtnSlide" data-dir="next" type="button">
                            Next</button>
                    </div>
                </span>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(window).load(function (e) {
            var servSlider = new Slider2($('#servSlider'), $('.sliderNav'));

            servSlider.nav.show().find('button').on('click', function () {                
                servSlider.setCurrent($(this).data('dir'));
                servSlider.transition();
            });
        });
  </script>
    <!--Project Image Toogle-->
    <script type="text/javascript">
        $(document).ready(function (e) {
            $('.thumbLinks a').click(function (e) {
                var imgSrc = $(this).attr('href');
                e.preventDefault();

                $('#projectInfo img').attr('src', imgSrc);
            });
        });
  </script>
    
</asp:Content>
