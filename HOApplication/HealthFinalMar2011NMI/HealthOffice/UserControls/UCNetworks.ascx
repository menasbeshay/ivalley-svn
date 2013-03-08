<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UCNetworks.ascx.cs" Inherits="UserControls_UCNetworks" %>
<style type="text/css">
    .style1
    {
        width: 100%;
        border-collapse: collapse;
    }
</style>
<fieldset style="direction:rtl">
<legend>
    <asp:Label ID="uiLabelTitle" runat="server" 
        meta:resourcekey="uiLabelTitleResource1" ></asp:Label></legend>

    <table class="style1">
        <tr>
            <td>
                <asp:Label ID="uiLabelNetworksTitle" runat="server" 
                    meta:resourcekey="uiLabelNetworksTitleResource1" ></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxNetworkName" runat="server" ValidationGroup="Network" 
                    meta:resourcekey="uiTextBoxNetworkNameResource1"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="*" ControlToValidate="uiTextBoxNetworkName" 
                    ValidationGroup="Network" 
                    meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Button ID="uiButtonAdd" runat="server" onclick="uiButtonAdd_Click" 
                    ValidationGroup="Network" meta:resourcekey="uiButtonAddResource1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="uiLabelNetworks" runat="server" 
                    meta:resourcekey="uiLabelNetworksResource1" ></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="uiGridViewNetworks" runat="server" 
                    AutoGenerateColumns="False" onrowcommand="uiGridViewNetworks_RowCommand" 
                    EnableModelValidation="True" meta:resourcekey="uiGridViewNetworksResource1">
                <Columns>
                <asp:TemplateField HeaderText="" meta:resourcekey="TemplateFieldResource1">
                <ItemTemplate>
                <%# Eval("NetworkName") %>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="" meta:resourcekey="TemplateFieldResource2">
                <ItemTemplate>
                    <asp:Button ID="uiButtonEdit" runat="server" 
                        CommandArgument='<%# Eval("NetworkID") %>' CommandName="EditNetwork" 
                        meta:resourcekey="uiButtonEditResource1"/>
                    <asp:Button ID="uiButtonDelete" runat="server" 
                        CommandArgument='<%# Eval("NetworkID") %>' CommandName="DeleteNetwork" 
                        OnClientClick='return confirm("هل تريد حذف هذا السجل ؟");' 
                        meta:resourcekey="uiButtonDeleteResource1" />
                </ItemTemplate>
                </asp:TemplateField>
                </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>

</fieldset>

