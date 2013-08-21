<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Inner.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="website.MyAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
    .style1
    {
        width: 100%;
        border-collapse: collapse;
    }
</style>
    <table align="left" cellpadding="2" class="style1">
    <tr>
    <td colspan="3"></td>
    </tr>
    <tr>
        <td colspan="3">
        My Account
        </td>
    </tr>
        <tr>
            <td colspan="3">
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" CssClass="Label" Text="First Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxFN" runat="server" ValidationGroup="AddUser" Width="200px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="uiTextBoxFN"
                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="AddUser"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" CssClass="Label" Text="Last Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxLN" runat="server" ValidationGroup="AddUser" Width="200px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="uiTextBoxLN"
                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="AddUser"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" CssClass="Label" Text="User Name"></asp:Label>
            </td>
            <td>
                <asp:Label ID="uiLabelUserName" runat="server" ></asp:Label>
            </td>
            <td>
                
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" CssClass="Label" Text="Password"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxPassword" runat="server" TextMode="Password" ValidationGroup="AddUser"
                    Width="200px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="uiTextBoxPassword"
                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="AddUser"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label13" runat="server" CssClass="Label" Text="Re-Password"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxRepass" runat="server" TextMode="Password" ValidationGroup="AddUser"
                    Width="200px"></asp:TextBox>
            </td>
            <td>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="uiTextBoxPassword"
                    ControlToValidate="uiTextBoxRepass" Display="Dynamic" ErrorMessage="Password don't match"
                    ForeColor="Red" ValidationGroup="AddUser"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" CssClass="Label" Text="E-Mail"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxMail" runat="server" ValidationGroup="AddUser" Width="200px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="uiTextBoxMail"
                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="AddUser"></asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                    ControlToValidate="uiTextBoxMail" Display="Dynamic" ErrorMessage="Enter mail correctly"
                    ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ValidationGroup="AddUser"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" CssClass="Label" Text="Address"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxAddress" runat="server" ValidationGroup="AddUser" Width="200px"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" CssClass="Label" Text="City"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxCity" runat="server" ValidationGroup="AddUser" Width="200px"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" CssClass="Label" Text="State"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxState" runat="server" ValidationGroup="AddUser" Width="200px"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" CssClass="Label" Text="Postal code"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxPC" runat="server" ValidationGroup="AddUser" Width="200px"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label10" runat="server" CssClass="Label" Text="Country"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxCountry" runat="server" ValidationGroup="AddUser" Width="200px"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label11" runat="server" CssClass="Label" Text="Phone"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxPhone" runat="server" ValidationGroup="AddUser" Width="200px"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label12" runat="server" CssClass="Label" Text="Fax"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxFax" runat="server" ValidationGroup="AddUser" Width="200px"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Button ID="uiButtonRegister" runat="server" OnClick="uiButtonRegister_Click"
                    Text="Update your data" ValidationGroup="AddUser" />
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>

    <asp:Panel ID="Orders" runat="server" GroupingText="My Orders">
        <asp:GridView ID="uiGridViewOrders" runat="server" AutoGenerateColumns="False" OnRowCommand="uiGridViewOrders_RowCommand"
            AllowPaging="True" OnPageIndexChanging="uiGridViewOrders_PageIndexChanging" EnableModelValidation="True"
            HorizontalAlign="Center" Width="95%">
        <Columns>
            <asp:BoundField DataField="OrderNumber" HeaderText="Order Number" />
            <asp:BoundField DataField="UserName" HeaderText="User Name" />
            <asp:BoundField DataField="OrderDate" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}" />            
            <asp:BoundField DataField="Status" HeaderText="Status" />
            
            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("OrderID") %>'
                        CommandName="ViewOrder">Details</asp:LinkButton>&nbsp;
            
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        </asp:GridView>
    </asp:Panel>
</asp:Content>
