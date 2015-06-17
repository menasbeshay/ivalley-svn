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
                            <asp:GridView ID="GrdDeliveryOrder" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField HeaderText="كود العملية" DataField="GeneralDeliveryCode" />
                                    <asp:BoundField HeaderText="أسم العملية" DataField="DeliveryOrderName" />
                                    <asp:BoundField HeaderText="القسم" DataField="Department" />
                                    <asp:BoundField HeaderText="التاريخ" DataField="CreatedDate" />
                                    <asp:BoundField HeaderText="رقم السائق" DataField="DriverTelephone" />
                                    <asp:TemplateField HeaderText="الحالة" />
                                    <asp:ButtonField HeaderText="عمليات" ButtonType="Image" />
                                </Columns>

                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END EXAMPLE TABLE widget-->
        </div>
    </div>

    <!-- END ADVANCED TABLE widget-->

    <!-- END PAGE CONTENT-->

</asp:Content>
