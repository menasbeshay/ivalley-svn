<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EduMaster.Master" AutoEventWireup="true" CodeBehind="printreceipt.aspx.cs" Inherits="EduMontreal.Admin.printreceipt" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <rsweb:ReportViewer ID="uiReportViewer" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="600px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="95%" >       
    </rsweb:ReportViewer>    
</asp:Content>
