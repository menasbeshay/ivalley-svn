<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UcNotifierInfo.ascx.cs"
    Inherits="UserControls_UcNotifierInfo" %>
<asp:UpdatePanel runat="server" ID="updatePnlParents" UpdateMode="Conditional">
    <ContentTemplate>
        <table width="100%" dir="rtl">
            <tr>
                <td>
                    <asp:Label ID="lblRelation" runat="server" meta:resourcekey="lblRelationResource1"></asp:Label>
                    <asp:RequiredFieldValidator runat="server" InitialValue="0" SetFocusOnError="true"
                        Display="Dynamic" ValidationGroup="GenralValidate" ID="reqName" ControlToValidate="drpNotiferRelation"
                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="drpNotiferRelation" Width="155px" onChange="FillNotifierInfo(this);">
                        <asp:ListItem Value="0">--------</asp:ListItem>
                        <asp:ListItem Value="1">الاب</asp:ListItem>
                        <asp:ListItem Value="2">الام</asp:ListItem>
                        <asp:ListItem Value="3">الاخ</asp:ListItem>
                        <asp:ListItem Value="4">الاخت</asp:ListItem>
                        <asp:ListItem Value="5">العم</asp:ListItem>
                        <asp:ListItem Value="6">الخال</asp:ListItem>
                        <asp:ListItem Value="7">الجد</asp:ListItem>
                        <asp:ListItem Value="9">الابن</asp:ListItem>
                        <asp:ListItem Value="10">الابنة</asp:ListItem>
                        <asp:ListItem Value="8">اخري</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblNationalId" runat="server" meta:resourcekey="lblNationalIdResource1"></asp:Label>
                </td>
                <td width="155px">
                    <asp:TextBox ID="txtNationalId" runat="server" meta:resourcekey="txtNationalIdResource1"
                        AutoPostBack="True" MaxLength="14" OnTextChanged="txtNationalId_TextChanged" OnKeyUp="ClearFields();"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                        ControlToValidate="txtNationalId" ErrorMessage="أدخل رقم قومى صحيح" 
                        ValidationExpression="^([0])|(\d{14})$"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" SetFocusOnError="true"
                        ValidationGroup="GenralValidate" ID="RequiredFieldValidator1" ControlToValidate="txtNationalId"
                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <%--   <asp:CompareValidator ID="CompareValidator1" Display="Dynamic" ValidationGroup="GenralValidate"
                                        runat="server" ControlToValidate="txtNationalId" ErrorMessage="ارقام فقط"
                                         Operator="DataTypeCheck" Type="Integer" ></asp:CompareValidator>--%>
                </td>
                <td>
                    <asp:Button ID="btnSearch" runat="server" Text="بحث" OnClick="btnSearch_Click" 
                        Width="35px" Enabled="False" />
                    <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="updatePnlParents" DisplayAfter="1"
                        ID="progParents">
                        <ProgressTemplate>
                            <asp:Image runat="server" ID="imgLoading" ImageUrl="~/Images/loading.gif" />
                            جارى البحث
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblError" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td width="60px">
                    <table width="100%">
                        <tr>
                            <td>
                                <asp:Label ID="lblNotifierName" runat="server" meta:resourcekey="lblNotifierNameResource1"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <asp:TextBox ID="txtFirstName" MaxLength="20" runat="server" 
                        meta:resourcekey="txtFirstNameResource1"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" Display="Dynamic"
                        ValidationGroup="GenralValidate" ID="RequiredFieldValidator3" ControlToValidate="txtFirstName"
                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td width="200px">
                    <table width="100%">
                        <tr>
                            <td style="padding-right: 42px">
                                <asp:Label ID="lblFatherName" runat="server" meta:resourcekey="lblFatherNameResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFatherName" MaxLength="20" Width="155px" runat="server"
                                    meta:resourcekey="txtFatherNameResource1"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" Display="Dynamic"
                                    ValidationGroup="GenralValidate" ID="RequiredFieldValidator2" ControlToValidate="txtFatherName"
                                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table>
                        <tr>
                            <td style="padding-right: 15px">
                                <asp:Label ID="lblPhoneNumber" runat="server" meta:resourcekey="lblPhoneNumberResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPhoneNumber" MaxLength="11" runat="server" meta:resourcekey="txtPhoneNumberResource1"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" Display="Dynamic"
                                    ValidationGroup="GenralValidate" ID="RequiredFieldValidator4" ControlToValidate="txtPhoneNumber"
                                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" Display="Dynamic" ControlToValidate="txtPhoneNumber"
                                                        ErrorMessage="ارقام فقط" ValidationGroup="GenralValidate" ValidationExpression="^\d+$"
                                                        runat="server"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                    </table>
                    <asp:HiddenField ID="hdnFirstName" runat="server" />
                    <asp:HiddenField ID="hdnFatherName" runat="server" />
                </td>
            </tr>
        </table>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
        <asp:AsyncPostBackTrigger ControlID="txtNationalId" EventName="TextChanged" />
    </Triggers>
</asp:UpdatePanel>
