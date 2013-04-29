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
                <li><a  rel="ourtsourcing" href="#Ourtsourcing" class="">Ourtsourcing</a></li>
            </ul>
        </div>
        <div id="portfolioContainer" class="large-12 columns">
            <ul id="portfolio-list" class="clear-fix">
                <!-- ITEM 1-->
                <li class="businesswebsites" style="display: list-item;">
                    <div class="imageSlide" style="overflow: hidden;">
                        <ul class="imagesContainer clear-fix sliderCont1">
                            <li>
                                <img src="images/portfolio/images/thumbs/1.gif" width="288" alt="Image Name"></li>
                            
                        </ul>
                        
                    </div>
                    <div class="large-10 columns portContent">
                        <h2>
                            <a target="_blank" href="http://www.obtravel-eg.com/">Obtravel</a><span
                                class="titleDivide">|</span> <span class="portCategorie">Business websites</span></h2>                        
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="images/portfolio/images/1.gif" rel="prettyPhoto">
                            Loupe</a> <a target="_blank" href="http://www.obtravel-eg.com">Link</a>
                    </div>
                </li>
                <!-- ITEM 2-->
                <li class="systemdevelopment" style="display: list-item;">
                    <div class="imageSlide">
                        <ul class="imagesContainer clear-fix sliderCont2" >
                            <li>
                                <img src="images/portfolio/images/thumbs/12.gif" width="288" alt="Image Name"></li>
                           
                        </ul>
                        
                    </div>
                    <div class="large-10 columns portContent">
                        <h2>
                            <a target="_blank" href="http://ifinance.i-valley.com">I-Finance</a><span
                                class="titleDivide">|</span> <span class="portCategorie">System Development</span></h2>
                        
                    </div>
                    <div class="large-2 columns portLinks">
                        <a  href="images/portfolio/images/12.gif" rel="prettyPhoto">
                            Loupe</a> <a target="_blank" href="http://ifinance.i-valley.com">Link</a>
                    </div>
                </li>
                <!-- ITEM 3-->
                <li class="Ourtsourcing" style="display: list-item;">
                    <div class="imageSlide">
                        <ul class="imagesContainer clear-fix sliderCont3" >
                            <li>
                                <img src="images/portfolio/images/thumbs/8.gif" width="288" alt="Image Name"></li>
                           
                        </ul>
                        
                    </div>
                    <div class="large-10 columns portContent">
                        <h2>
                            <a target="_blank" href="http://www.euroinvestor.dk/">Euroinvestor</a><span
                                class="titleDivide">|</span> <span class="portCategorie">Ourtsourcing</span></h2>
                        
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="images/portfolio/images/8.gif" rel="prettyPhoto">
                            Loupe</a> <a target="_blank" href="http://www.euroinvestor.dk/">Link</a>
                    </div>
                </li>
                <!-- ITEM 4-->
                <li class="businesswebsites" style="display: list-item;">
                    <div class="imageSlide" style="overflow: hidden;">
                        <ul class="imagesContainer clear-fix sliderCont1">
                            <li>
                                <img src="images/portfolio/images/thumbs/3.gif" width="288" alt="Image Name"></li>
                        </ul>
                    </div>
                    <div class="large-10 columns portContent">
                        <h2>
                            <a target="_blank" href="http://www.glologistics.com/">Global logistics</a><span class="titleDivide">|</span>
                            <span class="portCategorie">Business websites</span></h2>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="images/portfolio/images/3.gif" rel="prettyPhoto">Loupe</a> <a target="_blank" href="http://www.glologistics.com">
                            Link</a>
                    </div>
                </li>
                <!-- ITEM 5-->
                <li class="systemdevelopment" style="display: list-item;">
                    <div class="imageSlide">
                        <ul class="imagesContainer clear-fix sliderCont2" >
                            <li>
                                <img src="images/portfolio/images/thumbs/11.gif" width="288" alt="Image Name"></li>
                        </ul>
                    </div>
                    <div class="large-10 columns portContent">
                        <h2>
                            <a target="_blank" href="http://midwestapp.i-valley.com">I-Flights</a><span class="titleDivide">|</span>
                            <span class="portCategorie">System Development</span></h2>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="images/portfolio/images/11.gif" rel="prettyPhoto">Loupe</a> <a target="_blank" href="http://midwestapp.i-valley.com">
                            Link</a>
                    </div>
                </li>
                <!-- ITEM 6-->
                <li class="Ourtsourcing" style="display: list-item;">
                    <div class="imageSlide">
                        <ul class="imagesContainer clear-fix sliderCont3" >
                            <li>
                                <img src="images/portfolio/images/thumbs/7.gif" width="288" alt="Image Name"></li>
                        </ul>
                    </div>
                    <div class="large-10 columns portContent">
                        <h2>
                            <a target="_blank" href="http://www.zmags.com/">Zmags</a><span class="titleDivide">|</span>
                            <span class="portCategorie">Ourtsourcing</span></h2>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="images/portfolio/images/7.gif" rel="prettyPhoto">Loupe</a> <a target="_blank" href="http://www.zmags.com/">
                            Link</a>
                    </div>
                </li>
            
            
                <!-- ITEM 7-->
                <li class="businesswebsites" style="display: list-item;">
                    <div class="imageSlide" style="overflow: hidden;">
                        <ul class="imagesContainer clear-fix sliderCont1">
                            <li>
                                <img src="images/portfolio/images/thumbs/2.gif" width="288" alt="Image Name"></li>
                        </ul>
                    </div>
                    <div class="large-10 columns portContent">
                        <h2>
                            <a target="_blank" href="http://www.anbaermia.com/">Anba Ermia</a><span class="titleDivide">|</span>
                            <span class="portCategorie">Business websites</span></h2>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="images/portfolio/images/2.gif" rel="prettyPhoto">Loupe</a> <a target="_blank" href="http://www.anbaermia.com/">
                            Link</a>
                    </div>
                </li>                
                <!-- ITEM 8-->
                <li class="Ourtsourcing" style="display: list-item;">
                    <div class="imageSlide">
                        <ul class="imagesContainer clear-fix sliderCont3" >
                            <li>
                                <img src="images/portfolio/images/thumbs/5.gif" width="288" alt="Image Name"></li>
                        </ul>
                    </div>
                    <div class="large-10 columns portContent">
                        <h2>
                            <a target="_blank" href="http://www.airfare.com/">Airfare</a><span class="titleDivide">|</span>
                            <span class="portCategorie">Ourtsourcing</span></h2>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="images/portfolio/images/5.gif" rel="prettyPhoto">Loupe</a> <a target="_blank" href="http://www.airfare.com/">
                            Link</a>
                    </div>
                </li>
            
                <!-- ITEM 9-->
                <li class="businesswebsites" style="display: list-item;">
                    <div class="imageSlide" style="overflow: hidden;">
                        <ul class="imagesContainer clear-fix sliderCont1">
                            <li>
                                <img src="images/portfolio/images/thumbs/4.gif" width="288" alt="Image Name"></li>
                        </ul>
                    </div>
                    <div class="large-10 columns portContent">
                        <h2>
                            <a target="_blank" href="http://www.ybc-madina.com/">YBC-madina</a><span class="titleDivide">|</span>
                            <span class="portCategorie">Business websites</span></h2>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="images/portfolio/images/4.gif" rel="prettyPhoto">Loupe</a> <a target="_blank" href="http://www.ybc-madina.com/">
                            Link</a>
                    </div>
                </li>
                
                <!-- ITEM 10-->
                <li class="Ourtsourcing" style="display: list-item;">
                    <div class="imageSlide">
                        <ul class="imagesContainer clear-fix sliderCont3" >
                            <li>
                                <img src="images/portfolio/images/thumbs/9.gif" width="288" alt="Image Name"></li>
                        </ul>
                    </div>
                    <div class="large-10 columns portContent">
                        <h2>
                            <a target="_blank" href="http://www.comoto.com/">Comoto</a><span class="titleDivide">|</span>
                            <span class="portCategorie">Ourtsourcing</span></h2>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="images/portfolio/images/9.gif" rel="prettyPhoto">Loupe</a> <a target="_blank" href="http://www.comoto.com/">
                            Link</a>
                    </div>
                </li>
            
            
               
                <!-- ITEM 11-->
                <li class="Ourtsourcing" style="display: list-item;">
                    <div class="imageSlide">
                        <ul class="imagesContainer clear-fix sliderCont3" >
                            <li>
                                <img src="images/portfolio/images/thumbs/6.gif" width="288" alt="Image Name"></li>
                        </ul>
                    </div>
                    <div class="large-10 columns portContent">
                        <h2>
                            <a target="_blank" href="http://www.comozap.com/">Comozap</a><span class="titleDivide">|</span>
                            <span class="portCategorie">Ourtsourcing</span></h2>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="images/portfolio/images/6.gif" rel="prettyPhoto">Loupe</a> <a target="_blank" href="http://www.comozap.com/">
                            Link</a>
                    </div>
                </li>
                <!-- ITEM 12-->
                <li class="Ourtsourcing" style="display: list-item;">
                    <div class="imageSlide">
                        <ul class="imagesContainer clear-fix sliderCont3" >
                            <li>
                                <img src="images/portfolio/images/thumbs/10.gif" width="288" alt="Image Name"></li>
                        </ul>
                    </div>
                    <div class="large-10 columns portContent">
                        <h2>
                            <a target="_blank" href="http://linkedhunters.dk/">Linked hunters</a><span class="titleDivide">|</span>
                            <span class="portCategorie">Ourtsourcing</span></h2>
                    </div>
                    <div class="large-2 columns portLinks">
                        <a href="images/portfolio/images/10.gif" rel="prettyPhoto">Loupe</a> <a target="_blank" href="http://http://linkedhunters.dk/.dk/">
                            Link</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>

   
</asp:Content>
