<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="AccountType.aspx.cs" Inherits="Chat2Connect.Admin.AccountType" %>

<%@ Register Src="~/usercontrols/MemberTypes.ascx" TagPrefix="uc1" TagName="MemberTypes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <uc1:MemberTypes runat="server" ID="MemberTypes" />
</asp:Content>
