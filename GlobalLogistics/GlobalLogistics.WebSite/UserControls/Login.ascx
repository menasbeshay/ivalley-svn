<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="GlobalLogistics.WebSite.UserControls.Login" %>
<div class="ContentLeftDiv">

<asp:LoginView ID="uiLoginView" runat="server">
<AnonymousTemplate>
<h1>
    <asp:Label ID="Label1" runat="server" Text="Log In" 
        meta:resourcekey="Label1Resource1"></asp:Label>
</h1>
<div class="Details675">
<asp:Panel ID="uiPanelLogin" runat="server">
    <asp:Login ID="uiLogin" runat="server" Width="100%" CssClass="ContentLeftDiv" 
        TitleText="" meta:resourcekey="uiLoginResource1">
        <LabelStyle CssClass="Label" HorizontalAlign="Left" />
    </asp:Login>
    </asp:Panel>
    </div>
</AnonymousTemplate>

<LoggedInTemplate>
    <asp:LoginStatus ID="uiLoginStatus" runat="server" 
        meta:resourcekey="uiLoginStatusResource1" />
</LoggedInTemplate>
</asp:LoginView>
</div>