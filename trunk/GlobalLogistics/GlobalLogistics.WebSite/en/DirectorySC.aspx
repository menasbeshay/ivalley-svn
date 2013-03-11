<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="DirectorySC.aspx.cs" Inherits="GlobalLogistics.WebSite.en.DirectorySC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ContentLeftDiv">
        <h1>
            Directory
            <asp:Label ID="uiLabelTitle" runat="server" Font-Bold="True"></asp:Label></h1>
        <div class="Details675">
            <asp:Panel ID="uiPanelCategories" runat="server">
                <asp:DataList ID="uiDataListSubCats" runat="server" RepeatColumns="3" RepeatDirection="Horizontal"
                    Width="100%" CellPadding="5" CellSpacing="5">
                    <ItemTemplate>
                        <div class="IconHost">
                            <a href='Directory.aspx?<%# "scid=" + Eval("SubCategoryID").ToString() + (((Request.QueryString["type"] != null) && (Request.QueryString["type"].ToString() == "sh")) ? "&f=sh" : "") %>'>
                                <div>
                                    <img style="width: 130px;" src='Images.aspx?Image=<%# string.IsNullOrEmpty(Eval("IconPath").ToString()) ? "images/default_logo.gif" : Eval("IconPath") %>' />
                                </div>
                                <div class="clear">
                                </div>
                                <div>
                                    <%# Eval("EnName")%></div>
                        </div>
                        </a>
                    </ItemTemplate>
                </asp:DataList>
            </asp:Panel>
            <asp:Panel ID="uiPanelResults" runat="server">
                <asp:Repeater ID="uiRepeaterResults" runat="server" OnItemDataBound="uiRepeaterResults_ItemDataBound">
                    <ItemTemplate>
                        <div class="ItemHeader" style="font-weight: bold; text-decoration: underline; color: #0B538E;">
                            <asp:HyperLink ID="CompanyLink" runat="server"><%# Eval("EnName")%></asp:HyperLink>
                            <div runat="server" id="CompanyName">
                                <%# Eval("EnName")%></div>
                        </div>
                        <div class="Clear">
                        </div>
                        <div class="ItemLogo">
                            <img src='<%# string.IsNullOrEmpty(Eval("LogoPath").ToString()) ? "images/default_logo.gif" : Eval("LogoPath") %>' />
                        </div>
                        <div class="ItemDetails">
                            <div class="ItemHead" style="font-weight: bold;">
                                City</div>
                            <div class="ItemValue">
                                <asp:Label ID="uiLabelCityName" runat="server"></asp:Label>
                            </div>
                            <div class="clear">
                            </div>
                            <div class="ItemHead" style="font-weight: bold;">
                                Address</div>
                            <div class="ItemValue">
                                <%# Eval("EnAddress") %></div>
                            <div class="clear">
                            </div>
                            <div class="ItemHead" style="font-weight: bold;">
                                Telephone</div>
                            <div class="ItemValue">
                                <%# Eval("Tele") %></div>
                            <div class="clear">
                            </div>
                            <div class="ItemHead" style="font-weight: bold;">
                                Fax</div>
                            <div class="ItemValue">
                                <%# Eval("Fax") %></div>
                            <div class="clear">
                            </div>
                        </div>
                        <div class="clear10">
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Panel ID="uiPanelPaging" runat="server" Style="text-align: center; direction: rtl;">
                    <asp:LinkButton ID="uiLinkButtonPrev" runat="server" OnClick="uiLinkButtonPrev_Click"><< Prev</asp:LinkButton>&nbsp;
                    <asp:Label ID="uiLabelPages" runat="server" Text="Page "></asp:Label>&nbsp;
                    <asp:LinkButton ID="uiLinkButtonNext" runat="server" OnClick="uiLinkButtonNext_Click">Next >></asp:LinkButton>
                </asp:Panel>
            </asp:Panel>
            <asp:Panel ID="uiPanelNoResults" runat="server">
                <asp:Label ID="Label1" runat="server" Text="No results found."></asp:Label>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
