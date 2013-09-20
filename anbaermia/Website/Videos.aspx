<%@ Page Title="" Language="C#" MasterPageFile="~/newTheme.Master" AutoEventWireup="true" CodeBehind="Videos.aspx.cs" Inherits="Website.Videos" %>
<%@ MasterType VirtualPath="~/newTheme.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/tabs.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript">
        $(document).ready(function () {
            $("a[rel^=PageVideos]").prettyPhoto({
                social_tools: false, description: false
                
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ContentLeftDiv" id="tabs">
        <h1>
            ملتيمديا - فيديو
        </h1>
        <div class="Details675">
            <asp:Panel ID="uiPanelCats" runat="server" Visible="false">
                <div align="center" style="direction: rtl;clear:both;">
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
                    <div style="width: 92%;padding-right:15%;">
                        <asp:DataList ID="uiDataListCats" runat="server" HorizontalAlign="Center" RepeatColumns="3"
                            RepeatDirection="Horizontal" RepeatLayout="Flow" Width="90%" >
                            <ItemTemplate>
                                <div style="margin: 3px; text-decoration: none;display:block;width: 150px; margin: 10px;height:150px; padding: 0; text-align: center;border:3px solid #4A3F29;border-radius:80px;-moz-border-radius:80px;-webkit-border-radius:80px; float: right;" class="IconHost">
                                    <a href='Videos.aspx?catid=<%# Eval("CategoryID") %>' title="" style="text-decoration: none;">
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
            <div class="clear5"></div>
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
                    <div style="width: 95%;padding-right:15%;">
                        <asp:DataList ID="uiDataListSub" runat="server" HorizontalAlign="Center" RepeatColumns="3"
                            RepeatDirection="Horizontal" RepeatLayout="Flow" Width="90%" >
                            <ItemTemplate>
                                <div style="margin: 3px; text-decoration: none;display:block;width: 150px; margin: 10px;height:150px; padding: 0; text-align: center;border:3px solid #4A3F29;border-radius:80px;-moz-border-radius:80px;-webkit-border-radius:80px; float: right;" class="IconHost">
                                    <a href='Videos.aspx?scatid=<%# Eval("SubCategoryID") %>' title="" style="text-decoration: none;">
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
        <asp:Panel ID="uiPanelVideos" runat="server" Visible="false">
        
            <div class="clear5"></div>
            <div align="center" style="direction: rtl; clear: both;">
                <div style="width: 90%;background-color:#DDB987;height:20px;">
                    <div style="width: 40%; float: left;">
                        <asp:LinkButton ID="uiLinkButtonPrev" runat="server" 
                            OnClick="uiLinkButtonPrev_Click" Font-Bold="True" Font-Size="Medium">السابق &gt;&gt;</asp:LinkButton>
                    </div>
                    <div style="width: 40%; float: right;">
                        <asp:LinkButton ID="uiLinkButtonNext" runat="server" 
                            OnClick="uiLinkButtonNext_Click" Font-Bold="True" Font-Size="Medium"> &lt;&lt; التالى</asp:LinkButton>
                    </div>
                </div>
                <div style="width: 95%;">
                <asp:DataList ID="uiDataListVideos" runat="server" HorizontalAlign="Center"
                    RepeatColumns="4" RepeatDirection="Horizontal" RepeatLayout="Flow" 
                    Width="100%" onitemdatabound="uiDataListVideos_ItemDataBound">
                    <ItemTemplate>
                        <div style="margin: 3px; text-decoration: none;display:block;width: 150px; margin: 10px;height:150px; padding: 0; text-align: center;border:3px solid #4A3F29;border-radius:80px;-moz-border-radius:80px;-webkit-border-radius:80px; float: right;" class="IconHost">
                            <a href='<%# Eval("URL") %>' rel="PageVideos" title="" style="text-decoration:none;">
                                <asp:Image ID="uiImageThumb" runat="server" width="150" />
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
