<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/E_Admin.Master" AutoEventWireup="true" CodeBehind="sendNotifications.aspx.cs" Inherits="Flights_GUI.sendNotifications" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ MasterType VirtualPath="~/MasterPages/E_Admin.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="span12 clearfix"> 
        <asp:Panel runat="server" ID="uiPanelSuccess" Visible="false">
            <div class="alert alert-success">
                Mails sent successfully to pilots & crew.
            </div>
        </asp:Panel>
        <asp:Panel ID="uiPanelSearch" runat="server" DefaultButton="uiButtonSearch" CssClass="space12 clearfix">
                <div class="span7 clearfix">                    
                    &nbsp;<asp:Label ID="Label34" runat="server" CssClass="Label" Text="Date "></asp:Label>
                    <asp:Label ID="Label35" runat="server" CssClass="Label" Text="From :"></asp:Label>
                    &nbsp;<telerik:raddatepicker id="uiRadDatePickerFrom" runat="server" culture="en-US"
                        skin="Office2007">
                        <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                            Skin="Office2007">
                        </Calendar>
                        <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy">
                        </DateInput>
                        <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                    </telerik:raddatepicker>
                    &nbsp;
                    <asp:Label ID="Label36" runat="server" CssClass="Label" Text="To :"></asp:Label>
                    &nbsp;<telerik:raddatepicker id="uiRadDatePickerTo" runat="server" culture="en-US"
                        skin="Office2007">
                        <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                            Skin="Office2007">
                        </Calendar>
                        <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy">
                        </DateInput>
                        <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                    </telerik:raddatepicker>
                    </div>
                <div class="span5 clearfix">
                    <asp:Button ID="uiButtonSearch" runat="server" Text="Send Notifications" OnClick="uiButtonSend_Click" 
                        Width="60px" Style="display: none;" />
                    <div style=" height: 15px;  margin-left: 5px;">
                        <asp:LinkButton ID="uiLinkButtonSearch" runat="server" OnClick="uiButtonSend_Click" CssClass="btn btn-primary">Send notifications</asp:LinkButton>
                    </div>
                </div>                
            </asp:Panel>
        </div>
</asp:Content>
