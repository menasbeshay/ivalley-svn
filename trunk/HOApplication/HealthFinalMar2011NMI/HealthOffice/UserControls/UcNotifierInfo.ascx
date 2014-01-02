<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UcNotifierInfo.ascx.cs"
    Inherits="UserControls_UcNotifierInfo" %>
<asp:UpdatePanel runat="server" ID="updatePnlParents" UpdateMode="Conditional">
    <ContentTemplate>
        <table style="width:100%" dir="rtl">
            <tr>
                <td style="width:9%;">
                    <asp:Label ID="lblRelation" runat="server" meta:resourcekey="lblRelationResource1"></asp:Label>
                    <asp:RequiredFieldValidator runat="server" InitialValue="0" SetFocusOnError="true"
                        Display="Dynamic" ValidationGroup="GenralValidate" ID="reqName" ControlToValidate="drpNotiferRelation"
                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td style="text-align:right;">
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
            </table>
            <table style="width:100%" dir="rtl">
            <tr>
                <td style="width:9.5%;">
                    <asp:Label ID="lblNationalId" runat="server" meta:resourcekey="lblNationalIdResource1"></asp:Label>
                </td>
                <td style="text-align:right;width:15%">
                    <%--<asp:TextBox ID="txtNationalId" runat="server" meta:resourcekey="txtNationalIdResource1"
                        AutoPostBack="True" MaxLength="14" OnTextChanged="txtNationalId_TextChanged" OnKeyUp="ClearFields();"></asp:TextBox>--%>
                        <asp:TextBox ID="txtNationalId" runat="server" meta:resourcekey="txtNationalIdResource1"
                         MaxLength="14"></asp:TextBox>                    
                    <%--   <asp:CompareValidator ID="CompareValidator1" Display="Dynamic" ValidationGroup="GenralValidate"
                                        runat="server" ControlToValidate="txtNationalId" ErrorMessage="ارقام فقط"
                                         Operator="DataTypeCheck" Type="Integer" ></asp:CompareValidator>--%>
                </td>
                <td style="text-align:right;width:6%;">
                    <asp:Button ID="btnSearch" runat="server" Text="بحث" OnClick="btnSearch_Click" 
                        Width="35px" />
                    
                </td>
                <td>
                <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="updatePnlParents" DisplayAfter="1"
                        ID="progParents">
                        <ProgressTemplate>
                            <asp:Image runat="server" ID="imgLoading" ImageUrl="~/Images/loading.gif" />
                            جارى البحث
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ValidationGroup="GenralValidate"
                        ControlToValidate="txtNationalId" ErrorMessage="أدخل رقم قومى صحيح" Display="Dynamic"
                        ValidationExpression="^(0|\d{14})$"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" SetFocusOnError="true"
                        ValidationGroup="GenralValidate" ID="RequiredFieldValidator1" ControlToValidate="txtNationalId"
                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:Label runat="server" ID="lblError" ForeColor="Red"></asp:Label>
                </td>
                <td></td>                
            </tr>
            </table>
            <table style="width:100%" dir="rtl">
            <tr>
                <td style="width:6%;">
                   
                                <asp:Label ID="lblNotifierName" runat="server" meta:resourcekey="lblNotifierNameResource1"></asp:Label>
                   
                </td>
                <td style="width:15%;text-align:right;">
                    <asp:TextBox ID="txtFirstName" MaxLength="20" runat="server" 
                        meta:resourcekey="txtFirstNameResource1"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" Display="Dynamic"
                        ValidationGroup="GenralValidate" ID="RequiredFieldValidator3" ControlToValidate="txtFirstName"
                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td style="width:6%;">
                    
                                <asp:Label ID="lblFatherName" runat="server" meta:resourcekey="lblFatherNameResource1"></asp:Label>
                    </td>
                <td style="width:15%;text-align:right;">
                                <asp:TextBox ID="txtFatherName" MaxLength="20" Width="155px" runat="server"
                                    meta:resourcekey="txtFatherNameResource1"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" Display="Dynamic"
                                    ValidationGroup="GenralValidate" ID="RequiredFieldValidator2" ControlToValidate="txtFatherName"
                                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>                                        
                <td style="width:6%;">
                   
                                <asp:Label ID="lblPhoneNumber" runat="server" meta:resourcekey="lblPhoneNumberResource1"></asp:Label>
                            </td>
                <td style="width:15%;text-align:right;">
                                <asp:TextBox ID="txtPhoneNumber" MaxLength="11" runat="server" meta:resourcekey="txtPhoneNumberResource1"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" Display="Dynamic"
                                    ValidationGroup="GenralValidate" ID="RequiredFieldValidator4" ControlToValidate="txtPhoneNumber"
                                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" Display="Dynamic" ControlToValidate="txtPhoneNumber"
                                                        ErrorMessage="ارقام فقط" ValidationGroup="GenralValidate" ValidationExpression="^\d+$"
                                                        runat="server"></asp:RegularExpressionValidator>
                            <asp:HiddenField ID="hdnFirstName" runat="server" />
                    <asp:HiddenField ID="hdnFatherName" runat="server" />
                            </td>                 
            </tr>
            <tr>
            <table style="width:100%"><tr>
                <td style="width:11%;">
                    <asp:Label ID="lblNotifierAddress" runat="server" 
                        meta:resourcekey="lblNotifierAddressResource1"></asp:Label>
                </td>
                <td style="width:15%;">
                    <asp:TextBox ID="txtNotifierAddress" runat="server" Height="50px" MaxLength="20" 
                        meta:resourcekey="txtFirstNameResource1" TextMode="MultiLine" Width="250px"></asp:TextBox>
                </td>
                <td style="width:6%;">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="GenralValidate"
                        ControlToValidate="txtNotifierAddress" ErrorMessage="أقصى عدد حروف (50)" Display="Dynamic"
                        ValidationExpression="^.{0,50}$"></asp:RegularExpressionValidator>
                </td>
                <td style="width:60%;"></td>
                </tr></table>
            </tr>
        </table>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
       <%-- <asp:AsyncPostBackTrigger ControlID="txtNationalId" EventName="TextChanged" />--%>
    </Triggers>
</asp:UpdatePanel>
