<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ArSite.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Website.ar._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="postsContainer" class="row">
        <div class="large-12 columns recTitle">
            <h4>
                منتجات</h4>
        </div>
        <div class="large-6 columns postContainer">
            <div class="post-num">
                <img src="../images/flights.gif" alt="Blog Image">
                <p class="posterName">
                <p class="postDate">
                    I-Flights</p>
            </div>
            <div class="postInfo">
                <img src="../images/opFlights.gif" alt="Posted By" style="border-radius: 10px; -moz-border-radius: 10px;
                    -webkit-border-radius: 10px;">
                <p class="postInfo">
                    We offer for you the most stable Airlines Management System will enable you to handle
                    your commercial department, Operation department, Cabin Crew, Engineering, Station
                    and Training department with ability to extract all needed reports including Ministry
                    of Aviation schedule reports.</p>
            </div>
            <div class="blogHover">
                <a href="Products/I-Flights.aspx">Link</a>
            </div>
        </div>
        <div class="large-6 columns postContainer">
            <div class="post-num">
                <img src="../images/finance.gif" alt="Blog Image">
                <p class="postDate">
                    I-Finance</p>
            </div>
            <div class="postInfo">
                <img src="../images/opFinance.gif" alt="Posted By" style="border-radius: 10px; -moz-border-radius: 10px;
                    -webkit-border-radius: 10px;">
                <p class="postInfo">
                    IValley provide suitable solution for the small to mid-size companies for their
                    financial department – through our IFinance we provide Full accounting system including
                    stock management and point of sales management as well, Now you will be able to
                    remove all manual invoices and use the most powerful financial system.</p>
            </div>
            <div class="blogHover">
                <a href="Products/I-Finance.aspx">Link</a>
            </div>
        </div>
    </div>
</asp:Content>
