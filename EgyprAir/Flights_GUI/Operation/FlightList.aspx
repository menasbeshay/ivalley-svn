<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/E_Admin.Master" AutoEventWireup="true" CodeBehind="FlightList.aspx.cs" Inherits="Flights_GUI.Operation.FlightList" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ MasterType VirtualPath="~/MasterPages/E_Admin.Master" %>
<%@ Register src="../Common/Controls/SectorInfo.ascx" tagname="SectorInfo" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .RadGrid_Office2007 .rgRow td
    {
        border: solid 1px #A6ACB8;
    }

        .radio + label{
            display:inline;
        }

        
.seprator
{
    color: #FFFFFF;
    font-weight: bold;    
    font-family: Tahoma, Geneva, sans-serif;
    text-align: left;
    background-color: #79BCFF;
    padding: 2px;
    display: block;
    clear: both;
    padding-left:30px;
    margin:10px 0;
}
    </style>


    <script type="text/javascript">
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
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel runat="server" ID="uiPanelAllFlights" CssClass="space12 clearfix">
        <div class="span12 clearfix">            
            
            <div class="More" style="float: right;" runat="server" id="AddDiv">
                    <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click" CssClass="btn btn-primary">Add new flight</asp:LinkButton>
                </div>
            <asp:Panel ID="uiPanelSearch" runat="server" DefaultButton="uiButtonSearch" CssClass="space12 clearfix">
                <div class="span12 clearfix">
                    <div class="span7 clearfix">
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
                    <div class="span5 clearfix">
                    <asp:Button ID="uiButtonSearch" runat="server" Text="search" OnClick="uiButtonSearch_Click" 
                        Width="60px" Style="display: none;" />
                    <div style="width: 50px; height: 15px; margin-top: 20px; margin-left: 5px;">
                        <asp:LinkButton ID="uiLinkButtonSearch" runat="server" OnClick="uiButtonSearch_Click" CssClass="btn btn-primary">Search</asp:LinkButton>
                    </div>
                </div>
                </div>                                      
            </asp:Panel>

            <div class="span12 clearfix"  style="height:10px"></div>
            <div class="span12 clearfix" >
            <telerik:radgrid id="uiRadGridFlights" runat="server" allowpaging="True" autogeneratecolumns="False"
                        cellspacing="0" horizontalalign="Center" skin="Office2007" width="90%" onitemdatabound="uiRadGridFlights_ItemDataBound"
                        onpageindexchanged="uiRadGridFlights_PageIndexChanged" onpagesizechanged="uiRadGridFlights_PageSizeChanged"
                        onitemcommand="uiRadGridFlights_ItemCommand">
                        <AlternatingItemStyle HorizontalAlign="Center" />
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn DataField="FlightNo" HeaderText="Flight No.">
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn HeaderText="Flight Type">
                                    <ItemTemplate>
                                        <asp:Label ID="uiLabelFlightType" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                
                                
                                <telerik:GridBoundColumn DataField="Route" HeaderText="Route">
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn DataField="FlightDate" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}">
                                </telerik:GridBoundColumn>
                                
                                <telerik:GridBoundColumn DataField="STD" HeaderText="STD" DataFormatString="{0:HH:mm}">
                                </telerik:GridBoundColumn>

                                <telerik:GridTemplateColumn HeaderText="Aircraft">
                                    <ItemTemplate>
                                        <asp:Label ID="uiLabelAirCraft" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonView" runat="server" CommandArgument='<%# Eval("FlightID") %>'
                                            CommandName="ViewReport"><img src="../images/bar_chart.png" alt="View Report" title="View Report" style="border:0;float:none;" /></asp:LinkButton>
                                        &nbsp;
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("FlightID") %>'
                                            CommandName="EditFlightDetails"><img src="../images/edit.png" alt="Edit Details" title="Edit Details" style="border:0;float:none;" /></asp:LinkButton>
                                        &nbsp;
                                        <%--<asp:LinkButton ID="uiLinkButtonEditPilots" runat="server" CommandArgument='<%# Eval("FlightID") %>'
                                            Visible="false" CommandName="EditSectorPilots"><img src="../images/pilot.gif" alt="Edit Pilots" title="Edit Pilots" style="border:0;float:none;" /></asp:LinkButton>
                                        &nbsp;
                                        <asp:LinkButton ID="uiLinkButtonCrew" runat="server" CommandArgument='<%# Eval("FlightID") %>'
                                            Visible="false" CommandName="EditSectorCrew"><img src="../images/crew2.gif" alt="Edit Cabin Crew" title="Edit Cabin Crew" style="border:0;float:none;" /></asp:LinkButton>
                                        &nbsp;--%>
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("FlightID") %>' Visible="false"
                                            CommandName="DeleteFlight" OnClientClick="return confirm('Are you want to delete this record? ');"><img src="../images/delete.png" alt="Delete" title="Delete" style="border:0;float:none;" /></asp:LinkButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </telerik:radgrid>
                </div>
        </div>
        
    </asp:Panel>
    <asp:Panel runat="server" ID="uiPanelFlightDetails">
        <div class="span12 clearfix" style="margin-left:2.564102564102564%">
            <div class="span2">Flight No.</div>
            <div class="span6">
                <asp:Label ID="uiLabelFlightPrefix" runat="server" ></asp:Label>
                <asp:TextBox ID="uiTextBoxFlightNo" runat="server" Width="20%"></asp:TextBox></div>
            <div class="span4" style="text-align:center;">
                <asp:LinkButton ID="uiLinkButtonBack" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonBack_Click">Back to flights</asp:LinkButton>
            </div>
            </div>
        <div class="span12 clearfix">
        <div class="span2">Aircraft</div>
        <div class="span6">
            <asp:DropDownList ID="uiDropDownListACType" runat="server"></asp:DropDownList></div>
        <div class="span4"></div>
            </div>        
        <div class="span12 clearfix">
            <div class="span2">
                Date
            </div>
            <div class="span6">
            <telerik:raddatepicker id="uiRaddatepickerFlightDate" runat="server" culture="en-US"
                            skin="Office2007">
                            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                                Skin="Office2007">
                            </Calendar>
                            <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy">
                            </DateInput>
                            <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                        </telerik:raddatepicker>
                </div>
        </div>
        <div class="span12 clearfix">
            <div class="span2">Type</div>
            <div class="span7">
                <asp:RadioButtonList ID="uiRadioButtonListFlightType" runat="server" RepeatDirection="Horizontal" Width="70%" ></asp:RadioButtonList></div>
            <div class="span3" style="text-align:right;">
                <asp:LinkButton ID="uiLinkButtonSaveFlight" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonSaveFlight_Click" style="margin-right:48%;">Save</asp:LinkButton>
            </div>
        </div>
       
    </asp:Panel>
    <asp:Panel runat="server" ID="uiPanelSectors" CssClass="space12 clearfix">
            <div class="span12">
                <h3>
                    Sectors
                </h3>
                 <div class="span11 clearfix" style="text-align:right;margin:10px;" runat="server" id="AddSector">
                    <asp:LinkButton ID="uiLinkButtonAddSector" runat="server" OnClick="uiLinkButtonAddSector_Click" CssClass="btn btn-primary">Add new sector</asp:LinkButton>
                </div>
                <div class="span11 clearfix">
                <telerik:radgrid id="uiRadgridSectors" runat="server" autogeneratecolumns="False"
                        cellspacing="0" horizontalalign="Center" skin="Office2007" width="100%" onitemdatabound="uiRadGridSectors_ItemDataBound"                        
                        onitemcommand="uiRadGridSectors_ItemCommand">
                        <AlternatingItemStyle HorizontalAlign="Center" />
                        <MasterTableView>
                            
                            <Columns>
                                <telerik:GridBoundColumn DataField="FlightNo" HeaderText="Flight No.">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SectorDate" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}">
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn HeaderText="Route">
                                    <ItemTemplate>
                                        <asp:Label ID="uiLabelFrom" runat="server"></asp:Label>
                                        &nbsp;
                                        <asp:Label ID="uiLabelTo" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
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
            </div>
        </asp:Panel>
    <asp:Panel runat="server" ID="uiPanelSectorDetails">
            <div id="FlightForm" class="span12 clearfix" style="margin-left:0">
                  <h3>
                    Add / update Sector details
                </h3>
                <div class="span12 clearfix" style="margin-left:2.564102564102564%">
                    <div class="span2">
                        <asp:Label ID="Label37" runat="server" Text="Flight No." CssClass="Label"></asp:Label>
                    </div>
                    <div class="span2">
                        <asp:Label ID="uiLabelSectorPrefix" runat="server" ></asp:Label>
                        <asp:TextBox ID="uiTextBoxSectorFlightNo" runat="server" Style="margin-left: -1px;width:70%"></asp:TextBox>
                    </div>
                    <div class="span2">
                        &nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="uiTextBoxSectorFlightNo" Display="Dynamic" ErrorMessage="Required"
                            ForeColor="Red" ValidationGroup="Flight">*</asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator1_ValidatorCalloutExtender"
                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1">
                        </cc1:ValidatorCalloutExtender>
                    </div>
                    <div class="span2">
                        <asp:Label ID="Label3" runat="server" Text="Date" CssClass="Label"></asp:Label>
                    </div>
                    <div class="span4">
                       
                        <telerik:raddatepicker id="uiRaddatepickerSectorDate" runat="server" culture="en-US"
                            skin="Office2007">
                            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                                Skin="Office2007">
                            </Calendar>
                            <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy">
                            </DateInput>
                            <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                        </telerik:raddatepicker>
                    </div>
                    
                </div>
                <div class="span12 clearfix">
                    <div class="span2">
                        <asp:Label ID="Label1" runat="server" Text="Aircraft Registration" CssClass="Label"></asp:Label>
                    </div>
                    <div class="span4">
                        <asp:DropDownList ID="uiDropDownListAirCraftRegistration" runat="server" >
                        </asp:DropDownList>
                    </div>
                    <div class="span2">
                        <asp:Label ID="Label32" runat="server" Text="Is Heavy" CssClass="Label"></asp:Label>
                    </div>
                    <div class="span4">
                        <asp:CheckBox ID="uiCheckBoxIsHeavy" runat="server" Style="margin-left: -4px;" />
                    </div>

                </div>
                
                <div class="span12 clearfix" >
                    
                    <div class="span2">
                        <asp:Label ID="Label39" runat="server" CssClass="Label" Text="From "></asp:Label>
                    </div>
                    <div class="span3">
                        <asp:DropDownList ID="uiDropDownListSectorFrom" runat="server" >
                    </asp:DropDownList>
                    &nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        ControlToValidate="uiDropDownListSectorFrom" ErrorMessage="Please select airport"
                        ForeColor="Red" InitialValue="0" ValidationGroup="Flight">*</asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator2_ValidatorCalloutExtender"
                        runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2">
                    </cc1:ValidatorCalloutExtender>
                    &nbsp;
                                            
                    </div>
                    <div class="span1"></div>
                    <div class="span2">
                        <asp:Label ID="Label8" runat="server" Text="To " CssClass="Label"></asp:Label>&nbsp;&nbsp;
                    </div>
                    <div class="span3">
                        <asp:DropDownList  ID="uiDropDownListSectorTo" runat="server" >
                                            </asp:DropDownList>
                    &nbsp;
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="uiDropDownListSectorTo"
                                                ErrorMessage="Please select airport" ForeColor="Red" InitialValue="0" ValidationGroup="Flight">*</asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator3_ValidatorCalloutExtender"
                        runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3">
                    </cc1:ValidatorCalloutExtender>
                    </div>
                    

                </div>

                <div class="span12 clearfix" >
                    
                    <div class="span2">
                        <asp:Label ID="Label2" runat="server" CssClass="Label" Text="Night city "></asp:Label>
                    </div>
                    <div class="span3">
                        <asp:DropDownList ID="uiDropDownListNightCity" runat="server" >
                    </asp:DropDownList>                    
                    &nbsp;
                                            
                    </div>
                    <div class="span1"></div>
                    <div class="span2">
                        
                    </div>
                    <div class="span3">
                        
                    </div>
                    

                </div>

                <div class="seprator">
                    All Times in UTC
                </div>

                <div class="span12 clearfix">

                    <div class="span4">
                        <asp:Label ID="Label6" runat="server" Text="STD" CssClass="Label"></asp:Label>&nbsp;<asp:DropDownList Width="55px"
                            ID="uiDropDownListSTDHours" runat="server">
                        </asp:DropDownList>
                        :
                                            <asp:DropDownList Width="55px" ID="uiDropDownListSTDMins" runat="server">
                                            </asp:DropDownList>
                    </div>
                    <div class="span4">
                        <asp:Label ID="Label10" runat="server" Text="Chox Off" CssClass="Label"></asp:Label>&nbsp;<asp:DropDownList Width="55px"
                            ID="uiDropDownListOFFHours" runat="server">
                        </asp:DropDownList>
                        :
                                            <asp:DropDownList Width="55px" ID="uiDropDownListOFFMins" runat="server">
                                            </asp:DropDownList>
                    </div>
                    <div class="span4">
                        <asp:Label ID="Label9" runat="server" Text="A/B" CssClass="Label"></asp:Label>&nbsp;&nbsp; 
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:DropDownList Width="55px" ID="uiDropDownListATDHours" runat="server">
                                            </asp:DropDownList>
                        :
                                            <asp:DropDownList Width="55px" ID="uiDropDownListATDMins" runat="server">
                                            </asp:DropDownList>
                    </div>

                </div>

                <div class="span12 clearfix">

                    <div class="span4">
                        <asp:Label ID="Label11" runat="server" Text="STA" CssClass="Label"></asp:Label>&nbsp;<asp:DropDownList Width="55px"
                            ID="uiDropDownListSTAHours" runat="server">
                        </asp:DropDownList>
                        :
                                            <asp:DropDownList Width="55px" ID="uiDropDownListSTAMins" runat="server">
                                            </asp:DropDownList>
                    </div>
                    <div class="span4">
                        <asp:Label ID="Label12" runat="server" Text="T/Down" CssClass="Label" Style="padding-right: 3px;"></asp:Label>&nbsp;<asp:DropDownList Width="55px"
                            ID="uiDropDownListATAHours" runat="server">
                        </asp:DropDownList>
                        :
                                            <asp:DropDownList Width="55px" ID="uiDropDownListATAMins" runat="server">
                                            </asp:DropDownList>
                    </div>
                    <div class="span4">
                        <asp:Label ID="Label13" runat="server" Text="Chox On" CssClass="Label" Style="margin-right: 2px;"></asp:Label>&nbsp;<asp:DropDownList Width="55px"
                            ID="uiDropDownListOnHours" runat="server">
                        </asp:DropDownList>
                        :
                                            <asp:DropDownList Width="55px" ID="uiDropDownListOnMins" runat="server">
                                            </asp:DropDownList>
                    </div>

                </div>

                <div class="span12 clearfix">

                    <div class="span4">
                        <asp:Label ID="Label20" runat="server" Text="Day" CssClass="Label"></asp:Label>&nbsp;<asp:DropDownList Width="55px"
                            ID="uiDropDownListDayHours" runat="server">
                        </asp:DropDownList>
                        :
                                            <asp:DropDownList Width="55px" ID="uiDropDownListDayMins" runat="server">
                                            </asp:DropDownList>
                    </div>
                    <div class="span4">
                        <asp:Label ID="Label38" runat="server" Text="Night" CssClass="Label"></asp:Label>
                        &nbsp;&nbsp;&nbsp;
                                            <asp:DropDownList Width="55px" ID="uiDropDownListNightHours" runat="server">
                                            </asp:DropDownList>
                        :
                                            <asp:DropDownList Width="55px" ID="uiDropDownListNightMins" runat="server">
                                            </asp:DropDownList>
                    </div>
                    <div class="span4">
                    </div>
                </div>


                <div class="seprator">
                    General Info
                </div>
                
                <div class="span12 clearfix">

                    <div class="span2">
                       <asp:Label ID="Label14" runat="server" Text="Flight Plane Burn Off" CssClass="Label"></asp:Label>
                    </div>
                    <div class="span4">
                       <asp:TextBox ID="uiTextBoxPlanBurnOff" runat="server" Width="100px" CssClass="digits"></asp:TextBox>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                        ControlToValidate="uiTextBoxPlanBurnOff" Display="Dynamic" ErrorMessage="Numbers only."
                        ForeColor="Red" ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                    <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator2_ValidatorCalloutExtender"
                        runat="server" Enabled="True" TargetControlID="RegularExpressionValidator2">
                    </cc1:ValidatorCalloutExtender>
                    </div>
                    <div class="span2">
                        <asp:Label ID="Label15" runat="server" Text="Actual Burn Off" CssClass="Label"></asp:Label>
                    </div>
                    <div class="span4">
                        <asp:TextBox ID="uiTextBoxActualBurn" runat="server" Width="100px" CssClass="digits"></asp:TextBox>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"
                        ControlToValidate="uiTextBoxActualBurn" Display="Dynamic" ErrorMessage="Numbers only."
                        ForeColor="Red" ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                    <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator5_ValidatorCalloutExtender"
                        runat="server" Enabled="True" TargetControlID="RegularExpressionValidator5">
                    </cc1:ValidatorCalloutExtender>
                        </div>
                </div>

                <div class="span12 clearfix">

                    <div class="span2">
                        <asp:Label ID="Label21" runat="server" Text="Dep. Fuel" CssClass="Label"></asp:Label>
                    </div>
                    <div class="span4">
                        <asp:TextBox ID="uiTextBoxDepFuel" runat="server" Width="100px" CssClass="digits"></asp:TextBox>
                         &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                        ControlToValidate="uiTextBoxDepFuel" Display="Dynamic" ErrorMessage="Numbers only."
                        ForeColor="Red" ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                    <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator3_ValidatorCalloutExtender"
                        runat="server" Enabled="True" TargetControlID="RegularExpressionValidator3">
                    </cc1:ValidatorCalloutExtender>
                    </div>
                    <div class="span2"><asp:Label ID="Label22" runat="server" Text="Arr. Fuel" CssClass="Label"></asp:Label>
                    </div>
                    <div class="span4">
                         <asp:TextBox ID="uiTextBoxArrFuel" runat="server" Width="100px" CssClass="digits"></asp:TextBox>
                         &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server"
                        ControlToValidate="uiTextBoxArrFuel" Display="Dynamic" ErrorMessage="Numbers only."
                        ForeColor="Red" ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                    <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator6_ValidatorCalloutExtender"
                        runat="server" Enabled="True" TargetControlID="RegularExpressionValidator6">
                    </cc1:ValidatorCalloutExtender>
                    </div>
                </div>

                <div class="span12 clearfix">

                    <div class="span2">
                       <asp:Label ID="Label5" runat="server" Text="Fuel Uplifted" CssClass="Label"></asp:Label>
                    </div>
                    <div class="span4">
                        <asp:TextBox ID="uiTextBoxFule" runat="server" Width="100px" CssClass="digits"></asp:TextBox>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                        ControlToValidate="uiTextBoxFule" Display="Dynamic" ErrorMessage="Numbers only."
                        ForeColor="Red" ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                    <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator1_ValidatorCalloutExtender"
                        runat="server" Enabled="True" TargetControlID="RegularExpressionValidator1">
                    </cc1:ValidatorCalloutExtender>
                    </div>
                    <div class="span6">
                    </div>
                </div>

                <div class="span12 clearfix">

                    <div class="span2">
                        <asp:Label ID="Label24" runat="server" Text="ZFW" CssClass="Label"></asp:Label>
                    </div>
                    <div class="span4">
                        <asp:TextBox ID="uiTextBoxZFW" runat="server" Width="100px" CssClass="digits"></asp:TextBox>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                        ControlToValidate="uiTextBoxZFW" Display="Dynamic" ErrorMessage="Numbers only."
                        ForeColor="Red" ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                    <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator4_ValidatorCalloutExtender"
                        runat="server" Enabled="True" TargetControlID="RegularExpressionValidator4">
                    </cc1:ValidatorCalloutExtender>
                    </div>
                    <div class="span2">
                         <asp:Label ID="Label25" runat="server" Text="TOW" CssClass="Label"></asp:Label>
                    </div>
                    <div class="span4">
                         <asp:TextBox ID="uiTextBoxTOW" runat="server" Width="100px" CssClass="digits"></asp:TextBox>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server"
                        ControlToValidate="uiTextBoxTOW" Display="Dynamic" ErrorMessage="Numbers only."
                        ForeColor="Red" ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                    <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator7_ValidatorCalloutExtender"
                        runat="server" Enabled="True" TargetControlID="RegularExpressionValidator7">
                    </cc1:ValidatorCalloutExtender>
                    </div>
                </div>

                <div class="span12 clearfix">

                    <div class="span3">
                       <asp:Label ID="Label23" runat="server" Text="No. of PAX" CssClass="Label" Style="margin-right: 30px;"></asp:Label>A
                                            :
                                            <asp:TextBox ID="uiTextBoxNoOFPax_A" runat="server" Width="50px" CssClass="digits"></asp:TextBox>
                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server"
                        ControlToValidate="uiTextBoxNoOFPax_A" Display="Dynamic" ErrorMessage="Numbers only."
                        ForeColor="Red" ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                    <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator8_ValidatorCalloutExtender"
                        runat="server" Enabled="True" TargetControlID="RegularExpressionValidator8">
                    </cc1:ValidatorCalloutExtender>
                    </div>
                    <div class="span2">
                       CH :
                                            <asp:TextBox ID="uiTextBoxNoOFPax_CH" runat="server" Width="50px" CssClass="digits"></asp:TextBox>
                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"
                        ControlToValidate="uiTextBoxNoOFPax_CH" Display="Dynamic" ErrorMessage="Numbers only."
                        ForeColor="Red" ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                    <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator9_ValidatorCalloutExtender"
                        runat="server" Enabled="True" TargetControlID="RegularExpressionValidator9">
                    </cc1:ValidatorCalloutExtender>
                    </div>
                    <div class="span2">
                         I :
                                            <asp:TextBox ID="uiTextBoxNoOFPax_I" runat="server" Width="50px" CssClass="digits"></asp:TextBox>
                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                        ControlToValidate="uiTextBoxNoOFPax_I" Display="Dynamic" ErrorMessage="Numbers only."
                        ForeColor="Red" ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                    <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator10_ValidatorCalloutExtender"
                        runat="server" Enabled="True" TargetControlID="RegularExpressionValidator10">
                    </cc1:ValidatorCalloutExtender>
                    </div>
                    <div class="span5"></div>
                </div>
                <div class="span12 clearfix" style="margin-left:0;">
                <cc1:Accordion ID="DelayAccordion" runat="server" ContentCssClass="AccordionContent"
                    FramesPerSecond="30" HeaderCssClass="accordionHeader" HeaderSelectedCssClass="accordionHeaderSelected"
                    TransitionDuration="250">
                    <Panes>
                        <cc1:AccordionPane ID="AccordionPaneDep" runat="server" ContentCssClass="" HeaderCssClass="">
                            <Header>
                                <div class="seprator" style="cursor:pointer">
                                    Dep. Delays
                                </div>
                            </Header>
                            <Content>
                                <div class="span11 clearfix" style="margin-left:2.65%">
                                    <div class="span2"></div>
                                    <div class="span10" >
                                        <div class="span4">Delay 1</div>
                                        <div class="span4">Delay 2</div>
                                        <div class="span4">Delay 3</div>
                                    </div>
                                </div>
                                <div class="span11 clearfix" >
                                    <div class="span2"><asp:Label ID="Label16" runat="server" Text="Code" CssClass="Label" Style="margin-right: 70px;"></asp:Label></div>
                                    <div class="span10" >
                                        <div class="span4"> <asp:dropdownlist 
                                        ID="uiDropDownListDelay1Code" runat="server" >
                                    </asp:DropDownList></div>
                                        <div class="span4"> <asp:dropdownlist ID="uiDropDownListDelay2Code" runat="server">
                                    </asp:DropDownList></div>
                                        <div class="span4"><asp:dropdownlist  ID="uiDropDownListDelay3Code" runat="server">
                                    </asp:DropDownList></div>
                                    </div>
                                </div>
                                <div class="span11 clearfix" >
                                    <div class="span2"><asp:Label ID="Label17" runat="server" Text="Time" CssClass="Label" Style="margin-right: 70px;"></asp:Label></div>
                                    <div class="span10" >
                                        <div class="span4"><asp:dropdownlist width="55px"
                                        ID="uiDropDownListDelay1Hours" runat="server">
                                    </asp:DropDownList>
                                    :
                                                            <asp:dropdownlist width="55px" ID="uiDropDownListDelay1Mins" runat="server">
                                                            </asp:DropDownList></div>
                                        <div class="span4"><asp:dropdownlist width="55px" ID="uiDropDownListDelay2Hours" runat="server">
                                    </asp:DropDownList>
                                    :
                                                            <asp:dropdownlist width="55px" ID="uiDropDownListDelay2Mins" runat="server">
                                                            </asp:DropDownList></div>
                                        <div class="span4"><asp:dropdownlist width="55px" ID="uiDropDownListDelay3Hours" runat="server">
                                    </asp:DropDownList>
                                    :
                                                            <asp:dropdownlist width="55px" ID="uiDropDownListDelay3Mins" runat="server">
                                                            </asp:DropDownList></div>
                                    </div>
                                </div>
                                
                            </Content>
                        </cc1:AccordionPane>
                        <cc1:AccordionPane ID="AccordionPaneArr" runat="server" ContentCssClass="" HeaderCssClass="">
                            <Header>
                                <div class="seprator" style="cursor:pointer">
                                    Arr. Delays
                                </div>
                            </Header>
                            <Content>
                                
                                <div class="span11 clearfix" style="margin-left:2.65%">
                                    <div class="span2"></div>
                                    <div class="span10" style="margin-left:0">
                                        <div class="span4">Delay 1</div>
                                        <div class="span4">Delay 2</div>
                                        <div class="span4">Delay 3</div>
                                    </div>
                                </div>

                                <div class="span11 clearfix" >
                                    <div class="span2"><asp:Label ID="Label18" runat="server" Text="Code" CssClass="Label" Style="margin-right: 70px;"></asp:Label></div>
                                    <div class="span10" style="margin-left:0">
                                        <div class="span4"><asp:DropDownList
                                        ID="uiDropDownListArrDelay1Code" runat="server">
                                    </asp:DropDownList></div>
                                        <div class="span4"> <asp:DropDownList ID="uiDropDownListArrDelay2Code" runat="server">
                                    </asp:DropDownList></div>
                                        <div class="span4"><asp:DropDownList ID="uiDropDownListArrDelay3Code" runat="server">
                                    </asp:DropDownList></div>
                                    </div>
                                </div>

                                <div class="span11 clearfix" >
                                    <div class="span2"><asp:Label ID="Label19" runat="server" Text="Time" CssClass="Label" Style="margin-right: 70px;"></asp:Label></div>
                                    <div class="span10" style="margin-left:0">
                                        <div class="span4"> <asp:dropdownlist width="55px"
                                        ID="uiDropDownListArrDelay1Hours" runat="server">
                                    </asp:DropDownList>
                                    :
                                                            <asp:dropdownlist width="55px" ID="uiDropDownListArrDelay1Mins" runat="server">
                                                            </asp:DropDownList></div>
                                        <div class="span4"><asp:dropdownlist width="55px" ID="uiDropDownListArrDelay2Hours" runat="server">
                                    </asp:DropDownList>
                                    :
                                                            <asp:dropdownlist width="55px" ID="uiDropDownListArrDelay2Mins" runat="server">
                                                            </asp:DropDownList></div>
                                        <div class="span4"><asp:dropdownlist width="55px" ID="uiDropDownListArrDelay3Hours" runat="server">
                                    </asp:DropDownList>
                                    :
                                                            <asp:dropdownlist width="55px" ID="uiDropDownListArrDelay3Mins" runat="server">
                                                            </asp:DropDownList></div>
                                    </div>
                                </div>

                            </Content>
                        </cc1:AccordionPane>
                    </Panes>
                </cc1:Accordion>
                    </div>
                <div class="span12 clearfix">
                    
                        <asp:LinkButton ID="uiLinkButtonSaveSector" runat="server" Text="Save" OnClick="uiLinkButtonSaveSector_Click" CssClass="btn btn-primary"
                            OnClientClick="return ValidateBlockTime();" ValidationGroup="Flight"></asp:LinkButton>
                   
                    &nbsp;
                        <asp:LinkButton ID="uiLinkButtonCancelSector" runat="server" Text="Cancel" OnClick="uiLinkButtonCancelSector_Click" CssClass="btn btn-primary"></asp:LinkButton>
                    
                </div>
                
            </div>
        </asp:Panel>
</asp:Content>
