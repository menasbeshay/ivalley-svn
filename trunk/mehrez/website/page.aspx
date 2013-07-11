<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="page.aspx.cs" Inherits="website.page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Image ID="uiImagemain" runat="server" />
    <div style="width:85%;padding:5px;">
    <asp:Label ID="uiLabelcontent" runat="server" CssClass="content_black"></asp:Label>
    </div>
</asp:Content>
