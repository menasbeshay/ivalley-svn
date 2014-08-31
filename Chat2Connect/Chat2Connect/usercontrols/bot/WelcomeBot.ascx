<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WelcomeBot.ascx.cs" Inherits="Chat2Connect.usercontrols.bot.WelcomeBot" %>
<table dir="rtl">
    <tr>
        <td colspan="2">
            <asp:RadioButtonList ID="rdStatus" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="1" Text="فعال"></asp:ListItem>
                <asp:ListItem Value="0" Text="معطل"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>عند الدخول</td>
        <td>
            <asp:TextBox ID="txtLoginMessagePart1" runat="server" Width="100px"></asp:TextBox>
            (إسم الحساب)
            <asp:TextBox ID="txtLoginMessagePart2" runat="server" Width="100px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>عند الخروج</td>
        <td>
            <asp:TextBox ID="txtLogoutMessagePart1" runat="server" Width="100px"></asp:TextBox>
            (إسم الحساب)
            <asp:TextBox ID="txtLogoutMessagePart2" runat="server" Width="100px"></asp:TextBox>
        </td>
    </tr>
</table>
