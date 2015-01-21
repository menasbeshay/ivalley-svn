<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/E_Admin.Master" AutoEventWireup="true" CodeBehind="PilotFlights.aspx.cs" Inherits="Flights_GUI.Operation.PilotFlights" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(function () {
        $("#mi33").addClass("selected");
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="ContentLeftDiv">
            <h4>
                My Flights' List </h4>
            <div class="Details900">
            <div class="AdminMiddle" style="width: 100%">
                    <asp:GridView ID="uiGridViewReports" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        EmptyDataText="No avaliable data." HorizontalAlign="Center" Width="90%" OnPageIndexChanging="uiGridViewReports_PageIndexChanging"
                         Style="direction: ltr" PageSize="12">
                        <Columns>
                            <asp:BoundField DataField="FlightNo" HeaderText="Flight No." />
                            <asp:BoundField DataField="ReportDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Report Date" />                            
                            <asp:BoundField DataField="From" HeaderText="From" />
                            <asp:BoundField DataField="To" HeaderText="To" />
                        </Columns>
                        <HeaderStyle HorizontalAlign="Center" />
                        <PagerStyle HorizontalAlign="Center" />
                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:GridView>
                </div>
                <div class="clear5">
                </div>
            </div>
            </div>
</asp:Content>
