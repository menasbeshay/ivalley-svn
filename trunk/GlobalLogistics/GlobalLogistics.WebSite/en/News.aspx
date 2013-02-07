<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="GlobalLogistics.WebSite.News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ContentLeftDiv">
        <h1>
            News
        </h1>
        <div class="Details675">
            <asp:Panel ID="uiPanelAllNews" runat="server">
        <asp:Repeater ID="uiRepeaterCurrentNews" runat="server">
            <ItemTemplate>
                    <div class="ItemHeader">
                        <a class="title" href='News.aspx?NID=<%# Eval("NewsID") %>' style="display: block;
                            float: left; width: 64%">
                            <%# Eval("EnTitle") %>
                            </a>  
                            
                        <div class="Post" style="width: 35%; float: right; background-color: #ddd; padding-left: 5px;">
                            Posted in: Date
                            <%# string.Format("{0:yyyy-MM-dd}", Eval("CreatedDate"))%>
                            | Time
                            <%# string.Format("{0:hh:mm:ss}", Eval("CreatedDate"))%></div>                        
                    </div>
                <div class="clear">
                </div>
                <div class="ItemLogo">
                    <img src='<%# string.IsNullOrEmpty(Eval("MainPicturePath").ToString()) ? "images/logo_Big_watermark.jpg" : Eval("MainPicturePath") %>'
                        style="width: 60px; height: 60px;" />
                </div>
                <div class="ItemDetails">
                    <%# Eval("EnBrief") %>
                </div>
                <div class="clear">
                </div>
                <hr />
            </ItemTemplate>
        </asp:Repeater>
                <asp:Panel ID="uiPanelPaging" runat="server" Style="text-align: center">
                    <asp:LinkButton ID="uiLinkButtonPrev" runat="server" OnClick="uiLinkButtonPrev_Click"><< Prev</asp:LinkButton>&nbsp;
                    <asp:Label ID="uiLabelPages" runat="server" Text="Page "></asp:Label>&nbsp;
                    <asp:LinkButton ID="uiLinkButtonNext" runat="server" OnClick="uiLinkButtonNext_Click">Next >></asp:LinkButton>
                </asp:Panel>
    </asp:Panel>
    <asp:Panel ID="uiPanelViewNews" runat="server">
                    <div style="font-weight:bold;color:#0B538E;font-size:16px;"><asp:Label ID="uiLabelTitle" runat="server" ></asp:Label></div>
                    <div class="clear10"></div>
                    <div class="DateShare">
                        <div class="Post" style="width:60%;margin-top:5px;">
                        Posted in: Date <asp:Label ID="uiLabelDate" runat="server" ></asp:Label> | Time 
                            <asp:Label ID="uiLabelTime" runat="server" ></asp:Label></div>
                        <div class="Share" style="width:30%; float:left;margin-top:5px;">
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
                        <div class="SmallBtn" style="float:right;line-height:12px;">
                                <a href="News.aspx">Back</a>
                            </div> 
                        <div class="clear">
                        </div>
                    </div>
                    <div class="clear">
                        </div>
                    <div ><asp:Image ID="uiImageNews" runat="server" Width="350px" /></div>
                    
                    <div class="clear">
                    </div>
                    <div>
                        <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
                    </div>
                    <div class="clear">
                    </div>
        
    </asp:Panel>
        </div>
    </div>
</asp:Content>
