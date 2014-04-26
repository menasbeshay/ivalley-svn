<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/All.Master" AutoEventWireup="true"
    CodeBehind="Browse.aspx.cs" Inherits="E3zemni_WebGUI.Browse" %>

<%@ MasterType VirtualPath="~/MasterPages/All.Master" %>
<%@ Register Src="controls/ucSearch.ascx" TagName="ucSearch" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script src="js/purl.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <div class="row clearfix mbs">
        <div class="grid_9">
            <div class="products shop clearfix mbf">
                <asp:Repeater ID="uiRepeaterCards" runat="server">
                    <ItemTemplate>
                        <div class="product grid_4">
                            <img class="product_img" src='<%# Eval("MainPhoto") %>' alt=""><!-- featured thumbnail -->
                            <img class="product_img_hover" src='<%# Eval("MainPhotoHover") %>' alt=""><!-- featured thumbnail hover -->
                            <div class="product_inner">
                                <h3>
                                    <a href='viewCard.aspx?cid=<%# Eval("CardID") %>'>
                                        <%# Eval("CardNameEng")%>
                                    </a>
                                </h3>
                                <div class="clearfix">
                                    <p class="price">
                                        EGP
                                        <%# Eval("PriceNow")%>
                                    </p>
                                    <div class="Share" style=" margin-top: 50px;">
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
                                </div>
                            </div>
                            <div class="product_meta clearfix">
                                <%--<a href="#" class="f_btn add_c"><span><i class="icon_cart_alt"></i> Add to Cart</span></a>--%>
                                <a href='viewCard.aspx?cid=<%# Eval("CardID") %>' class="f_btn"><span><i class="icon_menu">
                                </i>Details</span></a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <div class="clear" style="height: 5px;">
                </div>
                <div class="pagination-tt clearfix">
                    <ul>
                        <li>
                            <asp:LinkButton ID="uiLinkButtonPrev" runat="server" OnClick="uiLinkButtonPrev_Click"
                                Font-Bold="True" Font-Size="Medium"><i class="arrow_left"></i> Prev</asp:LinkButton>
                        </li>
                        <li>
                            <asp:LinkButton ID="uiLinkButtonNext" runat="server" OnClick="uiLinkButtonNext_Click"
                                Font-Bold="True" Font-Size="Medium"> Next <i class="arrow_right"></i></asp:LinkButton>
                        </li>
                    </ul>
                </div>
                <!-- pagination -->
            </div>
        </div>
        <div class="grid_3 sidebar">
            <uc1:ucSearch ID="ucSearch1" runat="server" />
        </div>
    </div>
</asp:Content>
