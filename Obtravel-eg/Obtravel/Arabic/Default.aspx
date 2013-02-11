<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ARBannerMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Obtravel.Arabic.Default" %>
<%@ Register src="~/Arabic/UserContorls/Welcome.ascx" tagname="Welcome" tagprefix="uc1" %>
<%@ Register src="~/Arabic/UserContorls/About.ascx" tagname="About" tagprefix="uc2" %>
<%@ Register src="~/Arabic/UserContorls/Services.ascx" tagname="Services" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="left">
        <uc1:Welcome ID="Welcome1" runat="server" />
        <uc2:About ID="About1" runat="server" />
    </div>
        <div class="right">
                <uc3:Services ID="Services1" runat="server" />
            </div>
            <div class="clear"></div>
</asp:Content>
