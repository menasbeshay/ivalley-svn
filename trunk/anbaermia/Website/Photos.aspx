﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Inner.Master" AutoEventWireup="true" CodeBehind="Photos.aspx.cs" Inherits="Website.Photos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("a[rel^=PagePhotos]").prettyPhoto({
                social_tools: false, description: false
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ContentLeftDiv">
        <h1>
            ملتيمديا - صور
        </h1>
        <div class="Details675">            
            <div class="clear5">
            </div>
            <asp:Panel ID="uiPanelCats" runat="server" Visible="false">
                <div align="center" style="direction: rtl; clear: both;">
                    <div style="width: 90%; background-color: #cccccc; height: 20px;">
                        <div style="width: 40%; float: left;">
                            <asp:LinkButton ID="uiLinkButtonCatPrev" runat="server" OnClick="uiLinkButtonCatPrev_Click"
                                Font-Bold="True" Font-Size="Medium">السابق &gt;&gt;</asp:LinkButton>
                        </div>
                        <div style="width: 40%; float: right;">
                            <asp:LinkButton ID="uiLinkButtonCatNext" runat="server" OnClick="uiLinkButtonCatNext_Click"
                                Font-Bold="True" Font-Size="Medium"> &lt;&lt; التالى</asp:LinkButton>
                        </div>
                    </div>
                    <div style="width: 95%;">
                        <asp:DataList ID="uiDataListCats" runat="server" HorizontalAlign="Center" RepeatColumns="4"
                            RepeatDirection="Horizontal" RepeatLayout="Flow" Width="100%">
                            <ItemTemplate>
                                <div style="margin: 3px; border: 2px solid gray; width: 200px; float: right;" class="IconHost">
                                    <a href='Photos.aspx?catid=<%# Eval("CategoryID") %>' title="" style="text-decoration: none;">
                                        <img src="Images.aspx?Inner=photo&Image=<%# Eval("IconPath") %>" />
                                        <br />
                                        <%# Eval("Title") %></a>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                    <asp:Label ID="uiLabelCatEmpty" runat="server" Text="No data found." Visible="false"></asp:Label>
                </div>
            </asp:Panel>
            <div class="clear5">
            </div>
            <asp:Panel ID="uiPanelSubCats" runat="server" Visible="false">
                <div align="center" style="direction: rtl; clear: both;">
                    <div style="width: 90%; background-color: #cccccc; height: 20px;">
                        <div style="width: 40%; float: left;">
                            <asp:LinkButton ID="uiLinkButtonSubPrev" runat="server" OnClick="uiLinkButtonSubPrev_Click"
                                Font-Bold="True" Font-Size="Medium">السابق &gt;&gt;</asp:LinkButton>
                        </div>
                        <div style="width: 40%; float: right;">
                            <asp:LinkButton ID="uiLinkButtonSubNext" runat="server" OnClick="uiLinkButtonSubNext_Click"
                                Font-Bold="True" Font-Size="Medium"> &lt;&lt; التالى</asp:LinkButton>
                        </div>
                    </div>
                    <div style="width: 95%;">
                        <asp:DataList ID="uiDataListSub" runat="server" HorizontalAlign="Center" RepeatColumns="4"
                            RepeatDirection="Horizontal" RepeatLayout="Flow" Width="100%">
                            <ItemTemplate>
                                <div style="margin: 3px; border: 2px solid gray; width: 200px; float: right;" class="IconHost">
                                    <a href='Photos.aspx?scatid=<%# Eval("SubCategoryID") %>' title="" style="text-decoration: none;">
                                        <img src="Images.aspx?Inner=photo&Image=<%# Eval("IconPath") %>" />
                                        <br />
                                        <%# Eval("Title") %></a>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                    <asp:Label ID="Label1" runat="server" Text="No data found." Visible="false"></asp:Label>
                </div>
            </asp:Panel>
            <div class="clear5">
            </div>
            <asp:Panel ID="uiPanelPics" runat="server" Visible="false">
            <div align="center" style="direction: rtl;">
                <div style="width: 90%; background-color: #cccccc; height: 20px;">
                    <div style="width: 40%; float: left;">
                        <asp:LinkButton ID="uiLinkButtonPrev" runat="server" OnClick="uiLinkButtonPrev_Click"
                            Font-Bold="True" Font-Size="Medium">السابق &gt;&gt;</asp:LinkButton>
                    </div>
                    <div style="width: 40%; float: right;">
                        <asp:LinkButton ID="uiLinkButtonNext" runat="server" OnClick="uiLinkButtonNext_Click"
                            Font-Bold="True" Font-Size="Medium"> &lt;&lt; التالى</asp:LinkButton>
                    </div>
                </div>
                <div style="width: 92%;">
                    <asp:DataList ID="uiDataListPics" runat="server" HorizontalAlign="Center" RepeatColumns="4"
                        RepeatDirection="Horizontal" RepeatLayout="Flow" Width="100%" >
                        <ItemTemplate>
                            <div style="margin: 5px; border: 2px solid gray; width: 200px; float: right;">
                                <a href='<%# Eval("URL") %>' rel="PagePhotos" title="" style="text-decoration: none;">
                                    <img src='Images.aspx?Inner=photo&Image=<%# Eval("URL") %>'  />
                                    <br />
                                    <%# Eval("ArTitle") %></a>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <asp:Label ID="uiLabelEmpty" runat="server" Text="No data found." Visible="false"></asp:Label>
            </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
