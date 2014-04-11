<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Mail.ascx.cs" Inherits="Chat2Connect.usercontrols.Mail" %>
<style>
    .mailbtn {
        font-size: 18px;
        padding: 3px;
        width: 100%;
    }
</style>
        <div class="clearfix" style="height: 5px;"></div>
<div class="row">
    <div class=" pull-right" style="width: 15%;">
        <div class="center-block" style="width: 100%;">
            <asp:LinkButton ID="lnkInboxLoad" runat="server" OnClick="lnkInboxLoad_Click" class="btn btn-main mailbtn" role="button">
                البريد الوارد
                       <i class="entypoicon iconentypo-inbox pull-left" style="font-size: 40px;"></i>
            </asp:LinkButton>
        </div>
        <div class="clearfix" style="height: 5px;"></div>
        <div class="center-block" style="width: 100%;">
            <asp:LinkButton ID="lnkSentLoad" runat="server" OnClick="lnkSentLoad_Click" class="btn btn-main mailbtn" role="button">
                البريد المرسل
                       <i class="entypoicon iconentypo-sent pull-left" style="font-size: 40px;"></i>
            </asp:LinkButton>
        </div>
        <div class="clearfix" style="height: 5px;"></div>
        <div class="center-block" style="width: 100%;">
            <asp:LinkButton ID="lnkDeletedLoad" runat="server" OnClick="lnkDeletedLoad_Click" class="btn btn-main mailbtn" role="button">
                المهملات
                       <i class="entypoicon iconentypo-deleted pull-left" style="font-size: 40px;"></i>
            </asp:LinkButton>
        </div>
        <div class="clearfix" style="height: 5px;"></div>
    </div>
    <div class="pull-right form-group">
        <asp:GridView ID="grdMessages" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" PageSize="25" OnPageIndexChanging="grdMessages_PageIndexChanging" OnRowDataBound="grdMessages_RowDataBound" HeaderStyle-CssClass="MsgHeader">
            <Columns>
                <asp:TemplateField HeaderText="الراسل" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="uiLabelSenderName"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="العنوان" DataField="MessageSubject" ItemStyle-HorizontalAlign="Right" />
                <asp:TemplateField HeaderText="التاريخ والوقت" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <span style="direction: rtl">
                            <asp:Label ID="uiLabelDate" runat="server"></asp:Label>
                        </span>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</div>
