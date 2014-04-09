<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="Accounts.aspx.cs" Inherits="Chat2Connect.Admin.Accounts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <% if (Helper.Admin.HasRole(Helper.Enums.AdminRoles.Admin_MailsAccounts.ToString()))
       { %>
    <div class="row">
        <div class="pull-right ">
            حسابات البريد الإلكترونى
        </div>
        <div class="form-group">
            <asp:TextBox ID="txtMemberMailSearch" runat="server" placeholder="البريد الإلكترونى" Style="padding: 5px; padding-top: 7px;"></asp:TextBox>
            <asp:LinkButton ID="lnkMemberMailSearch" runat="server" CssClass="icon icon-search" OnClick="lnkMemberMailSearch_Click"></asp:LinkButton>
        </div>
    </div>
    <%} %>
    <% if (Helper.Admin.HasRole(Helper.Enums.AdminRoles.Admin_IPAccounts.ToString()))
       { %>
    <div class="row">
        <div class="pull-right ">
            حسابات الاّى بى IP
        </div>
        <div class="form-group">
            <asp:TextBox ID="txtMemberIPSearch" runat="server" placeholder="البريد الإلكترونى" Style="padding: 5px; padding-top: 7px;"></asp:TextBox>
            <asp:LinkButton ID="lnkmemberIPSearch" runat="server" CssClass="icon icon-search" OnClick="lnkmemberIPSearch_Click"></asp:LinkButton>
        </div>
    </div>
    <%} %>
    <div class="form-horizontal blockBoxshadow">
        <h2>النتائج
        </h2>
        <div class="clearfix" style="height: 10px;"></div>
        <div class="col-lg-12" style="float: none;">
            <asp:GridView ID="grdMemberResult" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" OnPageIndexChanging="grdMemberResult_PageIndexChanging" HeaderStyle-CssClass="MsgHeader">
                <RowStyle HorizontalAlign="Center" />
                <EmptyDataTemplate>
                    لا توجد بيانات
                </EmptyDataTemplate>
                <Columns>
                    <asp:BoundField DataField="UserName" HeaderText="إسم العضو" />
                    <asp:BoundField DataField="Email" HeaderText="البريد الإلكترونى" />
                    <asp:BoundField DataField="CreationDate" DataFormatString="{0:dd / MM / yyyy hh:mm tt}" HeaderText="تاريخ التسجيل" />
                </Columns>
            </asp:GridView>
            <div class="clearfix" style="height: 5px;"></div>
        </div>
        <div class="clearfix" style="height: 5px;"></div>
    </div>
</asp:Content>
