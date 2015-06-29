<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAr.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="TouchMediaGUI.Reports" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/fancybox/source/jquery.fancybox.css" rel="stylesheet" />
   <link rel="stylesheet" type="text/css" href="assets/gritter/css/jquery.gritter.css" />
   <link rel="stylesheet" type="text/css" href="assets/uniform/css/uniform.default.css" />
   <link rel="stylesheet" type="text/css" href="assets/chosen-bootstrap/chosen/chosen.css" />
   <link rel="stylesheet" type="text/css" href="assets/jquery-tags-input/jquery.tagsinput.css" />
   <link rel="stylesheet" type="text/css" href="assets/clockface/css/clockface.css" />
   <link rel="stylesheet" type="text/css" href="assets/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
   <link rel="stylesheet" type="text/css" href="assets/bootstrap-datepicker/css/datepicker.css" />
   <link rel="stylesheet" type="text/css" href="assets/bootstrap-timepicker/compiled/timepicker.css" />
   <link rel="stylesheet" type="text/css" href="assets/bootstrap-colorpicker/css/colorpicker.css" />
   <link rel="stylesheet" href="assets/bootstrap-toggle-buttons/static/stylesheets/bootstrap-toggle-buttons.css" />
   <link rel="stylesheet" href="assets/data-tables/DT_bootstrap.css" />
   <link rel="stylesheet" type="text/css" href="assets/bootstrap-daterangepicker/daterangepicker.css" />


    <style type="text/css">
        .row-fluid [class*="span"] {
            margin-right:0 !important;
        }
        .checkSections td label {
            display:inline;
            padding-right:5px;
            padding-left:10px;
        }

    </style>
</asp:Content>
 <asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScripts" runat="server">
   
   <script type="text/javascript" src="assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
   <script type="text/javascript" src="assets/bootstrap-daterangepicker/date.js"></script>
   <script type="text/javascript" src="assets/bootstrap-daterangepicker/daterangepicker.js"></script>   
   <script type="text/javascript" src="assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
   
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="widget-body">
        <div class="row-fluid">
            <div class="span12">
                <div class ="span6">
                    <label class="control-label"> التاريخ من </label>
                    <div class="input-append date date-picker" data-date-format="dd/mm/yyyy" data-date-viewmode="years">
                        <asp:TextBox runat="server" CssClass="m-ctrl-medium date-picker" Font-Size="16" type="text" ID="txtDateFrom" Style="direction: ltr" />
                        <span class="add-on">
                            <i class="icon-calendar"></i>
                        </span>
                    </div>
                </div>
                <div class ="span6">
                    <label class="control-label"> التاريخ الي </label>
                    <div class="input-append date date-picker" data-date-format="dd/mm/yyyy" data-date-viewmode="years">
                        <asp:TextBox runat="server" CssClass="m-ctrl-medium date-picker" Font-Size="16" type="text" ID="txtDateTo" Style="direction: ltr" />
                        <span class="add-on">
                            <i class="icon-calendar"></i>
                        </span>
                    </div>
                </div>
            </div>
            <div class="span12">
                <div class="span6">
                    <label class="control-label">أسم مقاول النقل </label>

                    <asp:DropDownList runat="server" type="text" ID="drpTransformationSupplier" />

                </div>
                <div class="span6">
                    <label class="control-label">الحالة </label>

                    <asp:DropDownList runat="server" type="text" ID="drpDeliveryOrderStatus" />

                </div>
            </div>

            <div class="span12">
                <div class="span6">
                <div style="margin-bottom: 7px;">
                    <asp:LinkButton runat="server" ID="btnDeliveryOrderReport" OnClick="btnDeliveryOrderReport_Click" class="btn btn-warning"><i class="icon-plus icon-white"></i>انشاء تقرير تشغيل السيارات</asp:LinkButton>
                </div>
                    </div>
                <div  class="span6">
                    <div style="margin-bottom: 7px;">
                    <asp:LinkButton runat="server" ID="btnStatus" OnClick="btnStatus_Click" class="btn btn-warning"><i class="icon-plus icon-white"></i>انشاء تقرير بالحالة</asp:LinkButton>
                </div>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span12" style="text-align: center">
                    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Height="19cm" Width="1000px"></rsweb:ReportViewer>
                </div>
                <div class="span12" style="text-align: center">
                    <rsweb:ReportViewer ID="ReportViewer2" runat="server" Height="19cm" Width="1000px"></rsweb:ReportViewer>
                </div>
            </div>
            </div>
    </div>
</asp:Content>
