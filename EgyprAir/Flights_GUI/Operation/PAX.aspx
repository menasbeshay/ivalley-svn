<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="PAX.aspx.cs" Inherits="Flights_GUI.Operation.PAX" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <asp:Panel ID="uiPanelViewAll" runat="server">
        <div class="ContentLeftDiv">
            <h4>
                PAX Flight List</h4>
            <div class="Details900">
                <div class="More" style="float: left;">
                    <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">Add new pax flight</asp:LinkButton>
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
                        &nbsp;<asp:Label ID="Label34" runat="server" CssClass="Label" Text="Report Date "></asp:Label>
                        &nbsp;
                        <asp:Label ID="Label35" runat="server" CssClass="Label" Text="From :"></asp:Label>
                        &nbsp;<asp:TextBox ID="uiTextBoxFromDate" runat="server" Width="100px"></asp:TextBox>
                        <asp:CalendarExtender ID="uiTextBoxFromDate_CalendarExtender" runat="server" Enabled="True"
                            TargetControlID="uiTextBoxFromDate" Format="dd/MM/yyyy">
                        </asp:CalendarExtender>
                        &nbsp;
                        <asp:Label ID="Label36" runat="server" CssClass="Label" Text="To :"></asp:Label>
                        &nbsp;<asp:TextBox ID="uiTextBoxToDate" runat="server" Width="100px"></asp:TextBox>
                        <asp:CalendarExtender ID="uiTextBoxToDate_CalendarExtender" runat="server" Enabled="True"
                            TargetControlID="uiTextBoxToDate" Format="dd/MM/yyyy">
                        </asp:CalendarExtender>
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
                <div class="AdminMiddle" style="width: 100%">
                    <asp:GridView ID="uiGridViewReports" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        EmptyDataText="No avaliable data." HorizontalAlign="Center" Width="90%" OnPageIndexChanging="uiGridViewReports_PageIndexChanging"
                        OnRowCommand="uiGridViewReports_RowCommand" Style="direction: ltr" PageSize="12">
                        <Columns>
                            <asp:BoundField DataField="FlightNo" HeaderText="Flight No." />
                            <asp:BoundField DataField="ReportDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Report Date" />
                            <asp:TemplateField HeaderText="Actions" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>                                
                                    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ReportID") %>'
                                        CommandName="EditReport"><img src="../images/edit.png" alt="Edit" title="Edit" style="border:0;float:none;" /></asp:LinkButton>
                                    &nbsp;
                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ReportID") %>'
                                        CommandName="DeleteReport" OnClientClick="return confirm('Are you want to delete this record?');"><img src="../images/delete.png" alt="Delete" title="Delete" style="border:0;float:none;" /></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Center" />
                        <PagerStyle HorizontalAlign="Center" />
                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:GridView>
                </div>
                <div class="clear5">
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="uiPanelEdit" runat="server">
        <div class="ContentLeftDiv">
            <h1>
                Edit Flight Details</h1>
            <div class="Details675">
                <asp:UpdateProgress ID="uiUpdateProgress" runat="server">
                    <ProgressTemplate>
                        <div style="width: 100%; height: 100%; top: 0px; left: 0px; position: fixed; display: block;
                            opacity: 0.7; background-color: #000; z-index: 10000; text-align: center;">
                            <div style="margin-top: 25%; background-color: White; width: 20%; margin-left: 50%;
                                text-align: center;">
                                <img src="../images/ajax-loader.gif" alt="Loading..." style="border: 0px; float: none;" />
                                <div class="clear">
                                </div>
                            </div>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <asp:UpdatePanel ID="uiUpdatePanel" runat="server">
                    <ContentTemplate>
                        <asp:TabContainer ID="uiTabContainerFlightDetails" runat="server" ActiveTabIndex="0"
                            Width="100%">
                            <asp:TabPanel runat="server" HeaderText="Basic Info" ID="uiTabPanelBasicInfo">
                                <ContentTemplate>
                                    <div class="AdminLeft" style="width: 25%;display:none;">
                                        <asp:Label ID="Label1" runat="server" Text="Aircraft Registration" CssClass="Label"></asp:Label></div>
                                    <div class="AdminMiddle" style="display:none;">
                                        <asp:DropDownList ID="uiDropDownListAirCraftRegistration" runat="server" 
                                            Width="155px">
                                        </asp:DropDownList>
                                        </div>
                                    <div class="AdminRight" style="display:none;">
                                    </div>
                                    <div class="clear">
                                    </div>
                                    <div class="AdminLeft" style="width: 25%">
                                        <asp:Label ID="Label2" runat="server" Text="Flight No." CssClass="Label"></asp:Label></div>
                                    <div class="AdminMiddle">
                                        <asp:TextBox ID="uiTextBoxFlightNo" runat="server"></asp:TextBox></div>
                                    <div class="AdminRight">
                                    </div>
                                    <div class="clear">
                                    </div>
                                    <div class="AdminLeft" style="width: 25%">
                                        <asp:Label ID="Label3" runat="server" Text="Date" CssClass="Label"></asp:Label></div>
                                    <div class="AdminMiddle">
                                        <asp:TextBox ID="uiTextBoxDate" runat="server"></asp:TextBox><asp:CalendarExtender
                                            ID="uiTextBoxDate_CalendarExtender" runat="server" Enabled="True" TargetControlID="uiTextBoxDate"
                                            Format="dd/MM/yyyy">
                                        </asp:CalendarExtender>
                                    </div>
                                    <div class="AdminRight">
                                    </div>
                                    <div class="clear">
                                    </div>
                                    <div class="AdminLeft" style="width: 25%;display:none;">
                                        <asp:Label ID="Label32" runat="server" Text="Is Heavy" CssClass="Label"></asp:Label></div>
                                    <div class="AdminMiddle" style="display:none;">
                                        <asp:CheckBox ID="uiCheckBoxIsHeavy" runat="server" /></div>
                                    <div class="AdminRight" style="display:none;">
                                    </div>
                                    
                                    <div class="AdminLeft" style="width: 25%">
                                        &nbsp;&nbsp;</div>
                                    <div class="AdminMiddle" style="width: 50%;">
                                        <div class="More" style="float: left;">
                                            <asp:LinkButton ID="uiButtonSaveMaster" runat="server" Text="Save and continue" OnClick="uiButtonSaveMaster_Click"></asp:LinkButton></div>
                                        &nbsp;<div class="More" style="float: left; width: 49%;">
                                            <asp:LinkButton ID="uiLinkButtonCancel" runat="server" Text="Cancel" OnClick="uiLinkButtonCancel_Click"></asp:LinkButton></div>
                                    </div>
                                    <div class="AdminRight">
                                    </div>
                                    <div class="clear">
                                    </div>
                                </ContentTemplate>
                            </asp:TabPanel>
                            <asp:TabPanel runat="server" HeaderText="Sectors" ID="uiTabPanelFlightInfo">
                                <ContentTemplate>
                                    <div class="AdminMiddle" style="width: 100%">
                                        <asp:GridView ID="uiGridViewSectors" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center"
                                            OnRowCommand="uiGridViewSectors_RowCommand" OnRowDataBound="uiGridViewSectors_RowDataBound"
                                            Width="80%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="From">
                                                    <ItemTemplate>
                                                        <asp:Label ID="uiLabelFrom" runat="server" Text="Label"></asp:Label></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="To">
                                                    <ItemTemplate>
                                                        <asp:Label ID="uiLabelTo" runat="server" Text="Label"></asp:Label></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Actions">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("SectorID") %>'
                                                            CommandName="EditSector"><img src="../images/edit.png" alt="Edit" title="Edit" style="border:0;float:none;" /></asp:LinkButton>&#160;&nbsp;<asp:LinkButton
                                                                ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("SectorID") %>'
                                                                CommandName="DeleteSector"><img src="../images/delete.png" alt="Delete" title="Delete" style="border:0;float:none;" /></asp:LinkButton></ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EditRowStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <RowStyle HorizontalAlign="Center" />
                                        </asp:GridView>
                                    </div>
                                    <div class="clear10">
                                    </div>
                                    <div class="AdminLeft" style="width: 25%">
                                        <asp:Label ID="Label4" runat="server" Text="Sectors" CssClass="Label"></asp:Label></div>
                                    <div class="AdminMiddle">
                                        <asp:Label ID="Label7" runat="server" Text="From " CssClass="Label"></asp:Label>&nbsp;
                                        <asp:DropDownList ID="uiDropDownListSectorFrom" runat="server" Width="150px">
                                        </asp:DropDownList>
                                        <asp:Label ID="Label8" runat="server" Text="To " CssClass="Label"></asp:Label>&nbsp;
                                        <asp:DropDownList ID="uiDropDownListSectorTo" runat="server" Width="150px">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="AdminRight">
                                    </div>
                                    <div class="clear">
                                    </div>
                                    
                                    
                                    <div class="AdminLeft" style="width: 25%">
                                        &nbsp;&nbsp;</div>
                                    <div class="AdminMiddle" style="width: 50%;">
                                        <div class="More" style="float: left;">
                                            <asp:LinkButton ID="uiLinkButtonSaveSector" runat="server" Text="Save" OnClick="uiLinkButtonSaveSector_Click" OnClientClick="return ValidateBlockTime();"></asp:LinkButton></div>
                                        &nbsp;<div class="More" style="float: left; width: 49%;">
                                            <asp:LinkButton ID="uiLinkButtonCancelSector" runat="server" Text="Cancel" OnClick="uiLinkButtonCancelSector_Click"></asp:LinkButton></div>
                                    </div>
                                    <div class="AdminRight">
                                    </div>
                                    <div class="clear">
                                    </div>
                                </ContentTemplate>
                            </asp:TabPanel>
                            <asp:TabPanel runat="server" HeaderText="Crew Info" ID="uiTabPanelCrewInfo">
                                <ContentTemplate>
                                    <div class="seprator">
                                        Pilots
                                    </div>
                                    <div class="clear">
                                    </div>
                                    <div class="AdminLeft" style="width: 25%">
                                        <asp:Label ID="Label26" runat="server" Text="Pilot" CssClass="Label"></asp:Label></div>
                                    <div class="AdminMiddle">
                                        <asp:DropDownList ID="uiDropDownListPilot" runat="server" Width="150px">
                                        </asp:DropDownList>
                                        &nbsp;
                                    </div>
                                    <div class="AdminRight">
                                        <asp:Label ID="uiLabelPilotFullName" runat="server"></asp:Label></div>
                                    <div class="clear">
                                    </div>
                                    <div class="AdminLeft" style="width: 25%">
                                        <asp:Label ID="Label27" runat="server" Text="Position" CssClass="Label"></asp:Label></div>
                                    <div class="AdminMiddle">
                                        <asp:DropDownList ID="uiDropDownListPilotPos" runat="server" Width="150px">
                                        </asp:DropDownList>
                                        &nbsp;
                                    </div>
                                    <div class="AdminRight">
                                    </div>
                                    <div class="clear">
                                    </div>
                                    <div class="AdminLeft" style="width: 25%">
                                        &nbsp;</div>
                                    <div class="AdminMiddle">
                                        <div class="More" style="float: left; height: 15px;">
                                            <asp:LinkButton ID="uiLinkButtonAddFlying" runat="server" OnClick="uiLinkButtonAddFlying_Click">Add new Pilot</asp:LinkButton></div>
                                    </div>
                                    <div class="AdminRight">
                                    </div>
                                    <div class="clear10">
                                    </div>
                                    <div class="AdminLeft" style="width: 25%;">
                                        <asp:Label ID="Label30" runat="server" CssClass="Label" Text="Co-Pilot"></asp:Label></div>
                                    <div class="AdminMiddle">
                                        <asp:DropDownList ID="uiDropDownListCoPilot" runat="server"
                                            Width="150px">
                                        </asp:DropDownList>
                                        &nbsp;
                                    </div>
                                    <div class="AdminRight">
                                        <asp:Label ID="uiLabelCoPilotFullName" runat="server"></asp:Label></div>
                                    <div class="clear">
                                    </div>
                                    <div class="AdminLeft" style="width: 25%">
                                        <asp:Label ID="Label31" runat="server" CssClass="Label" Text="Position"></asp:Label></div>
                                    <div class="AdminMiddle">
                                        <asp:DropDownList ID="uiDropDownListCOPos" runat="server" Width="150px">
                                        </asp:DropDownList>
                                        &nbsp;
                                    </div>
                                    <div class="AdminRight">
                                    </div>
                                    <div class="clear">
                                    </div>
                                    <div class="AdminLeft" style="width: 25%">
                                        &nbsp;</div>
                                    <div class="AdminMiddle">
                                        <div class="More" style="float: left; height: 15px;">
                                            <asp:LinkButton ID="uiLinkButtonAddCo" runat="server" OnClick="uiLinkButtonAddCo_Click">Add new Co-Pilot</asp:LinkButton></div>
                                    </div>
                                    <div class="AdminRight">
                                    </div>
                                    <div class="clear10">
                                    </div>
                                    <div class="AdminMiddle" style="text-align: center; width: 100%;">
                                        <asp:GridView ID="uiGridViewPiolts" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center"
                                            OnRowCommand="uiGridViewPiolts_RowCommand" OnRowDataBound="uiGridViewPiolts_RowDataBound"
                                            Width="80%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Staff No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="uiLabelStaffNo" runat="server"></asp:Label></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="uiLabelName" runat="server"></asp:Label></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Position">
                                                    <ItemTemplate>
                                                        <asp:Label ID="uiLabelPosition" runat="server"></asp:Label></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Is Pilot">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="uiCheckBoxIsPilot" runat="server" Enabled="false" /></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Actions">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ReportPilotID") %>'
                                                            CommandName="DeletePiolt"><img src="../images/delete.png" alt="Delete" title="Delete" style="border:0;float:none;" />
                                        
                                                        </asp:LinkButton></ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EditRowStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <RowStyle HorizontalAlign="Center" />
                                        </asp:GridView>
                                    </div>
                                    <div class="clear10">
                                    </div>
                                    <div class="seprator">
                                        Crew
                                    </div>
                                    <div class="clear">
                                    </div>
                                    <div class="AdminLeft" style="width: 25%">
                                        <asp:Label ID="Label28" runat="server" Text="Crew Member" CssClass="Label"></asp:Label></div>
                                    <div class="AdminMiddle">
                                        <asp:DropDownList ID="uiDropDownListCrew" runat="server" Width="150px">
                                        </asp:DropDownList>
                                        &nbsp;
                                    </div>
                                    <div class="AdminRight">
                                    </div>
                                    <div class="clear">
                                    </div>
                                    <div class="AdminLeft" style="width: 25%">
                                        <asp:Label ID="Label29" runat="server" CssClass="Label" Text="Position"></asp:Label></div>
                                    <div class="AdminMiddle">
                                        <asp:DropDownList ID="uiDropDownListCrewPos" runat="server" Width="150px">
                                        </asp:DropDownList>
                                        &nbsp;
                                    </div>
                                    <div class="AdminRight">
                                    </div>
                                    <div class="clear">
                                    </div>
                                    <div class="AdminLeft" style="width: 25%">
                                        &nbsp;</div>
                                    <div class="AdminMiddle">
                                        <div class="More" style="float: left; height: 15px;">
                                            <asp:LinkButton ID="uiLinkButtonAddCrew" runat="server" OnClick="uiLinkButtonAddCrew_Click">Add crew Member</asp:LinkButton></div>
                                    </div>
                                    <div class="AdminRight">
                                    </div>
                                    <div class="clear10">
                                    </div>
                                    <div class="AdminMiddle" style="text-align: center; width: 100%;">
                                        <asp:GridView ID="uiGridViewCrew" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center"
                                            OnRowCommand="uiGridViewCrew_RowCommand" OnRowDataBound="uiGridViewCrew_RowDataBound"
                                            Width="80%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Staff No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="uiLabelStaffNo" runat="server"></asp:Label></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="uiLabelName" runat="server"></asp:Label></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Position">
                                                    <ItemTemplate>
                                                        <asp:Label ID="uiLabelPosition" runat="server"></asp:Label></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Actions">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ReportCrewID") %>'
                                                            CommandName="DeleteCrew">
                                        <img src="../images/delete.png" alt="Delete" title="Delete" style="border:0;float:none;" />
                                                        </asp:LinkButton></ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EditRowStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <RowStyle HorizontalAlign="Center" />
                                        </asp:GridView>
                                    </div>
                                    <div class="clear">
                                    </div>
                                </ContentTemplate>
                            </asp:TabPanel>
                        </asp:TabContainer>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
