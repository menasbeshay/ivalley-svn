<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SectorInfo.ascx.cs" Inherits="Flights_GUI.Common.Controls.SectorInfo" %>
<style type="text/css">
    .style1
    {
        width: 50%;
        border-collapse: collapse;
    }
</style>

<table align="left" cellpadding="2" class="style1">
    <tr>
        <td colspan="4" style="font-size:18px;font-weight:bold;">
            
            Flight Details
            </td>
    </tr>
    <tr>
        <td colspan="4" >
            
        </td>
    </tr>
    <tr>
        <td width="20%">
            <asp:Label ID="Label1" runat="server" Text="Flight No." CssClass="Label"></asp:Label></td>
        <td>
            <asp:Label ID="uiLabelNO" runat="server"></asp:Label></td>
        <td width="20%">
            <asp:Label ID="Label2" runat="server" Text="Date" CssClass="Label"></asp:Label></td>
        <td>
            <asp:Label ID="uiLabelDate" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td width="20%">
            <asp:Label ID="Label3" runat="server" Text="From" CssClass="Label"></asp:Label></td>
        <td>
            <asp:Label ID="uiLabelFrom" runat="server"></asp:Label></td>
        <td width="20%">
            <asp:Label ID="Label4" runat="server" Text="To" CssClass="Label"></asp:Label></td>
        <td>
            <asp:Label ID="uiLabelTo" runat="server"></asp:Label></td>
    </tr>
</table>

