<%@ Page Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true"
    CodeFile="Register.aspx.cs" Inherits="Register" Culture="auto" meta:resourcekey="PageResource1"
    UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <asp:UpdatePanel ID="pnlAdd" runat="server">
        <ContentTemplate>
            <table align="center" width="100%">
                <tr>
                    <td width="100%">
                        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" CreateUserButtonText="����� ������"
                            Font-Names="Verdana" Font-Size="0.8em" OnCreatedUser="CreateUserWizard1_CreatedUser"
                            Height="365px" Width="621px" RequireEmail="false" DuplicateEmailErrorMessage="������ ���������� ����� �� ���"
                            DuplicateUserNameErrorMessage="����� ����� �� ���" UnknownErrorMessage="���� ����� �� ����� ������"
                            OnCreatingUser="CreateUserWizard1_CreatingUser" >
                            <WizardSteps>
                                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" meta:resourcekey="CreateUserWizardStep0Resource1">
                                    <ContentTemplate>
                                        <table border="0" style="font-family: Verdana; font-size: 100%; height: 365px; width: 621px;">
                                            <tr>
                                                <td align="center" colspan="7" style="width:100%">
                                                    <h3>
                                                   <center><b>����� ������ ����</b><h3>
                                                       </h3>
                                                       <h3>
                                                       </h3>
                                                    </h3>     
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblRole1" Text="������ �������" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="dropRole" Width="150px" runat="server" AutoPostBack="true"
                                                        meta:resourcekey="dropRole1Resource1" OnSelectedIndexChanged="dropRole_SelectedIndexChanged">
                                                        <asp:ListItem Text="���� �����" Value="SuperAdmin" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="���� ������" Value="Admin"></asp:ListItem>
                                                        <asp:ListItem Text="���� �����" Value="SubAdmin"></asp:ListItem>
                                                        <asp:ListItem Text="����" Value="Doctor"></asp:ListItem>
                                                        <asp:ListItem Text="���� ���" Value="Writer"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label1" Text="������ �������" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="txtqulification" Width="140px" runat="server" MaxLength="30"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtqulification"
                                                                    ErrorMessage="�����." ValidationGroup="CreateUserWizard1" 
                                                                    meta:resourcekey="ConfirmPasswordRequiredResource1" Display="Dynamic"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label2" Text="��� ������" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="txtPhoneNo" MaxLength="11" Width="140px" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPhoneNo"
                                                                    ErrorMessage="�����." ValidationGroup="CreateUserWizard1" 
                                                                    meta:resourcekey="ConfirmPasswordRequiredResource1" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="exp" ValidationGroup="CreateUserWizard1" runat="server"
                                                                    ControlToValidate="txtPhoneNo" ErrorMessage="����� ���" 
                                                                    ValidationExpression="^\d+$" Display="Dynamic"></asp:RegularExpressionValidator>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblGov" Text="������ ���" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="drpGov" Width="150px" Enabled="false" AutoPostBack="true" runat="server"
                                                        OnSelectedIndexChanged="drpGov_SelectedIndexChanged">
                                                        <asp:ListItem Value="-1">���� ������</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblCivil" Text="����� ����" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="drpCivil" Enabled="false" Width="150px" AutoPostBack="true"
                                                        runat="server" OnSelectedIndexChanged="drpCivil_SelectedIndexChanged">
                                                        <asp:ListItem Value="-1">���� �����</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblOffice" Text="���� ���" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="drpHealthOffice" Enabled="false" Width="150px" runat="server">
                                                        <asp:ListItem Value="-1">���� ����</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="pnlAdd" DisplayAfter="1"
                                                        ID="progParents">
                                                        <ProgressTemplate>
                                                            <asp:Image runat="server" ID="imgLoading" ImageUrl="~/Images/loading.gif" />
                                                            ���� �����
                                                        </ProgressTemplate>
                                                    </asp:UpdateProgress>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblNationalId" runat="server" Text="����� ������"></asp:Label>
                                                </td>
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="txtNationalId" Width="140px" MaxLength="14" runat="server" 
                                                                    meta:resourcekey="txtNationalIdResource1"></asp:TextBox>
                                                                <br />
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                                                    ControlToValidate="txtNationalId" Display="Dynamic" 
                                                                    ErrorMessage="���� ��� ���� ����" ValidationExpression="^([0])|(\d{14})$"></asp:RegularExpressionValidator>
                                                            </td>
                                                            <td>
                                                                <asp:ImageButton ID="btnSearch" runat="server" ImageUrl="~/Images/Search Magnifier.png"
                                                                    OnClick="btnSearch_Click" Width="25px" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td align="right">
                                                    <asp:Label ID="Label3" runat="server">����� �����:</asp:Label>
                                                </td>
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="txtFirstName" runat="server" MaxLength="20" Width="140px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFirstName"
                                                                    ErrorMessage="�����." meta:resourcekey="EmailRequiredResource1" ToolTip="Name is required."
                                                                    ValidationGroup="CreateUserWizard1" Display="Dynamic"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblFatherName" runat="server" Text="��� ����" meta:resourcekey="lblFatherNameResource1"> </asp:Label>
                                                </td>
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="txtFatherName" Width="140px" runat="server" meta:resourcekey="txtFatherNameResource1"
                                                                    MaxLength="40"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="GenralValidate"
                                                                    ID="RequiredFieldValidator4" ControlToValidate="txtFatherName" ErrorMessage="*"
                                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email" meta:resourcekey="EmailLabelResource1">������ ����������:</asp:Label>
                                                </td>
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="Email" runat="server" Width="140px" meta:resourcekey="EmailResource1"></asp:TextBox>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                                    ControlToValidate="Email" ValidationGroup="CreateUserWizard1" 
                                                                    ErrorMessage="������ ���������� ��� ����" Display="Dynamic" 
                                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label4" Text="���� ������" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="drpStatus" Width="150px" runat="server">
                                                        <asp:ListItem Selected="True" Value="1">����</asp:ListItem>
                                                        <asp:ListItem Value="0">�� ����</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" meta:resourcekey="UserNameLabelResource1">��� ������:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="UserName" Width="140px" runat="server" meta:resourcekey="UserNameResource1"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                        ErrorMessage="�����." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1"
                                                        meta:resourcekey="UserNameRequiredResource1" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </td>
                                                <td align="right">
                                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">����� �����:</asp:Label>
                                                </td>
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="Password" Width="140px" runat="server" TextMode="Password" meta:resourcekey="PasswordResource1"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                                    ErrorMessage="�����." ToolTip="Password is required." ValidationGroup="CreateUserWizard1"
                                                                    meta:resourcekey="PasswordRequiredResource1" Display="Dynamic"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td align="right">
                                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">����� ����� �����:</asp:Label>
                                                </td>
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="ConfirmPassword" Width="140px" runat="server" TextMode="Password"
                                                                    meta:resourcekey="ConfirmPasswordResource1"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                                                    ErrorMessage="�����." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1"
                                                                    meta:resourcekey="ConfirmPasswordRequiredResource1" Display="Dynamic"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="7">
                                                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                                        ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="���� ���� ������."
                                                        ValidationGroup="CreateUserWizard1" meta:resourcekey="PasswordCompareResource1"></asp:CompareValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="6" style="color: Red;">
                                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False" meta:resourcekey="ErrorMessageResource1"></asp:Literal>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:CreateUserWizardStep>
                                
                                <asp:CompleteWizardStep runat="server">
                                </asp:CompleteWizardStep>
                                
                            </WizardSteps>
                        </asp:CreateUserWizard>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
