<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminGov.master" AutoEventWireup="true" CodeFile="Troubleshooting.aspx.cs" Inherits="Troubleshooting" %>

<%@ Register src="UserControls/SubmitTroubleshoot.ascx" tagname="SubmitTroubleshoot" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
            border-collapse: collapse;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:SubmitTroubleshoot ID="SubmitTroubleshoot1" runat="server" />
    
</asp:Content>

