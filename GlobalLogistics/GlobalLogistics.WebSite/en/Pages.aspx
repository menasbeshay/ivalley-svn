<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="Pages.aspx.cs" Inherits="GlobalLogistics.WebSite.Pages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="ContentLeftDiv">
                <h1>
                    <asp:Label ID="uiLabelTitle" runat="server" ></asp:Label></h1>
                <div class="Details675">
                    <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
                </div>
                </div>
</asp:Content>
