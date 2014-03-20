<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Balance.master" AutoEventWireup="true" CodeBehind="roomtypes.aspx.cs" Inherits="Chat2Connect.roomtypes" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BHead" runat="server">
    
    <script src="js/dreamcodes.js"></script>
    <link href="css/tsc_pricingtables.css" rel="stylesheet" />
    <script src="js/tsc_pricingtables.js"></script>
     <script type="text/javascript">
         $(document).ready(function () {
             $('#roomtypes').addClass('active');
         });

    </script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
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
        <div class="col-lg-12 control-label center-block" style="float:none !important;padding:0px;">
        <!-- DC Pricing Tables:3 Start -->
        <div class="tsc_pricingtable03 tsc_pt3_style1">
        <div class="caption_column" style="width:15%;">
          <ul>
            <li class="header_row_1 align_center radius5_topleft"></li>
            <li class="header_row_2">
              <h2 class="caption">إختر نوع الغرفة</h2>
            </li>
            <li class="row_style_4"><span>مايكرفون</span></li>
            <li class="row_style_2"><span>كاميرا</span></li>
            <li class="row_style_4"><span style="font-size:14px;">ظهورها فى القائمة</span><br /></li>
            <li class="row_style_2"><span>عدد المايكرفونات</span></li>
            <li class="row_style_4" style="height:190px !important;"><span>عدد المتواجدين</span></li>
            <li class="row_style_2"><span>+ دخول أكثر</span></li>
            <li class="footer_row"></li>
          </ul>
        </div>
        <div class="column_1"  style="width:14%;">
          <ul>
            <li class="header_row_1 align_center">
              <h2 class="col1">غرفة مجانية</h2>
            </li>
            <li class="header_row_2 align_center">
              <h1 class="col1"></h1>
              <h3 class="col1"></h3>
            </li>
            <li class="row_style_3 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">صوت واضح</a></span></li>
            <li class="row_style_1 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">رؤية واضحة</a></span></li>
            <li class="row_style_3 align_center"><span><a href="#" class="" rel=" info.">بعد الغرف الملونة <br /></a></span></li>
            <li class="row_style_1 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">1</a></span></li>
            <li class="row_style_3 align_center" style="height:190px !important;">40 شخص</li>
            <li class="row_style_1 align_center">غير مسموح<br /></li>
            <li class="footer_row"></li>
          </ul>
        </div>
        <div class="column_2" style="width:23%;">
          <ul>
            <li class="header_row_1 align_center">
              <h2 class="col2">زيتى</h2>
            </li>
            <li class="header_row_2 align_center">
              <h1 class="col1"></h1>
              <h3 class="col1"></h3>
            </li>
            <li class="row_style_4 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">صوت نقى</a></span></li>
            <li class="row_style_2 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">رؤية مباشرة	</a></span></li>
            <li class="row_style_4 align_center"><span><a href="#" class="" rel=" info.">قبل الغرف الغير ملونة<br /></a></span></li>
            <li class="row_style_2 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">2</a></span></li>
            <li class="row_style_4 align_center" style="height:190px !important;">
                <div class="pull-right">
                    شهر<br />
                    <asp:RadioButtonList ID="uiRadioButtonListType1Count" runat="server">
                    <asp:ListItem>&nbsp;50 <span style="font-size:13px;">150 ريال</span></asp:ListItem>
                    <asp:ListItem>&nbsp;100 <span style="font-size:13px;">300 ريال</span></asp:ListItem>
                    <asp:ListItem>&nbsp;200 <span style="font-size:13px;">500 ريال</span></asp:ListItem>
                    <asp:ListItem>&nbsp;500 <span style="font-size:13px;">700 ريال</span></asp:ListItem>
                    <asp:ListItem>&nbsp;1000 <span style="font-size:13px;">1000 ريال</span></asp:ListItem>
                </asp:RadioButtonList>
                </div>
                <div class="pull-right">
                    سنة<br />
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                    <asp:ListItem> <span style="font-size:13px;">150 ريال</span></asp:ListItem>
                    <asp:ListItem> <span style="font-size:13px;">300 ريال</span></asp:ListItem>
                    <asp:ListItem> <span style="font-size:13px;">500 ريال</span></asp:ListItem>
                    <asp:ListItem> <span style="font-size:13px;">700 ريال</span></asp:ListItem>
                    <asp:ListItem> <span style="font-size:13px;">1000 ريال</span></asp:ListItem>
                </asp:RadioButtonList>
                </div>
            </li>
            <li class="row_style_2 align_center">10 حسابات ملونة<br />10 حسابات مميزة</li>
            <li class="footer_row"><a href="#type1" class="tsc_buttons2 grey" data-toggle="modal" >حجز</a></li>
          </ul>
        </div>
        <div class="column_3" style="width:24%;">
          <ul>
            <li class="header_row_1 align_center">
              <h2 class="col3">أرجوانى</h2>
            </li>
            <li class="header_row_2 align_center">
             <h1 class="col1"></h1>
              <h3 class="col1"></h3>
            </li>
            <li class="row_style_3 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">صوت نقى</a></span></li>
            <li class="row_style_1 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">رؤية مباشرة</a></span></li>
            <li class="row_style_3 align_center"><span><a href="#" class="" rel=" info.">فى أعلى القائمة	<br /></a></span></li>
            <li class="row_style_1 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">3</a></span></li>
            <li class="row_style_3 align_center" style="height:190px !important;">
                <div class="pull-right">
                    شهر<br />
                 <asp:RadioButtonList ID="uiRadioButtonListType2CountMounth" runat="server">
                    <asp:ListItem>&nbsp;50 <span style="font-size:13px;">200 ريال</span></asp:ListItem>
                    <asp:ListItem>&nbsp;100 <span style="font-size:13px;">400 ريال</span></asp:ListItem>
                    <asp:ListItem>&nbsp;200 <span style="font-size:13px;">600 ريال</span></asp:ListItem>
                    <asp:ListItem>&nbsp;500 <span style="font-size:13px;">900 ريال</span></asp:ListItem>
                    <asp:ListItem>&nbsp;1000 <span style="font-size:13px;">1400 ريال</span></asp:ListItem>
                     <asp:ListItem>&nbsp;2000 <span style="font-size:13px;">2000 ريال</span></asp:ListItem>
                     <asp:ListItem>&nbsp;3000 <span style="font-size:13px;">3000 ريال</span></asp:ListItem>
                     <asp:ListItem>&nbsp;5000 <span style="font-size:13px;">4000 ريال</span></asp:ListItem>

                </asp:RadioButtonList>
                    </div>
                <div class="pull-right">
                    سنة<br />
                 <asp:RadioButtonList ID="uiRadioButtonListType2CountYear" runat="server">
                    <asp:ListItem> <span style="font-size:13px;">200 ريال</span></asp:ListItem>
                    <asp:ListItem> <span style="font-size:13px;">400 ريال</span></asp:ListItem>
                    <asp:ListItem> <span style="font-size:13px;">600 ريال</span></asp:ListItem>
                    <asp:ListItem> <span style="font-size:13px;">900 ريال</span></asp:ListItem>
                    <asp:ListItem> <span style="font-size:13px;">1400 ريال</span></asp:ListItem>
                     <asp:ListItem> <span style="font-size:13px;">2000 ريال</span></asp:ListItem>
                     <asp:ListItem> <span style="font-size:13px;">3000 ريال</span></asp:ListItem>
                     <asp:ListItem> <span style="font-size:13px;">4000 ريال</span></asp:ListItem>

                </asp:RadioButtonList>
                    </div>

            </li>
            <li class="row_style_1 align_center">15 حسابات ملونة<br />15 حسابات مميزة</li>
            <li class="footer_row"><a href="" class="tsc_buttons2 grey">حجز</a></li>
          </ul>
        </div>
        <div class="column_4"  style="width:24%;">
          <ul>
            <li class="header_row_1 align_center radius5_topleft">
              <h2 class="col4">الغرف المميزة</h2>
            </li>
            <li class="header_row_2 align_center">
              <h1 class="col1"></h1>
              <h3 class="col1"></h3>
            </li>
            <li class="row_style_4 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">صوت نقى</a></span></li>
            <li class="row_style_2 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">رؤية مباشرة</a></span></li>
            <li class="row_style_4 align_center" style="padding-top:5px !important;"><span><a style="direction:rtl;" href="#" class="" rel=" info.">
                تظهر فى الغرف VIP &nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                وتظهر فى أعلى القائمة
            </a></span></li>
            <li class="row_style_2 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">4</a></span></li>
            <li class="row_style_4 align_center" style="height:190px !important;">
                 <div class="pull-right">
                    شهر<br />
                 <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                    <asp:ListItem>&nbsp;50 <span style="font-size:13px;">200 ريال</span></asp:ListItem>
                    <asp:ListItem>&nbsp;100 <span style="font-size:13px;">400 ريال</span></asp:ListItem>
                    <asp:ListItem>&nbsp;200 <span style="font-size:13px;">600 ريال</span></asp:ListItem>
                    <asp:ListItem>&nbsp;500 <span style="font-size:13px;">900 ريال</span></asp:ListItem>
                    <asp:ListItem>&nbsp;1000 <span style="font-size:13px;">1400 ريال</span></asp:ListItem>
                     <asp:ListItem>&nbsp;2000 <span style="font-size:13px;">2000 ريال</span></asp:ListItem>
                     <asp:ListItem>&nbsp;3000 <span style="font-size:13px;">3000 ريال</span></asp:ListItem>
                     <asp:ListItem>&nbsp;5000 <span style="font-size:13px;">4000 ريال</span></asp:ListItem>

                </asp:RadioButtonList>
                    </div>
                <div class="pull-right">
                    سنة<br />
                 <asp:RadioButtonList ID="RadioButtonList3" runat="server">
                    <asp:ListItem> <span style="font-size:13px;">200 ريال</span></asp:ListItem>
                    <asp:ListItem> <span style="font-size:13px;">400 ريال</span></asp:ListItem>
                    <asp:ListItem> <span style="font-size:13px;">600 ريال</span></asp:ListItem>
                    <asp:ListItem> <span style="font-size:13px;">900 ريال</span></asp:ListItem>
                    <asp:ListItem> <span style="font-size:13px;">1400 ريال</span></asp:ListItem>
                     <asp:ListItem> <span style="font-size:13px;">2000 ريال</span></asp:ListItem>
                     <asp:ListItem> <span style="font-size:13px;">3000 ريال</span></asp:ListItem>
                     <asp:ListItem> <span style="font-size:13px;">4000 ريال</span></asp:ListItem>

                </asp:RadioButtonList>
                    </div>
            </li>
            <li class="row_style_2 align_center">20 حسابات ملونة<br />20 حسابات مميزة</li>
            <li class="footer_row"><a href="" class="tsc_buttons2 grey">حجز</a></li>
          </ul>
        </div>
      </div>
        <!-- DC Pricing Tables:3 End -->
        <div class="tsc_clear"></div> <!-- line break/clear line -->
            </div>
    </div>


    <div id="confirm" class="modal fade" role="modal" aria-hidden="true">
        <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration:none;" >
                            ×</a>
                        <i class="icon-2x icon-edit" style="float:left;margin-left:10px;"></i>
                        <h3 >
                            تأكيد </h3>
                    </div>
                    <div class="modal-body">
                            <div class="form-horizontal blockBox">
                                <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label>السؤال السرى</label>
                                    </div>
                                    <div class="col-sm-8 pull-right">                                        
                                        <asp:DropDownList ID="uiDropDownListQuestion" runat="server" CssClass="form-control" >                     
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
                        <a href="#" class="btn btn-default" data-dismiss="modal" style="text-decoration:none;">إغلاق</a>
                        <asp:LinkButton CssClass="btn btn-warning" runat="server" ID="uiLinkButtonConfirm" style="text-decoration:none;" OnClick="uiLinkButtonConfirm_Click" ValidationGroup="confirm">تأكيد</asp:LinkButton>
                    </div>
                    </div>
            </div>
    </div>
</asp:Content>
