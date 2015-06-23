<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="TouchMediaGUI.UserManagement" %>

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
                    <a href="#"><i class="icon-user"></i>إدارة المستخدم</a><span class="divider divider-last">&nbsp;</span>
                </li>
            </ul>
        </div>
        </div>
    <div class="row-fluid">
        <div class="span12">

            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-reorder"></i>إدارة المستخدم</h4>
                    <span class="tools">
                        <a href="javascript:;" class="icon-chevron-down"></a>
                    </span>
                </div>
                <div class="widget-body">
                    <div class="row-fluid">
                        <div class="span12">
                            <asp:Panel ID="panelUserGrid" runat="server">
                                <div class="span2 clearfix block-margin-bottom-5">
                                    <asp:LinkButton ID="btnAddNewUser" OnClick="btnAddNewUser_Click" CssClass="btn btn-warning" runat="server"><i class="icon-plus icon-white"></i> اضافة مستخدم جديد</asp:LinkButton>
                                </div>
                                <asp:GridView ID="GridViewUsers" OnRowCommand="GridViewUsers_RowCommand" HorizontalAlign="Center"  CssClass="table table-striped table-bordered" AutoGenerateColumns="false" runat="server">
                                    <Columns>
                                        <asp:BoundField HeaderText="اسم المستخدم" DataField="UserName" />
                                        <asp:TemplateField HeaderText="نوع الدخول">
                                            <ItemTemplate>
                                                <%# string.Join("," ,Roles.GetRolesForUser(Eval("UserName").ToString())) %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="العمليات">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnEditUser" CssClass="btn btn-primary" CommandName="editUser"  CommandArgument='<%# Eval("UserName") %>' runat="server"><i class="icon-pencil icon-white"></i> تعديل</asp:LinkButton>
                                                <asp:LinkButton ID="btnDeleteUser" CssClass="btn btn-danger" OnClientClick="return confirm('Are you want to delete this user?');" CommandName="deleteUser" CommandArgument='<%# Eval("UserName") %>' runat="server"><i class="icon-remove icon-white"></i> مسح</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>

                            <asp:Panel ID="panelUserEdit" Visible="false" runat="server">
                                <div class="form-horizontal">
                                    <div class="control-group">
                                        <label class="control-label">أسم المستخدم</label>
                                        <div class="controls">
                                            <asp:TextBox runat="server" type="text" class="span3 " ID="txtUserName" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtUserName" ValidationGroup="UserEdit" runat="server" Font-Bold="true" ErrorMessage="*"/>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">كلمة المرور</label>
                                        <div class="controls">
                                            <asp:TextBox runat="server" TextMode="Password" type="text" class="span3 " ID="txtPassword" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPassword" ValidationGroup="UserEdit" runat="server" Font-Bold="true" ErrorMessage="*"/>

                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">تأكيد كلمة المرور</label>
                                        <div class="controls">
                                            <asp:TextBox runat="server" TextMode="Password" type="text" class="span3 " ID="txtConfirmPassword" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtConfirmPassword" ValidationGroup="UserEdit" runat="server" Font-Bold="true" ErrorMessage="*"/>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" ValidationGroup="UserEdit"/>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">نوع الدخول</label>
                                        <div class="controls">
                                            <asp:CheckBoxList ID="CheckBoxListRoles" CellPadding="5" CellSpacing="5" RepeatColumns="2" runat="server"></asp:CheckBoxList>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <asp:LinkButton ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-danger" runat="server"><i class="icon-ban-circle icon-white"></i> الغاء و رجوع</asp:LinkButton>
                                        <asp:LinkButton ID="btnSave" OnClick="btnSave_Click" CssClass="btn btn-success" runat="server"><i class="icon-ok icon-white"></i> حفظ</asp:LinkButton>
                                        <br />
                                        <asp:Label ID="lblError" runat="server" Visible="false" Text="" ForeColor="Red"></asp:Label>
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
