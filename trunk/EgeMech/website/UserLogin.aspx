<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Inner.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="website.UserLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" DefaultButton="uiButtonLogin">
        <table border="0" width="97%" cellspacing="0" cellpadding="0">
        <tr>
        <td></td>
        </tr>
            <tr>
                <td>
                <h2>
                User Login
                </h2>
                    <div class="clear5">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <table align="left" cellpadding="0" cellspacing="0" class="style1" dir="ltr">
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="uiLabelErrorLogin" runat="server" ForeColor="Red" Text="Error in User Name or Password"
                                    Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="uiLabelUserName" runat="server" Text="User Name:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="uiTextBoxUserName" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="uiRequiredFieldValidatorUserName" runat="server"
                                    ControlToValidate="uiTextBoxUserName" Display="Dynamic" ErrorMessage="*" ValidationGroup="Login">Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="uiLabelPassword" runat="server" Text="Password:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="uiTextBoxPassword" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="uiRequiredFieldValidatorPassword" runat="server"
                                    ControlToValidate="uiTextBoxPassword" Display="Dynamic" ErrorMessage="*" ValidationGroup="Login">Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="uiButtonLogin" runat="server" Text="Login" ValidationGroup="Login"
                                    OnClick="uiButtonLogin_Click" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
