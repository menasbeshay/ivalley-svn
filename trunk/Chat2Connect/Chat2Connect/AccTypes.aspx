<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Balance.master" AutoEventWireup="true" CodeBehind="AccTypes.aspx.cs" Inherits="Chat2Connect.AccTypes" %>

<%@ Register Src="~/usercontrols/MemberTypes.ascx" TagPrefix="uc1" TagName="MemberTypes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BHead" runat="server">
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <uc1:MemberTypes runat="server" ID="MemberTypes" />
</asp:Content>
