<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ExceptionLight.Master" AutoEventWireup="true" CodeBehind="certificates.aspx.cs" Inherits="Flights_GUI.Intranet.certificates" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ MasterType VirtualPath="~/MasterPages/ExceptionLight.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .clear {
            clear:both;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row padd-top-25">
    <telerik:RadListView ID="uiRadListViewCircularsPublic" runat="server" ItemPlaceholderID="CircularsContainer" AllowPaging="true" OnPageIndexChanged="uiRadListViewCircularsPublic_PageIndexChanged">
                                <LayoutTemplate>
                                    <asp:PlaceHolder ID="CircularsContainer" runat="server"></asp:PlaceHolder>
                                    <telerik:RadDataPager ID="uiRadDataPager" runat="server" PagedControlID="uiRadListViewCircularsPublic" PageSize="9" CssClass="pagination pagination-centered clear">
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
                                    <div class="cell-4 service-box-4 animated fadeInUp" >
                                <div class="cell-3">
                                    <a href="#" class="masterLink"><i class="fa fa-check-circle"></i></a>
                                </div>
                                <div class="cell-9">
                                    <h3><%# Eval("Name") %></h3>
                                    <p><a href='<%# Eval("Path") %>'class="btn empty main-border" target="_blank" download="<%# Eval("Name") %>" <%# !string.IsNullOrEmpty(Eval("Path").ToString()) ? "style='display:block'" : "style='display:none'" %>><i class="fa fa-download"></i>Download Certificate</a> </p>
                                </div>
                            </div>
                                </ItemTemplate>
                                
                            </telerik:RadListView>
        </div>
</asp:Content>
