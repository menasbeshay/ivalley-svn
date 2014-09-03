<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="viewnode.aspx.cs" Inherits="Chat2Connect.viewnode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="blockBoxshadow pull-right margin20" style="width:98%">
        <h3>
            <asp:Label ID="uiLabelTitle" runat="server"></asp:Label>
        </h3>
        <div class="clear">

        </div>
        <div class="col-lg-12">
            <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
        </div>
        <div class="clear">

        </div>
    </div>
</asp:Content>
