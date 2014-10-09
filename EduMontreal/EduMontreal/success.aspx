<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EduMaster.Master" AutoEventWireup="true" CodeBehind="success.aspx.cs" Inherits="EduMontreal.success" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="note note-success" id="ResponseSuccess"  style="position:relative;">
                                Your payment has been approved with transaction id :
                                <asp:Label ID="uiLabeltrx" runat="server" ></asp:Label>
                                <div class="clearfix" style="clear:both;height:10px;"></div>
                                Edu Montreal administration will review your payment and contact you soon.
                                <div class="clearfix" style="clear:both;height:10px;"></div>
                                <a href="checkapp" class="btn btn-primary" style="margin:0 auto;">Proceed to next step</a>

                                <i class="fa fa-check pull-right" style="color:green;font-size:6em;position:absolute;top:30px;right:30%;"></i>
                            </div>

    <div style="clear:both;height:2px;"></div>
    <div class="col-lg-12">
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Height="300px" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
            <LocalReport ReportEmbeddedResource="EduMontreal.Receipt.rdlc">
                
            </LocalReport>
            
        </rsweb:ReportViewer>
    </div>
</asp:Content>
