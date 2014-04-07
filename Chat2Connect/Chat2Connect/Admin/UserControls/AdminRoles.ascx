<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminRoles.ascx.cs" Inherits="Chat2Connect.Admin.UserControls.AdminRoles" %>

<div class="modal-content">
    <div class="modal-header">
        <h3 id="myModalLabel1">صلاحيات خاصة</h3>
    </div>
    <div class="modal-body">
        <div class="form-horizontal blockBox validationGroup">
            <div class="form-group">
                <div class="SScroll" data-height="300px">
                    <asp:GridView ID="grdAdminRoles" runat="server" AutoGenerateColumns="false" ShowHeader="false" EmptyDataText="لا توجد بيانات" CssClass="table table-condensed" Width="100%">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:TextBox ID="txtRoleName" runat="server" Visible="false" Text='<%# Eval("RoleName") %>'></asp:TextBox>
                                    <%# Eval("RoleDisplayName") %>
                                </ItemTemplate>
                                <ItemStyle Wrap="false" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkInclude" runat="server" Checked='<%# Eval("InUserRoles") %>' />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                </div>
                <div class="pull-left">
                    <asp:Button ID="btnUpdateRoles" runat="server" Text="إعتمد" CssClass="btn btn-warning " Style="width: 100px;" OnClick="btnUpdateRoles_Click" />
                </div>
            </div>
        </div>
    </div>
</div>
