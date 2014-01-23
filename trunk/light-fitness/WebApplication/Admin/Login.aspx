<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Admin.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication.Admin.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Panel ID="uiPanelLogin" runat="server" DefaultButton="uiLinkButtonLogin">
    <table align="center" cellpadding="2" cellspacing="2" style="empty-cells: show;width:80%;"> 
        <tr>
            <td colspan="3">
                <asp:Label ID="uiLabelErrorLogin" runat="server" ForeColor="#C76E1F" Text="Error in User Name or Password"
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="uiLabelUserName" runat="server" Text="User Name:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxUserName" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td >
                
                <asp:RequiredFieldValidator ID="uiRequiredFieldValidatorUserName" runat="server"
                    ControlToValidate="uiTextBoxUserName" Display="Dynamic" ErrorMessage="*" ValidationGroup="Login"
                    ForeColor="#C76E1F">Required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="uiLabelPassword" runat="server" Text="Password:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxPassword" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
            </td>
            <td>
                
                <asp:RequiredFieldValidator ID="uiRequiredFieldValidatorPassword" runat="server"
                    ControlToValidate="uiTextBoxPassword" Display="Dynamic" ErrorMessage="*" ValidationGroup="Login"
                    ForeColor="#C76E1F">Required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <div class="SmallBtn">
                    <asp:LinkButton ID="uiLinkButtonLogin" runat="server" OnClick="uiLinkButtonLogin_Click"
                        ValidationGroup="Login" >Login</asp:LinkButton></div>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    </asp:Panel>
</asp:Content>
