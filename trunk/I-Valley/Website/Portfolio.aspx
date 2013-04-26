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
                <li><a rel="businesswebsites" href="#businesswebsites" class="">Business websites</a></li>
                <li><a rel="systemdevelopment" href="#systemdevelopment" class="">System development</a></li>
                <li><a rel="ourtsourcing" href="#Ourtsourcing" class="">Ourtsourcing</a></li>
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
                            
                        </ul>
                        
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
                           
                        </ul>
                        
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
                           
                        </ul>
                        
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
                           
                        </ul>
                       
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
                            
                        </ul>
                        
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
                            
                        </ul>
                       
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
                           
                        </ul>
                       
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
                            
                        </ul>
                       
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
                            
                        </ul>
                       
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

   
</asp:Content>
