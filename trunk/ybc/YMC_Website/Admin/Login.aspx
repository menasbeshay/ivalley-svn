<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="YMC_Website.Admin.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/Styles/AdminSite.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="page">
        <div class="header">
            <div class="title" style="text-align: center; width: 98%">
                <h1 >
                    ادارة الموقع
                </h1>
            </div>
            <div class="loginDisplay">
            </div>
            <div class="clear hideSkiplink">
            </div>
        </div>
        <div class="main">
            <table dir="rtl" cellpadding="2" cellspacing="2" style="float:right;">
                <tr>                    
                    <td style="margin-right: 80px" colspan="3">
                        <asp:Label ID="uiLabelError" runat="server" ForeColor="Red" 
                            Text="خطأ فى إسم المستخدم أو كلمة المرور. من فضلك أعد المحاولة." 
                            Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>                    
                    <td style="margin-right: 80px">
                        <asp:Label ID="Label1" runat="server" Text="إسم المستخدم "></asp:Label>
                    </td>
                    <td>
                    <asp:TextBox ID="uiTextBoxUserName" runat="server" ValidationGroup="Login"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="uiTextBoxUserName" Display="Dynamic" ErrorMessage="*" 
                            ForeColor="#FF3300" ValidationGroup="Login"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>                    
                    <td style="margin-right: 80px">
                        <asp:Label ID="Label2" runat="server" Text="كلمة المرور"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="uiTextBoxPassword" runat="server" TextMode="Password" 
                            ValidationGroup="Login"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="uiTextBoxPassword" Display="Dynamic" ErrorMessage="*" 
                            ForeColor="#FF3300" ValidationGroup="Login"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>                    
                    <td style="margin-right: 80px;width:120px;">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="uiButtonLogin" runat="server" Text="دخول" CssClass="submitButton" 
                            ValidationGroup="Login" onclick="uiButtonLogin_Click" />
                    </td>
                    <td style="direction: ltr">
                        &nbsp;</td>
                </tr>
                </table>
            <div class="clear">
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="footer">
    </div>
    </form>
</body>
</html>
