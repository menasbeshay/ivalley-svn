<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MemberLogDetails.ascx.cs" Inherits="Chat2Connect.Admin.UserControls.MemberLogDetails" %>
<style>
    th {
        text-align: right;
    }
</style>
<asp:GridView CssClass="table table-striped table-condensed" ID="dtlLog" runat="server" AutoGenerateColumns="false">
    <Columns></Columns>
    <HeaderStyle HorizontalAlign="Right" />
    <RowStyle HorizontalAlign="Right" />
</asp:GridView>
