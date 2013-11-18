<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/EnSite.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebApplication.en._default" %>
<%@ Register src="../controls/ucHomeSlider.ascx" tagname="ucHomeSlider" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="Buttons">
                <a href="Node.aspx?PID=9"><img src="../images/button1_en.png" /></a>
                <a href="Node.aspx?PID=10"><img src="../images/button2_en.png" /></a>
                <a href="Node.aspx?PID=11"><img src="../images/button3_en.png" /></a>
                <a href="Node.aspx?PID=12"><img src="../images/button4_en.png" /></a>
                <a href="Node.aspx?PID=13"><img src="../images/button5_en.png" /></a>
                <a href="#"><img src="../images/button6_en.png" /></a>
                <ul class="socials">
                    <li class="youtube"><a href="#">youtube</a></li>
                    <li class="facebook"><a href="#">facebook</a></li>
                </ul>
            </div> 
            <div class="Content">
             <h3>
                    <asp:Label ID="uiLabelTitle" runat="server" ></asp:Label></h3>
                <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
             </div>
            <div class="slider">                
                
                <uc1:ucHomeSlider ID="ucHomeSlider1" runat="server" />
                
            </div> 
</asp:Content>
