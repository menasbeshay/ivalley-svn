<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Flights_GUI.WebForm1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" InteractiveDeviceInfos="(Collection)" style="direction: ltr" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="779px">
        <LocalReport ReportPath="Reports\SectorActualBurnOff.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="SqlDataSource1" 
                    Name="SectorActualBurnOffDataSet" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FlightReportConnectionString %>" 
        SelectCommand="GetSectorActualBurnOff" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="From" Type="Int32" />
            <asp:Parameter DefaultValue="0" Name="To" Type="Int32" />
            <asp:Parameter DefaultValue="10/01/2012" Name="StartDate" Type="DateTime" />
            <asp:Parameter DefaultValue="10/15/2012" Name="EndDate" Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>
