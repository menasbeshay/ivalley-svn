﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="ManageTransformationSupplier.aspx.cs" Inherits="TouchMediaGUI.ManageTransformationSupplier" %>
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
                    <a href="#"><i class="icon-truck"></i>مقاولين النقل</a><span class="divider divider-last">&nbsp;</span>
                </li>
            </ul>
        </div>
        </div>
    <div class="row-fluid">
        <div class="span12">

            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-reorder"></i>مقاولين النقل</h4>
                    <span class="tools">
                        <a href="javascript:;" class="icon-chevron-down"></a>
                    </span>
                </div>
                <div class="widget-body">
                    <div class="row-fluid">
                        <div class="span12">
                            <asp:Panel ID="panelSupplierGrid" runat="server">
                                <div class="span2 clearfix block-margin-bottom-5">
                                    <asp:LinkButton ID="btnNewSupplier" OnClick="btnNewSupplier_Click" CssClass="btn btn-warning" runat="server"><i class="icon-plus icon-white"></i> اضافة مقاول نقل</asp:LinkButton>
                                </div>
                                <asp:GridView ID="GridViewSuppliers" OnRowCommand="GridViewSuppliers_RowCommand" HorizontalAlign="Center"  CssClass="table table-striped table-bordered" AutoGenerateColumns="false" runat="server">
                                    <Columns>
                                        <asp:BoundField HeaderText="اسم مقاول النقل" DataField="TransformationSupplierName" />
                                        <asp:BoundField HeaderText="تليفون مقاول النقل" DataField="TransformationSupplierTelephone" />
                                        <asp:TemplateField HeaderText="العمليات">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnEditSupplier" CssClass="btn btn-primary" CommandName="editSupplier"  CommandArgument='<%# Eval("TransformationSupplierID") %>' runat="server"><i class="icon-pencil icon-white"></i> تعديل</asp:LinkButton>
                                                <asp:LinkButton ID="btnDeleteSupplier" CssClass="btn btn-danger" OnClientClick="return confirm('Are you want to delete this user?');" CommandName="deleteSupplier" CommandArgument='<%# Eval("TransformationSupplierID") %>' runat="server"><i class="icon-remove icon-white"></i> مسح</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>

                            <asp:Panel ID="panelSupplierEdit" Visible="false" runat="server">
                                <div class="form-horizontal">
                                    <div class="control-group">
                                        <label class="control-label">أسم مقاول النقل</label>
                                        <div class="controls">
                                            <asp:TextBox runat="server" type="text" class="span3 " ID="txtSupplierName" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtSupplierName" ValidationGroup="SupplierEdit" runat="server" Font-Bold="true" ErrorMessage="*"/>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">تليفون مقاول النقل</label>
                                        <div class="controls">
                                            <asp:TextBox runat="server" type="text" class="span3 " ID="txtSupplierTelephone" />

                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">عنوان مقاول النقل</label>
                                        <div class="controls">
                                            <asp:TextBox runat="server" type="text" class="span3 " ID="txtSupplierAddress" />
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
