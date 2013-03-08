<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SubmitTroubleshoot.ascx.cs" Inherits="UserControls_SubmitTroubleshoot" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<style type="text/css">
    .style1
    {
        width: 100%;
        border-collapse: collapse;
    }
    .style2
    {
        height: 21px;
    }
</style>
<div style="width: 100%">
<div style="text-align: center"><asp:Label ID="uiLabelTitle" runat="server" 
        meta:resourcekey="uiLabelTitleResource1"></asp:Label></div>
<fieldset style="direction:rtl">
<legend><asp:Label ID="uiLabelGovInfo" runat="server" 
        meta:resourcekey="uiLabelGovInfoResource1"></asp:Label></legend>
<table class="style1" dir="rtl">        
        <tr>
            <td class="style2">
                
            </td>
            <td class="style2">
            </td>
            <td class="style2">
            </td>
            <td class="style2">
            </td>
            <td class="style2">
            </td>
            <td class="style2">
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="uiLabelGov" runat="server" 
                    meta:resourcekey="uiLabelGovResource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="uiDropDownListGov" runat="server" 
                    meta:resourcekey="uiDropDownListGovResource1" AutoPostBack="True" 
                    onselectedindexchanged="uiDropDownListGov_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="uiLabelCivil" runat="server" 
                    meta:resourcekey="uiLabelCivilResource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="uiDropDownListCivil" runat="server" 
                    meta:resourcekey="uiDropDownListCivilResource1" AutoPostBack="True" 
                    onselectedindexchanged="uiDropDownListCivil_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="uiLabelHealthOffice" runat="server" 
                    meta:resourcekey="uiLabelHealthOfficeResource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="uiDropDownListHealthOffice" runat="server" 
                    meta:resourcekey="uiDropDownListHealthOfficeResource1">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="margin-right: 80px">
                <asp:Label ID="uiLabelDate" runat="server" 
                    meta:resourcekey="uiLabelDateResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxDate" runat="server" 
                    meta:resourcekey="uiTextBoxDateResource1"></asp:TextBox>
                <cc1:CalendarExtender ID="uiTextBoxDate_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="uiTextBoxDate">
                </cc1:CalendarExtender>
            </td>
            <td>
                <asp:Label ID="uiLabelTime" runat="server" 
                    meta:resourcekey="uiLabelTimeResource1" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxTime" runat="server" 
                    meta:resourcekey="uiTextBoxTimeResource1" Visible="False"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="uiLabelNotifier" runat="server" 
                    meta:resourcekey="uiLabelNotifierResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxNotifierName" runat="server" 
                    meta:resourcekey="uiTextBoxNotifierNameResource1"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="uiLabelIssueNo" runat="server" 
                    meta:resourcekey="uiLabelIssueNoResource1" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxIssueNo" runat="server" 
                    meta:resourcekey="uiTextBoxIssueNoResource1" Visible="False"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</fieldset>
    
    <br />
    
    
<fieldset style="direction:rtl">
<legend><asp:Label ID="uiLabelIssueInfo" runat="server" 
        meta:resourcekey="uiLabelIssueInfoResource1"></asp:Label></legend>
<table class="style1" dir="rtl">        
        <tr>
            <td class="style2" colspan="6">
                
                <asp:Label ID="uiLabelData" runat="server" 
                    meta:resourcekey="uiLabelDataResource1"></asp:Label>
                
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="uiLabelMachineGov" runat="server" 
                    meta:resourcekey="uiLabelMachineGovResource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="uiDropDownListMachineGov" runat="server" 
                    meta:resourcekey="uiDropDownListMachineGovResource1" AutoPostBack="True" 
                    onselectedindexchanged="uiDropDownListMachineGov_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="uiDropDownListMachineGov" ErrorMessage="*" 
                    ValidationGroup="Troubleshoot" ValueToCompare="0" Operator="NotEqual"></asp:CompareValidator>
            </td>
            <td>
                <asp:Label ID="uiLabelMachineCivil" runat="server" 
                    meta:resourcekey="uiLabelMachineCivilResource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="uiDropDownListMachineCivil" runat="server" 
                    meta:resourcekey="uiDropDownListMachineCivilResource1" AutoPostBack="True" 
                    onselectedindexchanged="uiDropDownListMachineCivil_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                    ControlToValidate="uiDropDownListMachineCivil" ErrorMessage="*" 
                    ValidationGroup="Troubleshoot" ValueToCompare="0" Operator="NotEqual"></asp:CompareValidator>
            </td>
            <td>
                <asp:Label ID="uiLabelMachineHealthOffice" runat="server" 
                    meta:resourcekey="uiLabelMachineHealthOfficeResource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="uiDropDownListMachineHealthOffice" runat="server" 
                    meta:resourcekey="uiDropDownListMachineHealthOfficeResource1">
                </asp:DropDownList>
                <asp:CompareValidator ID="CompareValidator3" runat="server" 
                    ControlToValidate="uiDropDownListMachineHealthOffice" ErrorMessage="*" 
                    ValidationGroup="Troubleshoot" ValueToCompare="0" Operator="NotEqual"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                
                <asp:Label ID="uiLabelPriority" runat="server" 
                    meta:resourcekey="uiLabelPriorityResource1"></asp:Label>
                
            </td>
            <td class="style2" colspan="5">
                
                <asp:DropDownList ID="uiDropDownListPriority" runat="server" 
                    meta:resourcekey="uiDropDownListMachineGovResource1">
                </asp:DropDownList>
                
            </td>
        </tr>
        <tr>
            <td class="style2">
                
                <asp:Label ID="uiLabelIssueType" runat="server" 
                    meta:resourcekey="uiLabelIssueTypeResource1"></asp:Label>
                
            </td>
            <td class="style2" colspan="5">
                
                <asp:RadioButtonList ID="uiRadioButtonListIssueType" runat="server" 
                    meta:resourcekey="uiRadioButtonListIssueTypeResource1" RepeatColumns="6" 
                    RepeatDirection="Horizontal" RepeatLayout="Flow">
                </asp:RadioButtonList>
                
            </td>
        </tr>
        
        
        <tr>
            <td style="margin-right: 80px" valign="top">
                <asp:Label ID="uiLabelDescription" runat="server" 
                    meta:resourcekey="uiLabelDescriptionResource1"></asp:Label>
            </td>
            <td colspan="5">
                <asp:TextBox ID="uiTextBoxDescription" runat="server" 
                    meta:resourcekey="uiTextBoxDescriptionResource1" Rows="5" TextMode="MultiLine" 
                    Width="50%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="margin-right: 80px" valign="top">
                <asp:Label ID="uiLabelTeleNo" runat="server" 
                    meta:resourcekey="uiLabelTeleNoResource1"></asp:Label>
            </td>
            <td colspan="5">
                <asp:TextBox ID="uiTextBoxTele" runat="server" 
                    meta:resourcekey="uiTextBoxTeleNoResource1"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="uiTextBoxTele" ErrorMessage="*" ValidationExpression="\d+" 
                    ValidationGroup="Troubleshoot"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="margin-right: 80px" valign="top">
                <asp:Label ID="uiLabelMobileNo" runat="server" 
                    meta:resourcekey="uiLabelMobileNoResource1"></asp:Label>
            </td>
            <td colspan="5">
                <asp:TextBox ID="uiTextBoxMobile" runat="server" 
                    meta:resourcekey="uiTextBoxMobileNoResource1"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="uiTextBoxMobile" ErrorMessage="*" ValidationExpression="\d+" 
                    ValidationGroup="Troubleshoot"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="uiLabelSerialNo" runat="server" 
                    meta:resourcekey="uiLabelSerialNoResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxSerialNo" runat="server" 
                    meta:resourcekey="uiTextBoxSerialNoResource1"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="uiLabelNetworkType" runat="server" 
                    meta:resourcekey="uiLabelNetworkTypeResource1"></asp:Label>
            </td>
            <td colspan="5">
                <asp:RadioButtonList ID="uiRadioButtonListNetworkType" runat="server" 
                    meta:resourcekey="uiRadioButtonListNetworkTypeResource1" RepeatColumns="3" 
                    RepeatDirection="Horizontal" RepeatLayout="Flow">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="5">
                <asp:Button ID="uiButtonAdd" runat="server" 
                    meta:resourcekey="uiButtonAddResource1" onclick="uiButtonAdd_Click" 
                    ValidationGroup="Troubleshoot" />
            </td>
        </tr>
    </table>
</fieldset>
    
    </div>
<br />
<br />
<fieldset style="direction:rtl"s>
<legend><asp:Label ID="uiLabelRecentIssues" runat="server" 
        meta:resourcekey="uiLabelRecentIssuesResource1"></asp:Label></legend>
    <asp:GridView ID="uiGridViewRecentIssues" runat="server" AutoGenerateColumns="false">
    <Columns>
    <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
    <ItemTemplate>
    <%# Eval("TroubleshootingID")%>
    </ItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField meta:resourcekey="TemplateFieldResource2">
    <ItemTemplate>
    <%# Eval("IssueTypeName")%>
    </ItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField meta:resourcekey="TemplateFieldResource3">
    <ItemTemplate>
    <%# DateTime.Parse(Eval("Date").ToString()).ToShortDateString() %>
    </ItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField meta:resourcekey="TemplateFieldResource4">
    <ItemTemplate>
    <%# DateTime.Parse(Eval("Time").ToString()).ToShortTimeString() %>
    </ItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField meta:resourcekey="TemplateFieldResource5">
    <ItemTemplate>
    <%# Eval("NetworkName")%>
    </ItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField meta:resourcekey="TemplateFieldResource6">
    <ItemTemplate>
    <%# Eval("Description")%>
    </ItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField meta:resourcekey="TemplateFieldResource7">
    <ItemTemplate>
    <%# Eval("StatusName")%>
    </ItemTemplate>
    </asp:TemplateField>

    </Columns>
    </asp:GridView>
</fieldset>
