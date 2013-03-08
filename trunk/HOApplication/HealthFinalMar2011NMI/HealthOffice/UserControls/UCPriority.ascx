<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UCPriority.ascx.cs" Inherits="UserControls_UCPriority" %>
<style type="text/css">
    .style1
    {
        width: 100%;
        border-collapse: collapse;
    }
</style>
<fieldset style="direction:rtl">
<legend>
    <asp:Label ID="uiLabelTitle" runat="server" meta:resourcekey="uiLabelTitleResource1" 
         ></asp:Label></legend>

    <table class="style1">
        <tr>
            <td>
                <asp:Label ID="uiLabelPriorityTitle" runat="server" meta:resourcekey="uiLabelPriorityTitleResource1" 
                    ></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxPriorityName" runat="server" 
                    ValidationGroup="Priority" meta:resourcekey="uiTextBoxPriorityNameResource1" 
                    ></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="*" ControlToValidate="uiTextBoxPriorityName" 
                    ValidationGroup="Priority" meta:resourcekey="RequiredFieldValidator1Resource1" 
                    ></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Button ID="uiButtonAdd" runat="server" onclick="uiButtonAdd_Click" 
                    ValidationGroup="Priority" meta:resourcekey="uiButtonAddResource1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="uiLabelPriority" runat="server" meta:resourcekey="uiLabelPriorityResource1" 
                     ></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="uiGridViewPriority" runat="server" 
                    AutoGenerateColumns="False" onrowcommand="uiGridViewPriority_RowCommand" 
                    EnableModelValidation="True" 
                    meta:resourcekey="uiGridViewPriorityResource1" >
                <Columns>
                <asp:TemplateField HeaderText="" meta:resourcekey="TemplateFieldResource1">
                <ItemTemplate>
                <%# Eval("PriorityName")%>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="" meta:resourcekey="TemplateFieldResource2" >
                <ItemTemplate>
                    <asp:Button ID="uiButtonEdit" runat="server" 
                        CommandArgument='<%# Eval("PriorityID") %>' CommandName="EditPriority" meta:resourcekey="uiButtonEditResource1" 
                        />
                    <asp:Button ID="uiButtonDelete" runat="server" 
                        CommandArgument='<%# Eval("PriorityID") %>' CommandName="DeletePriority" 
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

