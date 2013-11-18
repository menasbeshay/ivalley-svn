<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/EnSite.Master" AutoEventWireup="true" CodeBehind="Node.aspx.cs" Inherits="WebApplication.en.Node" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <h3>
                    <asp:Label ID="uiLabelTitle" runat="server" ></asp:Label></h3>
                <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
</asp:Content>
