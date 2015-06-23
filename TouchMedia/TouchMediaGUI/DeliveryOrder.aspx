<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAr.Master" AutoEventWireup="true" CodeBehind="DeliveryOrder.aspx.cs" Inherits="TouchMediaGUI.DeliveryOrder" %>

<%@ MasterType VirtualPath="~/MasterAr.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .row-fluid [class*="span"] {
            margin-right:0 !important;
        }
    </style>
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
                                    <asp:BoundField HeaderText="أسم العملية" DataField="DeliveryOrderName" />
                                    <asp:BoundField HeaderText="القسم" DataField="Department" />
                                    <asp:BoundField HeaderText="التاريخ" DataField="CreatedDate" />
                                    <asp:BoundField HeaderText="رقم السائق" DataField="DriverTelephone" />
                                    <asp:TemplateField HeaderText="الحالة">
                                        <ItemTemplate>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="العمليات">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnDeleteGrdDO" OnClientClick="return confirm('Are you sure you want to delete this Order ?')" runat="server" CommandArgument='<%# Eval("DeliveryOrderID") %>' CommandName="DeleteGrdDO">حذف</asp:LinkButton>
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
                                <asp:TextBox runat="server" type="text"  ID="txtDeliveryOrderDate" />
                            </div>
                        </div>
                        <div class="block-margin-bottom-5 span12 clearfix">
                            <div class="span6">
                                <label class="control-label">كود العميل</label>
                               <asp:TextBox runat="server" type="text"  ID="txtClientCode" />
                            </div>
                            <div class="span6">
                                <label class="control-label">كود العملية</label>
                                <asp:TextBox runat="server" type="text"  ID="txtGeneralDeliveryCode" />
                            </div>
                        </div>
                        <div class="block-margin-bottom-5 span12 clearfix">
                            <div class="span6">
                               <label class="control-label">القسم الطالب</label>
                               <asp:TextBox runat="server" type="text"  ID="txtDepartment" />
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
                            </div>
                            <div class="span6">
                                <label class="control-label">السعر الكلي</label>
                                <asp:TextBox runat="server" type="text"  ID="txtTotalPrice" />
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
                                <label class="control-label">رقم السيارة </label>

                                <asp:TextBox runat="server" type="text" ID="txtCarNumber" />

                            </div>

                            <div class=" span6">
                                <label class="control-label">عدد كيلومترات السيارة قبل  </label>

                                <asp:TextBox runat="server" type="text" ID="txtKiloMeterBefore" />

                            </div>
                        </div>
                        <div class="block-margin-bottom-5 span12 clearfix">
                            <div class="control-group">
                                <label class="control-label">عدد كيلومترات السيارة بعد  </label>
                               
                                    <asp:TextBox runat="server" type="text"  ID="txtkiloMeterAfter" />
                               
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
                                </div>
                            
                             </div>
                        <div class="block-margin-bottom-5 span12 clearfix">
                            <div class="control-group span6">
                                <label class="control-label">رقم بطاقة السائق </label>
                               
                                    <asp:TextBox type="text"  ID="txtDriverNationID" runat="server" />
                                
                            </div>
                            </div>
                       
                            <div class="span12 ">
                                <div>
                                    <%-- <asp:Button ID="btnDeliceryOrderGrd"  runat="server" Text="Add" CssClass=" btn btn-success " Width="20%" />--%>
                                    <div style="text-align: center; margin-bottom: 10px">
                                        <asp:LinkButton runat="server" ID="btnDeliceryOrderGrd" OnClick="btnDeliceryOrderGrd_Click" class="btn btn-success"><i class="icon-ok icon-white" ></i>حفظ</asp:LinkButton>
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
                                <asp:TextBox runat="server" type="text"  ID="txtDateFrom" />
                            </div>
                            <div class="span6">
                                <label class="control-label">الوقت الي</label>
                                <asp:TextBox runat="server" type="text"  ID="txtDateTo" />
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
                            </div>
                        </div>
                        <div class="block-margin-bottom-5 span12 clearfix">
                            <div class="span6">
                                <label class="control-label">السعر</label>
                                <asp:TextBox runat="server" type="text"  ID="txtPrice" />
                            </div>
                            <div class="span6">
                                <label class="control-label">الحالة</label>
                                <asp:DropDownList runat="server" type="text"  ID="drpStatusDetails" />
                            </div>
                        </div>

                        <div class="span12 ">
                            <div style="text-align: center; margin-bottom: 10px">
                                <asp:LinkButton runat="server" ID="addDeliveryOrderDetailsGrd" OnClick="addDeliveryOrderDetailsGrd_Click" class="btn btn-success"><i class="icon-ok icon-white" ></i>حفظ</asp:LinkButton>
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
                    <%--                            <asp:BoundField HeaderText="الحالة" DataField="" />--%>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <%--      <asp:Label ID="Label1" runat="server" CssClass="<%# "label label-" + Eval("StatusClass").ToString() %>" Text="<%# Eval("DeliveryOrderStatusNameAr") %>"></asp:Label>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="العمليات">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDeleteDetailsGrdDO" OnClientClick="return confirm('Are you sure you want to delete this Order ?')" runat="server" CommandArgument='<%# Eval("DeliveryOrderDetailsID") %>' CommandName="DeleteGrdDetailsDO">حذف</asp:LinkButton>
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
