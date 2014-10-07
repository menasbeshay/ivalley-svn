<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucSearch.ascx.cs" Inherits="ITravel.UserControls.ucSearch" %>
<asp:Panel ID="uiPanelSearch" runat="server" DefaultButton="uiLinkButtonSearch">
    <asp:LinkButton ID="uiLinkButtonSearch" runat="server" title="Click to search" CssClass="tooltip glyph">L</asp:LinkButton>   
    <asp:TextBox ID="uiTextBoxSeachText" runat="server" placeholder="What you want to search?"></asp:TextBox>     
</asp:Panel>