<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="SendMessage.aspx.cs" Inherits="Chat2Connect.Admin.SendMessage" %>

<%@ Register Src="~/usercontrols/SendMail.ascx" TagPrefix="uc1" TagName="SendMail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
<uc1:SendMail runat="server" id="ctrlSendMail"  />
</asp:Content>

