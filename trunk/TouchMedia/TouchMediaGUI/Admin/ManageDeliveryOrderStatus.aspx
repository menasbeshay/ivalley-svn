<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="ManageDeliveryOrderStatus.aspx.cs" Inherits="TouchMediaGUI.Admin.ManageDeliveryOrderStatus" %>
<%@ MasterType VirtualPath="~/Admin/admin.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="row-fluid">
        <div class="span12">
            <ul class="breadcrumb">
                <li>
                    <a href="Splash.aspx"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
                </li>
                <li>
                    <a href="#"><i class="icon-exclamation-sign"></i>ادارة حالة طلب النقل</a><span class="divider divider-last">&nbsp;</span>
                </li>
            </ul>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-reorder"></i>حالة طلب النقل</h4>
                    <span class="tools">
                        <a href="javascript:;" class="icon-chevron-down"></a>
                    </span>
                </div>
                <div class="widget-body">
                    <div class="row-fluid">
                        <div class="span12">
                            <asp:Panel ID="panelStatusGrid" runat="server">
                                <div class="span2 clearfix block-margin-bottom-5">
                                    <asp:LinkButton ID="btnNewStatus" OnClick="btnNewStatus_Click" CssClass="btn btn-warning" runat="server"><i class="icon-plus icon-white"></i> اضافة حالة جديدة</asp:LinkButton>
                                </div>
                                <asp:GridView ID="GridViewStatus" OnRowCommand="GridViewStatus_RowCommand" HorizontalAlign="Center" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" runat="server">
                                    <Columns>
                                        <asp:BoundField HeaderText="اسم الحالة انجليزى" DataField="DeliveryOrderStatusName" />
                                        <asp:BoundField HeaderText="اسم الحالة عربى" DataField="DeliveryOrderStatusNameAr" />
                                        <asp:TemplateField HeaderText="العمليات">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnEditStatus" CssClass="btn btn-primary" CommandName="editStatus" CommandArgument='<%# Eval("DeliveryOrderStatusID") %>' runat="server"><i class="icon-pencil icon-white"></i> تعديل</asp:LinkButton>
                                                <asp:LinkButton ID="btnDeleteStatus" CssClass="btn btn-danger" OnClientClick="return confirm('Are you want to delete this user?');" CommandName="deleteStatus" CommandArgument='<%# Eval("DeliveryOrderStatusID") %>' runat="server"><i class="icon-remove icon-white"></i> مسح</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>

                            <asp:Panel ID="panelStatusEdit" Visible="false" runat="server">
                                <div class="form-horizontal">
                                    <div class="control-group">
                                        <label class="control-label">اسم الحالة انجليزى</label>
                                        <div class="controls">
                                            <asp:TextBox runat="server" type="text" class="span3 " ID="txtStatusName" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtStatusName" ValidationGroup="StatusEdit" runat="server" Font-Bold="true" ErrorMessage="*" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">اسم الحالة عربى</label>
                                        <div class="controls">
                                            <asp:TextBox runat="server" type="text" class="span3 " ID="txtStatusNameAr" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtStatusNameAr" ValidationGroup="StatusEdit" runat="server" Font-Bold="true" ErrorMessage="*" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">لون الحالة</label>
                                        <div class="controls">
                                            <select id="dropDownStatusColor" runat="server" style="font-size:inherit">
                                                <option style="font-size:inherit" value="default" class="label label-default">Gray</option>
                                                <option style="font-size:inherit" value="success" class="label label-success">Green</option>
                                                <option style="font-size:inherit" value="warning" class="label label-warning">Orange</option>
                                                <option style="font-size:inherit" value="important" class="label label-important">Red</option>
                                                <option style="font-size:inherit" value="info" class="label label-info">Cyan</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <asp:LinkButton ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-danger" runat="server"><i class="icon-ban-circle icon-white"></i> الغاء و رجوع</asp:LinkButton>
                                        <asp:LinkButton ID="btnSave" OnClick="btnSave_Click" CssClass="btn btn-success" runat="server"><i class="icon-ok icon-white"></i> حفظ</asp:LinkButton>
                                        <br />
                                    </div>
                                </div>
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
