<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="News.ascx.cs" Inherits="Taqwa.Website.Controls.News" %>
<%--<div class="NewsHeader">
    </div>--%>
    <div style="clear:both;height:1px;"></div>
<%--<div class="NewsBlock">    
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
        <div align="center" >
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
</div>--%>

<div class="grid_12 pull-right">
<h3 class="block_title grid_4 ">أخبار المدرسة</h3>
<div class="grid_2 pull-left">
<a href="../News.aspx" class="btn btn-default">المزيد من الأخبار</a>
</div>
</div>

<div class="grid_6">
<asp:Repeater ID="uiRepeaterOne" runat="server">
<HeaderTemplate>
<ul class="tt-accordion">
</HeaderTemplate>
<FooterTemplate>
</ul><!-- end accordion -->
</FooterTemplate>
<ItemTemplate>
<li class="sub-accordion">
		<div class="accordion-head">
			<div class="accordion-head-sign"></div>
			<p style="margin:0 !important;"><%# Eval("ArTitle")%>
            <div class="pull-left" style="margin-top:-20px !important;margin-left:5px;"><%# DateTime.Parse(Eval("CreatedDate").ToString()).ToString("dd/MM/yyyy")%></div>
            </p>
            
		</div>
		<div class="accordion-content">
			<%# Eval("ArBody").ToString().Length > 200 ? System.Text.RegularExpressions.Regex.Replace(Server.HtmlDecode(Eval("ArBody").ToString()).Substring(0, 200), @"<[^>]+>|&nbsp;", "") : System.Text.RegularExpressions.Regex.Replace(Server.HtmlDecode(Eval("ArBody").ToString()), @"<[^>]+>|&nbsp;", "")%>
            <div class="clearfix"></div>
            <div class="pull-left">
            <a href='../news.aspx?NID=<%# Eval("NewsID").ToString() %>'>المزيد</a>
            </div>
		</div>
	</li>
</ItemTemplate>
</asp:Repeater>
	
		

</div>

<div class="grid_6">
<asp:Repeater ID="uiRepeaterTwo" runat="server">
<HeaderTemplate>
<ul class="tt-accordion">
</HeaderTemplate>
<FooterTemplate>
</ul><!-- end accordion -->
</FooterTemplate>
<ItemTemplate>
<li class="sub-accordion">
		<div class="accordion-head">
			<div class="accordion-head-sign"></div>
			<p style="margin:0 !important;"><%# Eval("ArTitle")%>
            <div class="pull-left" style="margin-top:-20px !important;margin-left:5px;"><%# DateTime.Parse(Eval("CreatedDate").ToString()).ToString("dd/MM/yyyy")%></div>
            </p>
            
		</div>
		<div class="accordion-content">
			<%# Eval("ArBody").ToString().Length > 200 ? System.Text.RegularExpressions.Regex.Replace(Server.HtmlDecode(Eval("ArBody").ToString()).Substring(0, 200), @"<[^>]+>|&nbsp;", "") : System.Text.RegularExpressions.Regex.Replace(Server.HtmlDecode(Eval("ArBody").ToString()), @"<[^>]+>|&nbsp;", "")%>
            <div class="clearfix"></div>
            <div class="pull-left">
            <a href='../news.aspx?NID=<%# Eval("NewsID").ToString() %>'>المزيد</a>
            </div>
		</div>
	</li>
</ItemTemplate>
</asp:Repeater>
	
		

</div>
