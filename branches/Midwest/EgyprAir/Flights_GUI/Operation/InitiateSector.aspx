<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/E_Admin.Master" AutoEventWireup="true" CodeBehind="InitiateSector.aspx.cs" Inherits="Flights_GUI.Operation.InitiatSector" %>

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

    
    <asp:Panel ID="uiPanelEdit" runat="server">
        <div class="ContentLeftDiv">
            <h4>
                Edit Sector Details</h4>
            <div class="Details900">
            <div class="whiteArea">
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
                        <div class="MoreBig" style="float: right; position: absolute; right: 180px; top: 80px;
                            height: 25px; z-index: 99999;">
                            <asp:LinkButton ID="uiLinkButtonBack" runat="server" OnClick="uiLinkButtonBack_Click">Back to sectors list</asp:LinkButton>
                        </div>
                        
                                    <div style="float: left; width: 98%" id="FlightForm">
                                        <div class="AdminLeft" style="width: 15%">
                                        </div>
                                        <div class="AdminMiddle" style="vertical-align: 50%; padding-top: 5px;">
                                        </div>
                                        <div class="AdminRight">
                                        </div>
                                        <div class="clear" style="height: 10px">
                                        </div>
                                        <div class="AdminLeft" style="width: 18%">
                                            <asp:Label ID="Label3" runat="server" Text="Date" CssClass="Label"></asp:Label></div>
                                        <div class="AdminMiddle">
                                            <asp:TextBox ID="uiTextBoxDate" runat="server" Style="margin-left: -1px;"></asp:TextBox><cc1:CalendarExtender
                                                ID="uiTextBoxDate_CalendarExtender" runat="server" Enabled="True" TargetControlID="uiTextBoxDate"
                                                Format="dd/MM/yyyy">
                                            </cc1:CalendarExtender>
                                        </div>
                                        <div class="AdminRight">
                                        </div>
                                        <div class="clear5">
                                        </div>
                                        <div class="AdminLeft" style="width: 18%">
                                            <asp:Label ID="Label1" runat="server" Text="Aircraft Registration" CssClass="Label"></asp:Label></div>
                                        <div class="AdminMiddle">
                                            <asp:DropDownList ID="uiDropDownListAirCraftRegistration" runat="server" Width="155px">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="AdminRight">
                                        </div>
                                        <div class="clear5">
                                        </div>
                                        <div class="AdminLeft" style="width: 18%">
                                            <asp:Label ID="Label37" runat="server" Text="Flight No." CssClass="Label"></asp:Label></div>
                                        <div class="AdminMiddle">
                                            <asp:TextBox ID="uiTextBoxSectorFlightNo" runat="server" Style="margin-left: -1px;"></asp:TextBox></div>
                                        <div class="AdminRight">
                                            &nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                ControlToValidate="uiTextBoxSectorFlightNo" Display="Dynamic" ErrorMessage="Required"
                                                ForeColor="Red" ValidationGroup="Flight">*</asp:RequiredFieldValidator>
                                            <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator1_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1">
                                            </cc1:ValidatorCalloutExtender>
                                        </div>
                                        <div class="clear" style="height: 5px">
                                        </div>
                                        <div class="AdminLeft" style="width: 18%">
                                            <asp:Label ID="Label32" runat="server" Text="Is Heavy" CssClass="Label"></asp:Label></div>
                                        <div class="AdminMiddle">
                                            <asp:CheckBox ID="uiCheckBoxIsHeavy" runat="server" Style="margin-left: -4px;" /></div>
                                        <div class="AdminRight">
                                        </div>
                                        <div class="clear5">
                                        </div>
                                        <div class="AdminLeft" style="width: 18%">
                                            <asp:Label ID="Label39" runat="server" CssClass="Label" Text="From "></asp:Label></div>
                                        <div class="AdminMiddle" style="vertical-align: 50%">
                                            <asp:DropDownList ID="uiDropDownListSectorFrom" runat="server" Width="100px">
                                            </asp:DropDownList>
                                            &nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                ControlToValidate="uiDropDownListSectorFrom" ErrorMessage="Please select airport"
                                                ForeColor="Red" InitialValue="0" ValidationGroup="Flight">*</asp:RequiredFieldValidator>
                                            <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator2_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2">
                                            </cc1:ValidatorCalloutExtender>
                                            &nbsp;
                                            <asp:Label ID="Label8" runat="server" Text="To " CssClass="Label"></asp:Label>&nbsp;&nbsp;<asp:DropDownList
                                                ID="uiDropDownListSectorTo" runat="server" Width="100px">
                                            </asp:DropDownList>
                                            &nbsp;
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="uiDropDownListSectorTo"
                                                ErrorMessage="Please select airport" ForeColor="Red" InitialValue="0" ValidationGroup="Flight">*</asp:RequiredFieldValidator>
                                            <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator3_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3">
                                            </cc1:ValidatorCalloutExtender>
                                        </div>
                                        <div class="clear5">
                                        </div>
                                        <div class="AdminLeft" style="width: 18%">
                                            <asp:Label ID="Label2" runat="server" CssClass="Label" Text="Client "></asp:Label></div>
                                        <div class="AdminMiddle" style="vertical-align: 50%">
                                            <asp:DropDownList ID="uiDropDownListClients" runat="server" Width="100px">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="clear10">
                                        </div>
                                        <div class="seprator">
                                            All Times in UTC
                                        </div>
                                        <div class="clear">
                                        </div>
                                        <div class="AdminLeft" style="width: 30%">
                                            <asp:Label ID="Label6" runat="server" Text="STD" CssClass="Label"></asp:Label>&nbsp;<asp:DropDownList
                                                ID="uiDropDownListSTDHours" runat="server">
                                            </asp:DropDownList>
                                            :
                                            <asp:DropDownList ID="uiDropDownListSTDMins" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        
                                        <div class="clear" style="height: 5px;">
                                        </div>
                                        <div class="AdminLeft" style="width: 30%">
                                            <asp:Label ID="Label11" runat="server" Text="STA" CssClass="Label"></asp:Label>&nbsp;<asp:DropDownList
                                                ID="uiDropDownListSTAHours" runat="server">
                                            </asp:DropDownList>
                                            :
                                            <asp:DropDownList ID="uiDropDownListSTAMins" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        
                                        <div class="clear" style="height: 5px;">
                                        </div>                                                                                                                      
                                        <div class="AdminLeft" style="width: 25%">
                                            &nbsp;&nbsp;</div>
                                        <div class="AdminMiddle" style="width: 50%;">
                                            <div class="More" style="float: left;">
                                                <asp:LinkButton ID="uiLinkButtonSaveSector" runat="server" Text="Save" OnClick="uiLinkButtonSaveSector_Click"
                                                    OnClientClick="return ValidateBlockTime();" ValidationGroup="Flight"></asp:LinkButton></div>
                                            &nbsp;<div class="More" style="float: left; width: 49%;">
                                                <asp:LinkButton ID="uiLinkButtonCancelSector" runat="server" Text="Cancel" OnClick="uiLinkButtonCancelSector_Click"></asp:LinkButton></div>
                                        </div>
                                        <div class="AdminRight">
                                        </div>
                                        <div class="clear">
                                        </div>
                                    </div>
                                    <div class="clear10">
                                    </div>
                                
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="uiLinkButtonCancelSector" />
                        <asp:PostBackTrigger ControlID="uiLinkButtonBack" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            </div>
        </div>
    </asp:Panel>

</asp:Content>
