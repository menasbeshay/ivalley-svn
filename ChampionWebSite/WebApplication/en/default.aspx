<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/EnSite.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebApplication.en._default" %>
<%@ Register src="../controls/ucHomeSlider.ascx" tagname="ucHomeSlider" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <div style="width:65%;float:left;">
             <h3>
                    <asp:Label ID="uiLabelTitle" runat="server" ></asp:Label></h3>
                <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
             </div>
            <div class="slider">                
                
                <uc1:ucHomeSlider ID="ucHomeSlider1" runat="server" />
                
            </div> 
</asp:Content>
