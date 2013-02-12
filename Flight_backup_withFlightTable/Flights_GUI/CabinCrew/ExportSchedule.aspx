<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/CabinCrew.Master" AutoEventWireup="true" CodeBehind="ExportSchedule.aspx.cs" Inherits="Flights_GUI.CabinCrew.ExportSchedule" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(function () {
            $("#mi1").addClass("selected");
        });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="ContentLeftDiv">
                    <h4>
                        Crew Schedule
                    </h4>
                    <div class="Details900">
                    <div class="AdminLeft">
                             <asp:Label ID="Label1" runat="server" Text="Date" CssClass="Label"></asp:Label>
                            </div>
                            <div class="AdminMiddle">
                                <asp:Label ID="Label2" runat="server" Text="From :" CssClass="Label"></asp:Label>
                                &nbsp;<asp:TextBox ID="uiTextBoxFrom" runat="server"></asp:TextBox>
                                <asp:CalendarExtender ID="uiTextBoxFrom_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="uiTextBoxFrom" Format="dd/MM/yyyy">
                                </asp:CalendarExtender>
                                &nbsp;<asp:Label ID="Label3" runat="server" Text="To :" CssClass="Label"></asp:Label>
                                &nbsp;<asp:TextBox ID="uiTextBoxTo" runat="server"></asp:TextBox>
                                <asp:CalendarExtender ID="uiTextBoxTo_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="uiTextBoxTo"  Format="dd/MM/yyyy">
                                </asp:CalendarExtender>
                            </div>
                            <div class="AdminRight">
                            
                            <div class="More" style="float:left; height: 15px;width:120px;">
                           <asp:LinkButton ID="uiLinkButtonGetReport" runat="server" 
                                        OnClick="uiLinkButtonGetReport_Click">View Report</asp:LinkButton></div>

                                        &nbsp;

                                        <div class="More" style="float:left; height: 15px;width:120px;margin-left:10px;">
                           <asp:LinkButton ID="uiLinkButtonBack" runat="server" 
                                        OnClick="uiLinkButtonBack_Click">Back</asp:LinkButton></div>
                            </div>
                            <div class="clear10"></div>

                             <div class="AdminMiddle" style="width: 100%">
                        <rsweb:ReportViewer ID="uiReportViewer" runat="server" Font-Names="Verdana" 
                            Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
                            WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%">
                            <LocalReport ReportPath="Reports\CabinCrewSchedule.rdlc">
                            </LocalReport>
                        </rsweb:ReportViewer>
                        </div>
                         <div class="clear10"></div>

                    </div>
                </div>
</asp:Content>
