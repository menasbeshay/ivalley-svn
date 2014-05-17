<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Company_Login.aspx.cs"
    Inherits="Pricing_GUI.Company_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <br /><br /><br /><br /><br /><br /><br />
    <center>
    <asp:Label runat="server" ID="lblTitle" Text="Companies Login ..." 
            Font-Size="XX-Large" Font-Names="Sakkal Majalla"></asp:Label>
            <br /><br />
    <div style=" width: 75%">
        <table>
            <tr>
                <td>
                    <asp:Label runat="server" ID="lblUserName" Text="Company Code"></asp:Label>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtCompanyCode" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator runat="server" ID="rquiredCompanyCode" ErrorMessage="*"
                        ForeColor="Red" ControlToValidate="txtCompanyCode" Display="Static"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="Label1" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ErrorMessage="*"
                        ForeColor="Red" ControlToValidate="txtPassword" Display="Static"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="right">
                    <asp:Button runat="server" ID="btnLogin" Text="Login" Width="90px" 
                        onclick="btnLogin_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                <asp:Label runat="server" ID="lblResult" ForeColor="Maroon" Font-Size="Large"></asp:Label>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    </center>
    </form>
</body>
</html>
