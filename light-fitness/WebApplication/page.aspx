<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Site.Master" AutoEventWireup="true" CodeBehind="page.aspx.cs" Inherits="WebApplication.page" %>
<%@ MasterType VirtualPath="~/Masterpages/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div  style="padding:20px;">
<h2>
    <asp:Label ID="uiLabelTitle" runat="server" ></asp:Label>
</h2>

<div >

    <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
</div>
</div>
</asp:Content>
