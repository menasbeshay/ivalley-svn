<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Ads5.ascx.cs" Inherits="GlobalLogistics.WebSite.Controls.Ads5" %>
 <asp:Panel ID="EnPanel" runat="server">
<asp:Repeater ID="uiRepeaterEnAds" runat="server">
    <HeaderTemplate>
    <div id="Ad5" style="height:175px;">
    </HeaderTemplate>
    <ItemTemplate>
    <a href='<%# Eval("URL") %>' target="_blank">
        <asp:Image ID="uiImage" runat="server" ImageUrl='<%# Eval("EnFilePath") %>' />
        </a>
    </ItemTemplate>
    <FooterTemplate>
    </div>
    </FooterTemplate>
    </asp:Repeater>
    <asp:Image ID="DefEnImage" runat="server" ImageUrl="~/images/AdDef_5.gif" />
</asp:Panel>
<asp:Panel ID="ArPanel" runat="server">
<asp:Repeater ID="uiRepeaterArAds" runat="server">
    <HeaderTemplate>
    <div id="Ad5" style="height:175px;">
    </HeaderTemplate>
    <ItemTemplate>
    <a href='<%# Eval("URL") %>' target="_blank">
        <asp:Image ID="uiImage" runat="server" ImageUrl='<%# Eval("ArFilePath") %>' />
       </a>
    </ItemTemplate>
    <FooterTemplate>
    </div>
    </FooterTemplate>
    </asp:Repeater>
    <asp:Image ID="DefArImage" runat="server" ImageUrl="~/Arabic/images/AdDef_5.gif" />
</asp:Panel>
 
 <asp:Literal ID="uiLiteralScript" runat="server"></asp:Literal>