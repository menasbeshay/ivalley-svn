<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCLogin.ascx.cs" Inherits="website.UC.UCLogin" %>

<asp:Panel ID="uiPanelLogin" runat="server" DefaultButton="uiButtonLogin">
    
                <table style="display:inline;width:100%;">
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="uiLabelErrorLogin" runat="server" ForeColor="Red" Text="Error in User Name or Password"
                                Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <p>
                            <asp:Label ID="uiLabelUserName" runat="server" Text="User Name"></asp:Label>
                        </p>
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="uiTextBoxUserName" runat="server" CssClass="campoArea"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="uiRequiredFieldValidatorUserName" runat="server"
                                ControlToValidate="uiTextBoxUserName" Display="Dynamic" ErrorMessage="*" ValidationGroup="UCLogin">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <p>
                            <asp:Label ID="uiLabelPassword" runat="server" Text="Password"></asp:Label>
                        </p>
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="uiTextBoxPassword" runat="server" TextMode="Password" CssClass="campoArea"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="uiRequiredFieldValidatorPassword" runat="server"
                                ControlToValidate="uiTextBoxPassword" Display="Dynamic" ErrorMessage="*" ValidationGroup="UCLogin">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td style="text-align: left">
                            <asp:Button ID="uiButtonLogin" runat="server" Text="Login" ValidationGroup="UCLogin"
                                OnClick="uiButtonLogin_Click" />
                            | <a href="../Registration.aspx">Register</a>
                        </td>
                        <td>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            
                        </td>
                        <td >
                            
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            
</asp:Panel>

<asp:Panel ID="uiPanelLoggedin" runat="server">
    <a href="../MyAccount.aspx" > My Account </a> | 
    <asp:LinkButton ID="uiLinkButtonLogout" runat="server" 
        onclick="uiLinkButtonLogout_Click">Logout</asp:LinkButton>
</asp:Panel>
