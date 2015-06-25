<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAr.Master" AutoEventWireup="true" CodeBehind="PurchaseOrder.aspx.cs" Inherits="TouchMediaGUI.PurchaseOrder" %>

<%@ MasterType VirtualPath="~/MasterAr.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                                    <asp:LinkButton ID="btnAddNewOrder" CssClass="btn btn-warning" runat="server"><i class="icon-plus icon-white"></i> انشاء امر شراء</asp:LinkButton>
                                </div>
                                <asp:GridView ID="GridViewPurchaseOrders" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" runat="server">
                                <Columns>
                                    <asp:BoundField DataField="PurchaseOrderNumber" HeaderText="رقم امر الشراء" />
                                    <asp:BoundField DataField="PurchaseOrderDate" HeaderText="تاريخ امر الشراء" />
                                    <asp:BoundField DataField="DeliveryDate" HeaderText="ميعاد التسليم" />
                                    <asp:BoundField DataField="DeliveryPlace" HeaderText="مكان التسليم" />
                                    <asp:TemplateField HeaderText="العمليات">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnDelete" OnClientClick="return confirm('Are you sure you want to delete this Order ?')" runat="server" CommandArgument='<%# Eval("PurchaseOrderID") %>' CommandName="deleteOrder">Delete</asp:LinkButton>
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
