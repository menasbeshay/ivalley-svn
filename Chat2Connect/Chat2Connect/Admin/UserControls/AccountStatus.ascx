<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AccountStatus.ascx.cs" Inherits="Chat2Connect.Admin.UserControls.AccountStatus" %>
<div class="modal-content">
    <div class="modal-header">
        <h3 id="myModalLabel1">تعطيل/تشغيل حساب</h3>
    </div>
    <div class="modal-body">
        <div class="form-horizontal blockBox validationGroup">
            <div class="form-group">
                <asp:DropDownList ID="drpAccountStatus" CssClass="form-control" runat="server">
                </asp:DropDownList>
                <asp:Button ID="btnUpdateAccountStatus" runat="server" Text="إعتمد" CssClass="pull-left btn btn-warning " Style="width: 100px;" OnClick="btnUpdateAccountStatus_Click" />
            </div>
        </div>
    </div>
</div>
