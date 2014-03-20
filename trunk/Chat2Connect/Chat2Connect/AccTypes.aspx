<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Balance.master" AutoEventWireup="true" CodeBehind="AccTypes.aspx.cs" Inherits="Chat2Connect.AccTypes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BHead" runat="server">
     <link href="css/tsc_pricingtables.css" rel="stylesheet" />
    <script src="js/tsc_pricingtables.js"></script> 
    <script type="text/javascript">
         $(document).ready(function () {
             $('#acctypes').addClass('active');

             $("#<%=uiRadioButtonListType1.ClientID%> input").change(function () {
                 $("table[id$=uiRadioButtonListType2] input:radio:checked").removeAttr("checked");
             });

             $("#<%=uiRadioButtonListType2.ClientID%> input").change(function () {
                 $("table[id$=uiRadioButtonListType1] input:radio:checked").removeAttr("checked");
             });
         });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="form-horizontal blockBoxshadow">
        
         <div class="form-group">
        <div class="col-lg-2 control-label pull-right">
           الأسم المراد صبغه    </div>
        <div class="col-lg-6 pull-right">
            <asp:DropDownList ID="uiDropDownListFriends" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
            </div>

        <div class="form-group">
        <div class="col-lg-11 control-label center-block" style="float:none !important;">

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
            <li class="row_style_4"><span>إضافة للإصدقاء	</span><br /></li>
            <li class="row_style_2"><span>سعة صندوق البريد	</span></li>
            <li class="row_style_4"><span>إنشاء غرف خاصة	</span></li>
            <li class="row_style_2"><span>إنشاء غرف مؤقتة	</span></li>
            <li class="row_style_4"><span style="font-size:14px;">هل يدخل الغرف المكتملة العدد</span></li>
            <li class="row_style_2"><span>عضو فى نادى التواصل		</span></li>
              <li class="row_style_4" style="height:100px !important;"><span>مدة الإشتراك</span></li>
            <li class="footer_row"></li>
          </ul>
        </div>
        <div class="column_1">
          <ul>
            <li class="header_row_1 align_center">
              <h2 class="col1"></h2>
            </li>
            <li class="header_row_2 align_center">
              <h1 class="col1">مجاناً</h1>
              <h3 class="col1"></h3>
            </li>
            <li class="row_style_3 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">غرفتين بوقت واحد	</a></span></li>
            <li class="row_style_1 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">كاميرا واحدة</a></span></li>
            <li class="row_style_3 align_center"><span><a href="#" class="" rel=" info.">500 صديق<br /></a></span></li>
            <li class="row_style_1 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">250 كيلو بايت</a></span></li>
            <li class="row_style_3 align_center">1</li>
            <li class="row_style_1 align_center">1<br /></li>
              <li class="row_style_3 align_center">لا</li>
            <li class="row_style_1 align_center">لا<br /></li>
              <li class="row_style_3 align_center" style="height:100px !important;color:red;">مجاناً</li>
            <li class="footer_row"></li>
          </ul>
        </div>
        <div class="column_2">
          <ul>
            <li class="header_row_1 align_center">
              <h2 class="col2">زيتى</h2>
            </li>
            <li class="header_row_2 align_center">
              <h1 class="col1"></h1>
              <h3 class="col1"></h3>
            </li>
            <li class="row_style_4 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">4 غرف بوقت واحد</a></span></li>
            <li class="row_style_2 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">4 كاميرات بوقت واحد</a></span></li>
            <li class="row_style_4 align_center"><span><a href="#" class="" rel=" info.">750 صديق<br /></a></span></li>
            <li class="row_style_2 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">500 كيلو بايت</a></span></li>
            <li class="row_style_4 align_center">2</li>
            <li class="row_style_2 align_center">2</li>
            <li class="row_style_4 align_center">لا</li>
            <li class="row_style_2 align_center">لا<br /></li>
              <li class="row_style_4 align_center" style="height:100px !important;">
                  <asp:RadioButtonList ID="uiRadioButtonListType1" runat="server">
                    <asp:ListItem Value="30">&nbsp;شهر / 30 ريال</asp:ListItem>
                    <asp:ListItem Value="120">&nbsp;6 أشهر / 120 ريال</asp:ListItem>
                    <asp:ListItem Value="200">&nbsp;سنة / 200 ريال</asp:ListItem>
                </asp:RadioButtonList>
              </li>
            <li class="footer_row"><a href="#confirm" class="tsc_buttons2 grey" data-toggle="modal" >تنفيذ</a></li>
          </ul>
        </div>
        <div class="column_3">
          <ul>
            <li class="header_row_1 align_center">
              <h2 class="col3">أرجوانى</h2>
            </li>
            <li class="header_row_2 align_center">
             <h1 class="col1"></h1>
              <h3 class="col1"></h3>
            </li>
            <li class="row_style_3 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">6 غرف بوقت واحد	</a></span></li>
            <li class="row_style_1 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">غير محدود</a></span></li>
            <li class="row_style_3 align_center"><span><a href="#" class="" rel=" info.">1500 صديق<br /></a></span></li>
            <li class="row_style_1 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">غير محدود</a></span></li>
            <li class="row_style_3 align_center">2</li>
            <li class="row_style_1 align_center">2</li>
                <li class="row_style_3 align_center">لا</li>
            <li class="row_style_1 align_center">لا<br /></li>
               <li class="row_style_3 align_center " style="height:100px !important;">
                  <asp:RadioButtonList ID="uiRadioButtonListType2" runat="server" >
                    <asp:ListItem Value="100">&nbsp;شهر / 100 ريال</asp:ListItem>
                    <asp:ListItem Value="300">&nbsp;6 أشهر / 300 ريال</asp:ListItem>
                    <asp:ListItem Value="500">&nbsp;سنة / 500 ريال</asp:ListItem>
                </asp:RadioButtonList>
              </li>
            <li class="footer_row"><a href="#confirm" class="tsc_buttons2 grey">تنفيذ</a></li>
          </ul>
        </div>
        <div class="column_4">
          <ul>
            <li class="header_row_1 align_center radius5_topleft">
              <h2 class="col4">الحساب المميز</h2>
            </li>
            <li class="header_row_2 align_center">
              <h1 class="col1"></h1>
              <h3 class="col1"></h3>
            </li>
            <li class="row_style_4 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">8 غرف بوقت واحد
</a></span></li>
            <li class="row_style_2 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">غير محدود</a></span></li>
            <li class="row_style_4 align_center" style="padding-top:5px !important;"><span><a href="#" class="" rel=" info.">2000 صديق
            </a></span></li>
            <li class="row_style_2 align_center"><span><a href="#" class="" rel="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">غير محدود</a></span></li>
            <li class="row_style_4 align_center">3</li>
            <li class="row_style_2 align_center">3</li>
            <li class="row_style_4 align_center">يدخل أى غرفة ممتلئة</li>
            <li class="row_style_2 align_center">نعم<br /></li>
               <li class="row_style_4 align_center" style="height:100px !important;">
                   <asp:RadioButtonList ID="uiRadioButtonListPremium" runat="server" ForeColor="Red">
                   <asp:ListItem Value="300">&nbsp;6 أشهر / 800 ريال</asp:ListItem>
                    <asp:ListItem Value="500">&nbsp;سنة / 1200 ريال</asp:ListItem>
                       </asp:RadioButtonList>
              </li>
            <li class="footer_row"><a href="#confirm" class="tsc_buttons2 grey">تنفيذ</a></li>
          </ul>
        </div>
      </div>
        <!-- DC Pricing Tables:3 End -->
        <div class="tsc_clear"></div> <!-- line break/clear line -->

            </div>
        
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
                            تأكيد التحويل</h3>
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
