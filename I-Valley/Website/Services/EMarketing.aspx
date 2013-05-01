<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Inner.Master" AutoEventWireup="true" CodeBehind="EMarketing.aspx.cs" Inherits="Website.Services.EMarketing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="banner" >
        <p>
            E-Marketing</p>
        <span>
            <p>
                E</p>
        </span>
    </div>
    <div class="row" id="Emarkting">
        
        <div class="large-3 columns recPost">
            <span class="hoverEffect">
                <img src="../images/8-services/seo_small.png" alt="Recent Post">
                <a href="SEO.aspx">
                    Link</a> </span>
           
            <h4>
                <a href="SEO.aspx">Search Engine Optimization (SEO)</a></h4>
            <p class="postContent">
                Search engine optimization (SEO) is the process of improving the volume and/or
                quality of traffic to a web site from search engines, via natural search results
                through increasing the positions of a web site within the search engines, using
                careful analysis and research techniques.
            </p>
        </div>
        <div class="large-3 columns recPost">
            <span class="hoverEffect">
                <img src="../images/8-services/sem_small.png" alt="Recent Post">
                <a href="SEM.aspx">
                    Link</a> </span>
           
            <h4>
                <a href="SEM.aspx">SEM & Banner Ads</a></h4>
            <p class="postContent">
                Search engine marketing (SEM) is a form of e-marketing that seeks to promote websites
                by increasing their visibility in Search Engine Result Pages (SERPs) through the
                use of contextual advertising, paid inclusion and Pay-Per-Click (PPC).
            </p>
        </div>
        <div class="large-3 columns recPost">
            <span class="hoverEffect">
                <img src="../images/8-services/smo_small.png" alt="Recent Post">
                <a href="SMO.aspx">
                    Link</a> </span>
           
            <h4>
                <a href="SMO.aspx">Social Media Optimization (SMO)</a></h4>
            <p class="postContent">
                Social Media Optimization (SMO) is a set of methods for generating publicity through
                social media, online communities and community websites. Methods of (SMO) include
                adding RSS feeds, social news buttons, blogging, and incorporating third party community
                functionalities like images and videos.
            </p>
        </div>
        <div class="large-3 columns recPost">
            <span class="hoverEffect">
                <img src="../images/8-services/Email-Marketing.png" alt="Recent Post">
                 <a href="EmailMarketing.aspx">
                    Link</a> </span>
            
            <h4>
                <a href="EmailMarketing.aspx">Email Marketing</a></h4>
            <p class="postContent">
                E-mail Marketing Is a form of direct marketing, which uses electronic mail as a
                means of commercial communicating. In its broadest sense, every e-mail sent to a
                potential or current customer could be considered e-mail marketing.
            </p>
        </div>
    </div>

</asp:Content>
