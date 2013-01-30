<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/CabinCrew.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Flights_GUI.CabinCrew.Reports" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

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
        $('#ReportList input').click(function () {
            var selectedvalue = $("#ReportList input:radio:checked").val();

            if (selectedvalue == 0 || selectedvalue == 1 || selectedvalue == 3) {
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
                <h4>
                    Crew Reports</h4>
                <div class="Details900">

                <div class="AdminLeft" style="width: 10%">
                             <asp:Label ID="Label4" runat="server" Text="Select Report" CssClass="Label"></asp:Label>
                            </div>
                            <div class="AdminMiddle" id="ReportList">
                                <asp:RadioButtonList ID="uiRadioButtonListReports" runat="server" 
                                    RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="3" 
                                    CellPadding="2" CellSpacing="2" CssClass="ReportItems">
                                    <asp:ListItem Value="0">Crew Hours</asp:ListItem>                                                                                                  
                                    <%--<asp:ListItem Value="4">Per diem</asp:ListItem>--%>
                                    <asp:ListItem Value="1">Actual Per diem</asp:ListItem>
                                    <asp:ListItem Value="2">All Crew Hours</asp:ListItem>                                    
                                    <asp:ListItem Value="3">Flight Schedule</asp:ListItem>    
                                </asp:RadioButtonList>
                                
                            </div>
                            <div class="AdminRight">
                                                      
                            </div>
                            <div class="clear10"></div>
                            <div id="crewdiv" style="display:none;">
                            <div class="AdminLeft" style="width: 10%">
                             <asp:Label ID="Label31" runat="server" Text="Select Crew" CssClass="Label"></asp:Label>
                            </div>
                            <div class="AdminMiddle">
                                <asp:DropDownList ID="uiDropDownListCrew" runat="server" Width="150px">
                                </asp:DropDownList>&nbsp;
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
                                
                            </div>
                            
                            <div class="clear"></div>

                </div>
                </div>
</asp:Content>
