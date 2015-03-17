<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/IFlights.Master" AutoEventWireup="true" CodeBehind="Circulars.aspx.cs" Inherits="Flights_GUI.Intranet.Circulars" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ MasterType VirtualPath="~/MasterPages/IFlights.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.notify-row .btn-inverse').removeClass("active");
            $('#mi_top_Circulars').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel runat="server" ID="uiPanelViewAll">
    <telerik:RadListView ID="uiRadListViewCirculars" runat="server" ItemPlaceholderID="CircularsContainer" AllowPaging="true" OnPageIndexChanged="uiRadListViewCirculars_PageIndexChanged" >
        <LayoutTemplate>
           <asp:PlaceHolder ID="CircularsContainer" runat="server" ></asp:PlaceHolder>
            <telerik:RadDataPager ID="uiRadDataPager" runat="server" PagedControlID="uiRadListViewCirculars" PageSize="5" CssClass="pagination pagination-centered">
                 <Fields>
                    <telerik:RadDataPagerButtonField FieldType="FirstPrev" ></telerik:RadDataPagerButtonField>
                    <telerik:RadDataPagerButtonField FieldType="Numeric" PageButtonCount="6"></telerik:RadDataPagerButtonField>
                    <telerik:RadDataPagerButtonField FieldType="NextLast"></telerik:RadDataPagerButtonField>
                    <telerik:RadDataPagerPageSizeField PageSizeComboWidth="60" PageSizeText="Page size: "></telerik:RadDataPagerPageSizeField>
                    <telerik:RadDataPagerGoToPageField CurrentPageText="Page: " TotalPageText="of" SubmitButtonText="Go"
                        TextBoxWidth="25"></telerik:RadDataPagerGoToPageField>
                </Fields>
                
            </telerik:RadDataPager>
        </LayoutTemplate>
        <ItemTemplate>
            
            <div class="row-fluid blog">
                                <div class="span3">
                                    <img src='<%# "../common/thumb.aspx?Image=" + (string.IsNullOrEmpty(Eval("MainPic").ToString()) ? "../img/announcement-icon.png" : Eval("MainPic")) %>' alt="" style="max-height:150px;max-width:100%;width:auto;margin:0 auto 10px ;display:block">
                                </div>
                                <div class="span9">
                                    <div class="date">
                                        <p class="day"><%# Convert.ToDateTime(Eval("createdDate").ToString()).ToString("dd") %></p>
                                        <p class="month"><%# Convert.ToDateTime(Eval("createdDate").ToString()).ToString("MMM") %></p>
                                    </div>
                                    <h2>
                                        <a href='Circulars.aspx?cid=<%# Eval("AnnouncementID") %>'><%# Eval("Title").ToString() %></a>
                                    </h2>
                                    <p>
                                        By <a href="javascript:;"><%# Eval("CreatedBy").ToString() %></a>
                                    </p>
                                    <p>
                                        <%# Eval("Brief").ToString() %>
                                    </p>
                                    
                                    <a href='Circulars.aspx?cid=<%# Eval("AnnouncementID") %>' class="btn btn-info pull-right">Continue Reading</a>
                                </div>
                            </div>
        </ItemTemplate>
        <ItemSeparatorTemplate>
            <hr />
        </ItemSeparatorTemplate>
    </telerik:RadListView>
    </asp:Panel>
    <asp:Panel runat="server" ID="uiPanelCurrent">
        <div class="row-fluid blog">
        <h2>
            <asp:Label ID="uiLabelTitle" runat="server"></asp:Label>
                                    </h2>
                                    <p>
                                        By <a href="javascript:;"><asp:Label ID="uiLabelCreator" runat="server"></asp:Label></a>
                                    </p>
                                     <asp:Image ID="uiImageMain" runat="server" />
                                    <div class="row-fluid">
                                        <div class="span6">
                                            <ul>
                                                <li><asp:Label ID="uiLabelDate" runat="server"></asp:Label></li>
                                            </ul>

                                        </div>
                                        
                                    </div>
                                    <div>
                                        <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
                                    </div>
            </div>
    </asp:Panel>    
</asp:Content>

