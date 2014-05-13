<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Mail.ascx.cs" Inherits="Chat2Connect.usercontrols.Mail" %>
<%@ Register Src="~/usercontrols/SendMail.ascx" TagPrefix="uc1" TagName="SendMail" %>

<style>
    .mailbtn {
        font-size: 18px;
        padding: 3px;
        width: 100%;
    }

    #dvMessageDetails {
        border: 1px solid #DDDDDD;
        background-color: white;
    }
</style>
<div class="clearfix" style="height: 5px;"></div>
<div class="row">
    <div class="pull-right">

        <h3>
            <i class="icon icon-envelope-alt"></i>
            <%= MemberName %></h3>
    </div>
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
        <asp:Repeater ID="repMemberFolders" runat="server">
            <ItemTemplate>
                <div class="clearfix" style="height: 5px;"></div>
                <div class="center-block" style="width: 100%;">
                    <asp:LinkButton ID="lnkCustomeFolderMessages" runat="server" OnClick="lnkCustomeFolderMessages_Click" CommandArgument='<%# Eval("MessageFolderID") %>' data-folder='<%# Eval("MessageFolderID") %>' CssClass='<%# ((int)Eval("MessageFolderID") == CurrentFolder) ? "btn btn-main mailbtn folder active" : "btn btn-main mailbtn folder" %>' role="button">
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
            <div style="padding: 10px;">
                <div class="btn-group">
                    <asp:LinkButton ID="btnDeleteMessages" runat="server" OnClick="btnDeleteMessages_Click" CssClass="btn btn-default">
                    حذف
                            <div class="icon-trash">
                                </div>
                    </asp:LinkButton>
                    <asp:Repeater ID="rptFoldersMove" runat="server">
                        <HeaderTemplate>
                            <div class="btn-group">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                    نقل إلى
                                    <i class="entypoicon iconentypo-folder pull-left" style="font-size: 40px;"></i>
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                <asp:LinkButton ID="lnkMoveMessagesToFolder" runat="server" OnClick="lnkMoveMessagesToFolder_Click" CommandArgument='<%# Eval("MessageFolderID") %>'>
                <%# Eval("Name") %>
                       <i class="entypoicon pull-left" style="font-size: 40px;"></i>
                                </asp:LinkButton>
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                </div>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <div class="SScroll" data-height="250px" style="border: 1px solid #DDDDDD; background-color: white;">
                    <asp:GridView ID="grdMessages" runat="server" CssClass="table table-hover" EmptyDataText="لا توجد رسائل فى هذا المجلد" AutoGenerateColumns="False" AllowPaging="true" PageSize="25" OnPageIndexChanging="grdMessages_PageIndexChanging" HeaderStyle-CssClass="MsgHeader">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkSelectAll" runat="server" ClientIDMode="Static" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelect" runat="server" data-id='<%# Eval("ID") %>' />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="الراسل" DataField="SenderName" ItemStyle-HorizontalAlign="Center" />
                            
                            <asp:TemplateField HeaderText="العنوان">
                                <ItemTemplate>
                                    <a href="#" class='<%# (Eval("IsRead")==DBNull.Value || Convert.ToBoolean(Eval("IsRead"))==false)? "message un-read" : "message" %>' data-message='<%# Eval("ID") %>'>
                                        <%# Eval("Subject") %>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="التاريخ والوقت" DataField="CreateDate" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd / MM / yyyy hh:mm tt}" HtmlEncode="false" />
                        </Columns>

                    </asp:GridView>
                </div>
                <div id="dvMessageDetails" width="100%"></div>
            </div>
            <script>
                function ActiviateFolder(folder) {
                    $(".folder").removeClass("active");
                    $(".folder").each(function () {
                        if ($(this).data("folder") == folder) {
                            $(this).addClass("active");
                        }
                    });
                }
                $(document).ready(function () {
                    $(".message").click(function () {
                        var self = this;
                        $("#dvMessageDetails").load('<%=ResolveUrl("~/LoadMessage.aspx") %>',
                { message: $(this).data("message"), operation: "" + $(this).data("operation") + "" },
                function (content) {
                    $(self).removeClass("un-read");
                    $(this).hide().fadeIn("slow");
                    $(this).removeAttr('style');

                    return false;
                });
                    });
                    $('#chkSelectAll').click(
        function () {
            if ($('#chkSelectAll').is(':checked')) {
                $('input:checkbox[name$=chkSelect]').each(
                    function () {
                        $(this).prop('checked', true);
                    });
            }
            else {
                $('input:checkbox[name$=chkSelect]').each(
                    function () {
                        $(this).prop('checked', false);
                    });
            }
        });
                    $('input:checkbox[name$=chkSelect]').click(
                        function () {
                            if (!$(this).is(':checked')) {
                                $('#chkSelectAll').prop('checked', false);
                            }
                            else {
                                if ($('input:checkbox[name$=chkSelect]').length ==
                                $('input:checkbox[name$=chkSelect]:checked').length) {
                                    $('#chkSelectAll').prop('checked', true);
                                }
                            }
                        });
                });
            </script>
        </asp:Panel>
        <asp:Panel ID="pnlSendMessage" runat="server" Visible="false" Width="100%">
            <uc1:SendMail runat="server" ID="ctrlSendMail" />
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
