<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Website.Admin.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="AdminMain" style="direction:rtl;">
    مرحباً ،
    <asp:LoginName ID="LoginName1" runat="server" />
    <asp:LoginStatus ID="LoginStatus1" runat="server" />
    </div>
</asp:Content>
