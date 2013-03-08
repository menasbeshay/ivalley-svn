<%@ Page Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true"
    CodeFile="AdminChangePassword.aspx.cs" Inherits="AdminChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
<center>
<asp:Label runat="server" ID="lblTitle" Text="تغيير كلمة المرور" Font-Bold="true" Font-Size="17px"></asp:Label>
</center>
    <div  style="text-align:right">
    <table dir="rtl" style="font-size:14px" cellpadding="4px" cellspacing="4px">
        <tr>
            <td>
                <asp:Label runat="server" Font-Bold="true" ID="lblUserName" Text="اسم المستخدم"></asp:Label>
            </td>
            <td>
                <asp:Label runat="server" ID="txtUserName"></asp:Label>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="Label1" Font-Bold="true" Text="كلمة المرور الجديدة"></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtNewPassword" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ErrorMessage="*"
                    ForeColor="Red" Display="Dynamic" ControlToValidate="txtNewPassword"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="Label2" Font-Bold="true" Text="تاكيد كلمة المرور"></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtNewPasswordconfirm" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ErrorMessage="*"
                    ForeColor="Red" Display="Dynamic" ControlToValidate="txtNewPasswordconfirm"></asp:RequiredFieldValidator>
                <asp:CompareValidator runat="server" ID="compareValidatePasswords" ForeColor="Red"
                    ControlToValidate="txtNewPassword" ControlToCompare="txtNewPasswordconfirm" Display="Dynamic"
                    ErrorMessage="تاكيد كلمة المور لابد ان يطابق كلمة المرور الجديدة" Operator="Equal"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
        <td colspan="3" align="right">
        <asp:Label runat="server" ID="lblError" ForeColor="Red"></asp:Label>
        </td>
        </tr>
        <tr>
            <td colspan="3" align="right">
                <asp:Button runat="server" ID="btnChange" Text="تغيير كلمة المرور" 
                    onclick="btnChange_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button runat="server" ID="btnCancel" ValidationGroup="Cancel" 
                    Text="رجوع" onclick="btnCancel_Click" />
            
            </td>
        </tr>
    </table>
    </div>
</asp:Content>
