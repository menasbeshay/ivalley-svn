<%@ Page Title="" Language="C#" MasterPageFile="~/NewDesign.Master" AutoEventWireup="true" CodeBehind="Pages.aspx.cs" Inherits="Taqwa.Website.Pages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mainContent" style="background:#fff;width:980px;">
<div class="style24">
    <asp:Literal ID="uiLiteralTitle" runat="server"></asp:Literal>
</div>
<div style="clear:both; height:10px;"></div>
<div class="Content">
    <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
</div>
</div>
</asp:Content>
