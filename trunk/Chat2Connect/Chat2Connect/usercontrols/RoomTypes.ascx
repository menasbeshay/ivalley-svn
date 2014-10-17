<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RoomTypes.ascx.cs" Inherits="Chat2Connect.usercontrols.RoomTypes" %>
<script src="../js/dreamcodes.js"></script>
<link href="../css/tsc_pricingtables.css" rel="stylesheet" />
<script src="../js/tsc_pricingtables.js"></script>
<script src="../js/jquery.tokeninput.js"></script>
<link href="../css/token-input-facebook.css" rel="stylesheet" />
<style>
    .spec {
        width: 20px;
        height: 20px;
        margin: 5px 5px 5px 5px;
        border-width: 1px;
        border-style: solid;
        border-color: rgba(0,0,0,.2);
    }

    .roomType {
        width: 20px;
        height: 20px;
        margin: 5px 5px 5px 5px;
        border-width: 1px;
        border-style: solid;
        border-color: rgba(0,0,0,.2);
    }
</style>
<script type="text/javascript">
    $(document).ready(function () {
        $('#roomtypes').addClass('active');
    });
</script>
<div class="form-horizontal blockBoxshadow">
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
    <div class="row">
        <div class="col-lg-8" style="float: right;">
            <!-- DC Pricing Tables:3 Start -->
            <div class="tsc_pricingtable03 tsc_pt3_style1">
                <div class="caption_column" style="width: 30%;">
                    <ul>
                        <li class="header_row_2">
                            <h2 class="caption">إختر لون الترقية (الصبغة)</h2>
                        </li>
                        <li class="row_style_4"><span>العدد المسموح فى الغرفة</span></li>
                        <li class="row_style_2"><span>مايكرفون</span></li>
                        <li class="row_style_4"><span>كاميرا</span></li>
                        <li class="row_style_2"><span style="font-size: 14px;">ظهور الغرفة</span>
                        <li class="row_style_4"><span style="font-size: 14px;">ظهور إعلانات فى الغرفة</span>
                        </li>
                        <li class="row_style_2"><span>مدة الإشتراك</span></li>
                    </ul>
                </div>
                <div class="column_1" style="width: 35%;">
                    <ul>
                        <li class="header_row_2 align_center" style="background-repeat: no-repeat; background-position: center; background-color: #000; background-image: url('images/bots/Room_1.png')"></li>
                        <li class="row_style_4 align_center"><span>500</span></li>
                        <li class="row_style_2 align_center"><span>صوت واضح</span></li>
                        <li class="row_style_4 align_center"><span>رؤية واضحة</span></li>
                        <li class="row_style_2 align_center"><span>بعد الغرف المميزة</span></li>
                        <li class="row_style_4 align_center"><span>نعم</li>
                        <li class="row_style_2 align_center"><span>مجانا</span></li>
                    </ul>
                </div>
                <div class="column_2" style="width: 35%;">
                    <ul>
                        <li class="header_row_2 align_center">
                            <ul style="width: 100%; height: 100%">
                                <li style="width: 50%; height: 100%; float: right; background-repeat: no-repeat; background-position: center; background-color: #ff00fe; background-image: url('images/bots/Room_2.png')"></li>
                                <li style="width: 50%; height: 100%; float: right; background-repeat: no-repeat; background-position: center; background-color: #880088; background-image: url('images/bots/Room_3.png')"></li>
                            </ul>
                        </li>
                        <li class="row_style_4 align_center"><span>2000</span></li>
                        <li class="row_style_2 align_center"><span>صوت نقى</span></li>
                        <li class="row_style_4 align_center"><span>رؤية مباشرة</span></li>
                        <li class="row_style_2 align_center"><span>فى أعلى الغرف</span></li>
                        <li class="row_style_4 align_center"><span>لا</span></li>
                        <li class="row_style_2 align_center"><span>شراء نقاط</span></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-lg-4" style="padding-top: 100px; padding-right: 10px;">
            <div class="row">
                إسم الغرفة المراد ترقية
            </div>
            <div class="row">
                <asp:TextBox ID="txtRoom" runat="server" CssClass="form-control"></asp:TextBox>
                <input type="hidden" runat="server" id="hdnRoom" />
            </div>
            <div class="row" style="padding-top: 10px;">
                لون الترقية
            </div>
            <div class="row pull-right" id="specs" style="padding-top: 10px; padding-bottom: 10px">
                <div class="col-lg-1"></div>
                <div class="col-lg-4">
                    <div class="col-lg-2">
                        <span style="display: block; width: 25px; height: 25px; background-color: #880088"></span>
                    </div>
                    <div class="col-lg-2">
                        <input type="radio" value="3" name="rdSpec" style="padding-top: 3px;" />
                    </div>
                </div>
                <div class="col-lg-4 ">
                    <div class="col-lg-2">
                        <span style="display: block; width: 25px; height: 25px; background-color: #ff00fe"></span>
                    </div>
                    <div class="col-lg-2">
                        <input type="radio" value="2" name="rdSpec" checked="checked" style="padding-top: 3px;" />
                    </div>
                </div>
                <input type="hidden" id="hdnSpec" runat="server" value="2" />
            </div>
            <div class="row" id="durations" style="padding-top: 5px;">
                <input type="hidden" id="hdnDuration" runat="server" value="1" />
                <div class="form-group">
                    <div class="col-lg-2 pull-right">
                        <input type="radio" name="rdDuration" value="1" checked="checked" />
                    </div>
                    <div class="col-lg-4 pull-right">شهر</div>
                    <div class="col-lg-6 pull-right">(1500 نقطة)</div>
                </div>
                <div class="form-group">
                    <div class="col-lg-2 pull-right">
                        <input type="radio" name="rdDuration" value="2" />
                    </div>
                    <div class="col-lg-4 pull-right">6 شهور</div>
                    <div class="col-lg-6 pull-right">(6000 نقطة)</div>
                </div>
                <div class="form-group">
                    <div class="col-lg-2 pull-right">
                        <input type="radio" name="rdDuration" value="3" />
                    </div>
                    <div class="col-lg-4 pull-right">سنة</div>
                    <div class="col-lg-6 pull-right">(10000 نقطة)</div>
                </div>
            </div>
            <div class="row align_center">
                <a href="#confirm" data-toggle="modal" class="btn btn-warning">تنفيذ</a>
            </div>
        </div>
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
<script>
    $("#specs").on("change", "[name=rdSpec]", function () {
        $("#<%= hdnSpec.ClientID%>").val($(this).val());
    });
    $("#durations").on("change", "[name=rdDuration]", function () {
        $("#<%= hdnDuration.ClientID%>").val($(this).val());
    });
    $(document).ready(function () {
        $("#<%= hdnSpec.ClientID%>").val($("[name=rdSpec]:checked").val());
        $("#<%= hdnDuration.ClientID%>").val($("[name=rdDuration]:checked").val());
        $("#<%= txtRoom.ClientID%>").tokenInput("../Services/Services.asmx/SearchRooms", {
            theme: "facebook",
            preventDuplicates: true,
            hintText: "",
            noResultsText: "لا يوجد",
            searchingText: "بحث فى الغرف...",
            tokenLimit: 1,
            onAdd: function (item) {
                $('#<%= hdnRoom.ClientID%>').val(item.id);
            },
        });
    });
</script>
