<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="Page.aspx.cs" Inherits="Sherifadel.Page" %>
<%@ MasterType VirtualPath="~/MasterPages/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="tittle_wight" style="padding:0px 50px;text-align:left;">
    <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
    </div>
</asp:Content>
