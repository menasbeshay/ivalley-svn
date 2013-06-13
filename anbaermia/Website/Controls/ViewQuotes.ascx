<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewQuotes.ascx.cs" Inherits="Website.Controls.ViewQuotes" %>
<script type="text/javascript">
    $(document).ready(function () {
        $("a[rel^=Quotes]").prettyPhoto({
            social_tools: false, description: false
        });
    });
</script>

<asp:Repeater ID="uiRepeaterQuotes" runat="server">
    <HeaderTemplate>
        <div class="heading">
            كلمـــات</div>
    <div class="clear5"></div>
    </HeaderTemplate>
    <ItemTemplate>
    <div>
        <div style="float:right;width:20%;margin:3px;">
        <a href='<%# Eval("ImageURL") %>' rel="Quotes" title="">
           <img src='Images.aspx?Inner=Quote&Image=<%# Eval("ImageURL") %>' style="vertical-align:middle;" />
        </a>
           </div>
           <div style="float: right; width: 70%; margin: 3px;padding-top:5px;">
           <%# Server.HtmlDecode(Eval("ArContent").ToString())%>
           </div>
    </div>
        <div class="clear">
        </div>
    <hr />
           <div class="clear5"></div>
    </ItemTemplate>
    
</asp:Repeater>

<div></div>
<div></div>