<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true" CodeFile="AdminTroubleShooting.aspx.cs" Inherits="Admin_AdminTroubleShooting" %>

<%@ Register src="../UserControls/AdminListTroubleShooting.ascx" tagname="AdminListTroubleShooting" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <uc1:AdminListTroubleShooting ID="AdminListTroubleShooting1" runat="server" />
</asp:Content>

