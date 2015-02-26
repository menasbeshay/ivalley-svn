<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/E_Admin.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Flights_GUI.Operation.Reports" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ MasterType VirtualPath="~/MasterPages/E_Admin.Master" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    $(function () {
        $("#mi3").addClass("selected");
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#<%= uiRadioButtonListReports.ClientID %>').change(function () {
            var selectedvalue = $(this).val();

            if (selectedvalue == 0 || selectedvalue == 4 || selectedvalue == 5 || selectedvalue == 8) {
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
                    <div class="span12 clearfix">
                <div class="span2" >
                             <asp:Label ID="Label4" runat="server" Text="Select Report" CssClass="Label"></asp:Label>
                            </div>
                            <div class="span3" id="ReportList">
                                <asp:DropDownList ID="uiRadioButtonListReports" runat="server" CssClass="ReportItems">                                    
                                    <asp:ListItem Value="-1">Select report ... </asp:ListItem>             
                                    <asp:ListItem Value="0">Pilot Hours</asp:ListItem>      
                                    <asp:ListItem Value="8">Pilot DHD Hours</asp:ListItem>                                                                                             
                                    <%--<asp:ListItem Value="4">Per diem</asp:ListItem>--%>
                                   <%-- <asp:ListItem Value="5">Actual Per diem</asp:ListItem>--%>
                                    <asp:ListItem Value="1">PAX & Fuel</asp:ListItem>
                                    <asp:ListItem Value="2">Aircraft Fly Hours</asp:ListItem>  
                                    <asp:ListItem Value="3">Flight Schedule</asp:ListItem>    
                                    <asp:ListItem Value="6">Airplane Fuel</asp:ListItem>
                                    <asp:ListItem Value="7">Sector Fuel</asp:ListItem>
                                </asp:DropDownList>
                                
                            </div>
                            <div class="AdminRight">
                                                      
                            </div>
                            <div class="clear10"></div>
                        </div>
                            <div id="PlanDiv" style="display:none;" class="span12 clearfix">
                            <div class="span2" >
                             <asp:Label ID="Label1" runat="server" Text="Airplane :" CssClass="Label"></asp:Label>
                            </div>
                            <div class="span3">
                                <asp:DropDownList ID="uiDropDownListAirplane" runat="server" Width="150px">
                                </asp:DropDownList>&nbsp;
                            </div>
                            <div class="AdminRight">
                            </div>
                            <div class="clear10"></div>
                            </div>
                            <div class="clear10"></div>
                            <div id="pilotdiv" style="display:none;" class="span12 clearfix">
                            <div class="span2" >
                             <asp:Label ID="Label31" runat="server" Text="Select Pilot" CssClass="Label"></asp:Label>
                            </div>
                            <div class="span3">
                                <asp:DropDownList ID="uiDropDownListPilots" runat="server" Width="150px">
                                </asp:DropDownList>&nbsp;
                            </div>
                            <div class="AdminRight">
                            </div>
                            <div class="clear10"></div>
                            </div>
                            <div id="Ratediv" style="display:none;" class="span12">
                            <div class="span2">
                             <asp:Label ID="Label5" runat="server" Text="Rate / Day" CssClass="Label"></asp:Label>
                            </div>
                            <div class="span3">
                                <asp:TextBox ID="uiTextBoxRate" runat="server"></asp:TextBox>
                            </div>
                            <div class="AdminRight">
                            </div>
                            <div class="clear10"></div>
                            </div>

                            <div id="SectorDiv" style="display:none" class="span12">
                            <div class="span1" >
                                <asp:Label ID="Label6" runat="server" Text="From :" CssClass="Label"></asp:Label>
                            </div>
                            <div class="span2" >
                                <asp:DropDownList ID="uiDropDownListFrom" runat="server">
                                </asp:DropDownList>
                               
                            </div>
                            <div class="span1">
                           
                            </div>
                                <div class="span1">
                                      <asp:Label ID="Label7" runat="server" Text="To :" CssClass="Label"></asp:Label>
                                
                                </div>
                                <div class="span2">
                                    <asp:DropDownList ID="uiDropDownListTo" runat="server">
                                </asp:DropDownList>
                                </div>
                            <div class="clear10"></div>
                            </div>
                    <div class="span12 clearfix">
                            <div class="span2" >
                                <asp:Label ID="Label2" runat="server" Text="From :" CssClass="Label"></asp:Label>
                            </div>
                            <div class="span2" >
                                <telerik:RadDatePicker ID="uiRadDatePickerFrom" runat="server" Culture="en-US" Skin="Office2007">
                                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                                        Skin="Office2007">
                                    </Calendar>
                                    <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy">
                                    </DateInput>
                                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                </telerik:RadDatePicker>                                
                                  
                            </div>
                        <div class="span1">
                            &nbsp;
                            </div>
                        <div class="span1">
                             <asp:Label ID="Label3" runat="server" Text="To :" CssClass="Label"></asp:Label>
                                
                        </div>
                        <div class="span2">
                            
                                <telerik:RadDatePicker ID="uiRadDatePickerTo" runat="server" Culture="en-US" Skin="Office2007">
                                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                                        Skin="Office2007">
                                    </Calendar>
                                    <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy">
                                    </DateInput>
                                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                </telerik:RadDatePicker>  
                        </div>
                            <div class="span2">
                           <asp:LinkButton ID="uiLinkButtonGetReport" runat="server" 
                                        OnClick="uiLinkButtonGetReport_Click" CssClass="btn btn-primary">View Report</asp:LinkButton>
                            </div>
                            <div class="clear10"></div>
                        </div>
                            

                            <div class="span12 clearfix" >
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
