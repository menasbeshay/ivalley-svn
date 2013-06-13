<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsTicker.ascx.cs" Inherits="Website.Controls.NewsTicker" %>

<asp:Repeater ID="uiRepeaterTicker" runat="server">
<HeaderTemplate>
    <ul id="js-news" style="background-color: Black; color: #fff; font-size: 15px; font-weight: bold;
        height: 20px; padding: 5px;">
</HeaderTemplate>
<ItemTemplate>
    <li class="news-item"><%# Eval("ArContent") %></li>
</ItemTemplate>
<FooterTemplate>
    </ul></FooterTemplate>
</asp:Repeater>

<script type="text/javascript">
    $(document).ready(function () {
        $('#js-news').ticker({ controls: false, titleText: 'أخر الأخبار', direction: 'rtl' });
     });
</script>