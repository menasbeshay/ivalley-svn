<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/IFlights.Master" AutoEventWireup="true" CodeBehind="DoReport.aspx.cs" Inherits="Flights_GUI.Operation.DoReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            TableEditable.init();
        });

        function GenerateMembers()
        {
            var rows = $("#sample_editable_1").dataTable().fnGetNodes();
            var members = "";
            for (var i = 0; i < rows.length; i++) {
                var data = $("#sample_editable_1").dataTable().fnGetData(rows[i]);
                members += data[0] + "#"+ data[1] + "#" + data[2] + "#" + data[3] + "[stop]";
            }
            $('#<%= uiHiddenFieldExtraMembers.ClientID %>').val(members);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ContentLeftDiv">
        <asp:HiddenField ID="uiHiddenFieldExtraMembers" runat="server" />
        <asp:LinkButton ID="uiLinkButtonViewReport" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonViewReport_Click" OnClientClick="GenerateMembers()">View Report</asp:LinkButton>
        <asp:Panel runat="server" ID="uiPanelAddGDExtraMembers" Visible="false">
            <div class="row-fluid">
                <div class="clearfix">
                    <div class="clearfix" style="height:5px;"></div>
                                    <div class="btn-group">
                                        <button id="sample_editable_1_new" class="btn green">
                                            Add New member / passenger <i class="icon-plus"></i>
                                        </button>
                                    </div>
                                   
                                </div>
                <div class="clearfix" style="height:5px;"></div>
                 <table class="table table-striped table-hover table-bordered" id="sample_editable_1">
                                    <thead>
                                    <tr>
                                        <th>Title</th>
                                        <th>Full Name</th>
                                        <th>Passport No.</th>
                                        <th>Birth Date</th>
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
                </rsweb:ReportViewer>
                <div class="clear10"></div>
               
            </div>


 </div>
</asp:Content>
