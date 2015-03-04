<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="stats.aspx.cs" Inherits="Taqwa.Website.Admin.stats" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <iframe src="http://awstats.woad.arvixe.com/cgi-bin/awstats.pl?config=alzahraaschools.com" style="width:100%;height:600px"></iframe>
</asp:Content>
