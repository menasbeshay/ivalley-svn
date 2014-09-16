<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AREduMaster.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="EduMontreal.ar._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>مرحبا بكم في معهد التربية بمونتريال </h1>    
    <asp:Panel ID="startPanel" runat="server">
    يرجى ملء طلبك من أجل الحصول على دراستك في المعهد <a href="apply" class="btn btn-primary">إبدأ الأن</a>
        <br />
        <img src="../Images/status/start.jpg" style="max-width:700px;"/>
        </asp:Panel>
    <asp:Panel ID="uiPanelfollow" runat="server">
    يرجى متابعة طلبك في المعهد <a href="checkapp" class="btn btn-primary">راجع طلبك</a>
        <br />
        
        </asp:Panel>
</asp:Content>
