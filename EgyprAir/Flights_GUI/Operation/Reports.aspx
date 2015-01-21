<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/E_Admin.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Flights_GUI.Operation.Reports" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    $(function () {
        $("#mi3").addClass("selected");
    });
</script>
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $('#ReportList input').click(function () {
            var selectedvalue = $("#ReportList input:radio:checked").val();

            if (selectedvalue == 0 || selectedvalue == 4 || selectedvalue == 5) {
                $('#pilotdiv').css('display', 'block');

                if (selectedvalue == 4 || selectedvalue == 5)
                    $('#Ratediv').css('display', 'block');
                else
                    $('#Ratediv').css('display', 'none');
            }
            else {
                $('#pilotdiv').css('display', 'none');
                $('#Ratediv').css('display', 'none');
            }


            if (selectedvalue == 1 || selectedvalue == 6) {
                $('#PlanDiv').css('display', 'block');
            }
            else {
                $('#PlanDiv').css('display', 'none');
            }

            if (selectedvalue == 7) {
                $('#SectorDiv').css('display', 'block');
            }
            else {
                $('#SectorDiv').css('display', 'none');
            }
        });
    });

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ContentLeftDiv">
                <h4>
                    Flight Reports</h4>
                <div class="Details900">

                <div class="AdminLeft" style="width: 10%">
                             <asp:Label ID="Label4" runat="server" Text="Select Report" CssClass="Label"></asp:Label>
                            </div>
                            <div class="AdminMiddle" id="ReportList">
                                <asp:RadioButtonList ID="uiRadioButtonListReports" runat="server" 
                                    RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="3" 
                                    CellPadding="2" CellSpacing="2" CssClass="ReportItems">
                                    <asp:ListItem Value="0">Pilot Hours</asp:ListItem>                                                                                                  
                                    <%--<asp:ListItem Value="4">Per diem</asp:ListItem>--%>
                                    <asp:ListItem Value="5">Actual Per diem</asp:ListItem>
                                    <asp:ListItem Value="1">PAX & Fuel</asp:ListItem>
                                    <asp:ListItem Value="2">Aircraft Fly Hours</asp:ListItem>  
                                    <asp:ListItem Value="3">Flight Schedule</asp:ListItem>    
                                    <asp:ListItem Value="6">Airplane Fuel</asp:ListItem>
                                    <asp:ListItem Value="7">Sector Fuel</asp:ListItem>
                                </asp:RadioButtonList>
                                
                            </div>
                            <div class="AdminRight">
                                                      
                            </div>
                            <div class="clear10"></div>
                            <div id="PlanDiv" style="display:none;">
                            <div class="AdminLeft" style="width: 10%">
                             <asp:Label ID="Label1" runat="server" Text="Airplane :" CssClass="Label"></asp:Label>
                            </div>
                            <div class="AdminMiddle">
                                <asp:DropDownList ID="uiDropDownListAirplane" runat="server" Width="150px">
                                </asp:DropDownList>&nbsp;
                            </div>
                            <div class="AdminRight">
                            </div>
                            <div class="clear10"></div>
                            </div>
                            <div class="clear10"></div>
                            <div id="pilotdiv" style="display:none;">
                            <div class="AdminLeft" style="width: 10%">
                             <asp:Label ID="Label31" runat="server" Text="Select Pilot" CssClass="Label"></asp:Label>
                            </div>
                            <div class="AdminMiddle">
                                <asp:DropDownList ID="uiDropDownListPilots" runat="server" Width="150px">
                                </asp:DropDownList>&nbsp;
                            </div>
                            <div class="AdminRight">
                            </div>
                            <div class="clear10"></div>
                            </div>
                            <div id="Ratediv" style="display:none;">
                            <div class="AdminLeft" style="width: 10%">
                             <asp:Label ID="Label5" runat="server" Text="Rate / Day" CssClass="Label"></asp:Label>
                            </div>
                            <div class="AdminMiddle">
                                <asp:TextBox ID="uiTextBoxRate" runat="server"></asp:TextBox>
                            </div>
                            <div class="AdminRight">
                            </div>
                            <div class="clear10"></div>
                            </div>

                            <div id="SectorDiv" style="display:none">
                            <div class="AdminLeft" style="width: 10%">
                                <asp:Label ID="Label6" runat="server" Text="From :" CssClass="Label"></asp:Label>
                            </div>
                            <div class="AdminMiddle" style="vertical-align: 50%">
                                <asp:DropDownList ID="uiDropDownListFrom" runat="server">
                                </asp:DropDownList>
                                &nbsp; <asp:Label ID="Label7" runat="server" Text="To :" CssClass="Label"></asp:Label>
                                &nbsp;<asp:DropDownList ID="uiDropDownListTo" runat="server">
                                </asp:DropDownList>
                            </div>
                            <div class="AdminRight">
                           
                            </div>
                            <div class="clear10"></div>
                            </div>
                            <div class="AdminLeft" style="width: 10%">
                                <asp:Label ID="Label2" runat="server" Text="From :" CssClass="Label"></asp:Label>
                            </div>
                            <div class="AdminMiddle" style="vertical-align: 50%">
                                <telerik:RadDatePicker ID="uiRadDatePickerFrom" runat="server" Culture="en-US" Skin="Office2007">
                                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                                        Skin="Office2007">
                                    </Calendar>
                                    <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy">
                                    </DateInput>
                                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                </telerik:RadDatePicker>                                
                                &nbsp; <asp:Label ID="Label3" runat="server" Text="To :" CssClass="Label"></asp:Label>
                                &nbsp;
                                <telerik:RadDatePicker ID="uiRadDatePickerTo" runat="server" Culture="en-US" Skin="Office2007">
                                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                                        Skin="Office2007">
                                    </Calendar>
                                    <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy">
                                    </DateInput>
                                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                </telerik:RadDatePicker>    
                            </div>
                            <div class="AdminRight">
                           
                            </div>
                            <div class="clear10"></div>

                            <div class="AdminLeft" style="width: 10%">
                            &nbsp;
                            </div>
                            <div class="AdminMiddle">
                            <div class="More" style="float:left; height: 15px;">
                                    <asp:LinkButton ID="uiLinkButtonGetReport" runat="server" 
                                        OnClick="uiLinkButtonGetReport_Click">View Report</asp:LinkButton>
                                </div>                                
                            </div>
                            <div class="AdminRight"></div>
                            <div class="clear10"></div>

                            <div class="AdminMiddle" style="width: 100%">
                                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" 
                                    Font-Names="Verdana" Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
                                    WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
                                    <LocalReport ReportPath="Reports\PilotReport.rdlc">                                    
                                        
                                    </LocalReport>
                                    
                                </rsweb:ReportViewer>

                                <rsweb:ReportViewer ID="ReportViewer2" runat="server" Width="100%" 
                                    Font-Names="Verdana" Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
                                    WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
                                    <LocalReport ReportPath="Reports\Copy_PerDiem.rdlc">                                    
                                    
                                    </LocalReport>
                                    
                                    
                                </rsweb:ReportViewer>

                                <rsweb:ReportViewer ID="ReportViewer3" runat="server" Width="100%" 
                                    Font-Names="Verdana" Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
                                    WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
                                    <LocalReport ReportPath="Reports\PAXReport.rdlc">                                    
                                    
                                    </LocalReport>
                                    
                                    
                                </rsweb:ReportViewer>

                                <rsweb:ReportViewer ID="ReportViewer4" runat="server" Width="100%" 
                                    Font-Names="Verdana" Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
                                    WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
                                    <LocalReport ReportPath="Reports\PlaneReport.rdlc">                                    
                                    
                                    </LocalReport>
                                    
                                    
                                </rsweb:ReportViewer>

                                <rsweb:ReportViewer ID="ReportViewer5" runat="server" Width="100%" 
                                    Font-Names="Verdana" Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
                                    WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
                                    <LocalReport ReportPath="Reports\Schedule.rdlc">                                    
                                    
                                    </LocalReport>
                                    
                                    
                                </rsweb:ReportViewer>

                                <rsweb:ReportViewer ID="ReportViewer6" runat="server" Width="100%" 
                                    Font-Names="Verdana" Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
                                    WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
                                    <LocalReport ReportPath="Reports\AirplaneActualBurnOff.rdlc">                                    
                                    
                                    </LocalReport>
                                    
                                    
                                </rsweb:ReportViewer>

                                <rsweb:ReportViewer ID="ReportViewer7" runat="server" Width="100%" 
                                    Font-Names="Verdana" Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
                                    WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" ShowParameterPrompts="true">
                                    <LocalReport ReportPath="Reports\SectorActualBurnOff.rdlc">                                    
                                    
                                    </LocalReport>
                                    
                                    
                                </rsweb:ReportViewer>
                            </div>
                            
                            <div class="clear"></div>

                </div>
                </div>
</asp:Content>
