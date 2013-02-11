<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="News.ascx.cs" Inherits="Taqwa.Website.Controls.News" %>
<div class="NewsHeader">
    </div>
    <div style="clear:both;height:1px;"></div>
<div class="NewsBlock">    
    <asp:Repeater ID="uiRepeaterTopNews" runat="server">
        <ItemTemplate>
        <div style="clear:both;height:3px;"></div>
            <div class="NewsDate">
                <%# string.Format("{0:dd.MM.yyyy}",  DateTime.Parse(Eval("CreatedDate").ToString())) + " - " %>
            </div>
            <div class="More">
                <a href='News.aspx?NID=<%# Eval("NewsID") %>'>المزيد</a>
            </div>
            <div style="clear:both;height:1px;"></div>
            <div class="NewsDetails">
                <%# Eval("ArBody").ToString().Length > 200 ? Server.HtmlDecode(Eval("ArBody").ToString()).Substring(0,200) : Server.HtmlDecode(Eval("ArBody").ToString()) %>
            </div>
        </ItemTemplate>
        <SeparatorTemplate>
        <div align="center" style="height:13px;padding-top:14px;">
        <img src="images/line.jpg" width="272" height="9">
        </div>        
        </SeparatorTemplate>
        <FooterTemplate>
        <div style="height:28px;text-align:left;padding-left:10px;">
        <a href="News.aspx">
        <img src="images/more_b.jpg" width="67" height="20" style="border: 0;">
        </a>
        </div>
        </FooterTemplate>
    </asp:Repeater>
</div>
