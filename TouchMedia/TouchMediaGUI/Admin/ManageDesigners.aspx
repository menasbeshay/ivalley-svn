<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAr.Master" AutoEventWireup="true" CodeBehind="ManageDesigners.aspx.cs" Inherits="TouchMediaGUI.Admin.ManageDesigners" %>
<%@ MasterType VirtualPath="~/MasterAr.Master" %>

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
                    <a href="#"><i class="icon-tint"></i>ادارة المصممين</a><span class="divider divider-last">&nbsp;</span>
                </li>
            </ul>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-reorder"></i>حالة طلب الشغل</h4>
                    <span class="tools">
                        <a href="javascript:;" class="icon-chevron-down"></a>
                    </span>
                </div>
                <div class="widget-body">
                    <div class="row-fluid">
                        <div class="span12">
                            <asp:Panel ID="panelDesignersGrid" runat="server">
                                <div class="span2 clearfix block-margin-bottom-5">
                                    <asp:LinkButton ID="btnNewDesigner" OnClick="btnNewDesigner_Click" CssClass="btn btn-warning" runat="server"><i class="icon-plus icon-white"></i> اضافة مصمم جديد</asp:LinkButton>
                                </div>
                                <asp:GridView ID="GridViewDesigners" OnRowCommand="GridViewDesigners_RowCommand" HorizontalAlign="Center" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" runat="server">
                                    <Columns>
                                        <asp:BoundField HeaderText="اسم المصمم" DataField="Name" />
                                        <asp:BoundField HeaderText="تليفون المصمم" DataField="Telephone" />
                                        <asp:BoundField HeaderText="البريد الالكترونى" DataField="Email" />
                                        <asp:TemplateField HeaderText="العمليات">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnEditDesigner" CssClass="btn btn-primary" CommandName="editDesigner" CommandArgument='<%# Eval("GeneralLookupID") %>' runat="server"><i class="icon-pencil icon-white"></i> تعديل</asp:LinkButton>
                                                <asp:LinkButton ID="btnDeleteDesigner" CssClass="btn btn-danger" OnClientClick="return confirm('Are you want to delete this user?');" CommandName="deleteDesigner" CommandArgument='<%# Eval("GeneralLookupID") %>' runat="server"><i class="icon-remove icon-white"></i> مسح</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>

                            <asp:Panel ID="panelDesignersEdit" Visible="false" runat="server">
                                <div class="form-horizontal">
                                    <div class="control-group">
                                        <label class="control-label">اسم المصمم</label>
                                        <div class="controls">
                                            <asp:TextBox runat="server" type="text" class="span3 " ID="txtDesignerName" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtDesignerName" ValidationGroup="StatusEdit" runat="server" Font-Bold="true" ErrorMessage="*" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">عنوان المصمم</label>
                                        <div class="controls">
                                            <asp:TextBox runat="server" type="text" class="span3 " ID="txtDesignerAddress" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">تليفون المصمم</label>
                                        <div class="controls">
                                            <asp:TextBox runat="server" type="text" class="span3 " ID="txtDesignerTelephone" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">البريد الالكترونى</label>
                                        <div class="controls">
                                            <asp:TextBox runat="server" type="text" class="span3 " ID="txtDesignerEmail" />
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <asp:LinkButton ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-danger" runat="server"><i class="icon-ban-circle icon-white"></i> الغاء و رجوع</asp:LinkButton>
                                        <asp:LinkButton ID="btnSave" OnClick="btnSave_Click" CssClass="btn btn-success" runat="server"><i class="icon-ok icon-white"></i> حفظ</asp:LinkButton>
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
