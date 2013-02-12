<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeBlock.ascx.cs" Inherits="GlobalLogistics.WebSite.Controls.HomeBlock" %>
<asp:Panel ID="EnPanel" runat="server">
    <div class="ContentLeftDiv">
        <h2>
            <asp:Label ID="uiLabelEnTitle" runat="server" ></asp:Label></h2>
        <div class="Details490" style="max-height:560px;overflow:scroll;margin-bottom:2px;">
            <asp:Literal ID="uiLiteralEnContent" runat="server"></asp:Literal>
        </div>
    </div>
</asp:Panel>
<asp:Panel ID="ArPanel" runat="server">
    <div class="ContentLeftDiv">
        <h2>
            <asp:Label ID="uiLabelArTitle" runat="server"></asp:Label></h2>
        <div class="Details490" style="max-height: 560px; overflow: scroll; margin-bottom: 2px;">
            <asp:Literal ID="uiLiteralArContent" runat="server"></asp:Literal>
        </div>
    </div>
</asp:Panel>
