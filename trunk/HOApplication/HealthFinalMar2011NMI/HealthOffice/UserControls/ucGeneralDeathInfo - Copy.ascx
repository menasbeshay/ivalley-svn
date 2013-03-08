<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Control Language="C#"  AutoEventWireup="true" CodeFile="ucGeneralDeathInfo.ascx.cs"
    Inherits="UserControls_ucGeneralDeathInfo" %>
<style type="text/css">
    .style1
    {
        width: 145px;
    }
</style>


<table dir="rtl" width="100%">
    <tr>
    <td width="35%">
    
    <table>
    <tr>
     <td width="75px">
            <asp:Label ID="lblBirthday" runat="server" meta:resourcekey="lblBirthdayResource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtBirthDate" MaxLength="20" runat="server"></asp:TextBox>
            <ajaxToolkit:CalendarExtender CssClass="custom-calendar" Format="yyyy/MM/dd" TargetControlID="txtBirthDate"
                ID="calenderDate" runat="server">
            </ajaxToolkit:CalendarExtender>
            <asp:RequiredFieldValidator runat="server" Display="Dynamic" SetFocusOnError="true" ValidationGroup="GenralValidate"
                ID="reqName" ControlToValidate="txtBirthDate" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    </table>
    </td>
    <td align="right">
       <table>
       
       <tr>
         <td>
        <asp:Label ID="lblDeathDate" runat="server" meta:resourcekey="lblDeathDateResource1"></asp:Label>
       </td>
        <td align="right">
        <asp:TextBox ID="txtDeathDate" MaxLength="20" Width="150px" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator runat="server" Display="Dynamic" SetFocusOnError="true" ValidationGroup="GenralValidate"
                            ID="RequiredFieldValidator1" ControlToValidate="txtDeathDate" ErrorMessage="*"
                            ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        </tr>
       
                
       
       </table>
       <table align="right">
       <tr width="100%" align="right">
                <td>
                <asp:Label ID="Label2" runat="server" Text="وقت الوفاة"></asp:Label>
                </td>
                    <td align="right">
                    <table>
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" Text="دقيقة" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDeathMin"  Width="30px" MaxLength="2" Text="00" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                       
                    </td>
                    <td align="left" width="92px">
                         <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblHour" Text="ساعة" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDeathHour"  Width="30px" MaxLength="2" Text="12" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                       
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" SetFocusOnError="true" ValidationGroup="GenralValidate"
                            ID="RequiredFieldValidator3" ControlToValidate="txtDeathHour" ErrorMessage="*"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" Display="Dynamic" ValidationGroup="GenralValidate"
                            ID="RequiredFieldValidator4" ControlToValidate="txtDeathMin" ErrorMessage="*"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="lbl" SetFocusOnError="true" ValidationExpression="^([0]?[0-9]|[1][0-9]|[2][0-3])$"
                            ControlToValidate="txtDeathHour" runat="server" ErrorMessage="الساعة غير صحيحه"></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" SetFocusOnError="true" ValidationExpression="^([0]?[0-9]|[1-5][0-9])$"
                            ControlToValidate="txtDeathMin" runat="server" ErrorMessage="الدقيقة غير صحيحه"></asp:RegularExpressionValidator>
                            <ajaxToolkit:CalendarExtender CssClass="custom-calendar" Format="yyyy/MM/dd" TargetControlID="txtDeathDate"
                ID="CalendarExtender1" runat="server">
            </ajaxToolkit:CalendarExtender>
                    </td>
                </tr>
       </table>
      </td>
     </tr>
    </table>
    <table dir="rtl" width="100%">
    <tr>
        <td width="75px">
            <asp:Label ID="lblLocationOfDeath" runat="server" meta:resourcekey="lblLocationOfDeathResource1"></asp:Label>
        </td>
        <td width="25%">
            <asp:RadioButtonList ID="rdioDeathLocation" runat="server" RepeatDirection="Horizontal"
                meta:resourcekey="rdioDeathLocationResource1">
                <asp:ListItem meta:resourcekey="ListItemResource1" Selected="True" Value="1"></asp:ListItem>
                <asp:ListItem meta:resourcekey="ListItemResource2" Value="2"></asp:ListItem>
                <asp:ListItem meta:resourcekey="ListItemResource3" Value="3"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td width="8%">
            <asp:Label ID="lblDescriptionOfLocation" Width="20px" runat="server" meta:resourcekey="lblDescriptionOfLocationResource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtDescriptionOfLocation" MaxLength="100" Width="150px" runat="server" meta:resourcekey="txtDescriptionOfLocationResource1"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" Display="Dynamic" SetFocusOnError="true" ValidationGroup="GenralValidate"
                ID="RequiredFieldValidator2" ControlToValidate="txtDescriptionOfLocation" ErrorMessage="*"
                ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td colspan="3">
            <table dir="rtl">
                <tr>
                    <td>
                        <asp:Label ID="lblState" runat="server" meta:resourcekey="lblStateResource1" 
                            Font-Bold="True"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:Label ID="lblStateValue" runat="server" meta:resourcekey="lblStateValueResource1"></asp:Label>
                    </td>
                    
                    <td>
                        <asp:Label ID="lblSection" runat="server" 
                            meta:resourcekey="lblSectionResource1" Font-Bold="True"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:Label ID="lblSectionValue" runat="server" meta:resourcekey="lblSectionValueResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblSubSection" runat="server" 
                            meta:resourcekey="lblSubSectionResource1" Font-Bold="True"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblSubSectionValue" runat="server" meta:resourcekey="lblSubSectionValueResource1"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<asp:UpdatePanel runat="server" ID="updateGeneralDeathInfo" UpdateMode="Conditional">
<ContentTemplate>
</ContentTemplate>
</asp:UpdatePanel>