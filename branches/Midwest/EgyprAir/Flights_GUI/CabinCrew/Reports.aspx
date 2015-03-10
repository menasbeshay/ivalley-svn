<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/IFlights.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Flights_GUI.CabinCrew.Reports" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ MasterType VirtualPath="~/MasterPages/IFlights.Master" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(function () {
            $("#mi3").addClass("selected");
        });
</script>
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $('#<%= uiRadioButtonListReports.ClientID %>').change(function () {
            var selectedvalue = $(this).val();

            if (selectedvalue == 0 || selectedvalue == 1 || selectedvalue == 3 || selectedvalue == 5 || selectedvalue == 6) {
                $('#crewdiv').css('display', 'block');
                
            }
            else {
                $('#crewdiv').css('display', 'none'); 
            }
        });
    });

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ContentLeftDiv">
                
                <div class="Details900">
                    <div class="span12">
                <div class="span2" >
                             <asp:Label ID="Label4" runat="server" Text="Select Report" CssClass="Label"></asp:Label>
                            </div>
                            <div class="span4" id="ReportList">
                                <asp:DropDownList ID="uiRadioButtonListReports" runat="server" CssClass="ReportItems">
                                    <asp:ListItem Value="-1">Select report ... </asp:ListItem>    
                                    <asp:ListItem Value="0">Crew Hours</asp:ListItem>                                                                                                  
                                    <asp:ListItem Value="5">Crew DHD Hours</asp:ListItem>
                                    <asp:ListItem Value="6">Crew Night city</asp:ListItem>
                                    <asp:ListItem Value="7">Crew Hours summary</asp:ListItem>
                                    <%--<asp:ListItem Value="4">Per diem</asp:ListItem>--%>
                                    <%--<asp:ListItem Value="1">Actual Per diem</asp:ListItem>--%>
                                    <asp:ListItem Value="2">All Crew Hours</asp:ListItem>                                    
                                    <asp:ListItem Value="3">Flight Schedule</asp:ListItem>    
                                </asp:DropDownList>
                                
                            </div>
                            <div class="AdminRight">
                                                      
                            </div>
                            <div class="clear10"></div>
                    </div>
                            <div id="crewdiv" style="display:none;" class="span12 clearfix">
                            <div class="span2" >
                             <asp:Label ID="Label31" runat="server" Text="Select Crew" CssClass="Label"></asp:Label>
                            </div>
                            <div class="span3">
                                <asp:DropDownList ID="uiDropDownListCrew" runat="server" Width="150px">
                                </asp:DropDownList>&nbsp;
                            </div>
                            <div class="AdminRight">
                            </div>
                            <div class="clear10"></div>
                            </div>                            
                            <div class="span2" >
                                <asp:Label ID="Label2" runat="server" Text="From :" CssClass="Label"></asp:Label>
                            </div>
                            <div class="span2" style="vertical-align: 50%">
                                <telerik:RadDatePicker ID="uiRadDatePickerFrom" runat="server" Culture="en-US" Skin="Office2007">
                                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                                        Skin="Office2007">
                                    </Calendar>
                                    <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy">
                                    </DateInput>
                                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                </telerik:RadDatePicker> 
                                </div>
                                <div class="span2">
                                &nbsp; <asp:Label ID="Label3" runat="server" Text="To :" CssClass="Label"></asp:Label>
                                &nbsp;</div>                               
                                <div class="span3">
                                <telerik:RadDatePicker ID="uiRadDatePickerTo" runat="server" Culture="en-US" Skin="Office2007">
                                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                                        Skin="Office2007">
                                    </Calendar>
                                    <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy">
                                    </DateInput>
                                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                </telerik:RadDatePicker>   
                                    </div>                            
                           
                            <div class="span1">
                           
                            </div>
        <div class="span1"></div>
                            <div class="clear10"></div>

                            <div class="span2" >
                            &nbsp;
                            </div>
                            <div class="span2">
                            <div class="More" style="float:left; height: 15px;">
                                    <asp:LinkButton ID="uiLinkButtonGetReport" runat="server" 
                                        OnClick="uiLinkButtonGetReport_Click" CssClass="btn btn-primary">View Report</asp:LinkButton>
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
                                
                            </div>
                            
                            <div class="clear"></div>

                </div>
                </div>
</asp:Content>
