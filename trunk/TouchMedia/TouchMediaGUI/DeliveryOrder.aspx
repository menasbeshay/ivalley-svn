<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAr.Master" AutoEventWireup="true" CodeBehind="DeliveryOrder.aspx.cs" Inherits="TouchMediaGUI.DeliveryOrder" %>

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
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScripts" runat="server">
   
   <script type="text/javascript" src="assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
   <script type="text/javascript" src="assets/bootstrap-daterangepicker/date.js"></script>
   <script type="text/javascript" src="assets/bootstrap-daterangepicker/daterangepicker.js"></script>   
   <script type="text/javascript" src="assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
   
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- BEGIN ADVANCED TABLE widget-->
    <ul class="breadcrumb">
        <li>
            <a href="Splash.aspx"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
        </li>
        <li>اوامر تشغيل السيارات<span class="divider-last">&nbsp;</span>
        </li>
    </ul>
    <div class="row-fluid">
        <div class="span12">
            <!-- BEGIN EXAMPLE TABLE widget-->
           
            <div class="widget" id="WidGrdGeneralDeliveryOrder" runat="server">
                <div class="widget-title">
                    <h4><i class="icon-truck"></i>اوامر تشغيل السيارات </h4>
                    <span class="tools">
                        <a href="javascript:;" class="icon-chevron-down"></a>
                        <a href="javascript:;" class="icon-remove"></a>
                    </span>

                </div>
                <div class="widget-body">
                    <div class="row-fluid">
                        <div class="span12">
                             <div style="margin-bottom: 7px ; " >
                <asp:LinkButton runat="server"  ID="createNewDeliveryOrder" OnClick="createNewDeliveryOrder_Click" class="btn btn-warning"><i class="icon-plus icon-white"></i>انشاء امر تشغيل سيارة</asp:LinkButton>
            </div>
                            <asp:GridView ID="GrdDeliveryOrder" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false" OnRowCommand="GrdDeliveryOrder_RowCommand">
                                <Columns>
                                    <asp:BoundField HeaderText="كود العملية" DataField="GeneralDeliveryCode" />
                                    <asp:BoundField HeaderText="أسم المشوار" DataField="DeliveryOrderName" />
                                    <asp:BoundField HeaderText="القسم" DataField="Department" />
                                    <asp:BoundField HeaderText="التاريخ" DataField="DeliveryOrderDate" DataFormatString="{0:dd/MM/yyyy}"/>
                                    <asp:BoundField HeaderText="رقم السائق" DataField="DriverTelephone" />
                                    <asp:TemplateField HeaderText="الحالة">
                                        
                                            <ItemTemplate>
                                                <span class='label label-<%# Eval("StatusClass") %>'><%# Eval("StatusNameAr") %></span>
                                            </ItemTemplate>
                                        

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="العمليات">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnDeleteGrdDO" OnClientClick="return confirm('هل تريد حذف هذا السجل ?')" runat="server" CommandArgument='<%# Eval("DeliveryOrderID") %>' CommandName="DeleteGrdDO">حذف</asp:LinkButton>
                                            <asp:LinkButton ID="btnEditGrdDO" runat="server" CommandArgument='<%# Eval ("DeliveryOrderID") %>' CommandName="EditGrdDO">تعديل</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>

                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END EXAMPLE TABLE widget-->
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <!-- BEGIN SAMPLE FORM widget-->
            <div class="widget" id="WidEditDeliveryOrder" runat="server" visible="false">
                <div class="widget-title">
                    <h4><i class="icon-reorder"></i>انشاء/تعديل امر تشغيل سيارة</h4>
                    <span class="tools">
                        <a href="javascript:;" class="icon-chevron-down"></a>
                        <a href="javascript:;" class="icon-remove"></a>
                    </span>
                </div>
                <div class="widget-body form">
                    <!-- BEGIN FORM-->
                    <div class="form-horizontal">

                       <div class="block-margin-bottom-5 span12 clearfix">
                            <div class="span6">
                                <label class="control-label">أسم المشوار</label>
                               <asp:TextBox runat="server" type="text"  ID="txtDeliveryOrderName" />
                            </div>
                            <div class="span6">
                                <label class="control-label">التاريخ</label>
                                <div class="input-append date date-picker" data-date-format="dd/mm/yyyy" data-date-viewmode="years" >
                                <asp:TextBox runat="server" CssClass="m-ctrl-medium date-picker" Font-Size="16"  type="text"  ID="txtDeliveryOrderDate" style="direction:ltr"/>
                                    <span class="add-on">
                                        <i class="icon-calendar"></i>
                                    </span>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtDeliveryOrderDate" ValidationGroup="dlr" runat="server" ForeColor="Red" Font-Bold="true" ErrorMessage="*"/>

                            </div>
                           
                        </div>
                        <div class="block-margin-bottom-5 span12 clearfix">
                            <div class="span6">
                                <label class="control-label">كود العميل</label>
                               <asp:TextBox runat="server" type="text"  ID="txtClientCode" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtClientCode" ValidationGroup="dlr" runat="server" ForeColor="Red" Font-Bold="true" ErrorMessage="*"/>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtClientCode"
                                             ValidationExpression="^\d+$"
                                             Display="Static"
                                             ErrorMessage="أرقام فقط"
                                             ValidationGroup="dlr"
                                             runat="server"></asp:RegularExpressionValidator>
                            </div>
                            <div class="span6">
                                <label class="control-label">كود العملية</label>
                                <asp:TextBox runat="server" type="text"  ID="txtGeneralDeliveryCode" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtGeneralDeliveryCode" ValidationGroup="dlr" runat="server" ForeColor="Red" Font-Bold="true" ErrorMessage="*"/>
                            </div>
                        </div>
                        <div class="block-margin-bottom-5 span12 clearfix">
                            <div class="span6">
                               <label class="control-label">القسم الطالب</label>
                               <asp:DropDownList runat="server" type="text"  ID="drpDepartment" />
                            </div>
                            <div class="span6">
                                <label class="control-label">المسئول بالقسم الطالب</label>
                                <asp:TextBox runat="server" type="text"  ID="txtDepartmentResponsable" />
                            </div>
                        </div>
                        <div class="block-margin-bottom-5 span12 clearfix">
                            <div class="span6">
                                <label class="control-label">رقم الإذن</label>
                              <asp:TextBox runat="server" type="text"  ID="txtPermission" />
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtPermission"
                                             ValidationExpression="^\d+$"
                                             Display="Static"
                                             ErrorMessage="أرقام فقط"
                                             ValidationGroup="dlr"
                                             runat="server"></asp:RegularExpressionValidator>
                            </div>
                            <div class="span6">
                                <label class="control-label">السعر الكلي</label>
                                <asp:TextBox runat="server" type="text"  ID="txtTotalPrice" />
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="txtTotalPrice"
                                             ValidationExpression="^[0-9]*(?:\.[0-9]*)?$"
                                             Display="Static" 
                                             ErrorMessage="أرقام فقط"
                                             ValidationGroup="dlr"
                                             runat="server"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="block-margin-bottom-5 span12 clearfix">
                            <div class="span6">
                                <label class="control-label">الحالة</label>
                               <asp:DropDownList runat="server" type="text"  ID="drpStatusGeneral" />
                            </div>
                            <div class="span6">
                                <%--<label class="control-label">التاريخ</label>
                                <asp:TextBox runat="server" type="text" class="span3 " ID="TextBox8" />--%>
                            </div>
                        </div>


                 


                    <asp:Panel runat="server" GroupingText="بيانات السيارة">
                        <div class="block-margin-bottom-5 span12 clearfix">
                        
                            <div class=" span6" >
                                <label class="control-label">أسم مقاول النقل </label>
                                
                                    <asp:DropDownList runat="server" type="text"  ID="drpTransformationSupplier" />
                                
                            </div>
                            <div class=" span6">
                                <label class="control-label">نوع السيارة </label>
                                
                                    <asp:TextBox runat="server" type="text"  ID="txtCarType" />
                                
                            </div>
                            </div>
                        <div class="block-margin-bottom-5 span12 clearfix">

                            

                            <div class=" span6">
                                <label class="control-label">عدد كيلومترات السيارة قبل  </label>

                                <asp:TextBox runat="server" type="text" ID="txtKiloMeterBefore" />
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtKiloMeterBefore" ValidationGroup="dlr" runat="server" ForeColor="Red" Font-Bold="true" ErrorMessage="*"/>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="txtKiloMeterBefore"
                                             ValidationExpression="^[0-9]*(?:\.[0-9]*)?$"
                                             Display="Static"
                                             ErrorMessage="أرقام فقط"
                                             ValidationGroup="dlr"
                                             runat="server"></asp:RegularExpressionValidator>
                            </div>
                             <div class="control-group">
                                <label class="control-label">عدد كيلومترات السيارة بعد  </label>
                               
                                    <asp:TextBox runat="server" type="text"  ID="txtkiloMeterAfter" />
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="txtKiloMeterAfter"
                                             ValidationExpression="^[0-9]*(?:\.[0-9]*)?$"
                                             Display="Static"
                                             ErrorMessage="أرقام فقط"
                                             ValidationGroup="dlr"
                                             runat="server"></asp:RegularExpressionValidator>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtkiloMeterAfter" ValidationGroup="dlr" runat="server" ForeColor="Red" Font-Bold="true" ErrorMessage="*"/>
                            </div>
                        </div>
                        <div class="block-margin-bottom-5 span12 clearfix">
                           <div class=" span6">
                                <label class="control-label">رقم السيارة </label>

                                <asp:TextBox runat="server" type="text" ID="txtCarNumber" />

                            </div>
                            </div>

                       
                    </asp:Panel>
                    <asp:Panel runat="server" GroupingText="بيانات السائق">
                         <div class="block-margin-bottom-5 span12 clearfix">
                            <div class=" span6">
                                <label class="control-label">أسم السائق </label>
                               
                                    <asp:TextBox runat="server" type="text"  ID="txtDriverName" />
                                </div>
                           <div class="span6">
                                <label class="control-label">هاتف السائق </label>
                                
                                    <asp:TextBox runat="server" type="text"  ID="txtDriverTelephone" />
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator10" ControlToValidate="txtDriverTelephone"
                                             ValidationExpression="^\d+$"
                                             Display="Static"
                                             ErrorMessage="أرقام فقط"
                                             ValidationGroup="dlr"
                                             runat="server"></asp:RegularExpressionValidator>
                                </div>
                            
                             </div>
                        <div class="block-margin-bottom-5 span12 clearfix">
                            <div class="control-group span6">
                                <label class="control-label">رقم بطاقة السائق </label>
                               
                                    <asp:TextBox type="text"  ID="txtDriverNationID" runat="server" MaxLength="14" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="txtDriverNationID"
                                             ValidationExpression="^\d+$"
                                             Display="Static"
                                             ErrorMessage="أرقام فقط"
                                             ValidationGroup="dlr"
                                             runat="server"></asp:RegularExpressionValidator>
                            </div>
                            </div>
                       
                            <div class="span12 ">
                                <div>
                                    <%-- <asp:Button ID="btnDeliceryOrderGrd"  runat="server" Text="Add" CssClass=" btn btn-success " Width="20%" />--%>
                                    <div style="margin-bottom: 10px">
                                        <asp:LinkButton runat="server" ID="btnDeliceryOrderGrd" ValidationGroup="dlr" OnClick="btnDeliceryOrderGrd_Click" class="btn btn-success"><i class="icon-ok icon-white" ></i>حفظ</asp:LinkButton>
                                         <asp:LinkButton runat="server" ID="btnCancelDeliveryOrderGrid"  OnClick="btnCancelDeliveryOrderGrid_Click" class="btn btn-danger"><i class="icon-remove icon-white" ></i>الغاء</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        
                        </asp:Panel>
                        
                        
                   

                    <asp:Panel runat="server" GroupingText="خطة حركة السيارة" ID="PanelDeliveryOrderDetails">
                        <div class="block-margin-bottom-5 span12 clearfix ">
                            <div class="span6">
                                <label class="control-label">المكان من</label>
                                <asp:TextBox runat="server" type="text"  ID="txtDeliveryFrom" />
                            </div>
                            <div class="span6">
                                <label class="control-label">المكان الي</label>
                                <asp:TextBox runat="server" type="text"  ID="txtDeliveryTo" />
                            </div>
                        </div>

                        <div class="block-margin-bottom-5 span12 clearfix">
                            <div class="span6">
                                <label class="control-label">الوقت من</label>
                                
                                        <div class="input-append bootstrap-timepicker-component">
                                <asp:TextBox runat="server" CssClass=" m-ctrl-small timepicker-default" type="text"  ID="txtDateFrom" />
                                            <span class="add-on"><i class="icon-time"></i></span>
                                            </div>
                                    
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtDateFrom" ValidationGroup="dlrd" runat="server" ForeColor="Red" Font-Bold="true" ErrorMessage="*"/>
                            </div>
                            <div class="span6">
                                <label class="control-label">الوقت الي</label>
                                
                                        <div class="input-append bootstrap-timepicker-component">
                                <asp:TextBox runat="server" type="text" CssClass=" m-ctrl-small timepicker-default"  ID="txtDateTo" />
                                             <span class="add-on"><i class="icon-time"></i></span>
                                            </div>
                                <asp:RequiredFieldValidator  ID="RequiredFieldValidator7" ControlToValidate="txtDateTo" ValidationGroup="dlrd" runat="server" ForeColor="Red" Font-Bold="true" ErrorMessage="*"/>
                            </div>
                        </div>
                        <div class="block-margin-bottom-5 span12 clearfix">
                            <div class="span6">
                                <label class="control-label">أسم المستقبل</label>
                                <asp:TextBox runat="server" type="text"  ID="txtRecivableName" />
                            </div>
                            <div class="span6">
                                <label class="control-label">رقم المستقبل</label>
                                <asp:TextBox runat="server" type="text"  ID="txtRecivableTelephone" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ControlToValidate="txtRecivableTelephone"
                                             ValidationExpression="^\d+$"
                                             Display="Static"
                                             ErrorMessage="أرقام فقط"
                                             ValidationGroup="dlr"
                                             runat="server"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="block-margin-bottom-5 span12 clearfix">
                            <div class="span6">
                                <label class="control-label">كود عملية النقل</label>
                                <asp:TextBox runat="server" type="text"  ID="txtDeliveryOrderCode" />
                            </div>
                            <div class="span6">
                                <label class="control-label">ساعات الإنتظار</label>
                                <asp:TextBox runat="server" type="text"  ID="txtWatingHours" />
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ControlToValidate="txtWatingHours"
                                             ValidationExpression="^[0-9]*(?:\.[0-9]*)?$"
                                             Display="Static"
                                             ErrorMessage="أرقام فقط"
                                             ValidationGroup="dlr"
                                             runat="server"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="block-margin-bottom-5 span12 clearfix">
                            <div class="span6">
                                <label class="control-label">السعر</label>
                                <asp:TextBox runat="server" type="text"   ID="txtPrice" />
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="txtPrice"
                                             ValidationExpression="^[0-9]*(?:\.[0-9]*)?$"
                                             Display="Static"
                                             ErrorMessage="أرقام فقط"
                                             ValidationGroup="dlr"
                                             runat="server"></asp:RegularExpressionValidator>
                            </div>
                            <div class="span6">
                                <label class="control-label">الحالة</label>
                                <asp:DropDownList runat="server" type="text"  ID="drpStatusDetails" />
                            </div>
                        </div>

                        <div class="span12 ">
                            <div style= "margin-bottom: 10px">
                                <asp:LinkButton runat="server" ID="addDeliveryOrderDetailsGrd" ValidationGroup="dlrd" OnClick="addDeliveryOrderDetailsGrd_Click" class="btn btn-success"><i class="icon-ok icon-white" ></i>حفظ</asp:LinkButton>
                                <asp:LinkButton runat="server" ID="btnCancelDeliveryOrderDetails"  OnClick="btnCancelDeliveryOrderDetails_Click" class="btn btn-danger"><i class="icon-remove icon-white" ></i>الغاء</asp:LinkButton>
                            </div>
                            <%--<div>
                                    <asp:Button ID="addDeliveryOrderDetailsGrd" OnClick="addDeliveryOrderDetailsGrd_Click" runat="server" Text="Add" CssClass=" btn-primary " Width="20%" />
                                </div>--%>
                            
                        </div>
                    </asp:Panel>
                        <div class="row-fluid">
        <div class="block-margin-bottom-5 span12 clearfix">
            <asp:GridView ID="grdDeliveryOrderDetails" OnRowCommand="grdDeliveryOrderDetails_RowCommand" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField HeaderText="المكان من" DataField="DeliveryFrom" />
                    <asp:BoundField HeaderText="المكان الي" DataField="DeliveryTo" />
                    <asp:BoundField HeaderText="الوقت من" DataField="DateFrom" />
                    <asp:BoundField HeaderText="الوقت الي" DataField="DateTo" />
                    <asp:BoundField HeaderText="أسم المستقبل" DataField="ReceivableName" />
                    <asp:BoundField HeaderText="رقم المستقبل" DataField="ReceivableTelephone" />
                    <asp:BoundField HeaderText=" كود عملية النقل" DataField="DeliveryOrderCode" />
                    <asp:BoundField HeaderText=" ساعات الإنتظارل" DataField="WatingHours" />
                    <asp:BoundField HeaderText=" السعر" DataField="Price" />
                    
                    <asp:TemplateField HeaderText="الحالة">
                        <ItemTemplate>
                            <span class='label label-<%# Eval("StatusClass") %>'><%# Eval("StatusNameAr") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="العمليات">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDeleteDetailsGrdDO" OnClientClick="return confirm('هل تريد حذف هذا السجل ?')" runat="server" CommandArgument='<%# Eval("DeliveryOrderDetailsID") %>' CommandName="DeleteGrdDetailsDO">حذف</asp:LinkButton>
                            <asp:LinkButton ID="btnEdiDetailsGrdDO" runat="server" CommandArgument='<%# Eval ("DeliveryOrderDetailsID") %>' CommandName="EditGrdDetailsDO">تعديل</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
        </div>
    </div>
                        </div>
                </div>

                    </div>
        </div>
    </div>


    




    

  



    <!-- END ADVANCED TABLE widget-->

    <!-- END PAGE CONTENT-->
</asp:Content>
