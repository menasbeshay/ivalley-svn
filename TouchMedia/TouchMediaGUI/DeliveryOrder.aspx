<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAr.Master" AutoEventWireup="true" CodeBehind="DeliveryOrder.aspx.cs" Inherits="TouchMediaGUI.DeliveryOrder" %>

<%@ MasterType VirtualPath="~/MasterAr.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- BEGIN ADVANCED TABLE widget-->
    <ul class="breadcrumb">
        <li>
            <a href="Splash.aspx"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
        </li>
        <li>اوامر النقل<span class="divider-last">&nbsp;</span>
        </li>
    </ul>
    <div class="row-fluid">
        <div class="span12">
            <!-- BEGIN EXAMPLE TABLE widget-->
            <div style="text-align: center; margin-bottom: 7px">
                <button class="btn btn-warning"><i class="icon-plus icon-white"></i>انشاء امر نقل</button>
            </div>
            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-truck"></i>اوامر النقل </h4>
                    <span class="tools">
                        <a href="javascript:;" class="icon-chevron-down"></a>
                        <a href="javascript:;" class="icon-remove"></a>
                    </span>
                </div>
                <div class="widget-body">
                    <div class="row-fluid">
                        <div class="span12">
                            <asp:GridView ID="GrdDeliveryOrder" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false" OnRowCommand="GrdDeliveryOrder_RowCommand">
                                <Columns>
                                    <asp:BoundField HeaderText="كود العملية" DataField="GeneralDeliveryCode" />
                                    <asp:BoundField HeaderText="أسم العملية" DataField="DeliveryOrderName" />
                                    <asp:BoundField HeaderText="القسم" DataField="Department" />
                                    <asp:BoundField HeaderText="التاريخ" DataField="CreatedDate" />
                                    <asp:BoundField HeaderText="رقم السائق" DataField="DriverTelephone" />
                                    <asp:TemplateField HeaderText="الحالة" >
                                        <ItemTemplate>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="العمليات">
                                        <ItemTemplate>
                                             <asp:LinkButton ID="btnDeleteGrdDO" OnClientClick="return confirm('Are you sure you want to delete this Order ?')"  runat="server" CommandArgument='<%# Eval("DeliveryOrderID") %>' CommandName="DeleteGrdDO">Delete</asp:LinkButton>
                                            <asp:LinkButton ID="btnEditGrdDO" runat="server" CommandArgument='<%# Eval ("DeliveryOrderID") %>' CommandName="EditGrdDO">Edit</asp:LinkButton>
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
            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-reorder"></i>انشاء/تعديل امر نقل</h4>
                    <span class="tools">
                        <a href="javascript:;" class="icon-chevron-down"></a>
                        <a href="javascript:;" class="icon-remove"></a>
                    </span>
                </div>
                <div class="widget-body form">
                    <!-- BEGIN FORM-->
                    <div class="form-horizontal">
                        <div class="control-group">
                            <label class="control-label">أسم العميل</label>
                            <div class="controls">
                                <asp:TextBox runat="server" type="text" class="span3 " ID="txtDeliveryOrderName" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">كود العميل</label>
                            <div class="controls">
                                <asp:TextBox runat="server" type="text" class="span3 " ID="txtClientCode" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">كود العملية</label>
                            <div class="controls">
                                <asp:TextBox runat="server" type="text" class="span3 " ID="txtGeneralDeliveryCode" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">القسم الطالب</label>
                            <div class="controls">
                                <asp:TextBox runat="server" type="text" class="span3 " ID="txtDepartment" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">رقم الإذن</label>
                            <div class="controls">
                                <asp:TextBox runat="server" type="text" class="span3 " ID="txtPermission" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">السعر الكلي</label>
                            <div class="controls">
                                <asp:TextBox runat="server" type="text" class="span3 " ID="txtTotalPrice" />
                            </div>
                        </div>


                        <asp:Panel runat="server" GroupingText="بيانات السيارة">
                            <div class="space12 clearfix">
                                <div class="control-group">
                                    <label class="control-label">أسم مقاول النقل </label>
                                    <div class="controls">
                                        <asp:DropDownList runat="server" type="text" class="span3 " ID="drpTransformationSupplier" />
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">رقم السيارة </label>
                                    <div class="controls">
                                        <asp:TextBox runat="server" type="text" class="span3 " ID="txtCarNumber" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">عدد كيلومترات السيارة قبل  </label>
                                    <div class="controls">
                                        <asp:TextBox runat="server" type="text" class="span3 " ID="txtKiloMeterBefore" />
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">عدد كيلومترات السيارة بعد  </label>
                                    <div class="controls">
                                        <asp:TextBox runat="server" type="text" class="span3 " ID="txtkiloMeterAfter" />
                                    </div>
                                </div>

                            </div>
                        </asp:Panel>
                        <asp:Panel runat="server" GroupingText="بيانات السائق">
                            <div class="space12 clearfix">
                                <div class="control-group">
                                    <label class="control-label">أسم السائق </label>
                                    <div class="controls">
                                        <asp:TextBox runat="server" type="text" class="span3 " ID="txtDriverName" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">هاتف السائق </label>
                                    <div class="controls">
                                        <asp:TextBox runat="server" type="text" class="span3 " ID="txtDriverTelephone" />
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">رقم بطاقة السائق </label>
                                    <div class="controls">
                                        <asp:TextBox type="text" class="span3 " ID="txtDriverNationID" runat="server" />
                                    </div>
                                </div>
                                 <div class="span12 ">
                                <div>
                                    <asp:Button ID="btnDeliceryOrderGrd" OnClick="btnDeliceryOrderGrd_Click" runat="server" Text="Add" CssClass=" btn-primary " Width="20%" />
                                </div>
                            </div>

                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>


            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-reorder"></i>تفاصيل امر نقل</h4>
                    <span class="tools">
                        <a href="javascript:;" class="icon-chevron-down"></a>
                        <a href="javascript:;" class="icon-remove"></a>
                    </span>
                </div>
                <div class="widget-body form">
                    <!-- BEGIN FORM-->
                    <div class="form-horizontal">
                        <asp:Panel runat="server" GroupingText="خطة حركة السيارة">
                            <div class="block-margin-bottom-5 span12 clearfix ">
                                <div class="span6">
                                    <label class="control-label">المكان من</label>
                                    <asp:TextBox runat="server" type="text" class="span6 " ID="txtDeliveryFrom" />
                                </div>
                                <div class="span6">
                                    <label class="control-label">المكان الي</label>
                                    <asp:TextBox runat="server" type="text" class="span6 " ID="txtDeliveryTo" />
                                </div>
                            </div>

                            <div class="block-margin-bottom-5 span12 clearfix">
                                <div class="span6">
                                    <label class="control-label">الوقت من</label>
                                    <asp:TextBox runat="server" type="text" class="span6 " ID="txtDateFrom" />
                                </div>
                                <div class="span6">
                                    <label class="control-label">الوقت الي</label>
                                    <asp:TextBox runat="server" type="text" class="span6 " ID="txtDateTo" />
                                </div>
                            </div>
                            <div class="block-margin-bottom-5 span12 clearfix">
                                <div class="span6">
                                    <label class="control-label">أسم المستقبل</label>
                                    <asp:TextBox runat="server" type="text" class="span6 " ID="txtRecivableName" />
                                </div>
                                <div class="span6">
                                    <label class="control-label">رقم المستقبل</label>
                                    <asp:TextBox runat="server" type="text" class="span6 " ID="txtRecivableTelephone" />
                                </div>
                            </div>
                            <div class="block-margin-bottom-5 span12 clearfix">
                                <div class="span6">
                                    <label class="control-label">كود عملية النقل</label>
                                    <asp:TextBox runat="server" type="text" class="span6 " ID="txtDeliveryOrderCode" />
                                </div>
                                <div class="span6">
                                    <label class="control-label">ساعات الإنتظار</label>
                                    <asp:TextBox runat="server" type="text" class="span6 " ID="txtWatingHours" />
                                </div>
                            </div>
                            <div class="block-margin-bottom-5 span12 clearfix">
                                <div class="span6">
                                    <label class="control-label">السعر</label>
                                    <asp:TextBox runat="server" type="text" class="span6 " ID="txtPrice" />
                                </div>
                                <div class="span6">
                                    <label class="control-label">الحالة</label>
                                    <asp:DropDownList runat="server" type="text" class="span6 " ID="txtStatus" />
                                </div>
                            </div>
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
                                        <asp:BoundField HeaderText="الحالة" DataField="" />
                                        <asp:TemplateField HeaderText="العمليات">
                                        <ItemTemplate>
                                             <asp:LinkButton ID="btnDeleteDetailsGrdDO" OnClientClick="return confirm('Are you sure you want to delete this Order ?')"  runat="server" CommandArgument='<%# Eval("DeliveryOrderDetailsID") %>' CommandName="DeleteGrdDetailsDO">Delete</asp:LinkButton>
                                            <asp:LinkButton ID="btnEdiDetailsGrdDO" runat="server" CommandArgument='<%# Eval ("DeliveryOrderDetailsID") %>' CommandName="EditGrdDetailsDO">Edit</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    </Columns>

                                </asp:GridView>
                            </div>
                                </div>

                            <div class="span12 ">
                                <div>
                                    <asp:Button ID="addDeliveryOrderDetailsGrd" OnClick="addDeliveryOrderDetailsGrd_Click" runat="server" Text="Add" CssClass=" btn-primary " Width="20%" />
                                </div>
                            </div>

                        </asp:Panel>

                    </div>
                </div>
            </div>


        </div>
    </div>
   


        <!-- END ADVANCED TABLE widget-->

        <!-- END PAGE CONTENT-->
</asp:Content>
