<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="Vedios.aspx.cs" Inherits="GlobalLogistics.WebSite.en.Videos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ContentLeftDiv">
        <h1>
            Video Liberary
        </h1>
        <div class="Details675">
            <asp:Panel ID="uiPanelCategories" runat="server">
                <asp:DataList ID="uiDataListSubCats" runat="server" RepeatColumns="3" RepeatDirection="Horizontal"
                    Width="100%" CellPadding="5" CellSpacing="5">
                    <ItemTemplate>
                        <div class="IconHost">
                            <a href='Vedios.aspx?cid=<%# Eval("CategoryID").ToString() %>'>
                                <div>
                                    <img style="width: 130px; height: 130px;" src='<%# string.IsNullOrEmpty(Eval("IconPath").ToString()) ? "images/default_logo.gif" : Eval("IconPath") %>' />
                                </div>
                                <div class="clear">
                                </div>
                                <div>
                                    <%# Eval("EnName") %></div>
                        </div>
                        </a>
                    </ItemTemplate>
                </asp:DataList>
            </asp:Panel>
            <div class="clear10">
            </div>
            <asp:Panel ID="uiPanelAllVedios" runat="server">
                <asp:Repeater ID="uiRepeaterCurrentVedios" runat="server">
                    <ItemTemplate>
                        <div class="ItemHeader">
                            <a class="title" href='vedios.aspx?vid=<%# Eval("VedioID") %>' style="display: block;
                                float: left; width: 64%">
                                <%# Eval("EnTitle") %>
                            </a>
                        </div>
                        <div class="clear">
                        </div>
                        <div class="ItemLogo">
                            <img src='<%# string.IsNullOrEmpty(Eval("IconPath").ToString()) ? "images/default_logo.gif" : Eval("IconPath") %>'
                                style="width: 60px; height: 60px;" />
                        </div>
                        <div class="ItemDetails">
                            <%# Eval("EnDescription") %>
                        </div>
                        <div class="clear">
                        </div>
                        <hr />
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Panel ID="uiPanelPaging" runat="server" Style="text-align: center; direction: rtl;">
                    <asp:LinkButton ID="uiLinkButtonPrev" runat="server" OnClick="uiLinkButtonPrev_Click"><< Prev</asp:LinkButton>&nbsp;
                    <asp:Label ID="uiLabelPages" runat="server" Text="Page "></asp:Label>&nbsp;
                    <asp:LinkButton ID="uiLinkButtonNext" runat="server" OnClick="uiLinkButtonNext_Click">Next >></asp:LinkButton>
                </asp:Panel>
            </asp:Panel>
            <div class="clear10">
            </div>
            <asp:Panel ID="uiPanelVedio" runat="server">
                <asp:Repeater ID="uiRepeaterVedio" runat="server">
                    <ItemTemplate>
                        <asp:Label CssClass="videoTitle" ID="uiLabeltTitle" runat="server" Text='<%# Eval("EnTitle") %>'></asp:Label>
                        <br />
                        <asp:Label ID="uiLabelDesc" runat="server" Text='<%# Eval("EnDescription") %>'></asp:Label>
                        <div class="clear10">
                        </div>
                        <iframe width="640" height="400" src='<%# Eval("URL") %>' frameborder="0" allowfullscreen>
                        </iframe>
                    </ItemTemplate>
                </asp:Repeater>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
