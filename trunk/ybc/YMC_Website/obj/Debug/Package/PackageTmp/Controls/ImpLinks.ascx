<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImpLinks.ascx.cs" Inherits="YMC_Website.Controls.ImpLinks" %>
<div class="maintext" id="newsbox">
    <div class="maintext" id="textnews">
    روابط مهمة</div>
    </div>
<div id="lastnews">
    <asp:Repeater ID="uiRepeaterLinks" runat="server">
    <HeaderTemplate>
        <ul>
    </HeaderTemplate>
    <ItemTemplate>
        <li><a href="<%# Eval("LinkURL") %>"><%# Eval("LinkName") %></a></li>
    </ItemTemplate>
    <FooterTemplate>
    </ul>
    </FooterTemplate>
    </asp:Repeater>   
</div>
