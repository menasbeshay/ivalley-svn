<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/CabinCrew.Master" AutoEventWireup="true" CodeBehind="ManageCrewProfile.aspx.cs" Inherits="Flights_GUI.CabinCrew.ManageCrewProfile" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
    <asp:Panel ID="uiPanelViewAll" runat="server">
    <div class="ContentLeftDiv">
            <h4>
                Crew Profiles</h4>
            <div class="Details900">

            </div>
    </div>
    </asp:Panel>
    <asp:Panel ID="uiPanelEdit" runat="server">
    <div class="ContentLeftDiv">
            <h4>
                Edit Profile</h4>
            <div class="Details900">
            </div>
    </div>
    </asp:Panel>
</asp:Content>
