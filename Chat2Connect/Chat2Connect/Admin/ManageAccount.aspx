<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="ManageAccount.aspx.cs" Inherits="Chat2Connect.Admin.ManageAccount" %>

<%@ Register Src="~/Admin/UserControls/AccountInfo.ascx" TagPrefix="uc1" TagName="AccountInfo" %>
<%@ Register Src="~/Admin/UserControls/AccountRoles.ascx" TagPrefix="uc1" TagName="AccountRoles" %>
<%@ Register Src="~/Admin/UserControls/AdminRoles.ascx" TagPrefix="uc1" TagName="AdminRoles" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="pull-right ">
        إدارة حساب
    </div>
    <div class="form-group">
        <div class="col-sm-12 control-label pull-right">
            <asp:Label ID="ErrorMessage" runat="server" EnableViewState="False" Visible="false" ForeColor="red"></asp:Label>
        </div>
    </div>
    <div class="form-group">
        <asp:TextBox ID="txtMemberSearch" runat="server" placeholder="النكنيم" Style="padding: 5px; padding-top: 7px;"></asp:TextBox>
        <asp:LinkButton ID="lnkMemberSearch" runat="server" CssClass="icon icon-search" OnClick="lnkMemberSearch_Click"></asp:LinkButton>
        <asp:TextBox ID="txtSelectedMember" runat="server" Visible="false" />
    </div>
    <uc1:AccountInfo runat="server" id="ctrlAccountInfo" />
    <uc1:AccountRoles runat="server" id="ctrlAccountRoles" />
    <uc1:AdminRoles runat="server" id="ctrlAdminRoles" />
    <script>
        $(document).ready(function () {
            $('input:checkbox').removeAttr('disabled');
            //$('input:checkbox').bootstrapSwitch();
        });
    </script>
</asp:Content>
