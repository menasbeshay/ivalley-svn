<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ExceptionLight.Master" AutoEventWireup="true" CodeBehind="blog.aspx.cs" Inherits="Flights_GUI.Intranet.blog" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ MasterType VirtualPath="~/MasterPages/ExceptionLight.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/custombootstrap/css/bootstrap.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('.notify-row .btn-inverse').removeClass("selected");
            $('#mi_top_Circulars').addClass("selected");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel runat="server" ID="uiPanelViewAll">
        <div class="blog-thumbs no-bar">
            <div class="blog-posts">
                <telerik:RadListView ID="uiRadListViewCirculars" runat="server" ItemPlaceholderID="CircularsContainer" AllowPaging="true" OnPageIndexChanged="uiRadListViewCirculars_PageIndexChanged">
                    <LayoutTemplate>
                        <asp:PlaceHolder ID="CircularsContainer" runat="server"></asp:PlaceHolder>
                        <telerik:RadDataPager ID="uiRadDataPager" runat="server" PagedControlID="uiRadListViewCirculars" PageSize="5" CssClass="pagination pagination-centered">
                            <Fields>
                                <telerik:RadDataPagerButtonField FieldType="FirstPrev"></telerik:RadDataPagerButtonField>
                                <telerik:RadDataPagerButtonField FieldType="Numeric" PageButtonCount="6"></telerik:RadDataPagerButtonField>
                                <telerik:RadDataPagerButtonField FieldType="NextLast"></telerik:RadDataPagerButtonField>
                                <telerik:RadDataPagerPageSizeField PageSizeComboWidth="60" PageSizeText="Page size: "></telerik:RadDataPagerPageSizeField>
                                <telerik:RadDataPagerGoToPageField CurrentPageText="Page: " TotalPageText="of" SubmitButtonText="Go"
                                    TextBoxWidth="25"></telerik:RadDataPagerGoToPageField>
                            </Fields>

                        </telerik:RadDataPager>
                    </LayoutTemplate>
                    <ItemTemplate>

                        <div class="post-item " data-animate="fadeInLeft">
                            <div class="post-image">
                                <a href='blog.aspx?cid=<%# Eval("AnnouncementID") %>'>
                                    <div class="mask"></div>
                                    <div class="post-lft-info">
                                        <div class="main-bg">
                                            <%# Convert.ToDateTime(Eval("createdDate").ToString()).ToString("dd") %><br>
                                            <%# Convert.ToDateTime(Eval("createdDate").ToString()).ToString("MMM") %><br>
                                            <%# Convert.ToDateTime(Eval("createdDate").ToString()).ToString("yyyy") %>
                                        </div>
                                    </div>
                                    <img src='<%# (string.IsNullOrEmpty(Eval("MainPic").ToString()) ? "../img/flyegypt.png" : "../common/thumb.aspx?Image=" + Eval("MainPic")) %>' alt="" style="max-height: 177px; max-width: 300px; width: 300px; margin: 0 auto 10px; display: block">
                                </a>
                            </div>
                            <article class="post-content">
                                <div class="post-info-container">
                                    <div class="post-info">
                                        <h2><a class="main-color" href='blog.aspx?cid=<%# Eval("AnnouncementID") %>'><%# Eval("Title").ToString() %></a></h2>
                                        <ul class="post-meta">
                                            <li class="meta-user"><i class="fa fa-user"></i>By: <a href="../Account/Profile.aspx?uid=<%# Eval("UserID") %>" target="_blank"><%# Eval("UserName").ToString() %></a></li>

                                        </ul>
                                    </div>
                                </div>
                                <p>
                                    <%# Eval("Brief").ToString() %> <a class="read-more" href='blog.aspx?cid=<%# Eval("AnnouncementID") %>'>Read more</a>
                                </p>
                            </article>

                        </div>

                    </ItemTemplate>

                    <ItemSeparatorTemplate>
                        <hr />
                    </ItemSeparatorTemplate>
                </telerik:RadListView>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="uiPanelCurrent">
        <div class="row-fluid blog">
            <h2>
                <asp:Label ID="uiLabelTitle" runat="server"></asp:Label>
            </h2>
            <p>
                By
                <asp:Label ID="uiLabelCreator" runat="server"></asp:Label>
            </p>
            <asp:Image ID="uiImageMain" runat="server" />
            <div class="row-fluid">
                <div class="span6">
                    <ul>
                        <li>
                            <asp:Label ID="uiLabelDate" runat="server"></asp:Label></li>
                    </ul>
                </div>
                <div class="span6" style="float: right">
                    <a id="btnDownloadAttachment" href="#" class="btn btn-small main-bg" target="_blank" runat="server"><i class="fa fa-download"></i>Download Attachment</a>
                </div>

            </div>
            <div>
                <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
