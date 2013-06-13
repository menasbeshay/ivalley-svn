<%@ Page Title="" Language="C#" MasterPageFile="~/Inner.Master" AutoEventWireup="true" CodeBehind="ArticleDetails.aspx.cs" Inherits="Website.ArticleDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Image ID="uiImageMain" runat="server" />
    <div class="clear" style="height: 10px;">
    </div>
    <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
</asp:Content>
