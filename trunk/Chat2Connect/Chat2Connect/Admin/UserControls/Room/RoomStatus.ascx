<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RoomStatus.ascx.cs" Inherits="Chat2Connect.Admin.UserControls.Room.RoomStatus" %>
<div class="modal-content">
    <div class="modal-header">
        <h3 id="myModalLabel1">تعطيل/تشغيل غرفة</h3>
    </div>
    <div class="modal-body">
        <div class="form-horizontal blockBox validationGroup">
            <div class="form-group">
                <asp:DropDownList ID="drpRoomStatus" CssClass="form-control" runat="server">
                </asp:DropDownList>
                <asp:Button ID="btnUpdateRoomStatus" runat="server" Text="إعتمد" CssClass="pull-left btn btn-warning " Style="width: 100px;" OnClick="btnUpdateRoomStatus_Click" />
            </div>
        </div>
    </div>
</div>