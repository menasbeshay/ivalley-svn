<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="ManageAccount.aspx.cs" Inherits="Chat2Connect.Admin.ManageAccount" %>

<%@ Register Src="~/Admin/UserControls/AccountInfo.ascx" TagPrefix="uc1" TagName="AccountInfo" %>
<%@ Register Src="~/Admin/UserControls/AccountRoles.ascx" TagPrefix="uc1" TagName="AccountRoles" %>
<%@ Register Src="~/Admin/UserControls/AdminRoles.ascx" TagPrefix="uc1" TagName="AdminRoles" %>
<%@ Register Src="~/Admin/UserControls/AccountType.ascx" TagPrefix="uc1" TagName="AccountType" %>
<%@ Register Src="~/Admin/UserControls/AccountStatus.ascx" TagPrefix="uc1" TagName="AccountStatus" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="row">
        <div class="pull-right ">
            إدارة حساب
        </div>
        <div class="form-group">
            <asp:TextBox ID="txtMemberSearch" runat="server" placeholder="النكنيم" Style="padding: 5px; padding-top: 7px;"></asp:TextBox>
            <asp:LinkButton ID="lnkMemberSearch" runat="server" CssClass="icon icon-search" OnClick="lnkMemberSearch_Click"></asp:LinkButton>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-6">
            <uc1:AccountType runat="server" ID="ctrlAccountType" />
            <uc1:AccountStatus runat="server" id="ctrlAccountStatus" />
        </div>
        <div class="col-xs-6">
            <uc1:AccountInfo runat="server" ID="ctrlAccountInfo" />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-6">
            <uc1:AdminRoles runat="server" ID="ctrlAdminRoles" />
        </div>
        <div class="col-xs-6">
            <uc1:AccountRoles runat="server" ID="ctrlAccountRoles" />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-6">
            </div>
        <div class="col-xs-6">
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('input:checkbox').removeAttr('disabled');
            //$('input:checkbox').bootstrapSwitch();
        });
    </script>
</asp:Content>
