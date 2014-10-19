<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Balance.master" AutoEventWireup="true" CodeBehind="MyBalance.aspx.cs" Inherits="Chat2Connect.MyBalance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BHead" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#mybalance').addClass('active');

            $('#<%= uiDropDownListPoints.ClientID%>').change(function() {
                $('#price').val($('#<%= uiDropDownListPoints.ClientID%>').val()/10);
            });

            $("#uiTextBoxFriend").tokenInput("../Services/Services.asmx/SearchMembersFriends?memberID=" + <%= BLL.Member.CurrentMemberID.ToString() %> , {
                theme: "facebook",
                preventDuplicates: true,
                hintText: "",
                noResultsText: "لا يوجد",
                searchingText: "بحث فى الأصدقاء...",    
                tokenLimit: 1,
                onAdd: function (item) {
                    $('#uiHiddenFieldFriendID').val(item.id);
                },
            });
        });

    </script>
     <script src="js/jquery.tokeninput.js"></script>
<link href="css/token-input-facebook.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="form-horizontal blockBoxshadow" style="padding-top:5px;">
        <div class="form-group">
        <div class="col-lg-2 pull-right" style="padding-top:3px;">
            رصيد النقاط
        </div>
        <div class="col-lg-4 pull-right bordered" style="padding:3px;">
            <asp:Label ID="uiLabelBalance" runat="server" ></asp:Label>
        </div>
            <div class="col-lg-4 pull-right" style="color:#b5b5b5;padding-top:3px;">
                (كل 100 نقطة تساوى 10 ريال)
            </div>
            </div>

         <div class="form-group">
        <div class="col-sm-12 control-label pull-right">
           <h3> تحويل رصيد نقاط</h3>
        </div>
        
            </div>

          <div class="form-group " style="padding-right:0px;">
                    <div class="col-sm-2 control-label pull-right">
                        إختر الأصدقاء 
                    </div>
              <div class="col-sm-6 pull-right">
              <asp:TextBox ID="uiTextBoxFriend" runat="server" ClientIDMode="Static" Width="40%"></asp:TextBox>
                  <asp:HiddenField ID="uiHiddenFieldFriendID" runat="server" ClientIDMode="Static" />
                  </div>
              
                   
                    <div class="clearfix" style="height:1px;"></div>
                </div>
        <div class="clearfix" style="height:1px;"></div>
        <div class="form-group">
        <div class="col-sm-2 control-label pull-right">
            عدد النقاط</div>
        <div class="col-sm-6 pull-right">
            <asp:TextBox ID="uiTextBoxAmount" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="uiTextBoxAmount" ErrorMessage="من فضلك أدخل القيمة." ToolTip="من فضلك أدخل القيمة." ValidationGroup="confirm_start" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
            </div>

        <div class="form-group">
        <div class="col-sm-2 control-label pull-right">
            </div>
        <div class="col-sm-6 pull-right">
            <asp:HyperLink ID="uiLinkButtonTransfere" runat="server" class="btn btn-main" data-toggle="modal" ValidationGroup="confirm_start" NavigateUrl="#confirm">تحويل</asp:HyperLink>           
        </div>
            </div>
    </div>

    <div class="clear" style="height:10px;"></div>
    <div class="form-horizontal blockBoxshadow" style="padding-top:5px;">
        
         <div class="form-group">
        <div class="col-sm-12 control-label pull-right">
           <h3 class="col-sm-4 pull-right"> شحن رصيد نقاط</h3>
            <span class="col-sm-3 pull-right" style="padding-right:0px;padding-top:10px;"> (كيف تريد أن تدفع)</span>
        </div>
        
            </div>

          <div class="form-group col-sm-12" style="padding-right:0px;">
              <div class="col-sm-7 pull-right">
                    <div class="col-sm-5 pull-right bordered" style="height:70px;padding:5px;text-align:center;margin-left:10px;"  > 
                        <img src="images/onecard.png" style="max-width:60px;vertical-align:middle;"/>                       
                    </div>
              <div class="col-sm-5 pull-right bordered" style="height:70px;padding:5px;text-align:center;">
                  <img src="images/cashu.png" style="max-width:100%;vertical-align:middle;"/></div>
                   <div class="clear" style="height:10px;"></div>
               
        <div class="col-sm-5 pull-right bordered" style="height:70px;padding:5px;text-align:center;margin-left:10px;"> 
                        <img src="images/etisalat.jpg" style="max-width:40px;vertical-align:middle;"/>                       
                    </div>
              <div class="col-sm-5 pull-right bordered" style="height:70px;padding:5px;text-align:center;" >عن طريق موظفين المساعدة (Help) المتواجدين فى قائمة أصدقائى </div>
                    <div class="clearfix" style="height:10px;"></div>
                </div>
              <div class="col-sm-5 pull-right">
                     <div class="form-group">
        <div class="col-sm-3 control-label pull-right">
             النقاط</div>
        <div class="col-sm-5 pull-right">
            <asp:DropDownList ID="uiDropDownListPoints" runat="server" CssClass="form-control">
                <asp:ListItem>100</asp:ListItem>
                <asp:ListItem>200</asp:ListItem>
                <asp:ListItem>500</asp:ListItem>
                <asp:ListItem>1000</asp:ListItem>
                <asp:ListItem>2000</asp:ListItem>
                <asp:ListItem>5000</asp:ListItem>
                <asp:ListItem>10000</asp:ListItem>
            </asp:DropDownList>
        </div>
                         <div class="col-sm-4" style="padding-left:0px;padding-right:0px;">
                             العملة بالريال<br />السعودى فقط
                         </div>
            </div>

        <div class="form-group">
            
        <div class="col-sm-3 control-label pull-right">
             السعر</div>
        <div class="col-sm-5 pull-right">
            <input type="text" class="form-control" id="price" readonly="true" value="10" />
        </div>
            <div class="col-sm-4 pull-left"> ريال </div>
            </div>
              </div>
              </div>

     <div class="clear" style="height:1px;"></div>

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
            	                            <asp:ListItem>اين ولدت</asp:ListItem>
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
