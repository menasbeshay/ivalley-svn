<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resetpass.aspx.cs" Inherits="Combo.resetpass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="uiPanelReset" runat="server">
             <div style="width:99%;border:1px solid black;clear:both;padding:5px">
                <div style="width:10%;">New password : </div>
                <div style="width:20%;">
                    <asp:TextBox ID="uiTextBoxPass" TextMode="Password" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="uiTextBoxPass" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ValidationGroup="resetpass"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div style="width:99%;border:1px solid black;clear:both;padding:5px">
                <div style="width:10%;">confirm password : </div>
                <div style="width:20%;">
                    <asp:TextBox ID="uiTextBoxcpass" TextMode="Password" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="uiTextBoxcpass" ControlToCompare="uiTextBoxPass" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ValidationGroup="resetpass"></asp:CompareValidator>
                </div>
            </div>
            <div style="width:99%;border:1px solid black;clear:both;padding:5px">
                <div style="width:10%;"></div>
                <div style="width:20%;">
                    <asp:Button ID="uiButtonSave" runat="server" Text="Reset password" ValidationGroup="resetpass" OnClick="uiButtonSave_Click" /></div>
            </div>
        </asp:Panel>
        <asp:Panel ID="uiPanelError" runat="server">
            Error , please ask to reset your password again.
        </asp:Panel>

         <asp:Panel ID="uiPanelsuccess" runat="server">
            Password has been changed successfully.
        </asp:Panel>
   
    </form>
</body>
</html>
