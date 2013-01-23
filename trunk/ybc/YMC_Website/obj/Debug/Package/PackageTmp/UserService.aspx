<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeBehind="UserService.aspx.cs" Inherits="YMC_Website.RequestService" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MContent" runat="server">
    <div style="direction: rtl;">
        <h1>
            <asp:Label ID="uiLabelTitle" runat="server" Text="خدمات ذات صلة"></asp:Label></h1>
        <div style="margin-top: 15px;">
            <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
        </div>
    </div>
</asp:Content>
