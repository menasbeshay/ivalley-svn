<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ENNoBanner.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Obtravel.Admin.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" cellpadding="2" cellspacing="2" style="empty-cells:show">
                                                <tr>
                                                    <td colspan="3">
                                                        <asp:Label ID="uiLabelErrorLogin" runat="server" ForeColor="#C76E1F" 
                                                            Text="Error in User Name or Password" Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="uiLabelUserName" runat="server" Text="User Name:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="uiTextBoxUserName" runat="server" Width="150px"></asp:TextBox>
                                                    </td>
                                                    <td width="60px">
                                                        &nbsp;&nbsp;&nbsp;
                                                        <asp:RequiredFieldValidator ID="uiRequiredFieldValidatorUserName" 
                                                            runat="server" ControlToValidate="uiTextBoxUserName" Display="Dynamic" 
                                                            ErrorMessage="*" ValidationGroup="Login" ForeColor="#C76E1F">Required</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="uiLabelPassword" runat="server" Text="Password:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="uiTextBoxPassword" runat="server" TextMode="Password" 
                                                            Width="150px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        &nbsp;&nbsp;&nbsp;
                                                        <asp:RequiredFieldValidator ID="uiRequiredFieldValidatorPassword" 
                                                            runat="server" ControlToValidate="uiTextBoxPassword" Display="Dynamic" 
                                                            ErrorMessage="*" ValidationGroup="Login" ForeColor="#C76E1F">Required</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td>
                                                       <div class="btn">
                                                           <asp:LinkButton ID="uiLinkButtonLogin" runat="server" 
                                                               onclick="uiLinkButtonLogin_Click" ValidationGroup="Login">Login</asp:LinkButton></div>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
</asp:Content>
