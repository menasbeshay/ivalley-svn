<%@ Page Title="" Language="C#" MasterPageFile="~/newTheme.Master" AutoEventWireup="true" CodeBehind="ArticleDetails.aspx.cs" Inherits="Website.ArticleDetails" %>
<%@ MasterType VirtualPath="~/newTheme.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Image ID="uiImageMain" runat="server" Visible="false"/>
    <div class="clear" style="height: 10px;">
    </div>
    <div style="width:75%;height:450px;overflow:auto;margin:0 auto;">
    <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
    </div>
</asp:Content>
