<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AccountType.ascx.cs" Inherits="Chat2Connect.Admin.UserControls.AccountType" %>

<div class="modal-content">
    <div class="modal-header">
        <h3 id="myModalLabel1">ترقية الحساب</h3>
    </div>
    <div class="modal-body">
        <div class="form-horizontal blockBox validationGroup">
            <div class="form-group">
                <asp:DropDownList ID="drpAccountType" CssClass="form-control" runat="server" AppendDataBoundItems="true">
                    <asp:ListItem Text="لا يوجد" Value=""></asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnUpdateAccountType" runat="server" Text="إعتمد" CssClass="pull-left btn btn-warning " Style="width: 100px;" OnClick="btnUpdateAccountType_Click" />
            </div>
        </div>
    </div>
</div>
