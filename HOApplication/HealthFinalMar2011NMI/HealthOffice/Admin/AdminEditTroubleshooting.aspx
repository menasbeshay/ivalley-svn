<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true" CodeFile="AdminEditTroubleshooting.aspx.cs" Inherits="Admin_AdminEditTroubleshooting" %>

<%@ Register src="../UserControls/AdminEditTroubleShooting.ascx" tagname="AdminEditTroubleShooting" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <uc1:AdminEditTroubleShooting ID="AdminEditTroubleShooting1" runat="server" />
</asp:Content>

