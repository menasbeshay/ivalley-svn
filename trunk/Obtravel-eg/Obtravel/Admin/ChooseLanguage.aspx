<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ENNoBanner.Master" AutoEventWireup="true" CodeBehind="ChooseLanguage.aspx.cs" Inherits="Obtravel.Admin.ChooseLanguage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <h1>Choose which Admin Control panel you need </h1>
    
    <div class="btn"><asp:HyperLink ID="uiHyperLinkEditPages" runat="server" 
            NavigateUrl="~/Admin/AdminCP.aspx" style="float:left">Admin CP for English Site</asp:HyperLink>
    </div>
    <div class="clear10px"></div>
    <div class="btn"><asp:HyperLink ID="uiHyperLinkHomeBlocks" runat="server" 
            NavigateUrl="~/Arabic/Admin/AdminCP.aspx" style="float:left">لوحة التحكم للموقع العربى</asp:HyperLink>
    </div>
</asp:Content>
