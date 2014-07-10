<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginControl.ascx.cs" Inherits="Taqwa.Website.Controls.LoginControl" %>
<asp:Panel ID="uiPanelLogin" runat="server" CssClass="pull-left"  DefaultButton="uiLinkButtonLogin"  >
<div class="grid_6 fll pull-left">
    <div class="grid_5 alpha pull-right fll">
        <asp:TextBox ID="uiTextBoxUsername" runat="server" CssClass="form-control" placeholder="إسم المستخدم"></asp:TextBox>
    </div>
    <div class="grid_5 alpha pull-right fll">
        <asp:TextBox ID="uiTextBoxPassword" TextMode="Password" runat="server" CssClass="form-control" placeholder="كلمة المرور"></asp:TextBox>
    </div>
    <div class="grid_2 alpha pull-right fll">
        <asp:LinkButton ID="uiLinkButtonLogin" runat="server" 
            onclick="uiLinkButtonLogin_Click" CssClass="btn " style="margin-top:-5px;background-color:#006535;color:#fff;"> دخول الطلاب</asp:LinkButton>
    </div>
</div>
</asp:Panel>

<asp:Panel ID="uiPanelLogout" runat="server" CssClass="pull-left">
<div class="grid_12 fll pull-left ">
    <div class="grid_4 pull-right fll">
    <asp:LinkButton ID="LinkButton1" runat="server" 
        onclick="uiLinkButtonLogout_Click" CssClass="btn btn-default" 
        PostBackUrl="~/MyAccount.aspx">حسابى</asp:LinkButton>
        </div>&nbsp;
        <div class="grid_4 pull-left fll">
    <asp:LinkButton ID="uiLinkButtonLogout" runat="server" 
        onclick="uiLinkButtonLogout_Click" CssClass="btn btn-default">خروج</asp:LinkButton>
        </div>
</div>
</asp:Panel>