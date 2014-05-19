<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MemberTypes.ascx.cs" Inherits="Chat2Connect.usercontrols.MemberTypes" %>
<link href="../css/tsc_pricingtables.css" rel="stylesheet" />
<script src="../js/tsc_pricingtables.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#acctypes').addClass('active');

        $("input[name='MemberTypeSpecDurationID']").change(function () {
            $("#<%=selectedTypeSpecDurationID.ClientID%>").val($(this).data("id"));
            $("#<%=selectedTypeSpecDurationPrice.ClientID%>").val($(this).data("price"));
        });

    });

</script>
<div class="form-horizontal blockBoxshadow">

    <div class="form-group">
        <div class="col-lg-2 control-label pull-right">
            الأسم المراد صبغه   
        </div>
        <div class="col-lg-6 pull-right">
            <asp:DropDownList ID="uiDropDownListFriends" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
    </div>

    <div class="form-group">
        <div class="col-lg-11 control-label center-block" style="float: none !important;">

            <!-- DC Pricing Tables:3 Start -->
            <div class="tsc_pricingtable03 tsc_pt3_style1">
                <div class="caption_column">
                    <ul>
                        <li class="header_row_1 align_center radius5_topleft"></li>
                        <li class="header_row_2">
                            <h2 class="caption">إختر لون الصبغة</h2>
                        </li>
                        <li class="row_style_4"><span>المسموح دخول غرف	</span></li>
                        <li class="row_style_2"><span>كاميرات</span></li>
                        <li class="row_style_4"><span>إضافة للإصدقاء	</span>
                            <br />
                        </li>
                        <li class="row_style_2"><span>سعة صندوق البريد	</span></li>
                        <li class="row_style_4"><span>إنشاء غرف خاصة	</span></li>
                        <li class="row_style_2"><span>إنشاء غرف مؤقتة	</span></li>
                        <li class="row_style_4"><span style="font-size: 14px;">هل يدخل الغرف المكتملة العدد</span></li>
                        <li class="row_style_2"><span>عضو فى نادى التواصل		</span></li>
                        <li class="row_style_4" style="height: 100px !important;"><span>مدة الإشتراك</span></li>
                    </ul>
                </div>
                <asp:Repeater ID="repMemberTypeSpecs" runat="server" OnItemDataBound="repMemberTypeSpecs_ItemDataBound">
                    <ItemTemplate>
                        <div class="column_<%# Eval("ID") %>">
                            <ul>
                                <li class="header_row_1 align_center">
                                    <h2 class="col1"></h2>
                                </li>
                                <li class="header_row_2 align_center">
                                    <h1 class="col1"><%# Eval("Name") %></h1>
                                    <h3 class="col1"></h3>
                                </li>
                                <li class="row_style_3 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit."><%# Eval("OpenRoomCount") %>	</a></span></li>
                                <li class="row_style_1 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit."><%# Eval("OpenedCamCount") %></a></span></li>
                                <li class="row_style_3 align_center"><span><a href="#" class="" rel=" info."><%# Eval("FriendsCount") %><br />
                                </a></span></li>
                                <li class="row_style_1 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">
                                    <%# (Convert.ToString(Eval("MailSize"))=="")?"غير محدود" :Eval("MailSize")+" كيلو بايت" %> 
                                </a></span></li>
                                <li class="row_style_3 align_center"><%# Eval("CreatePrivateRoomCount") %></li>
                                <li class="row_style_1 align_center"><%# Eval("CreateTempRoomCount") %><br />
                                </li>
                                <li class="row_style_3 align_center"><%# Eval("CreateTempRoomCount")=="True"?"نعم":"لا" %></li>
                                <li class="row_style_1 align_center"><%# Eval("CreateTempRoomCount")=="True"?"نعم":"لا" %><br />
                                </li>
                                <li class="row_style_3 align_center" style="height: 100px !important;">
                                    <asp:GridView ID="grdDurations" runat="server" AutoGenerateColumns="false" ShowHeader="false">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <input type="radio" name="MemberTypeSpecDurationID" id='MemberTypeSpecDurationID_<%# Eval("ID") %>' data-id='<%# Eval("ID") %>' data-price='<%# Eval("Price") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <label for="MemberTypeSpecDurationID_<%# Eval("ID") %>">
                                                        <%# Eval("DurationName") %>
                                                        /
                                                        <%# Convert.ToDouble(Eval("Price")).ToString("0") %> ريال
                                                    </label>

                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EmptyDataTemplate>
                                            <span style="color: red">مجانا</span>
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                </li>
                            </ul>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <input type="hidden" runat="server" id="selectedTypeSpecDurationID" value="0" />
                <input type="hidden" runat="server" id="selectedTypeSpecDurationPrice" value="0" />
            </div>
            <div class="tsc_pricingtable03 tsc_pt3_style1">
                <center>
            <a href="#confirm" class="tsc_buttons2 grey" data-toggle="modal" >تنفيذ</a>
                    </center>
                </div>
            <!-- DC Pricing Tables:3 End -->
            <div class="tsc_clear"></div>
            <!-- line break/clear line -->
        </div>
        
    </div>


</div>

<div id="confirm" class="modal fade" role="modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>
                <i class="icon-2x icon-edit" style="float: left; margin-left: 10px;"></i>
                <h3>تأكيد التحويل</h3>
            </div>
            <div class="modal-body">
                <div class="form-horizontal blockBox">
                    <div class="form-group">
                        <div class="col-sm-4 control-label pull-right">
                            <label>السؤال السرى</label>
                        </div>
                        <div class="col-sm-8 pull-right">
                            <asp:DropDownList ID="uiDropDownListQuestion" runat="server" CssClass="form-control">
                                <asp:ListItem Value="0">اختر السؤال السرى</asp:ListItem>
                                <asp:ListItem> اين ولدت</asp:ListItem>
                                <asp:ListItem>اقرب صديق اليك</asp:ListItem>
                                <asp:ListItem>اين تسكن</asp:ListItem>
                                <asp:ListItem>افضل مدينه زرتها</asp:ListItem>
                                <asp:ListItem>سيارة تتمنى اقتنائها</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-4 control-label pull-right">
                            <label>إجابة السوال السرى</label>
                        </div>
                        <div class="col-sm-8 pull-right">
                            <asp:TextBox ID="uiTextBoxAnswer" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="uiTextBoxAnswer" ErrorMessage="من فضلك أدخل إجابة السؤال السرى." ToolTip="من فضلك أدخل إجابة السؤال السرى." ValidationGroup="confirm" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <a href="#" class="btn btn-default" data-dismiss="modal" style="text-decoration: none;">إغلاق</a>
                <asp:LinkButton CssClass="btn btn-warning" runat="server" ID="uiLinkButtonConfirm" Style="text-decoration: none;" OnClick="uiLinkButtonConfirm_Click" ValidationGroup="confirm">تأكيد</asp:LinkButton>
            </div>
        </div>
    </div>
</div>
