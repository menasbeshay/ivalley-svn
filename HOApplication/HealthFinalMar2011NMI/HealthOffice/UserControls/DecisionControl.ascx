<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DecisionControl.ascx.cs"
    Inherits="UserControls_DecisionControl" %>
<div style="width: 100%">
    <table width="100%" dir="rtl">
        <tr>
            <td>
                <table>
                    <tr>
                        <td width="61px">
                            <asp:Label ID="lblHealthOffice" runat="server" Text="مكتب صحة:" 
                                Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblHealthOfficeValue" runat="server" meta:resourcekey="lblHealthOfficeValueResource1"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td width="61px">
                            <asp:Label ID="lblDecisionNumber" runat="server" Text="رقم القرار:" 
                                Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDecisionNumber" runat="server" MaxLength="10" meta:resourcekey="txtDecisionNumberResource1"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" Display="Dynamic" ValidationGroup="xxxx"
                                ID="RequiredFieldValidator1" ControlToValidate="txtDecisionNumber" ErrorMessage="*"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="exp" SetFocusOnError="true" runat="server" ControlToValidate="txtDecisionNumber"
                                ErrorMessage="ارقام فقط" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="padding-right:75px">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblDecisionDirection" runat="server" Text="جهة القرار" 
                                Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDecisionDirectionValue" runat="server" 
                                Text="ادارة الاحوال المدنية ب" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDecisionDirectionValue" runat="server" meta:resourcekey="txtDecisionDirectionValueResource1"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td width="61px">
                            <asp:Label ID="lblDecisionDate" runat="server" Text="تاريخ القرار" 
                                Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDecisionDate" MaxLength="50" runat="server"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender CssClass="custom-calendar" Format="yyyy/MM/dd" TargetControlID="txtDecisionDate"
                                ID="calenderDate" runat="server">
                            </ajaxToolkit:CalendarExtender>
                            <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" Display="Dynamic" ValidationGroup="xxx"
                                ID="reqName" ControlToValidate="txtDecisionDate" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="padding-right:75px">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblNotes" runat="server" Text="ملاحظات" Font-Bold="True"></asp:Label>
                        </td>
                        <td style="padding-right: 113px;">
                            <asp:TextBox ID="txtNotesValue" MaxLength="50" runat="server" meta:resourcekey="txtNotesValueResource1"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
