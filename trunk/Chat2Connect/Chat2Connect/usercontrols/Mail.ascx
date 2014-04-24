<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Mail.ascx.cs" Inherits="Chat2Connect.usercontrols.Mail" %>
<%@ Register Src="~/usercontrols/SendMail.ascx" TagPrefix="uc1" TagName="SendMail" %>

<style>
    .mailbtn {
        font-size: 18px;
        padding: 3px;
        width: 100%;
    }
</style>
<div class="clearfix" style="height: 5px;"></div>
<div class="row">
    <div class=" pull-left" style="width: 15%;">
        <div class="clearfix" style="height: 5px;"></div>
        <div class="center-block" style="width: 100%;">
            <asp:LinkButton ID="lnkSendMessage" runat="server" OnClick="lnkSendMessage_Click" CssClass="btn btn-main mailbtn" role="button">
                إرسال رسالة
                       <i class="entypoicon iconentypo-newmsg pull-left" style="font-size:40px;"></i>
            </asp:LinkButton>
        </div>
    </div>
</div>
<div class="row">
    <div class=" pull-right" style="width: 15%;">
        <div class="center-block" style="width: 100%;">
            <asp:LinkButton ID="lnkInboxLoad" runat="server" OnClick="lnkInboxLoad_Click" CssClass="btn btn-main mailbtn" role="button">
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
            <asp:LinkButton ID="lnkDeletedLoad" runat="server" OnClick="lnkDeletedLoad_Click" CssClass="btn btn-main mailbtn" role="button">
                المهملات
                       <i class="entypoicon iconentypo-deleted pull-left" style="font-size: 40px;"></i>
            </asp:LinkButton>
        </div>
        <asp:Repeater ID="repMemberFolders" runat="server">
            <ItemTemplate>
                <div class="clearfix" style="height: 5px;"></div>
                <div class="center-block" style="width: 100%;">
                    <asp:LinkButton ID="lnkCustomeFolderMessages" runat="server" OnClick="lnkCustomeFolderMessages_Click" CommandArgument='<%# Eval("MessageFolderID") %>' CssClass="btn btn-main mailbtn" role="button">
                <%# Eval("Name") %>
                       <i class="entypoicon pull-left" style="font-size: 40px;"></i>
                    </asp:LinkButton>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div class="clearfix" style="height: 5px;"></div>
        <div class="center-block" style="width: 100%;">
            <asp:LinkButton ID="lnkCreateFolder" runat="server" OnClick="lnkCreateFolder_Click" CssClass="btn btn-main mailbtn" role="button">
                إنشاء تصنيف جديد
                       <i class="entypoicon iconentypo-newfolder pull-left" style="font-size:40px;"></i>
            </asp:LinkButton>
        </div>
        <div class="clearfix" style="height: 5px;"></div>
    </div>
    <div class="pull-right form-group" style="width: 85%">
        <asp:Panel ID="pnlViewMessages" runat="server">
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
        </asp:Panel>
        <asp:Panel ID="pnlSendMessage" runat="server" Visible="false" Width="100%">
            <uc1:SendMail runat="server" ID="ctrlSendMail"/>
        </asp:Panel>
        <asp:Panel ID="pnlCreateFolder" runat="server" Visible="false" Width="100%">
            <div class="form-horizontal blockBox">
                <div class="row">
                    <div class="col-sm-2 pull-right">
                        <asp:HiddenField ID="folderID" runat="server" Value="0" />
                        <label>اسم التصنيف  </label>
                    </div>
                    <div class="col-sm-8 pull-right">
                        <asp:TextBox ID="txtFolderName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-1 pull-right">
                        <asp:LinkButton ID="lnkSaveFolder" runat="server" CssClass="btn btn-main" OnClick="lnkSaveFolder_Click">حفظ</asp:LinkButton>
                    </div>
                </div>
                <div class="clearfix" style="height: 10px;"></div>
                <div class="row">
                    <div class="col-sm-2 pull-right">
                        <label>التصنيفات الحالية </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-10 pull-right">
                        <asp:GridView ID="grdFolders" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" OnPageIndexChanging="grdFolders_PageIndexChanging" HeaderStyle-CssClass="MsgHeader" OnRowCommand="grdFolders_RowCommand">
                            <Columns>
                                <asp:BoundField HeaderText="اسم التصنيف" ItemStyle-HorizontalAlign="Center" DataField="Name" />
                                <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEditFolder" runat="server" CssClass="btn btn-main" CommandArgument='<%# Eval("MessageFolderID") %>' CommandName="EditFolder">تعديل</asp:LinkButton>
                                        <asp:LinkButton ID="lnkDeleteFolder" runat="server" CssClass="btn btn-main" CommandArgument='<%# Eval("MessageFolderID") %>' CommandName="DeleteFolder">حذف</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>

</div>
