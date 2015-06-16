<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAr.Master" AutoEventWireup="true" CodeBehind="DeliveryOrder.aspx.cs" Inherits="TouchMediaGUI.DeliveryOrder" %>
<%@ MasterType VirtualPath="~/MasterAr.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- BEGIN ADVANCED TABLE widget-->
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN EXAMPLE TABLE widget-->
                    <div class="widget">
                        <div class="widget-title">
                            <h4><i class="icon-reorder"></i>Managed Table</h4>
                            <span class="tools">
                                <a href="javascript:;" class="icon-chevron-down"></a>
                                <a href="javascript:;" class="icon-remove"></a>
                            </span>
                            <button class="btn btn-warning" ><i class="icon-plus icon-white"></i> Create New Delivery Order</button>
                        </div>
                        <div class="widget-body">
                           <div class="row-fluid">
                               <div class="span12">
                               <asp:GridView ID="GrdDeliveryOrder" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false">
                                   <Columns>
                                       <asp:BoundField HeaderText="كود العملية" DataField="GeneralDeliveryCode"  />
                                       <asp:BoundField HeaderText="القسم" DataField="Department"  />
                                       <asp:BoundField HeaderText="التاريخ" DataField="CreatedDate"  />
                                       <asp:BoundField HeaderText="رقم السائق" DataField="DriverTelephone"  />
                                       <asp:TemplateField HeaderText="الحالة"  />
                                       <asp:ButtonField HeaderText="عمليات"  ButtonType="Image"   />
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
