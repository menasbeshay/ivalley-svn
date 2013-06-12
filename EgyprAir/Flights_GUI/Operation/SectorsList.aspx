<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SectorsList.aspx.cs" Inherits="Flights_GUI.Operation.SectorsList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .RadGrid_Office2007 .rgRow td
    {
        border: solid 1px #A6ACB8;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="uiPanelViewAll" runat="server">
        <div class="ContentLeftDiv">
            <h4>
                Sectors List</h4>
            <div class="Details900">
                <div class="More" style="float: left;" runat="server" id="AddDiv">
                    <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">Add new sector</asp:LinkButton>
                </div>
                <div class="clear10">
                </div>
                <asp:Panel ID="uiPanelSearch" runat="server" DefaultButton="uiButtonSearch">
                    <div class="AdminMiddle">
                        <asp:Label ID="Label33" runat="server" Text="Flight No. : " CssClass="Label"></asp:Label>
                        &nbsp;
                        <asp:TextBox ID="uiTextBoxSearch" runat="server" Width="310px"></asp:TextBox>
                        <div class="clear5">
                        </div>
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
                    <div class="AdminRight" style="width: 80px">
                        <div>
                            &nbsp;</div>
                        <div class="clear">
                        </div>
                        &nbsp;
                        <asp:Button ID="uiButtonSearch" runat="server" Text="بحث" OnClick="uiButtonSearch_Click"
                            Width="60px" Style="display: none;" />
                        <div class="SearchBtn" style="width: 50px; height: 15px; margin-top: -5px; margin-left: 5px;">
                            <asp:LinkButton ID="uiLinkButtonSearch" runat="server" OnClick="uiButtonSearch_Click">Search</asp:LinkButton>
                        </div>
                    </div>
                    <div class="clear10">
                    </div>
                </asp:Panel>
                <div class="clear5">
                </div>
                <div class="AdminMiddle" style="width: 100%; padding-left: 5%;">
                    <telerik:radgrid id="uiRadGridFlights" runat="server" allowpaging="True" autogeneratecolumns="False"
                        cellspacing="0" horizontalalign="Center" skin="Office2007" width="90%" onitemdatabound="uiRadGridFlights_ItemDataBound"
                        onpageindexchanged="uiRadGridFlights_PageIndexChanged" onpagesizechanged="uiRadGridFlights_PageSizeChanged"
                        onitemcommand="uiRadGridFlights_ItemCommand">
                        <AlternatingItemStyle HorizontalAlign="Center" />
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn DataField="FlightNo" HeaderText="Flight No.">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SectorDate" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="STD" HeaderText="STD" DataFormatString="{0:HH:mm}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="STA" HeaderText="STA" DataFormatString="{0:HH:mm}">
                                </telerik:GridBoundColumn>
                                <telerik:GridCheckBoxColumn DataField="IsHeavy" HeaderText="Heavy">
                                </telerik:GridCheckBoxColumn>
                                <telerik:GridTemplateColumn HeaderText="Aircraft">
                                    <ItemTemplate>
                                        <asp:Label ID="uiLabelAirCraft" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonView" runat="server" CommandArgument='<%# Eval("SectorID") %>'
                                            CommandName="ViewReport"><img src="../images/bar_chart.png" alt="View Report" title="View Report" style="border:0;float:none;" /></asp:LinkButton>
                                        &nbsp;
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("SectorID") %>'
                                            CommandName="EditSectorDetails"><img src="../images/edit.png" alt="Edit Details" title="Edit Details" style="border:0;float:none;" /></asp:LinkButton>
                                        &nbsp;
                                        <asp:LinkButton ID="uiLinkButtonEditPilots" runat="server" CommandArgument='<%# Eval("SectorID") %>'
                                            Visible="false" CommandName="EditSectorPilots"><img src="../images/pilot.gif" alt="Edit Pilots" title="Edit Pilots" style="border:0;float:none;" /></asp:LinkButton>
                                        &nbsp;
                                        <asp:LinkButton ID="uiLinkButtonCrew" runat="server" CommandArgument='<%# Eval("SectorID") %>'
                                            Visible="false" CommandName="EditSectorCrew"><img src="../images/crew2.gif" alt="Edit Cabin Crew" title="Edit Cabin Crew" style="border:0;float:none;" /></asp:LinkButton>
                                        &nbsp;
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("SectorID") %>' Visible="false"
                                            CommandName="DeleteSector" OnClientClick="return confirm('Are you want to delete this record? ');"><img src="../images/delete.png" alt="Delete" title="Delete" style="border:0;float:none;" /></asp:LinkButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </telerik:radgrid>
                </div>
                <div class="clear5">
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
