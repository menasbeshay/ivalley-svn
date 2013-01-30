<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Exchanges.ascx.cs" Inherits="GlobalLogistics.WebSite.Controls.Exchanges" %>
<!-- Exchange -->
<div class="ContentLeftDiv">
    <div class="xChange">
        
        <asp:Repeater ID="uiRepeaterExchange" runat="server">
        <HeaderTemplate>
        <marquee scrolldelay="150">
        </HeaderTemplate>
        <ItemTemplate>
        <%# "1 " + Eval("Code").ToString() + " = " + Eval("CellPrice").ToString() + " EGP " %>  
        </ItemTemplate>
        <SeparatorTemplate>&nbsp;&nbsp;|&nbsp;&nbsp;</SeparatorTemplate>
        <FooterTemplate>
        </marquee>
        </FooterTemplate>
        </asp:Repeater>
    </div>
</div>