<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RoomTypes.ascx.cs" Inherits="Chat2Connect.usercontrols.RoomTypes" %>
<script src="../js/dreamcodes.js"></script>
<link href="../css/tsc_pricingtables.css" rel="stylesheet" />
<script src="../js/tsc_pricingtables.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#roomtypes').addClass('active');
        $("input[name='RoomTypeSpecDurationID']").change(function () {
            $("#<%=selectedTypeSpecDurationID.ClientID%>").val($(this).data("id"));
            $("#<%=selectedTypeSpecDurationPrice.ClientID%>").val($(this).data("price"));
        });
    });
</script>
<div class="form-horizontal blockBoxshadow">
    <div class="row">
        <div class="form-group">
            <div class="col-lg-4 pull-right control-label">
                اختر غرفة
            </div>
            <div class="col-lg-4 pull-right">
                <asp:DropDownList ID="uiDropDownListMyRooms" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="form-group">
            <div class="col-lg-4 pull-right control-label">
                رصيد النقاط
            </div>
            <div class="col-lg-4 pull-right">
                <asp:Label ID="lblPoints" runat="server"></asp:Label>
            </div>
        </div>
    </div>
    <div class="col-lg-12 control-label center-block" style="float: none !important; padding: 0px;">
        <!-- DC Pricing Tables:3 Start -->
        <div class="tsc_pricingtable03 tsc_pt3_style1">
            <div class="caption_column" style="width: 15%;">
                <ul>
                    <li class="header_row_1 align_center radius5_topleft"></li>
                    <li class="header_row_2">
                        <h2 class="caption">إختر نوع الغرفة</h2>
                    </li>
                    <li class="row_style_4"><span>مايكرفون</span></li>
                    <li class="row_style_2"><span>كاميرا</span></li>
                    <li class="row_style_4"><span style="font-size: 14px;">ظهورها فى القائمة</span><br />
                    </li>
                    <li class="row_style_4" style="height: 100px !important;"><span>مدة الإشتراك</span></li>
                </ul>
            </div>
            <asp:Repeater ID="repRoomTypeSpecs" runat="server" OnItemDataBound="repRoomTypeSpecs_ItemDataBound">
                <ItemTemplate>
                    <div class="column_<%# Eval("ID") %>">
                        <ul>
                            <li class="header_row_1 align_center radius5_topleft" style="background-color:<%# Eval("Color") %>">
                                <h2 class="col4"><%# Eval("Name") %></h2>
                            </li>
                            <li class="header_row_2 align_center" style="background-repeat:no-repeat;background-position:center;background-color:<%# Eval("Color") %>;background-image:url('images/bots/Room_<%# Eval("ID") %>.png')">
                            </li>
                            <li class="row_style_4 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit."><%# Eval("MicQuality") %></a></span></li>
                            <li class="row_style_2 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit."><%# Eval("CamQuality") %></a></span></li>
                            <li class="row_style_4 align_center" style="padding-top: 5px !important;"><span><a style="direction: rtl;" href="#" class="" rel=" info.">
                                <%# GetRoomOrder(Convert.ToInt32(Eval("OrderInRoomList"))) %>
                            </li>
                            <li class="row_style_4 align_center" style="height: 100px !important;">
                                <center>
                                <asp:GridView ID="grdDurationTypespec" runat="server" AutoGenerateColumns="false" ShowHeader="false" CellPadding="5">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <input type="radio" name="RoomTypeSpecDurationID" id='RoomTypeSpecDurationID_<%# Eval("ID") %>' data-id='<%# Eval("ID") %>' data-price='<%# Eval("Points") %>' style='<%# Convert.ToDouble(Eval("Points"))!=0?"": "display:none;" %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <label for="RoomTypeSpecDurationID_<%# Eval("ID") %>" style="font-size: 13px;">
                                                    <%# Eval("DurationName") %>
                                                </label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <label for="RoomTypeSpecDurationID_<%# Eval("ID") %>" style="font-size: 13px;">
                                                    <%# Convert.ToDouble(Eval("Points"))>0?Convert.ToDouble(Eval("Points")).ToString("0")+" نقطة":"" %>
                                                </label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                    </center>
                            </li>
                        </ul>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <input type="hidden" runat="server" id="selectedTypeSpecDurationID" value="0" />
            <input type="hidden" runat="server" id="selectedTypeSpecDurationPrice" value="0" />
        </div>
        <div class="tsc_clear"></div>
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


<div id="confirm" class="modal fade" role="modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>
                <i class="icon-2x icon-edit" style="float: left; margin-left: 10px;"></i>
                <h3>تأكيد </h3>
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
