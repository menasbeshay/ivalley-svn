<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Inner.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Website.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Aboutbanner" >
        <p style="padding-top: 50px;">
            About us</p>
        <span>
            <p>
                A</p>
        </span>
    </div>
    <!--CONTENT ABOUT US AND WHAT WE DO-->
    <div id="aboutUs" class="row">
        <div id="ourJob" class="large-6 columns" style="width: 49%; float: left;">
            <div class="large-12 columns recTitle aboutTitle">
                <h4>
                    Who we are</h4>
            </div>
            &nbsp;<p class="MsoNormal">
                <span><span class="CompanyName">Intelligent valley</span> is software house working as one team trying to produce 
                the best quality software for its customers using our software engineering 
                experience.<br />
                Always our main interest is to gain our customers satisfaction through our 
                service quality and system delivery … always we stay outside waiting to hear 
                your voice saying thanks <span class="CompanyName">I-Valley</span>.</span></p>
        </div>
        <div id="ourJob" class="large-6 columns" style="width: 49%;float:right;">
            <div class="large-12 columns recTitle aboutTitle">
                <h4>
                    What we do</h4>
            </div>
            <p class="MsoNormal" dir="LTR">
                We providing professional software service by doing different types of software 
                development services helping you to improve your business, starting from your 
                office automation, custom software development, your company business website, 
                E-Commerce and complete E-Marketing solutions.<o:p></o:p></p>
            <p>
                &nbsp;</p>
            <div class="jobList">
                <a class="webdesign" href="#">
                    <img src="images/2-about/webDes.png" alt="Job Thumb">
                    <span class="fadeSpan">Custom Development
                        <div class="arrow">
                        </div>
                    </span></a> 
                <a class="seo" href="#">
                        <img src="images/2-about/Seo.png" alt="Job Thumb">
                        <span class="fadeSpan">Websites
                            <div class="arrow">
                            </div>
                        </span></a><a class="mobileApps" href="#">
                            <img src="images/2-about/mobileApps.png" alt="Job Thumb">
                            <span class="fadeSpan">E-Commerce
                                <div class="arrow">
                                </div>
                            </span></a><a class="photography" href="#">&nbsp;</a><a class="responsive" href="#"><img
                                src="images/2-about/Responsive.png" alt="Job Thumb">
                                <span class="fadeSpan">Office Automation
                                    <div class="arrow">
                                    </div>
                                </span></a><a class="socialNet" href="#">
                                    <img src="images/2-about/socialNet.png" alt="Job Thumb">
                                    <span class="fadeSpan">E-Marketing
                                        <div class="arrow">
                                        </div>
                                    </span></a>
            </div>
        </div>
    </div>
    <!--MEET THE TEAM SECTION-->
    <div id="theTeam" class="row">
    </div>
    <!--CLIENTS SECTION-->
    
</asp:Content>
