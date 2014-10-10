<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Mail.ascx.cs" Inherits="Chat2Connect.usercontrols.Mail" %>
<%@ Register Src="~/usercontrols/SendMail.ascx" TagPrefix="uc1" TagName="SendMail" %>

<style>
  

    #dvMessageDetails {
        background-color: white;
    }
</style>
<div class="clear" style="height: 5px;"></div>
<div class="col-sm-12 clearfix">
    <div class="pull-right">

        <h3>
            <i class="icon icon-envelope-alt"></i>
            <%= MemberName %></h3>
    </div>
    <div class=" pull-left">        
        
            <asp:LinkButton ID="lnkSendMessage" runat="server" OnClick="lnkSendMessage_Click" CssClass="btn btn-main mailbtn" role="button">
                إرسال رسالة
                       <i class="entypoicon iconentypo-newmsg pull-left" style="font-size:40px;"></i>
            </asp:LinkButton>
        
    </div>
</div>
 <div class="clear" style="height: 5px;"></div>
<div class="col-sm-12 clearfix">
    <asp:Repeater ID="repMemberFolders" runat="server">
            <ItemTemplate>                
                <div class="pull-right mailbtn" >
                    <asp:LinkButton ID="lnkCustomeFolderMessages" runat="server" OnClick="lnkCustomeFolderMessages_Click" CommandArgument='<%# Eval("MessageFolderID") %>' data-folder='<%# Eval("MessageFolderID") %>' CssClass='<%# ((int)Eval("MessageFolderID") == CurrentFolder) ? "btn btn-main mailbtn folder active" : "btn btn-main mailbtn folder" %>' role="button">
                <%# Eval("Name") %>                       
                    </asp:LinkButton>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    <div class="pull-right" >
            <asp:LinkButton ID="lnkCreateFolder" runat="server" OnClick="lnkCreateFolder_Click" CssClass="btn btn-main mailbtn" role="button">
                إنشاء تصنيف جديد
                       <i class="entypoicon iconentypo-newfolder pull-left" style="font-size:40px;"></i>
            </asp:LinkButton>
        </div>
</div>
<div class="clear" style="height: 5px;"></div>
<div class="pull-right col-sm-12" >
        <asp:Panel ID="pnlViewMessages" runat="server" CssClass="pull-right col-sm-12" style="padding:0px;">
            
                <div class="col-sm-12" style="padding:0px;">
                    <div class="btn-group" style="padding-right: 20px;">
                        <a id="lnkReply" data-message="" href="#" class="btn btn-default">
                    رد
                            <div class="icon-reply">
                                </div>
                        </a>
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
                                    <ul class="dropdown-menu" style="left:initial !important;;right:0 !important;">
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
                </div>
                <div class="col-sm-12" style="padding:0px;">
                    <div class="col-sm-5 pull-right" style="padding-left:0px;">
                        <div class="SScroll" data-height="350px" style="border: 1px solid #DDDDDD; background-color: white;">
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
                                    <asp:BoundField HeaderText="الراسل" DataField="SenderName" />

                                    <asp:TemplateField HeaderText="العنوان">
                                        <ItemTemplate>
                                            <a href="#" class='<%# (Eval("IsRead")==DBNull.Value || Convert.ToBoolean(Eval("IsRead"))==false)? "message un-read" : "message" %>' data-message='<%# Eval("ID") %>'>
                                                <%# Eval("Subject") %>
                                            </a>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="التاريخ" DataField="CreateDate" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd / MM / yyyy}" HtmlEncode="false"  />
                                    
                                </Columns>

                            </asp:GridView>
                        </div>
                    </div>
                    <div class="col-sm-7 pull-right">
                        <div class="SScroll" data-height="350px" style="border: 1px solid #DDDDDD; background-color: white;">
                            <div id="dvMessageDetails" style="width:100%"></div>
                        </div>
                    </div>
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
                        $("#lnkReply").data("message", $(this).data("message"));
                        $("#dvMessageDetails").load('<%=ResolveUrl("~/LoadMessage.aspx") %>',
                { message: $(this).data("message"), operation: "" + $(this).data("operation") + "" },
                function (content) {
                    $(self).removeClass("un-read");
                    $(self).parent().parent('tr').removeClass('un-readRow');
                    $(this).hide().fadeIn("slow");
                    $(this).removeAttr('style');

                    return false;
                });
                    });
                    $('#lnkReply').click(function () {
                        if ($("#lnkReply").data("message") != "") {
                            document.location.href = '<%=ResolveUrl("~/popuppages/Messages_popup.aspx") %>?reply=' + $("#lnkReply").data("message");
                        }
                        else {
                            alert('يجب إحتيار رسالة أولا بالضغط على عنوان الرسالة');
                        }
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

                    $('.un-read').parent().parent('tr').addClass('un-readRow');
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
<div class="clear" style="height: 5px;"></div>