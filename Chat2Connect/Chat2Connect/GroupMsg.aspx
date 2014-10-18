<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/createMaster.master" AutoEventWireup="true" CodeBehind="GroupMsg.aspx.cs" Inherits="Chat2Connect.GroupMsg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
    <script src="js/jquery.tokeninput.js"></script>
    <link href="css/token-input-facebook.css" rel="stylesheet" />
    <script src="../js/wysihtml5-0.3.0.js"></script>
<script src="../js/advanced.js"></script>

      <script type="text/javascript">
          $(document).ready(function () {
              $('#sendmsgtoall').addClass('active');

              $("#txtBody").on('change keyup paste', function () {
                  $('#txtCount').html(500 - $(this).val().length);
              });


              $('#sendmsgbtn').click(function () {
                  SendMsg();
              });

              function SendMsg() {
                  var ids = [];
                  $('#grbfriends input:checked').each(function () {
                      ids.push(this.value);
                  });
                  $.ajax({
                      url: "../Services/Services.asmx/SendPrivateMsg",
                      dataType: "json",
                      type: "post",
                      data: "{'toIds':'" + ids.join(",") + "' , 'msg' : '" + $('#txtbody').val() + "'}",
                      contentType: "application/json; charset=utf-8",
                      success: function (data) {
                          if (data.d == false) {

                              $.pnotify({
                                  text: 'حدث خطأ . من فضلك أعد المحاولة.',
                                  type: 'error',
                                  history: false,
                                  closer_hover: false,
                                  delay: 5000,
                                  sticker: false
                              });
                          }
                          else if (data.d == true) {

                              $.pnotify({
                                  text: 'تم الإرسال بنجاح.',
                                  type: 'success',
                                  history: false,
                                  closer_hover: false,
                                  delay: 5000,
                                  sticker: false
                              });
                              setTimeout(function () {
                                  inFormOrLink = true;
                                  document.location.href = document.location.href;
                                  
                              }, 3000);


                          }
                      },
                      error: function (XMLHttpRequest, textStatus, errorThrown) {

                          $.pnotify({
                              text: 'حدث خطأ . من فضلك أعد المحاولة.',
                              type: 'error',
                              history: false,
                              closer_hover: false,
                              delay: 5000,
                              sticker: false
                          });
                      }
                  });
              }
          });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="form-horizontal blockBoxshadow">
   
    <div class="clearfix" style="height: 10px;"></div>
    
       <div class="col-lg-10 pull-right" id="grbfriends">
                <div class="form-group">
                    <h5>
                        إختر الأصدقاء 
                    </h5>
                    <div class="form-control SScroll" data-height="200px">
                    <asp:CheckBoxList ID="uiCheckBoxListFriends" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" CellPadding="5" CellSpacing="5" Width="100%" CssClass="checkbox-main" >
                    </asp:CheckBoxList>
                        <asp:Panel runat="server" ID="uiPanelNoFriendsFound" Visible="false">
                            <div class="alert alert-danger">
                                عفواً . لا يوجد أصدقاء متواجدين حالياً. من فضلك حاول فى وقت لاحق.
                            </div>
                        </asp:Panel>
                        
                        </div>
                    <div class="clearfix" style="height:10px;"></div>
                </div>                
            </div>

    

    <div class="clear" style="height: 10px;"></div>

    <div class="row">
        <div class="col-sm-2 pull-right">
            <label>المحتوى </label>
        </div>
        <div class="clear" style="height:5px;"></div>
        <div class="col-sm-8 pull-right">            
            <textarea id="txtbody" class="form-control" style="height: 200px; padding: 0 !important;" maxlength="500"></textarea>
            <span id="txtCount">500</span>
        </div>
    </div>
    <div class="clearfix" style="height: 10px;"></div>
    <div class="row">
        <div class="col-sm-2 pull-right">
        </div>
        <div class="col-sm-8 pull-right">
            <a class="btn btn-main" id="sendmsgbtn">إرسال</a>
        </div>
    </div>    
</div>

</asp:Content>
