<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="YMC_Website.Controls.Login" %>
<div id="userlogin">
    <div class="maintext" id="userlogtext">
        دخول الاعضاء</div>
    <div id="userloginform">
        <asp:Panel ID="uiPanelNotLogin" runat="server">
        <table width="190" cellspacing="1">
            <tr>
                <td style="text-align: right">
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="uiTextBoxUserName" Display="Dynamic" ErrorMessage="*" 
                        ForeColor="Red" ValidationGroup="Login"></asp:RequiredFieldValidator>
                    &nbsp;<asp:TextBox ID="uiTextBoxUserName" runat="server" Width="100"></asp:TextBox>
                </td>
                <td style="text-align: right">
                    الاسم
                </td>
            </tr>
            <tr>
                <td style="text-align: right">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="uiTextBoxPassword" Display="Dynamic" ErrorMessage="*" 
                        ForeColor="Red" ValidationGroup="Login"></asp:RequiredFieldValidator>
                    &nbsp;<asp:TextBox ID="uiTextBoxPassword" runat="server" TextMode="Password" Width="100"></asp:TextBox>
                </td>
                <td>
                    <label for="password" style="text-align: right">
                        كلمة السر</label>
                </td>
            </tr>
            <tr>
                <td style="text-align: center" colspan="2">
                    <asp:Label ID="uiLabelError" runat="server" Font-Size="10px" ForeColor="Red" 
                        Text="خطأ فى إسم المستخدم أو كلمة المرور" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:Label ID="uiLabelNotApproved" runat="server" Font-Size="10px" 
                        ForeColor="Red" Text="لم يتم تفعيل حسابك، من فضلك أعد المحاولة لاحقاً" 
                        Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right">
                    <asp:Button ID="uiButtonLogin" runat="server" onclick="uiButtonLogin_Click" 
                        Text="دخول" ValidationGroup="Login" />
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="text-align: right">
                    <asp:HyperLink ID="uiHyperLinkGetPassword" runat="server" 
                        NavigateUrl="~/SendPassword.aspx"> استعادة كلمة المرور</asp:HyperLink>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
        </asp:Panel>

        <asp:Panel ID="uiPanelLoggedIn" runat="server">
            <table width="190" cellspacing="1">
                <tr>
                    <td style="text-align: right">
                        <asp:HyperLink ID="uiHyperLinkUserPage" runat="server" NavigateUrl="~/UserHome.aspx"> صفحتك الشخصية</asp:HyperLink>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>            
                <tr>
                    <td style="text-align: right">
                        <asp:Button ID="uiButtonLogout" runat="server" OnClick="uiButtonLogout_Click" Text="خروج"/>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
               
            </table>
        </asp:Panel>
    </div>
    </div>

