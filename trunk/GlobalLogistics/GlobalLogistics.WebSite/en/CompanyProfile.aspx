<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="CompanyProfile.aspx.cs" Inherits="GlobalLogistics.WebSite.CompanyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/purl.js" type="text/javascript"></script>
 <script type="text/javascript">
     $(document).ready(function () {
         // Tabs
         var tid = $.url().param('tid');
         if (tid == "undefined") {
             $('#CompanyTabs').tabs();
         }
         else {
             $('#CompanyTabs').tabs({ selected: tid });
         }
     });
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ContentLeftDiv">
        <h1 style="font-family:Tahoma, Verdana, Arial, sans-serif;text-transform:none;">
            <asp:Label ID="uiLabelPath" runat="server" ></asp:Label>&nbsp;<asp:Label 
                ID="uiLabelCompanyName" runat="server" ForeColor="#000099" ></asp:Label>
        </h1>
        <div class="Details675" style="padding-right:2px; padding-left: 2px;width:669px">
            <div id="CompanyTabs">
                <ul>
                    <li id="LIAbout" runat="server"><a href='<%= "#" + CompanyTabs_1.ClientID %>'>About</a></li>
                    <li id="LIBranch" runat="server"><a href='<%= "#" + CompanyTabs_2.ClientID %>'>Branches</a></li>
                    <li id="LIMap" runat="server"><a href='<%= "#" + CompanyTabs_3.ClientID %>'>Map</a></li>
                    <li id="LIServices" runat="server"><a href='<%= "#" + CompanyTabs_4.ClientID %>'>Services</a></li>
                    <li id="LIOffers" runat="server"><a href='<%= "#" + CompanyTabs_5.ClientID %>'>Offers</a></li>
                    <li id="LIRequests" runat="server"><a href='<%= "#" + CompanyTabs_6.ClientID %>'>Requests</a></li>
                    <li id="LIJobs" runat="server"><a href='<%= "#" + CompanyTabs_7.ClientID %>'>Jobs</a></li>
                    <li id="LIPic" runat="server"><a href='<%= "#" + CompanyTabs_8.ClientID %>'>Photos</a></li>
                    <li id="LIVideos" runat="server"><a href='<%= "#" + CompanyTabs_9.ClientID %>'>Videos</a></li>
                    <li id="LISchedule" runat="server"><a href='<%= "#" + CompanyTabs_10.ClientID %>'>Schedule</a></li>
                    <li id="LIContacts" runat="server"><a href='<%= "#" + CompanyTabs_11.ClientID %>'>Contacts</a></li>
                    <li id="LIWebsite" runat="server"><a href='<%= "#" + CompanyTabs_12.ClientID %>'>Website</a></li>
                </ul>
                <div id="CompanyTabs_1" runat="server">
                    <asp:Literal ID="uiLiteralAbout" runat="server"></asp:Literal>
                </div>
                <div id="CompanyTabs_2" runat="server">
                    <asp:Literal ID="uiLiteralBranches" runat="server"></asp:Literal>
                </div>
                <div id="CompanyTabs_3" runat="server">
                    <asp:Literal ID="uiLiteralMap" runat="server"></asp:Literal>
                </div>
                <div id="CompanyTabs_4" runat="server">
                    <asp:Repeater ID="uiRepeaterService" runat="server">
                        <HeaderTemplate>
                            <div class="serviceContent">
                        <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a href='Service.aspx?T=ser&sid=<%# Eval("ServiceID") %>'><%# Eval("EnName") %></a></li>
                        </ItemTemplate>
                        <FooterTemplate>
                        </ul>
                        </div>
                        </FooterTemplate>
                        </asp:Repeater>
                    <asp:Literal ID="uiLiteralServices" runat="server"></asp:Literal>
                </div>
                <div id="CompanyTabs_5" runat="server"> 
                <asp:Repeater ID="uiRepeaterOffers" runat="server">
                        <HeaderTemplate>
                            <div class="serviceContent">
                        <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a href='Service.aspx?T=off&sid=<%# Eval("ServiceID") %>'><%# Eval("EnName") %></a></li>
                        </ItemTemplate>
                        <FooterTemplate>
                        </ul>
                        </div>
                        </FooterTemplate>
                        </asp:Repeater>
                    <asp:Literal ID="uiLiteralOffers" runat="server"></asp:Literal>
                </div>
                <div id="CompanyTabs_6" runat="server">
                <asp:Repeater ID="uiRepeaterRequests" runat="server">
                        <HeaderTemplate>
                            <div class="serviceContent">
                        <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a href='Service.aspx?T=req&sid=<%# Eval("ServiceID") %>'><%# Eval("EnName") %></a></li>
                        </ItemTemplate>
                        <FooterTemplate>
                        </ul></div>
                        </FooterTemplate>
                        </asp:Repeater>
                    <asp:Literal ID="uiLiteralRequests" runat="server"></asp:Literal>
                </div>
                <div id="CompanyTabs_7" runat="server">
                <asp:Repeater ID="uiRepeaterJobs" runat="server">
                        <HeaderTemplate>
                            <div class="serviceContent">
                        <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a href='Service.aspx?T=job&sid=<%# Eval("ServiceID") %>'><%# Eval("EnName") %></a></li>
                        </ItemTemplate>
                        <FooterTemplate>
                        </ul></div>
                        </FooterTemplate>
                        </asp:Repeater>
                    <asp:Literal ID="uiLiteralJobs" runat="server"></asp:Literal>
                </div>
                <div id="CompanyTabs_8" runat="server">
                    <asp:DataList ID="uiDataListPhotos" runat="server" 
                        HorizontalAlign="Center" RepeatColumns="4" RepeatDirection="Horizontal"  >
                        <ItemTemplate>
                            <a href='<%# Eval("PhotoPath") %>' rel="lightbox[chiledranroom]"><img src='<%# Eval("PhotoPath") %>' alt="4" width="150" height="110"></a> 
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <div id="CompanyTabs_9" runat="server">
                    <asp:DataList ID="uiDataListVideos" runat="server" 
                        HorizontalAlign="Center" RepeatColumns="1" RepeatDirection="Horizontal"  >
                        <ItemTemplate>
                            <%# Eval("URL") %>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <div id="CompanyTabs_10" runat="server">
                    <asp:Literal ID="uiLiteralSchedule" runat="server"></asp:Literal>
                </div>
                <div id="CompanyTabs_11" runat="server">
                    <asp:Literal ID="uiLiteralContacts" runat="server"></asp:Literal>
                </div>
                <div id="CompanyTabs_12" runat="server">
                    <asp:HyperLink ID="uiHyperLinkWebsite" runat="server" Target="_blank"></asp:HyperLink>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
