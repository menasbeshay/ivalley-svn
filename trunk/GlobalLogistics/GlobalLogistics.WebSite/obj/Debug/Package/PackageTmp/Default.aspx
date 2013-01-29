<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ARMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GlobalLogistics.WebSite.Arabic.Default" %>
<%@ Register Src="Controls/Ads6.ascx" TagName="Ads6" TagPrefix="uc6" %>
<%@ Register src="Controls/Exchanges.ascx" tagname="Exchanges" tagprefix="uc10" %>
<%@ Register src="Controls/News.ascx" tagname="News" tagprefix="uc11" %>
<%@ Register src="Controls/Times.ascx" tagname="Times" tagprefix="uc12" %>
<%@ Register src="Controls/LatestOffers.ascx" tagname="LatestOffers" tagprefix="uc13" %>
<%@ Register src="Controls/LatestRequests.ascx" tagname="LatestRequests" tagprefix="uc14" %>
<%@ Register src="Controls/LogisticsConsulting.ascx" tagname="LogisticsConsulting" tagprefix="uc15" %>
<%@ Register src="Controls/TrainingCourses.ascx" tagname="TrainingCourses" tagprefix="uc16" %>
<%@ Register src="Controls/Sponsors.ascx" tagname="Sponsors" tagprefix="uc17" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc11:News ID="News1" runat="server" />
    <uc12:Times ID="Times1" runat="server" />
    <uc10:Exchanges ID="Exchanges1" runat="server" />
    <div class="ContentLeft2">
        <!-- Ads 6 -->
        <div class="ContentLeftAd160">
            <uc6:Ads6 ID="Ads61" runat="server" />
        </div>
        <div class="ContentLeftDivRight">
            <uc13:LatestOffers ID="LatestOffers1" runat="server" />
            <uc14:LatestRequests ID="LatestRequests1" runat="server" />            
            <div class="clear">
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="clear10">
    </div>
    <uc17:Sponsors ID="Sponsors1" runat="server" />
</asp:Content>
