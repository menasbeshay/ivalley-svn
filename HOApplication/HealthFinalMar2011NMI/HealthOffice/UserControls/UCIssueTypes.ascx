<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UCIssueTypes.ascx.cs" Inherits="UserControls_UCIssueTypes" %>
<style type="text/css">
    .style1
    {
        width: 100%;
        border-collapse: collapse;
    }
</style>
<fieldset style="direction:rtl">
<legend> <asp:Label ID="uiLabelTitle" runat="server" 
        meta:resourcekey="uiLabelTitleResource1" ></asp:Label></legend>

    <table class="style1">
        <tr>
            <td>
                <asp:Label ID="uiLabelIssueTypesTitle" runat="server" meta:resourcekey="uiLabelIssueTypesTitleResource1" 
                     ></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxIssueTypeName" runat="server" 
                    ValidationGroup="IssueType" meta:resourcekey="uiTextBoxIssueTypeNameResource1" ></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="*" ControlToValidate="uiTextBoxIssueTypeName" 
                    ValidationGroup="IssueType" meta:resourcekey="RequiredFieldValidator1Resource1" 
                    ></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Button ID="uiButtonAdd" runat="server" onclick="uiButtonAdd_Click" 
                    ValidationGroup="IssueType" meta:resourcekey="uiButtonAddResource1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="uiLabelIssueTypes" runat="server" meta:resourcekey="uiLabelIssueTypesResource1" 
                     ></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="uiGridViewIssueTypes" runat="server" 
                    AutoGenerateColumns="False" onrowcommand="uiGridViewIssueTypes_RowCommand" 
                    EnableModelValidation="True" 
                    meta:resourcekey="uiGridViewIssueTypesResource1" >
                <Columns>
                <asp:TemplateField HeaderText="" meta:resourcekey="TemplateFieldResource1" >
                <ItemTemplate>
                <%# Eval("TypeName") %>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="" meta:resourcekey="TemplateFieldResource2" >
                <ItemTemplate>
                    <asp:Button ID="uiButtonEdit" runat="server" 
                        CommandArgument='<%# Eval("IssueTypeID") %>' CommandName="EditIssueType" meta:resourcekey="uiButtonEditResource1" 
                        />
                    <asp:Button ID="uiButtonDelete" runat="server" 
                        CommandArgument='<%# Eval("IssueTypeID") %>' CommandName="DeleteIssueType" 
                        OnClientClick='return confirm("هل تريد حذف هذا السجل ؟");' meta:resourcekey="uiButtonDeleteResource1" 
                         />
                </ItemTemplate>
                </asp:TemplateField>
                </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>

</fieldset>

