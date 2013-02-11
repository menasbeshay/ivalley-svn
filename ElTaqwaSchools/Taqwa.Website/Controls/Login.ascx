<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="Taqwa.Website.Controls.Login" %>

<style type="text/css">

.style37 {font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: bold; color: #FFFFFF; }
</style>
<asp:Panel ID="uiPanelLogin" runat="server" Style="padding-left: 5px;">
    <div style="height: 8px;">
        &nbsp;</div>
    <table width="509" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="41" rowspan="2" valign="bottom">
                <img src="../images/login_icon.png" width="29" height="35" />
            </td>
            <td>
                <div align="center" class="style37">
                    دخول الاعضاء
                </div>
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td width="144">
                <label for="ctl00_Login1_uiTextBoxUserName">
                    اســــم الــمســتخدم</label>
                <asp:TextBox ID="uiTextBoxUserName" runat="server" ValidationGroup="LoginControl"></asp:TextBox>
                <label for="ctl00_Login1_uiTextBoxSecertCode">
                    الــرقـــم الـــسرى</label>
                <asp:TextBox ID="uiTextBoxSecertCode" runat="server" ValidationGroup="LoginControl"
                    TextMode="Password"></asp:TextBox>
            </td>
            <td width="13">
                <br />
            </td>
            <td width="66">
                <asp:ImageButton ID="uiImageButtonLogin" runat="server" ImageUrl="~/images/login.gif"
                    ValidationGroup="LoginControl" OnClick="uiImageButtonLogin_Click" />
                <%--<img src="images/login.png" width="64" height="21" />--%>
            </td>
            <td width="163">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td colspan="3">
                <div align="center">
                </div>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <script type="text/javascript" charset="utf-8">
        $(document).ready(function () {
            $("label").inFieldLabels();
        });
	                </script>
</asp:Panel>
<asp:Panel ID="uiPanelAccount" runat="server" Style="padding-left: 5px;">
<div style="height: 8px;">
        &nbsp;</div>
    <table width="509" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="41" rowspan="2" valign="bottom">
                &nbsp;
            </td>
            <td>
                <div align="center" class="style37">
                    دخول الاعضاء
                </div>
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td width="144">
                <%-- </form>--%>
                <asp:ImageButton ID="uiImageButtonMyAccount" runat="server" ImageUrl="~/images/myAccount.gif"
                    OnClick="uiImageButtonMyAccount_Click" ValidationGroup="Login" />
            </td>
            <td width="13">
                <br />
            </td>
            <td width="66">
                <%--<img src="images/login.png" width="64" height="21" />--%>
            </td>
            <td width="163">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td colspan="3">
                <div align="center" style="text-align: left">
                    <asp:ImageButton ID="uiImageButtonLogout" runat="server" Height="21px" ImageUrl="~/images/logout.gif"
                        OnClick="uiImageButtonLogout_Click" ValidationGroup="Login" Width="64px" />
                </div>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Panel>



                

