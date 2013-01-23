<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="News.ascx.cs" Inherits="YMC_Website.Controls.News" %>
<div class="maintext" id="newsbox">
    <div class="maintext" id="textnews">
        اخر الاخبار</div>
</div>
<div id="lastnews">
    <asp:Repeater ID="uiRepeaterNews" runat="server">
        <HeaderTemplate>
            <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <li><a href="ViewNews.aspx?nid=<%# Eval("NewsID") %>">
                <%# Eval("Title")%></a></li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>   
</div>
