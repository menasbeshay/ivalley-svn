<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/ArSite.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebApplication._default" %>
<%@ Register src="controls/ucArHomeSlider.ascx" tagname="ucArHomeSlider" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="slider">
              
              <uc1:ucArHomeSlider ID="ucArHomeSlider1" runat="server" />
            </div>              
            
              
            <div class="Content">
                <h3>
                    <asp:Label ID="uiLabelTitle" runat="server" ></asp:Label></h3>
                <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
            </div>    
            <div class="Buttons">
                <a href="Node.aspx?PID=9"><img src="../images/button1_ar.png" /></a>
                <a href="Node.aspx?PID=10"><img src="../images/button2_ar.png" /></a>
                <a href="Node.aspx?PID=11"><img src="../images/button3_ar.png" /></a>
                <a href="Node.aspx?PID=12"><img src="../images/button4_ar.png" /></a>
                <a href="Node.aspx?PID=13"><img src="../images/button5_ar.png" /></a>
                <a href="#"><img src="../images/button6_ar.png" /></a>
                <ul class="socials">
                    <li class="youtube"><a href="#">youtube</a></li>
                    <li class="facebook"><a href="#">facebook</a></li>
                </ul>
            </div>   

</asp:Content>
