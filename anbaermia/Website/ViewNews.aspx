﻿<%@ Page Title="" Language="C#" MasterPageFile="~/newTheme.Master" AutoEventWireup="true" CodeBehind="ViewNews.aspx.cs" Inherits="Website.ViewNews" %>
<%@ MasterType VirtualPath="~/newTheme.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/tabs.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.tinyscrollbar.min.js" type="text/javascript"></script>
    <link href="css/scrollbar.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('#scrollbar1').tinyscrollbar();
            $('#scrollbar2').tinyscrollbar();
        });
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ContentLeftDiv" style="width:75%;float:right;" id="tabs">
        <h1 >
            الأخبـــار
        </h1>
        <div class="Details675">
            <asp:Panel ID="uiPanelAllNews" runat="server">
                <asp:Repeater ID="uiRepeaterCurrentNews" runat="server">
                <HeaderTemplate>
                <div id="scrollbar1"><div class="scrollbar"><div class="track"><div class="thumb"><div class="end"></div></div></div></div><div class="viewport"> <div class="overview">
                </HeaderTemplate>
                <FooterTemplate>
                </div>
		</div>
	</div>	
                </FooterTemplate>
                    <ItemTemplate>
                        <div class="ItemHeader" style="background-color: #DDB987; height: 25px; font-size: 16px;
                            border-radius: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px;">
                            <a class="title" href='ViewNews.aspx?NID=<%# Eval("NewsID") %>' style="display: block;
                                background-color: #DDB987; float: right; width: 64%;font-weight:bold; color: #720000;">
                                <%# Eval("ArTitle") %>
                            </a>
                            <div class="Post" style="width: 35%; float: left; background-color: #DDB987; padding-right: 5px; color: #990000;font-size:14px;direction:ltr;">
                                
                                <%# string.Format("{0:dd-MMM-yyyy}", Eval("PostedDate"))%> &nbsp;
                                 <%# string.Format("{0:hh:mm}", Eval("PostedDate"))%>
                            </div>

                        </div>
                        <div class="clear">
                        </div>
                        <div class="ItemLogo">
                            <img src='<%# string.IsNullOrEmpty(Eval("MainImagePath").ToString()) ? "images/logo_Big_watermark.jpg" : Eval("MainImagePath") %>'
                                style="width: 60px; height: 60px;" />
                        </div>
                        <div class="ItemDetails">
                            <%# Eval("Description")%>
                        </div>
                        <div class="clear">
                        </div>
                        <hr />
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Panel ID="uiPanelPaging" runat="server" Style="text-align: center; direction: rtl;">
                    <asp:LinkButton ID="uiLinkButtonPrev" runat="server" OnClick="uiLinkButtonPrev_Click"><< السابق</asp:LinkButton>&nbsp;
                    <asp:Label ID="uiLabelPages" runat="server" Text="Page "></asp:Label>&nbsp;
                    <asp:LinkButton ID="uiLinkButtonNext" runat="server" OnClick="uiLinkButtonNext_Click">التالى >></asp:LinkButton>
                </asp:Panel>
            </asp:Panel>
            <asp:Panel ID="uiPanelViewNews" runat="server">
                <div style="font-weight: bold; color: #0B538E; font-size: 16px; color: #720000;">
                    <asp:Label ID="uiLabelTitle" runat="server"></asp:Label></div>
                <div class="clear10">
                </div>
                <div class="DateShare" style="background-color: #DDB987; height: 30px; margin-bottom: 10px;
                    margin-top: 5px; padding: 5px; border-radius: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px;">
                    <div class="Post" style="width: 30%; background-color: #DDB987; float: right; padding-top: 3px;font-size:14px; 
                        color: #990000;">
                        
                        <asp:Label ID="uiLabelDate" runat="server"></asp:Label>
                        </div>  
                    <div class="Share" style="width: 20%; float: right; background-color: #DDB987;margin-top:5px;">
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
                    <div class="SmallBtn" style="float: right;margin-right:20px; line-height: 12px;">
                        <a href="ViewNews.aspx">رجوع</a>
                    </div>
                    <div class="clear">
                    </div>
                </div>
                <div class="clear">
                </div>
                <div style="float:right;width:30%;">
                    <asp:Image ID="uiImageNews" runat="server"  /></div>
                
                <div style="float:right;width:50%;">
                <div id="scrollbar2"><div class="scrollbar"><div class="track"><div class="thumb"><div class="end"></div></div></div></div><div class="viewport"> <div class="overview">
                    <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
                    </div>
		</div>
	</div>	    
                </div>
                <div class="clear">
                </div>
            </asp:Panel>
        </div>
    </div>
    <%--<div class="ContentLeftDiv NewsImageHolder" style="width: 17%; float: right; padding: 5px;padding-top:77px;">
        <img src="images/news_banner.jpg" />
    </div>--%>
</asp:Content>
