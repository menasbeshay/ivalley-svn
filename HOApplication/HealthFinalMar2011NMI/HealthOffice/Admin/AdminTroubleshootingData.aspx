<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true" CodeFile="AdminTroubleshootingData.aspx.cs" Inherits="Admin_AdminTroubleshootingData" %>

<%@ Register src="../UserControls/UCNetworks.ascx" tagname="UCNetworks" tagprefix="uc1" %>

<%@ Register src="../UserControls/UCIssueTypes.ascx" tagname="UCIssueTypes" tagprefix="uc2" %>
<%@ Register src="../UserControls/UCStatus.ascx" tagname="UCStatus" tagprefix="uc3" %>
<%@ Register src="../UserControls/UCPriority.ascx" tagname="UCPriority" tagprefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <uc1:UCNetworks ID="UCNetworks1" runat="server" />
    <br />
    <br />
    <uc2:UCIssueTypes ID="UCIssueTypes1" runat="server" />
    <br />
    <br />
    <uc3:UCStatus ID="UCStatus1" runat="server" />
    <br />
    <br />
    <uc4:UCPriority ID="UCPriority1" runat="server" />
</asp:Content>

