<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/E_Admin.Master" AutoEventWireup="true" CodeBehind="AllPilotStatus.aspx.cs" Inherits="Flights_GUI.Operation.AllPilotStatus" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ContentLeftDiv">
        <h4>
          All  Pilot Status
        </h4>
        <div class="Details900">
            
            <div class="AdminLeft" style="width: 80px;">
                <asp:Label ID="Label2" runat="server" Text="From :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle" style="width: 430px; vertical-align: 50%;">
                <asp:TextBox ID="uiTextBoxFrom" runat="server" Width="150px"></asp:TextBox>
                <asp:CalendarExtender ID="uiTextBoxFrom_CalendarExtender" runat="server" Enabled="True"
                    TargetControlID="uiTextBoxFrom" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="uiTextBoxFrom"
                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="Schedule"></asp:RequiredFieldValidator>
                &nbsp;<asp:Label ID="Label3" runat="server" Text="To :" CssClass="Label"></asp:Label>
                &nbsp;<asp:TextBox ID="uiTextBoxTo" runat="server" Width="150px"></asp:TextBox>
                <asp:CalendarExtender ID="uiTextBoxTo_CalendarExtender" runat="server" Enabled="True"
                    TargetControlID="uiTextBoxTo" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="uiTextBoxTo"
                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="Schedule"></asp:RequiredFieldValidator>
            </div>
            <div class="AdminRight" style="width: 150px">
                <div class="More" style="float: left; margin-left: 5px; height: 15px;">
                    <asp:LinkButton ID="uiLinkButtonView" runat="server" Text="View Status" OnClick="uiLinkButtonView_Click"
                        ValidationGroup="Schedule"></asp:LinkButton></div>
            </div>
            <div class="clear10">
            </div>
            <div class="AdminLeft" style="height: 15px; padding-top: 5px; width: 25px;">
                &nbsp;
            </div>
            <div class="AdminMiddle" style="width: 400px;">
                &nbsp;
            </div>
            <div class="AdminRight" style="width: 150px">
                <div class="More" style="float: left; margin-left: 5px; height: 15px;">
                </div>
            </div>
            <div class="clear10">
            </div>
            <div class="AdminMiddle" style="width: 100%" id="PrintArea">
                
                <telerik:RadGrid ID="uiRadGridAllPilots" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellSpacing="0" GridLines="None" Skin="Office2007" 
                    onitemdatabound="uiRadGridAllPilots_ItemDataBound" 
                    onpageindexchanged="uiRadGridAllPilots_PageIndexChanged" 
                    onpagesizechanged="uiRadGridAllPilots_PageSizeChanged">
                    <MasterTableView>
                       
<CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
                       
                        <Columns>
                            <telerik:GridBoundColumn FilterControlAltText="Filter column column" HeaderText="Name"
                                UniqueName="column" DataField="ShortName">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" HeaderText="Current Month Total "
                                UniqueName="TemplateColumn">
                                <ItemTemplate>
                                    <asp:Label ID="uiLabelCurrentMonthTotal" runat="server" Text="Label"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn1 column"
                                HeaderText="Last Month Total" UniqueName="TemplateColumn1">
                                <ItemTemplate>
                                    <asp:Label ID="uiLabelLastMonthTotal" runat="server" Text="Label"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn2 column"
                                HeaderText="Selected Period Total" UniqueName="TemplateColumn2">
                                <ItemTemplate>
                                    <asp:Label ID="uiLabelSelectedPeriodTotal" runat="server" Text="Label"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn3 column"
                                HeaderText="Average Total for last 4 weeks" UniqueName="TemplateColumn3">
                                <ItemTemplate>
                                    <asp:Label ID="uiLabelAverageTotal" runat="server" Text="Label"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>                       

<EditFormSettings>
<EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
</EditFormSettings>
                        <ItemStyle HorizontalAlign="Center" />
                        <AlternatingItemStyle HorizontalAlign="Center" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </MasterTableView>                    

<FilterMenu EnableImageSprites="False"></FilterMenu>

<HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Office2007"></HeaderContextMenu>
                </telerik:RadGrid>
&nbsp;<div class="clear10">
                </div>
                <div class="clear10">
                </div>
                <div runat="server" id="guide">
                    <div style="border: 1px solid black; background-color: Green; float: left; width: 70px;
                        color: White; text-align: center;">
                        SU-MWE</div>
                    <div style="border: 1px solid black; background-color: Yellow; float: left; width: 70px;
                        color: Black; text-align: center;">
                        SU-MWF</div>
                </div>
                <div class="clear10">
                </div>
            </div>
            <input id="Button1" type="button" value="Print preview" onclick="printme()" />
            <div class="clear10">
            </div>
        </div>
    </div>
</asp:Content>
