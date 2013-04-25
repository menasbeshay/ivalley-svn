<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Website.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="postsContainer" class="row">
        <div class="large-12 columns recTitle">
            <h4>
                Products</h4>
        </div>
        <div class="large-6 columns postContainer">
            <div class="post-num">
                <img src="images/blog-img1.jpg" alt="Blog Image">
                <p class="postDate">
                    I-Flights</p>
            </div>
            <div class="postInfo">
                <img src="images/user1.png" alt="Posted By">
                <p class="posterName">
                    <a href="single-post.html">I-Flights</a></p>
                <p class="postInfo">
                    IValley have very good experience in Airlines companies' software management system, so we offer for you the most stable solution will enable you to handle your commercial department, Operation department, Cabin Crew, Engineering, Station and Training department with ability to extract all needed reports including Ministry of Aviation schedule reports.</p>
            </div>
            <div class="blogHover">
                <a href="images/blog-img3.jpg" rel="prettyPhoto" class="firstL">Zoom</a> <a href="single-post.html">
                    Link</a>
            </div>
        </div>
        <div class="large-6 columns postContainer">
            <div class="post-num">
                <img src="images/blog-img2.jpg" alt="Blog Image">
                <p class="postDate">
                    I-Finance</p>
            </div>
            <div class="postInfo">
                <img src="images/user2.png" alt="Posted By">
                <p class="posterName">
                    <a href="single-post.html">I-Finance</a></p>
                <p class="postInfo">
                    IValley provide suitable solution for the small to mid-size companies for their financial department – through our IFinance we provide Full accounting system including stock management and point of sales management as well.</p>
            </div>
            <div class="blogHover">
                <a href="images/blog-img3.jpg" rel="prettyPhoto" class="firstL">Zoom</a> <a href="single-post.html">
                    Link</a>
            </div>
        </div>
    </div>
</asp:Content>
