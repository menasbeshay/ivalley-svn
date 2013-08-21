<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Inner.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="website.Projects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="clear: both; height: 10px;">
    </div>
    <div class="ContentLeftDiv">
        <h1>
            <asp:Label ID="uiLabelTitle" runat="server"></asp:Label></h1>        
        <div style="clear: both; height: 10px;"></div>
        <asp:Image ID="uiImageProj" runat="server" />
        <div style="clear: both; height: 10px;">
        </div>
        <div class="Details675">
            <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
        </div>
    </div>
</asp:Content>
