<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsTicker.ascx.cs" Inherits="YMC_Website.Controls.NewsTicker" %>
<asp:Repeater ID="uiRepeaterNews" runat="server">
    <HeaderTemplate>
        <marquee onmouseover="this.setAttribute('scrollamount',0,0);" direction="right" onmouseout="this.setAttribute('scrollamount',6,0);">
    </HeaderTemplate>
    <ItemTemplate>
        <a href="ViewNews.aspx?nid=<%# Eval("NewsID") %>" style="color: #003366">
            <%# Eval("Title")%></a>
    </ItemTemplate>
    <FooterTemplate>
        </marquee>
    </FooterTemplate>
    <SeparatorTemplate>
    &nbsp;|&nbsp;
    </SeparatorTemplate>
</asp:Repeater>
