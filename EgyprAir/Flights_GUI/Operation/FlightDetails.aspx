<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/E_Admin.Master" AutoEventWireup="true"
    CodeBehind="FlightDetails.aspx.cs" Inherits="Flights_GUI.Operation.FlightDetails"
    EnableEventValidation="false" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(function () {
            $("#mi2").addClass("selected");
        });

        function ValidateBlockTime() {
            OFFHours = parseInt($("#<%= uiDropDownListOFFHours.ClientID %>").val(), 10);
            OFFMins = parseInt($("#<%= uiDropDownListOFFMins.ClientID %>").val(), 10);

            ONHours = parseInt($("#<%= uiDropDownListOnHours.ClientID %>").val(), 10);
            ONMins = parseInt($("#<%= uiDropDownListOnMins.ClientID %>").val(), 10);

            DayHours = parseInt($("#<%= uiDropDownListDayHours.ClientID %>").val(), 10);
            DayMins = parseInt($("#<%= uiDropDownListDayMins.ClientID %>").val(), 10);

            NightHours = parseInt($("#<%= uiDropDownListNightHours.ClientID %>").val(), 10);
            NightMins = parseInt($("#<%= uiDropDownListNightMins.ClientID %>").val(), 10);

            totalDayNightHours = DayHours + NightHours + Math.floor((DayMins + NightMins) / 60);
            totalDayNightMins = (((DayMins + NightMins) % 60));

            var NewDate = new Date(1900, 0, 1, OFFHours, OFFMins, 0, 0);
            NewDate.setHours(NewDate.getHours() + totalDayNightHours);
            NewDate.setMinutes(NewDate.getMinutes() + totalDayNightMins);

            if (NewDate.getHours() == ONHours & NewDate.getMinutes() == ONMins) {
                return true;
            }
            else {
                alert('Error : Day Time + Night Time must equal to Chox Off Time - Chox On Time. ' /*+ NewDate.getHours() + ' : ' + NewDate.getMinutes() + ' - ' + totalDayNightHours + ' : ' + totalDayNightMins + '-**-'+  ONHours + ' : ' + ONMins*/);
                return false;
            }

        }        

    </script>

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
                Flight List</h4>
            <div class="Details900">
                <div class="More" style="float: left;">
                    <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">Add new flight</asp:LinkButton>
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
                        &nbsp;<telerik:RadDatePicker ID="uiRadDatePickerFrom" runat="server" Culture="en-US" Skin="Office2007">
                                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                                        Skin="Office2007">
                                    </Calendar>
                                    <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy">
                                    </DateInput>
                                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                </telerik:RadDatePicker>   
                        &nbsp;
                        <asp:Label ID="Label36" runat="server" CssClass="Label" Text="To :"></asp:Label>
                        &nbsp;<telerik:RadDatePicker ID="uiRadDatePickerTo" runat="server" Culture="en-US" Skin="Office2007">
                                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                                        Skin="Office2007">
                                    </Calendar>
                                    <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy">
                                    </DateInput>
                                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                </telerik:RadDatePicker>   
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

                <div class="clear5"></div>
                <div class="AdminMiddle" style="width: 100%;padding-left:5%;">
                    <telerik:RadGrid ID="uiRadGridFlights" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" CellSpacing="0" 
                        HorizontalAlign="Center" Skin="Office2007" Width="90%" 
                        onitemdatabound="uiRadGridFlights_ItemDataBound" 
                        onpageindexchanged="uiRadGridFlights_PageIndexChanged" 
                        onpagesizechanged="uiRadGridFlights_PageSizeChanged" 
                        onitemcommand="uiRadGridFlights_ItemCommand">
                        <AlternatingItemStyle HorizontalAlign="Center" />
                        <MasterTableView>
                            
                        <Columns>
                        <telerik:GridBoundColumn DataField="FlightNo" HeaderText="Flight No."></telerik:GridBoundColumn>                            
                        <telerik:GridBoundColumn DataField="SectorDate" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="STD" HeaderText="STD" DataFormatString="{0:HH:mm}"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="STA" HeaderText="STA" DataFormatString="{0:HH:mm}"></telerik:GridBoundColumn>
                        <telerik:GridCheckBoxColumn DataField="IsHeavy" HeaderText="Heavy"></telerik:GridCheckBoxColumn>
                        <telerik:GridTemplateColumn HeaderText="Aircraft">
                        <ItemTemplate>
                            <asp:Label ID="uiLabelAirCraft" runat="server" ></asp:Label>
                        </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Actions">
                                <ItemTemplate>
                                <asp:LinkButton ID="uiLinkButtonView" runat="server" CommandArgument='<%# Eval("SectorID") %>'
                                    CommandName="ViewReport"><img src="../images/bar_chart.png" alt="View Report" title="View Report" style="border:0;float:none;" /></asp:LinkButton>
                                    &nbsp;
                                    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("SectorID") %>'
                                        CommandName="EditSector"><img src="../images/edit.png" alt="Edit" title="Edit" style="border:0;float:none;" /></asp:LinkButton>
                                    &nbsp;
                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("SectorID") %>'
                                        CommandName="DeleteSector" OnClientClick="return confirm('Are you want to delete this record? ');"><img src="../images/delete.png" alt="Delete" title="Delete" style="border:0;float:none;" /></asp:LinkButton>

                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>                            
                        </MasterTableView>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                       
                    </telerik:RadGrid>
                </div>
                <div class="clear5">
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="uiPanelEdit" runat="server">
        <div class="ContentLeftDiv">
            <h4>
                Edit Flight Details</h4>
            <div class="Details900">
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
                        <div class="MoreBig" style="float: right;position:absolute;right:180px;top:80px;height:25px;z-index:99999;">
                            <asp:LinkButton ID="uiLinkButtonBack" runat="server" 
                                OnClick="uiLinkButtonBack_Click">Back to flight list</asp:LinkButton>
                        </div>                        
                        <cc1:TabContainer ID="uiTabContainerFlightDetails" runat="server" ActiveTabIndex="0"
                            Width="100%" >                                                        
                            <cc1:TabPanel runat="server" HeaderText="Sectors" ID="uiTabPanelFlightInfo">
                                <ContentTemplate>
                                    
                                    
                                    <div style="float:left;width:98%" id="FlightForm">
                                    <div class="AdminLeft" style="width: 15%">
                                            </div>
                                        <div class="AdminMiddle" style="vertical-align: 50%;padding-top:5px;">
                                        </div>
                                        <div class="AdminRight">
                                        </div>
                                        <div class="clear" style="height: 10px">
                                        </div>
                                         <div class="AdminLeft" style="width: 18%">
                                            <asp:Label ID="Label3" runat="server" Text="Date" CssClass="Label"></asp:Label></div>
                                        <div class="AdminMiddle">
                                            <asp:TextBox ID="uiTextBoxDate" runat="server" style="margin-left:-1px;"></asp:TextBox><cc1:CalendarExtender
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
                                            <asp:TextBox ID="uiTextBoxSectorFlightNo" runat="server" style="margin-left:-1px;"></asp:TextBox></div>
                                        <div class="AdminRight">
                                            &nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                ControlToValidate="uiTextBoxSectorFlightNo" Display="Dynamic" 
                                                ErrorMessage="Required" ForeColor="Red" ValidationGroup="Flight">*</asp:RequiredFieldValidator>
                                            <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator1_ValidatorCalloutExtender" 
                                                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1">
                                            </cc1:ValidatorCalloutExtender>
                                        </div>
                                        <div class="clear" style="height: 5px">
                                        </div>
                                        
                                       
                                        <div class="AdminLeft" style="width: 18%">
                                            <asp:Label ID="Label32" runat="server" Text="Is Heavy" CssClass="Label"></asp:Label></div>
                                        <div class="AdminMiddle">
                                            <asp:CheckBox ID="uiCheckBoxIsHeavy" runat="server" style="margin-left:-4px;"/></div>
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
                                                ControlToValidate="uiDropDownListSectorFrom" 
                                                ErrorMessage="Please select airport" ForeColor="Red" InitialValue="0" 
                                                ValidationGroup="Flight">*</asp:RequiredFieldValidator>
                                            <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator2_ValidatorCalloutExtender" 
                                                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2">
                                            </cc1:ValidatorCalloutExtender>
&nbsp; <asp:Label ID="Label8" runat="server" Text="To " CssClass="Label"></asp:Label>&nbsp;&nbsp;<asp:DropDownList
                                                ID="uiDropDownListSectorTo" runat="server" Width="100px">
                                            </asp:DropDownList>
                                            &nbsp;
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                ControlToValidate="uiDropDownListSectorTo" ErrorMessage="Please select airport" 
                                                ForeColor="Red" InitialValue="0" ValidationGroup="Flight">*</asp:RequiredFieldValidator>
                                            <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator3_ValidatorCalloutExtender" 
                                                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3">
                                            </cc1:ValidatorCalloutExtender>
                                        </div>
                                        <div class="clear" style="height: 5px">
                                        </div>
                                        <div class="AdminLeft" style="width: 18%">
                                            <asp:Label ID="Label5" runat="server" Text="Fuel Uplifted" CssClass="Label"></asp:Label></div>
                                        <div class="AdminMiddle">
                                            <asp:TextBox ID="uiTextBoxFule" runat="server" style="margin-left:-1px;"></asp:TextBox></div>
                                        <div class="AdminRight">
                                            &nbsp;&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                                                runat="server" ControlToValidate="uiTextBoxFule" Display="Dynamic" 
                                                ErrorMessage="Numbers only." ForeColor="Red" 
                                                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                                            <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator1_ValidatorCalloutExtender" 
                                                runat="server" Enabled="True" TargetControlID="RegularExpressionValidator1">
                                            </cc1:ValidatorCalloutExtender>
                                        </div>
                                        <div class="clear">
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
                                        <div class="AdminMiddle" style="width: 30%">
                                            <asp:Label ID="Label10" runat="server" Text="Chox Off" CssClass="Label"></asp:Label>&nbsp;<asp:DropDownList
                                                ID="uiDropDownListOFFHours" runat="server">
                                            </asp:DropDownList>
                                            :
                                            <asp:DropDownList ID="uiDropDownListOFFMins" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="AdminRight" style="width: 30%">
                                            <asp:Label ID="Label9" runat="server" Text="A/B" CssClass="Label"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:DropDownList ID="uiDropDownListATDHours" runat="server">
                                            </asp:DropDownList>
                                            :
                                            <asp:DropDownList ID="uiDropDownListATDMins" runat="server">
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
                                        <div class="AdminMiddle" style="width: 30%">
                                            <asp:Label ID="Label12" runat="server" Text="T/Down" CssClass="Label" style="padding-right:3px;"></asp:Label>&nbsp;<asp:DropDownList
                                                ID="uiDropDownListATAHours" runat="server">
                                            </asp:DropDownList>
                                            :
                                            <asp:DropDownList ID="uiDropDownListATAMins" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="AdminRight" style="width: 30%">
                                            <asp:Label ID="Label13" runat="server" Text="Chox On" CssClass="Label" Style="margin-right: 2px;"></asp:Label>&nbsp;<asp:DropDownList
                                                ID="uiDropDownListOnHours" runat="server">
                                            </asp:DropDownList>
                                            :
                                            <asp:DropDownList ID="uiDropDownListOnMins" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="clear" style="height: 5px;">
                                        </div>
                                        <div class="AdminLeft" style="width: 30%;">
                                            <asp:Label ID="Label20" runat="server" Text="Day" CssClass="Label"></asp:Label>&nbsp;<asp:DropDownList
                                                ID="uiDropDownListDayHours" runat="server">
                                            </asp:DropDownList>
                                            :
                                            <asp:DropDownList ID="uiDropDownListDayMins" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="AdminMiddle" style="width: 30%; margin-left: 5px;">
                                            <asp:Label ID="Label38" runat="server" Text="Night" CssClass="Label"></asp:Label>&nbsp;&nbsp;&nbsp;
                                            <asp:DropDownList ID="uiDropDownListNightHours" runat="server">
                                            </asp:DropDownList>
                                            :
                                            <asp:DropDownList ID="uiDropDownListNightMins" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="AdminRight" style="width: 20%; margin-left: 5px;">
                                        </div>
                                        <div class="clear" style="height: 5px;">
                                        </div>
                                        <div class="seprator">
                                            General Info
                                        </div>
                                        <div class="clear">
                                        </div>
                                        <div class="AdminLeft" style="width: 20%; padding-right: 0px;">
                                            <asp:Label ID="Label14" runat="server" Text="Flight Plane Burn Off" CssClass="Label"></asp:Label></div>
                                        <div class="AdminMiddle">
                                            <asp:TextBox ID="uiTextBoxPlanBurnOff" runat="server" Width="100px" CssClass="digits"></asp:TextBox></div>
                                        <div class="AdminRight" style="width: 40px">
                                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                                                runat="server" ControlToValidate="uiTextBoxPlanBurnOff" Display="Dynamic" 
                                                ErrorMessage="Numbers only." ForeColor="Red" 
                                                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                                            <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator2_ValidatorCalloutExtender" 
                                                runat="server" Enabled="True" TargetControlID="RegularExpressionValidator2">
                                            </cc1:ValidatorCalloutExtender>
                                        </div>
                                        <div class="AdminLeft" style="width: 14%; padding-right: 0px;">
                                            <asp:Label ID="Label15" runat="server" Text="Actual Burn Off" CssClass="Label"></asp:Label></div>
                                        <div class="AdminMiddle">
                                            <asp:TextBox ID="uiTextBoxActualBurn" runat="server" Width="100px" CssClass="digits"></asp:TextBox></div>
                                        <div class="AdminRight" style="width: 40px">
                                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator5" 
                                                runat="server" ControlToValidate="uiTextBoxActualBurn" Display="Dynamic" 
                                                ErrorMessage="Numbers only." ForeColor="Red" 
                                                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                                            <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator5_ValidatorCalloutExtender" 
                                                runat="server" Enabled="True" TargetControlID="RegularExpressionValidator5">
                                            </cc1:ValidatorCalloutExtender>
                                        </div>
                                        <div class="clear" style="height: 5px">
                                        </div>
                                        <div class="AdminLeft" style="width: 20%; padding-right: 0px;">
                                            <asp:Label ID="Label21" runat="server" Text="Dep. Fuel" CssClass="Label"></asp:Label></div>
                                        <div class="AdminMiddle">
                                            <asp:TextBox ID="uiTextBoxDepFuel" runat="server" Width="100px" CssClass="digits"></asp:TextBox></div>
                                        <div class="AdminRight" style="width: 40px">
                                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" 
                                                runat="server" ControlToValidate="uiTextBoxDepFuel" Display="Dynamic" 
                                                ErrorMessage="Numbers only." ForeColor="Red" 
                                                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                                            <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator3_ValidatorCalloutExtender" 
                                                runat="server" Enabled="True" TargetControlID="RegularExpressionValidator3">
                                            </cc1:ValidatorCalloutExtender>
                                        </div>
                                        <div class="AdminLeft" style="width: 14%; padding-right: 0px;">
                                            <asp:Label ID="Label22" runat="server" Text="Arr. Fuel" CssClass="Label"></asp:Label></div>
                                        <div class="AdminMiddle">
                                            <asp:TextBox ID="uiTextBoxArrFuel" runat="server" Width="100px" CssClass="digits"></asp:TextBox></div>
                                        <div class="AdminRight" style="width: 40px">
                                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator6" 
                                                runat="server" ControlToValidate="uiTextBoxArrFuel" Display="Dynamic" 
                                                ErrorMessage="Numbers only." ForeColor="Red" 
                                                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                                            <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator6_ValidatorCalloutExtender" 
                                                runat="server" Enabled="True" TargetControlID="RegularExpressionValidator6">
                                            </cc1:ValidatorCalloutExtender>
                                        </div>
                                        <div class="clear" style="height: 5px">
                                        </div>
                                        <div class="AdminLeft" style="width: 20%; padding-right: 0px;">
                                            <asp:Label ID="Label24" runat="server" Text="ZFW" CssClass="Label"></asp:Label></div>
                                        <div class="AdminMiddle">
                                            <asp:TextBox ID="uiTextBoxZFW" runat="server" Width="100px" CssClass="digits"></asp:TextBox></div>
                                        <div class="AdminRight" style="width: 40px">
                                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" 
                                                runat="server" ControlToValidate="uiTextBoxZFW" Display="Dynamic" 
                                                ErrorMessage="Numbers only." ForeColor="Red" 
                                                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                                            <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator4_ValidatorCalloutExtender" 
                                                runat="server" Enabled="True" TargetControlID="RegularExpressionValidator4">
                                            </cc1:ValidatorCalloutExtender>
                                        </div>
                                        <div class="AdminLeft" style="width: 14%; padding-right: 0px;">
                                            <asp:Label ID="Label25" runat="server" Text="TOW" CssClass="Label"></asp:Label></div>
                                        <div class="AdminMiddle">
                                            <asp:TextBox ID="uiTextBoxTOW" runat="server" Width="100px" CssClass="digits"></asp:TextBox></div>
                                        <div class="AdminRight" style="width: 40px">
                                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator7" 
                                                runat="server" ControlToValidate="uiTextBoxTOW" Display="Dynamic" 
                                                ErrorMessage="Numbers only." ForeColor="Red" 
                                                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                                            <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator7_ValidatorCalloutExtender" 
                                                runat="server" Enabled="True" TargetControlID="RegularExpressionValidator7">
                                            </cc1:ValidatorCalloutExtender>
                                        </div>
                                        <div class="clear10">
                                        </div>
                                        <div class="AdminLeft" style="width: 24%; border-right: 1px solid black;">
                                            <asp:Label ID="Label23" runat="server" Text="No. of PAX" CssClass="Label" Style="margin-right: 30px;"></asp:Label>A
                                            :
                                            <asp:TextBox ID="uiTextBoxNoOFPax_A" runat="server" Width="50px" CssClass="digits"></asp:TextBox>
                                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator8" 
                                                runat="server" ControlToValidate="uiTextBoxNoOFPax_A" Display="Dynamic" 
                                                ErrorMessage="Numbers only." ForeColor="Red" 
                                                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                                            <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator8_ValidatorCalloutExtender" 
                                                runat="server" Enabled="True" TargetControlID="RegularExpressionValidator8">
                                            </cc1:ValidatorCalloutExtender>
                                        </div>
                                        <div class="AdminMiddle" 
                                            style="width: 15%; border-right: 1px solid black; margin-left: 5px;">
                                            CH :
                                            <asp:TextBox ID="uiTextBoxNoOFPax_CH" runat="server" Width="50px" CssClass="digits"></asp:TextBox>
                                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator9" 
                                                runat="server" ControlToValidate="uiTextBoxNoOFPax_CH" Display="Dynamic" 
                                                ErrorMessage="Numbers only." ForeColor="Red" 
                                                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                                            <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator9_ValidatorCalloutExtender" 
                                                runat="server" Enabled="True" TargetControlID="RegularExpressionValidator9">
                                            </cc1:ValidatorCalloutExtender>
                                        </div>
                                        <div class="AdminRight" style="width: 20%; margin-left: 5px;">
                                            I :
                                            <asp:TextBox ID="uiTextBoxNoOFPax_I" runat="server" Width="50px" CssClass="digits"></asp:TextBox>
                                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator10" 
                                                runat="server" ControlToValidate="uiTextBoxNoOFPax_I" Display="Dynamic" 
                                                ErrorMessage="Numbers only." ForeColor="Red" 
                                                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                                            <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator10_ValidatorCalloutExtender" 
                                                runat="server" Enabled="True" TargetControlID="RegularExpressionValidator10">
                                            </cc1:ValidatorCalloutExtender>
                                        </div>
                                        <div class="clear10">
                                        </div>
                                        <cc1:Accordion ID="DelayAccordion" runat="server" ContentCssClass="AccordionContent"
                                            FramesPerSecond="30" HeaderCssClass="accordionHeader" HeaderSelectedCssClass="accordionHeaderSelected"
                                            TransitionDuration="250">
                                            <Panes>
                                                <cc1:AccordionPane ID="AccordionPaneDep" runat="server" ContentCssClass="" HeaderCssClass="">
                                                    <Header>
                                                        <div>
                                                            Dep. Delays
                                                        </div>
                                                    </Header>
                                                    <Content>
                                                        <div class="AdminLeft" style="width: 36%; border-right: 1px solid black;">
                                                            <div style="padding-left: 108px;">
                                                                Delay 1</div>
                                                        </div>
                                                        <div class="AdminMiddle" style="width: 20%; border-right: 1px solid black; margin-left: 5px;">
                                                            Delay 2
                                                        </div>
                                                        <div class="AdminRight" style="width: 20%; margin-left: 5px;">
                                                            Delay 3
                                                        </div>
                                                        <div class="clear10">
                                                        </div>
                                                        <div class="AdminLeft" style="width: 36%; border-right: 1px solid black;">
                                                            <asp:Label ID="Label16" runat="server" Text="Code" CssClass="Label" Style="margin-right: 70px;"></asp:Label><asp:DropDownList
                                                                ID="uiDropDownListDelay1Code" runat="server" Width="103px">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="AdminMiddle" style="width: 20%; border-right: 1px solid black; margin-left: 5px;">
                                                            <asp:DropDownList ID="uiDropDownListDelay2Code" runat="server" Width="103px">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="AdminRight" style="width: 20%; margin-left: 5px;">
                                                            <asp:DropDownList ID="uiDropDownListDelay3Code" runat="server" Width="103px">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="clear10">
                                                        </div>
                                                        <div class="AdminLeft" style="width: 36%; border-right: 1px solid black;">
                                                            <asp:Label ID="Label17" runat="server" Text="Time" CssClass="Label" Style="margin-right: 70px;"></asp:Label><asp:DropDownList
                                                                ID="uiDropDownListDelay1Hours" runat="server">
                                                            </asp:DropDownList>
                                                            :
                                                            <asp:DropDownList ID="uiDropDownListDelay1Mins" runat="server">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="AdminMiddle" style="width: 20%; border-right: 1px solid black; margin-left: 5px;">
                                                            <asp:DropDownList ID="uiDropDownListDelay2Hours" runat="server">
                                                            </asp:DropDownList>
                                                            :
                                                            <asp:DropDownList ID="uiDropDownListDelay2Mins" runat="server">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="AdminRight" style="width: 20%; margin-left: 5px;">
                                                            <asp:DropDownList ID="uiDropDownListDelay3Hours" runat="server">
                                                            </asp:DropDownList>
                                                            :
                                                            <asp:DropDownList ID="uiDropDownListDelay3Mins" runat="server">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="clear10">
                                                        </div>
                                                    </Content>
                                                </cc1:AccordionPane>
                                                <cc1:AccordionPane ID="AccordionPaneArr" runat="server" ContentCssClass="" HeaderCssClass="">
                                                    <Header>
                                                        <div>
                                                            Arr. Delays
                                                        </div>
                                                    </Header>
                                                    <Content>
                                                        <div class="AdminLeft" style="width: 36%; border-right: 1px solid black;">
                                                            <div style="padding-left: 108px;">
                                                                Delay 1</div>
                                                        </div>
                                                        <div class="AdminMiddle" style="width: 20%; border-right: 1px solid black; margin-left: 5px;">
                                                            Delay 2
                                                        </div>
                                                        <div class="AdminRight" style="width: 20%; margin-left: 5px;">
                                                            Delay 3
                                                        </div>
                                                        <div class="clear10">
                                                        </div>
                                                        <div class="AdminLeft" style="width: 36%; border-right: 1px solid black;">
                                                            <asp:Label ID="Label18" runat="server" Text="Code" CssClass="Label" Style="margin-right: 70px;"></asp:Label><asp:DropDownList
                                                                ID="uiDropDownListArrDelay1Code" runat="server" Width="103px">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="AdminMiddle" style="width: 20%; border-right: 1px solid black; margin-left: 5px;">
                                                            <asp:DropDownList ID="uiDropDownListArrDelay2Code" runat="server" Width="103px">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="AdminRight" style="width: 20%; margin-left: 5px;">
                                                            <asp:DropDownList ID="uiDropDownListArrDelay3Code" runat="server" Width="103px">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="clear10">
                                                        </div>
                                                        <div class="AdminLeft" style="width: 36%; border-right: 1px solid black;">
                                                            <asp:Label ID="Label19" runat="server" Text="Time" CssClass="Label" Style="margin-right: 70px;"></asp:Label><asp:DropDownList
                                                                ID="uiDropDownListArrDelay1Hours" runat="server">
                                                            </asp:DropDownList>
                                                            :
                                                            <asp:DropDownList ID="uiDropDownListArrDelay1Mins" runat="server">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="AdminMiddle" style="width: 20%; border-right: 1px solid black; margin-left: 5px;">
                                                            <asp:DropDownList ID="uiDropDownListArrDelay2Hours" runat="server">
                                                            </asp:DropDownList>
                                                            :
                                                            <asp:DropDownList ID="uiDropDownListArrDelay2Mins" runat="server">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="AdminRight" style="width: 20%; margin-left: 5px;">
                                                            <asp:DropDownList ID="uiDropDownListArrDelay3Hours" runat="server">
                                                            </asp:DropDownList>
                                                            :
                                                            <asp:DropDownList ID="uiDropDownListArrDelay3Mins" runat="server">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="clear10">
                                                        </div>
                                                    </Content>
                                                </cc1:AccordionPane>
                                            </Panes>
                                        </cc1:Accordion>
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
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" HeaderText="Crew Info" ID="uiTabPanelCrewInfo">
                                <ContentTemplate>
                                <div style="height:25px;clear:both;"></div>
                                    <div class="seprator">
                                        Pilots
                                    </div>
                                    <div class="clear">
                                    </div>

                                    <div style="float:left;padding:15px;width:40%;">
                                    <div class="AdminLeft" style="width: 25%">
                                        <asp:Label ID="Label26" runat="server" Text="Pilot" CssClass="Label"></asp:Label></div>
                                    <div class="AdminMiddle">
                                        <asp:DropDownList ID="uiDropDownListPilot" runat="server" Width="150px">
                                        </asp:DropDownList>
                                        &nbsp;&nbsp;</div>
                                    <div class="AdminRight">
                                        <asp:Label ID="uiLabelPilotFullName" runat="server"></asp:Label></div>
                                    <div class="clear" style="height:5px;">
                                    </div>
                                    <div class="AdminLeft" style="width: 25%">
                                        <asp:Label ID="Label27" runat="server" Text="Position" CssClass="Label"></asp:Label></div>
                                    <div class="AdminMiddle">
                                        <asp:DropDownList ID="uiDropDownListPilotPos" runat="server" Width="150px">
                                        </asp:DropDownList>
                                        &nbsp;&nbsp;</div>
                                    <div class="AdminRight">
                                    </div>
                                    <div class="clear" style="height:5px;">
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
                                    </div>
                                    <div style="float:left;padding:15px;width:40%;">
                                    <div class="AdminLeft" style="width: 25%;">
                                        <asp:Label ID="Label30" runat="server" CssClass="Label" Text="Co-Pilot"></asp:Label></div>
                                    <div class="AdminMiddle">
                                        <asp:DropDownList ID="uiDropDownListCoPilot" runat="server" Width="150px">
                                        </asp:DropDownList>
                                        &nbsp;&nbsp;</div>
                                    <div class="AdminRight">
                                        <asp:Label ID="uiLabelCoPilotFullName" runat="server"></asp:Label></div>
                                    <div class="clear" style="height:5px;">
                                    </div>
                                    <div class="AdminLeft" style="width: 25%">
                                        <asp:Label ID="Label31" runat="server" CssClass="Label" Text="Position"></asp:Label></div>
                                    <div class="AdminMiddle">
                                        <asp:DropDownList ID="uiDropDownListCOPos" runat="server" Width="150px">
                                        </asp:DropDownList>
                                        &nbsp;&nbsp;</div>
                                    <div class="AdminRight">
                                    </div>
                                   <div class="clear" style="height:5px;">
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
                                    <div style="float:left;padding:15px;width:40%;">
                                    <div class="AdminLeft" style="width: 25%">
                                        <asp:Label ID="Label28" runat="server" Text="Crew Member" CssClass="Label"></asp:Label></div>
                                    <div class="AdminMiddle">
                                        <asp:DropDownList ID="uiDropDownListCrew" runat="server" Width="150px">
                                        </asp:DropDownList>
                                        &nbsp;&nbsp;</div>
                                    <div class="AdminRight">
                                    </div>
                                   <div class="clear" style="height:5px;">
                                    </div>
                                    <div class="AdminLeft" style="width: 25%">
                                        <asp:Label ID="Label29" runat="server" CssClass="Label" Text="Position"></asp:Label></div>
                                    <div class="AdminMiddle">
                                        <asp:DropDownList ID="uiDropDownListCrewPos" runat="server" Width="150px">
                                        </asp:DropDownList>
                                        &nbsp;&nbsp;</div>
                                    <div class="AdminRight">
                                    </div>
                                    <div class="clear" style="height:5px;">
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
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                    </ContentTemplate>
                    
                    <Triggers>
                        <asp:PostBackTrigger ControlID="uiTabContainerFlightDetails$uiTabPanelFlightInfo$uiLinkButtonCancelSector" />
                        <asp:PostBackTrigger ControlID="uiLinkButtonBack" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>

        

    </asp:Panel>
</asp:Content>
