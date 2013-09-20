<%@ Page Title="" Language="C#" MasterPageFile="~/newTheme.Master" AutoEventWireup="true" CodeBehind="Photos.aspx.cs" Inherits="Website.Photos" %>
<%@ MasterType VirtualPath="~/newTheme.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/tabs.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("a[rel^=PagePhotos]").prettyPhoto({
                social_tools: false, description: false
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ContentLeftDiv" id="tabs">
        <h1>
            ملتيمديا - صور
        </h1>
        <div class="Details675">            
            <div class="clear5">
            </div>
            <asp:Panel ID="uiPanelCats" runat="server" Visible="false">
                <div align="center" style="direction: rtl; clear: both;">
                    <div style="width: 90%; background-color: #DDB987; height: 20px;">
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
                                <div style="margin: 3px; text-decoration: none;display:block;width: 150px; margin: 10px;height:150px; padding: 0; text-align: center;border:3px solid #4A3F29;border-radius:80px;-moz-border-radius:80px;-webkit-border-radius:80px; float: right;" class="IconHost">
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
                    <div style="width: 90%; background-color: #DDB987; height: 20px;">
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
                                <div style="margin: 3px; text-decoration: none;display:block;width: 150px; margin: 10px;height:150px; padding: 0; text-align: center;border:3px solid #4A3F29;border-radius:80px;-moz-border-radius:80px;-webkit-border-radius:80px; float: right;" class="IconHost">
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
                <div style="width: 90%; background-color: #DDB987; height: 20px;">
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
                            <div style="margin: 3px; text-decoration: none;display:block;width: 150px; margin: 10px;height:150px; padding: 0; text-align: center;border:3px solid #4A3F29;border-radius:80px;-moz-border-radius:80px;-webkit-border-radius:80px; float: right;" class="IconHost">
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
      <div class="sydna"></div>
<div class="clear" style="height:10px;"></div>
</asp:Content>
