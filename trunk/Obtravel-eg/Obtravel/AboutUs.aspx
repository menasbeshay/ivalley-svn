<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ENBanner.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Obtravel.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h1>
<asp:Label ID="uiLabelTitle" runat="server"></asp:Label>
</h1>
<div class="clear10px" ></div>
                    <div>
                        <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
                    </div>
</asp:Content>
