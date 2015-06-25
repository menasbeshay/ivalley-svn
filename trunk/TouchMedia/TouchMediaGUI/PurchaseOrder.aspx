<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAr.Master" AutoEventWireup="true" CodeBehind="PurchaseOrder.aspx.cs" Inherits="TouchMediaGUI.PurchaseOrder" %>

<%@ MasterType VirtualPath="~/MasterAr.Master" %>
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
    <asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScriptsPurchaseOrder" runat="server">
   
   <script type="text/javascript" src="assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
   <script type="text/javascript" src="assets/bootstrap-daterangepicker/date.js"></script>
   <script type="text/javascript" src="assets/bootstrap-daterangepicker/daterangepicker.js"></script>   
   <script type="text/javascript" src="assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
   
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul class="breadcrumb">
        <li>
            <a href="Splash.aspx"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
        </li>
        <li><a>اوامر النقل</a><span class="divider-last">&nbsp;</span>
        </li>
    </ul>
    <div class="row-fluid">
        <div class="span12">
            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-shopping-cart"></i>اوامر الشراء </h4>
                    <span class="tools">
                        <a href="javascript:;" class="icon-chevron-down"></a>
                    </span>
                </div>
                <div class="widget-body">
                    <div class="row-fluid">
                        <div class="span12">
                            <asp:Panel ID="PanelPurchaseOrdersGrid" runat="server">
                                <div class="span4">
                                    <asp:LinkButton ID="btnAddNewOrder" CssClass="btn btn-warning" OnClick="btnAddNewOrder_Click" runat="server"><i class="icon-plus icon-white"></i> انشاء امر شراء</asp:LinkButton>
                                </div>
                                <asp:GridView ID="GrdViewPurchaseOrders" OnRowCommand="GrdViewPurchaseOrders_RowCommand" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" runat="server">
                                <Columns>
                                    <asp:BoundField DataField="PurchaseOrderNumber" HeaderText="رقم امر الشراء" />
                                    <asp:BoundField DataField="PurchaseOrderDate" HeaderText="تاريخ امر الشراء" />
                                    <asp:BoundField DataField="DeliveryDate" HeaderText="ميعاد التسليم" />
                                    <asp:BoundField DataField="DeliveryPlace" HeaderText="مكان التسليم" />
                                    <asp:TemplateField HeaderText="العمليات">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnDelete" OnClientClick="return confirm('هل تريد حذف هذا السجل ?')" runat="server" CommandArgument='<%# Eval("PurchaseOrderID") %>' CommandName="deleteOrder">Delete</asp:LinkButton>
                                            <asp:LinkButton ID="btnEdit" runat="server" CommandArgument='<%# Eval ("PurchaseOrderID") %>' CommandName="editOrder">Edit</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            </asp:Panel>
                            <asp:Panel ID="PanelPurchaseOrderGeneral" runat="server">
                                <div class="form-horizontal">
                                    <div class="block-margin-bottom-5 span12 clearfix">
                                        <div class="span6">
                                             <label class="control-label">رقم أمر الشراء</label>
                                             <asp:TextBox runat="server" type="text"  ID="txtPurchaseOrderNumber" />
                                        </div>
                                        <div class="span6">
                                            <label class="control-label">التاريخ</label>
                                            <div class="input-append date date-picker" data-date-format="dd/mm/yyyy" data-date-viewmode="years">
                                                <asp:TextBox runat="server" CssClass="m-ctrl-medium date-picker" Font-Size="16" type="text" ID="txtPurchaseOrderDate" Style="direction: ltr" />
                                                <span class="add-on">
                                                    <i class="icon-calendar"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="block-margin-bottom-5 span12 clearfix">
                                        <div class="span6">
                                            <label class="control-label">الادارة</label>
                                            <asp:TextBox runat="server" type="text" ID="txtManagement" />
                                        </div>

                                        <div class="span6">
                                            
                                                <label class="control-label">نوع المنتج</label>
                                                <%--<div class="controls">
                                                    <label class="checkbox">
                                                        <input type="checkbox" value="" />
                                                        منتج نهائي
                                                    </label>
                                                    <label class="checkbox">
                                                        <input type="checkbox" value="" />
                                                        عينة
                                                    </label>
                                                    <label class="checkbox">
                                                        <input type="checkbox" value="" />
                                                        منتج تحت التصنيع
                                                    </label>
                                                </div>--%>
                                                <asp:CheckBoxList ID="CheckBoxList1" CssClass="checkSections" RepeatDirection="Horizontal" RepeatColumns="3" runat="server">
                                                    <asp:ListItem >
                                                        منتج نهائي
                                                    </asp:ListItem>
                                                    <asp:ListItem>
                                                        عينة
                                                    </asp:ListItem>
                                                    <asp:ListItem>
                                                        منتج تحت التصنيع
                                                    </asp:ListItem>
                                                </asp:CheckBoxList>
                                            
                                        </div>
                                    </div>
                                    <div class="block-margin-bottom-5 span12 clearfix">
                                        <div class="span6">
                                             <label class="control-label">ميعاد التسليم</label>
                                            <div class="input-append date date-picker" data-date-format="dd/mm/yyyy" data-date-viewmode="years">
                                                <asp:TextBox runat="server" CssClass="m-ctrl-medium date-picker" Font-Size="16" type="text" ID="txtDeliveryDate" Style="direction: ltr" />
                                                <span class="add-on">
                                                    <i class="icon-calendar"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="span6">
                                             <label class="control-label">مكان التسليم</label>
                                            <asp:TextBox runat="server" type="text" ID="txtDeliveryPlace" />
                                        </div>
                                    </div> 
                                    <div class="block-margin-bottom-5 span12 clearfix">
                                        <div class="span6">
                                        <label class="control-label">شروط الدفع</label>
                                            <asp:TextBox runat="server" type="text" ID="txtPaymentRequirement" />
                                            </div>
                                        <div class="span6">
                                            <label class="control-label">المدير المسئول</label>
                                            <asp:TextBox runat="server" type="text" ID="TxtManagerName" />
                                        </div>
                                    </div> 
                                    <div class="span12 ">
                                <div>
                                   
                                    <div style="margin-bottom: 10px">
                                        <asp:LinkButton runat="server" ID="btnSavePurchaseOrderGeneralGrid"  OnClick="btnSavePurchaseOrderGeneralGrid_Click" class="btn btn-success"><i class="icon-ok icon-white" ></i>حفظ</asp:LinkButton>
                                         <asp:LinkButton runat="server" ID="btnCancelPurchaseOrderGeneralGrid"  OnClick="btnCancelPurchaseOrderGeneralGrid_Click" class="btn btn-danger"><i class="icon-remove icon-white" ></i>الغاء</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                                </div>
                            </asp:Panel>


                            
                            <asp:Panel runat="server" ID="PanelPurchaseOrderDetails" GroupingText="تفاصيل طلب الشراء" >
                                <div class="form-horizontal">
                                    <div class ="block-margin-bottom-5 span12 clearfix">
                                        <div class ="span6">
                                            <label class="control-label">اجمالي القيمة</label>
                                            <asp:TextBox runat="server" type="text" ID="txtTotalValue" />
                                        </div>
                                        <div class="span6">
                                            <label class="control-label">سعر الوحدة</label>
                                            <asp:TextBox runat="server" type="text" ID="txtUnitPrice" />
                                        </div>
                                    </div>
                                    <div class="block-margin-bottom-5 span12 clearfix">
                                        <div class="span6">
                                            <label class="control-label">الكمية المطلوبة</label>
                                            <asp:TextBox runat="server" type="text" ID="txtQuantityRequired" />
                                        </div>
                                        <div class="span6">
                                            <label class="control-label">المخزون</label>
                                            <asp:TextBox runat="server" type="text" ID="txtStockOnHands" />
                                        </div>
                                    </div> 
                                    <div class ="block-margin-bottom-5 span12 clearfix">
                                        <div class="span6">
                                            <label class="control-label">الوحدة</label>
                                            <asp:TextBox runat="server" type="text" ID="txtUnit" />
                                        </div>
                                        <div class="span6">
                                            <label class="control-label">البيانات</label>
                                            <asp:TextBox runat="server" type="text" ID="txtDescription" />
                                        </div>
                                    </div>
                                   <div class="span12 ">
                                <div>
                                   
                                    <div style="margin-bottom: 10px">
                                        <asp:LinkButton runat="server" ID="btnSavePurchaseOrderDetails"  OnClick="btnSavePurchaseOrderDetails_Click" class="btn btn-success"><i class="icon-ok icon-white" ></i>حفظ</asp:LinkButton>
                                         <asp:LinkButton runat="server" ID="btnCancelPurchaseOrderDetails"  OnClick="btnCancelPurchaseOrderDetails_Click" class="btn btn-danger"><i class="icon-remove icon-white" ></i>الغاء</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="PanelGrdPurcahseOrderDetails" runat="server">
                                
                                <asp:GridView ID="grdPurchaseOrderDetails" OnRowCommand="grdPurchaseOrderDetails_RowCommand" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" runat="server">
                                <Columns>
                                    <asp:BoundField DataField="TotalValue" HeaderText="اجمالي القيمة" />
                                    <asp:BoundField DataField="UnitPrice" HeaderText="سعر الوحدة" />
                                    <asp:BoundField DataField="QuantityRequired" HeaderText="الكمية المطلوبة" />
                                    <asp:BoundField DataField="StockOnHand" HeaderText="المخزون" />
                                     <asp:BoundField DataField="Unit" HeaderText="الوحدة" />
                                     <asp:BoundField DataField="Description" HeaderText="البيانات" />
                                    <asp:TemplateField HeaderText="العمليات">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnDelete" OnClientClick="return confirm('هل تريد حذف هذا السجل ?')" runat="server" CommandArgument='<%# Eval("PurchaseOrderID") %>' CommandName="deleteOrder">Delete</asp:LinkButton>
                                            <asp:LinkButton ID="btnEdit" runat="server" CommandArgument='<%# Eval ("PurchaseOrderID") %>' CommandName="editOrder">Edit</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScripts" runat="server">
</asp:Content>
