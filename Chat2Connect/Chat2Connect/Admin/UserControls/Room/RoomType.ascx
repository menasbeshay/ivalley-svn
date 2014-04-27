<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RoomType.ascx.cs" Inherits="Chat2Connect.Admin.UserControls.Room.RoomType" %>
<div class="modal-content">
    <div class="modal-header">
        <h3 id="myModalLabel1">صبغة غرفة</h3>
    </div>
    <div class="modal-body">
        <div class="form-horizontal blockBox validationGroup">
            <div class="form-group">
                
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
          </ul>
        </div>
      </div>
        <!-- DC Pricing Tables:3 End -->
        <div class="tsc_clear"></div> <!-- line break/clear line -->
            </div>

                <asp:Button ID="btnUpdateRoomType" runat="server" Text="إعتمد" CssClass="pull-left btn btn-warning " Style="width: 100px;" OnClick="btnUpdateRoomType_Click" />
            </div>
        </div>
    </div>
</div>