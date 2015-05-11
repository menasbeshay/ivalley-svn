<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/IFlights.Master" AutoEventWireup="true" CodeBehind="FlightReport.aspx.cs" Inherits="Flights_GUI.Operation.FlightReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            TableEditable2.init();
        });

        function GenerateMembers() {
            var rows = $("#sample_editable_2").dataTable().fnGetNodes();
            var members = "";
            for (var i = 0; i < rows.length; i++) {
                var data = $("#sample_editable_2").dataTable().fnGetData(rows[i]);
                members += data[0] + "[stop]";
            }
            $('#<%= uiHiddenFieldExtraMembers.ClientID %>').val(members);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="ContentLeftDiv">
            <h4>
                Flight Report</h4>

            <asp:HiddenField ID="uiHiddenFieldExtraMembers" runat="server" />
        <asp:LinkButton ID="uiLinkButtonViewReport" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonViewReport_Click" OnClientClick="GenerateMembers()">View Report</asp:LinkButton>
        <asp:Panel runat="server" ID="uiPanelAddGDExtraMembers" >
            <div class="row-fluid">
                <div class="clearfix">
                    <div class="clearfix" style="height:5px;"></div>
                                    <div class="btn-group">
                                        <button id="sample_editable_2_new" class="btn green">
                                            Add member <i class="icon-plus"></i>
                                        </button>
                                    </div>
                                   
                                </div>
                <div class="clearfix" style="height:5px;"></div>
                 <table class="table table-striped table-hover table-bordered" id="sample_editable_2">
                                    <thead>
                                    <tr>                                        
                                        <th>Name</th>
                                        
                                        <th>Edit</th>
                                        <th>Delete</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    
                                    </tbody>
                                </table>
			</div>
        </asp:Panel>    

            <div class="Details900">
                <rsweb:ReportViewer ID="uiReportViewer" runat="server" Font-Names="Verdana" 
                    Font-Size="8pt" Height="450px" InteractiveDeviceInfos="(Collection)" 
                    WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%">
                    <LocalReport ReportPath="Reports\JournyFlightLog.rdlc">
                        <%--<DataSources>
                            <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="FlightLog" />
                            <rsweb:ReportDataSource DataSourceId="SqlDataSource2" Name="FlightLogPilot" />
                            <rsweb:ReportDataSource DataSourceId="SqlDataSource3" Name="FlightLogCrew" />
                            <rsweb:ReportDataSource DataSourceId="SqlDataSource4" Name="FlightLogTotals" />
                        </DataSources>--%>
                    </LocalReport>
                </rsweb:ReportViewer>
                <div class="clear10"></div>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:FlightReportConnectionString %>" 
                    SelectCommand="GetFlightLogTotalTime" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="ReportID" 
                            QueryStringField="RID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:FlightReportConnectionString %>" 
                    SelectCommand="GetFlightLogCrew" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="ReportID" 
                            QueryStringField="RID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:FlightReportConnectionString %>" 
                    SelectCommand="GetFlightLogPilot" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="ReportID" 
                            QueryStringField="RID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:FlightReportConnectionString %>" 
                    SelectCommand="GetFlightLog" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="ReportID" 
                            QueryStringField="RID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
 </div>
</asp:Content>
