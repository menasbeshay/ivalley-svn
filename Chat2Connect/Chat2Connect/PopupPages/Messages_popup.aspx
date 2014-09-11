<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Popup.Master" AutoEventWireup="true" CodeBehind="Messages_popup.aspx.cs" Inherits="Chat2Connect.PopupPages.Messages_popup" %>
<%@ Register Src="~/usercontrols/Mail.ascx" TagPrefix="uc1" TagName="Mail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <uc1:Mail runat="server" ID="ctrlMail" />
        
    
</asp:Content>
