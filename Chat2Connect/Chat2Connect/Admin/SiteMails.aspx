<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="SiteMails.aspx.cs" Inherits="Chat2Connect.Admin.SiteMails" %>

<%@ Register Src="~/usercontrols/Mail.ascx" TagPrefix="uc1" TagName="Mail" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <uc1:Mail runat="server" ID="ctrlMail"/>
</asp:Content>
