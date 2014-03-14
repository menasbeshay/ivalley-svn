<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/IStock.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="I_Stock.Admin.Reports" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="width:90%;text-align:center;margin:0 auto; background-color:#fff;">
    <rsweb:ReportViewer ID="uiReportViewerMain" runat="server" Width="1000px" Height="800px" >
    </rsweb:ReportViewer>
</div>
</asp:Content>
