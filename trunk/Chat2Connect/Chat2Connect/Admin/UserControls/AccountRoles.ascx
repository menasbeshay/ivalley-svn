<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AccountRoles.ascx.cs" Inherits="Chat2Connect.Admin.UserControls.AccountRoles" %>
<div class="pull-right ">
    خصائص الحساب
</div>
<hr />
<div class="form-group">
    <asp:GridView ID="grdMemberRoles" runat="server" AutoGenerateColumns="false" ShowHeader="false" ShowFooter="true" EmptyDataText="لا توجد بيانات" CssClass="table table-condensed" Width="400px">
        <AlternatingRowStyle CssClass="Alteven" />
        <RowStyle CssClass="Altodd" />
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
                <FooterTemplate>
                    <asp:Button ID="btnUpdateRoles" runat="server" Text="إعتمد" CssClass="btn btn-warning " Style="width: 100px;" OnClick="btnUpdateRoles_Click" />
                </FooterTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <FooterStyle HorizontalAlign="Center" />
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
</div>
