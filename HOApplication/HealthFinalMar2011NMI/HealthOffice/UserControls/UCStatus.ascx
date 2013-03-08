<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UCStatus.ascx.cs" Inherits="UserControls_UCStatus" %>
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
                <asp:Label ID="uiLabelStatusTitle" runat="server" meta:resourcekey="uiLabelStatusTitleResource1" 
                    ></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxStatusName" runat="server" ValidationGroup="Status" meta:resourcekey="uiTextBoxStatusNameResource1" 
                   ></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="*" ControlToValidate="uiTextBoxStatusName" 
                    ValidationGroup="Status" meta:resourcekey="RequiredFieldValidator1Resource1" 
                    ></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Button ID="uiButtonAdd" runat="server" onclick="uiButtonAdd_Click" 
                    ValidationGroup="Status" meta:resourcekey="uiButtonAddResource1"  />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="uiLabelStatuses" runat="server" meta:resourcekey="uiLabelStatusesResource1" 
                     ></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="uiGridViewStatuses" runat="server" 
                    AutoGenerateColumns="False" onrowcommand="uiGridViewStatuses_RowCommand" 
                    EnableModelValidation="True" 
                    meta:resourcekey="uiGridViewStatusesResource1" >
                <Columns>
                <asp:TemplateField HeaderText="" meta:resourcekey="TemplateFieldResource1">
                <ItemTemplate>
                <%# Eval("StatusName") %>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="" meta:resourcekey="TemplateFieldResource2" >
                <ItemTemplate>
                    <asp:Button ID="uiButtonEdit" runat="server" 
                        CommandArgument='<%# Eval("StatusID") %>' CommandName="EditStatus" meta:resourcekey="uiButtonEditResource1" 
                        />
                    <asp:Button ID="uiButtonDelete" runat="server" 
                        CommandArgument='<%# Eval("StatusID") %>' CommandName="DeleteStatus" 
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

