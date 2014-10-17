<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RoomTypes.ascx.cs" Inherits="Chat2Connect.usercontrols.RoomTypes" %>
<script src="../js/dreamcodes.js"></script>
<link href="../css/tsc_pricingtables.css" rel="stylesheet" />
<script src="../js/tsc_pricingtables.js"></script>
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
                            <h2 class="caption">إختر نوع الغرفة</h2>
                        </li>
                        <li class="row_style_4"><span>العدد المسموح فى الغرفة</span></li>
                        <li class="row_style_4"><span>مايكرفون</span></li>
                        <li class="row_style_2"><span>كاميرا</span></li>
                        <li class="row_style_4"><span style="font-size: 14px;">ظهورها الغرفة</span>
                        <li class="row_style_4"><span style="font-size: 14px;">ظهور إعلانات فى الغرفة</span>
                        </li>
                        <li class="row_style_4"><span>مدة الإشتراك</span></li>
                    </ul>
                </div>
                <div class="column_1" style="width: 35%;">
                    <ul>
                        <li class="header_row_2 align_center" style="background-repeat: no-repeat; background-position: center; background-color: #000; background-image: url('images/bots/Room_1.png')"></li>
                        <li class="row_style_4 align_center"><span>500</span></li>
                        <li class="row_style_4 align_center"><span>صوت واضح</span></li>
                        <li class="row_style_2 align_center"><span>رؤية واضحة</span></li>
                        <li class="row_style_4 align_center"><span>بعد الغرف المميزة</span></li>
                        <li class="row_style_4 align_center"><span>نعم</li>
                        <li class="row_style_4 align_center"><span>مجانا</span></li>
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
                        <li class="row_style_4 align_center"><span>صوت نقى</span></li>
                        <li class="row_style_2 align_center"><span>رؤية مباشرة</span></li>
                        <li class="row_style_4 align_center"><span>فى أعلى الغرف</span></li>
                        <li class="row_style_4 align_center"><span>لا</span></li>
                        <li class="row_style_4 align_center"><span>شراء نقاط</span></li>
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
            </div>
            <div class="row">
                لون الترقية
            </div>
            <div class="row" id="specs">
                <div class="col-lg-6 ">
                    <div class="col-lg-3">
                        <span class="spec" style="background-color: #ff00fe"></span>
                    </div>
                    <div class="col-lg-3">
                        <input type="radio" value="2" name="rdSpec" checked="checked" />
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="col-lg-3">
                        <span class="spec" style="background-color: #880088"></span>
                    </div>
                    <div class="col-lg-3">
                        <input type="radio" value="3" name="rdSpec" />
                    </div>
                </div>
                <input type="hidden" id="hdnSpec" runat="server" value="2" />
            </div>
            <div class="row" id="durations">
                <input type="hidden" id="hdnDuration" runat="server" />
                <div class="form-group">
                    <div class="col-lg-2 pull-right">
                        <input type="radio" name="rdDuration" value="1" checked="checked" />
                    </div>
                    <div class="col-lg-5 pull-right">شهر</div>
                    <div class="col-lg-5 pull-right">(1500 نقطة)</div>
                </div>
                <div class="form-group">
                    <div class="col-lg-2 pull-right">
                        <input type="radio" name="rdDuration" value="2" />
                    </div>
                    <div class="col-lg-5 pull-right">6 شهور</div>
                    <div class="col-lg-5 pull-right">(6000 نقطة)</div>
                </div>
                <div class="form-group">
                    <div class="col-lg-2 pull-right">
                        <input type="radio" name="rdDuration" value="3" />
                    </div>
                    <div class="col-lg-5 pull-right">سنة</div>
                    <div class="col-lg-5 pull-right">(10000 نقطة)</div>
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
</script>
