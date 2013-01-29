<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="News.ascx.cs" Inherits="GlobalLogistics.WebSite.Controls.News" %>
<!-- News -->
<asp:Panel ID="EnPanel" runat="server">
<div class="ContentLeftDiv">
    <h1>
        Letast News</h1>
    <div class="Details675">
        <asp:Repeater ID="uiRepeaterEnNews" runat="server">
        <ItemTemplate>
        <div class="newsItem" <%# Container.ItemIndex == 0 ? "style='display:block;'" : "style='display:none'" %> >
            <h5>
            <a class="title" href='../en/News.aspx?NID=<%# Eval("NewsID") %>'>
                <%# Eval("EnTitle")%>
                </a>
                </h5>
                <div class="DateShare">
                <div class="Post">
                Posted in: Date <%# string.Format("{0:yyyy-MM-dd}", Eval("CreatedDate"))%> | Time <%# string.Format("{0:hh:mm:ss}", Eval("CreatedDate"))%></div>
                <div class="Share">
                    <!-- AddThis Button BEGIN -->
                    <div class="addthis_toolbox addthis_default_style ">
                        <a class="addthis_button_preferred_1"></a><a class="addthis_button_preferred_2">
                        </a><a class="addthis_button_preferred_3"></a><a class="addthis_button_preferred_4">
                        </a><a class="addthis_button_compact"></a><a class="addthis_counter addthis_bubble_style">
                        </a>
                    </div>
                    <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-4ff5714055358f82"></script>
                    <!-- AddThis Button END -->
                </div>
                <div class="clear">
                </div>
            </div>
            <img src='<%# string.IsNullOrEmpty(Eval("MainPicturePath").ToString()) ? "/images/logo_Big_watermark.jpg" : Eval("MainPicturePath") %>' style="width:140px;height:120px;" /> <%# Eval("EnBrief")%>
            </div>
         </ItemTemplate>
         <FooterTemplate>
         <div class="ControlMore">
            <div class="Control">
                <ul>
                    <li><a class="newsItemBtn" href="#d">1</a></li>
                    <li><a class="newsItemBtn" href="#d">2</a></li>
                    <li><a class="newsItemBtn" href="#d">3</a></li>
                    <li><a class="newsItemBtn" href="#d">4</a></li>
                    <div class="ControlPause">
                        <a id="playNews" href="#d">.</a></div>
                </ul>
            </div>
            <div class="More">
                <a href="../en/News.aspx" target="_blank">View More News</a></div>
            <div class="clear">
            </div>
        </div>
         </FooterTemplate>
        </asp:Repeater>        
    </div>
</div>
</asp:Panel>

<asp:Panel ID="ArPanel" runat="server">
<div class="ContentLeftDiv">
    <h1>
        أخر الأخبار </h1>
    <div class="Details675">
      <asp:Repeater ID="uiRepeaterArNews" runat="server">
        <ItemTemplate>
        <div class="newsItem" <%# Container.ItemIndex == 0 ? "style='display:block;'" : "style='display:none'" %> >
            <h5>
            <a class="title" href="../News.aspx?NID=<%# Eval("NewsID") %>">
                <%# Eval("ArTitle")%>
                </a>
                </h5>
                <div class="DateShare">
                <div class="Post">
                تاريخ النشر : <%# string.Format("{0:yyyy-MM-dd}", Eval("CreatedDate"))%> | الساعة <%# string.Format("{0:hh:mm:ss}", Eval("CreatedDate"))%>
                </div>
                <div class="Share">
                    <!-- AddThis Button BEGIN -->
                    <div class="addthis_toolbox addthis_default_style ">
                        <a class="addthis_button_preferred_1"></a><a class="addthis_button_preferred_2">
                        </a><a class="addthis_button_preferred_3"></a><a class="addthis_button_preferred_4">
                        </a><a class="addthis_button_compact"></a><a class="addthis_counter addthis_bubble_style">
                        </a>
                    </div>
                    <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-4ff5714055358f82"></script>
                    <!-- AddThis Button END -->
                </div>

                <div class="clear">
                </div>
            </div>
            <img src='<%# string.IsNullOrEmpty(Eval("MainPicturePath").ToString()) ? "/images/logo_Big_watermark.jpg" : Eval("MainPicturePath") %>' style="width:140px;height:120px;" /> <%# Eval("ArBrief")%>
            </div>
         </ItemTemplate>
         <FooterTemplate>
         <div class="ControlMore">
            <div class="Control">
                <ul>
                    <li><a class="newsItemBtn" href="#d">1</a></li>
                    <li><a class="newsItemBtn" href="#d">2</a></li>
                    <li><a class="newsItemBtn" href="#d">3</a></li>
                    <li><a class="newsItemBtn" href="#d">4</a></li>
                    <div class="ControlPause">
                        <a id="playNews" href="#d">.</a></div>
                </ul>
            </div>
            <div class="More">
                <a href="../News.aspx" target="_blank">المزيد من الأخبار</a></div>
            <div class="clear">
            </div>
        </div>
         </FooterTemplate>
        </asp:Repeater>
    </div>
</div>
</asp:Panel>