<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="Chat2Connect.Account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/jquery.blueimp-gallery.min.js"></script>
    <script src="js/bootstrap-image-gallery.js"></script>
    <link href="css/blueimp-gallery.min.css" rel="stylesheet" />
    <link href="css/bootstrap-image-gallery.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('.iconentypo-menu').tooltip()
            $('.icon-plus').tooltip();

            $("#<%= uiTextBoxInterests.ClientID %>").on('change keyup paste', function () {
                $('#WallCount').html(300 - $(this).val().length);
            });

        });

        blueimp.Gallery(document.getElementById('links'),
                {
                    onslide: function (index, slide) {
                        var text = this.list[index].getAttribute('data-description'),
                            node = this.container.find('.description');
                        node.empty();
                        if (text) {
                            node[0].appendChild(document.createTextNode(text));
                        }
                    }
                });

        function changeMail() {
            if ($('#<%= Email.ClientID %>').val() != '') {
                $('#pGeneral').css('display', 'block');
                $.ajax({
                    url: "../Services/Services.asmx/changeMail",
                    dataType: "json",
                    type: "post",
                    data: "{'question':'" + $('#<%= MailQuestion.ClientID %>').val() + "', 'answer':'" + $('#<%= MailAnswer.ClientID %>').val() + "', 'mail' : '" + $('#<%= Email.ClientID %>').val() + "'}",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        if (data.d == false) {
                            $('#pGeneral').css('display', 'none');
                            $('#MailResponse').css('display', 'block');
                            $('#MailResponse').addClass('alert-danger');
                            $('#mailFail').css('display', 'block');
                            $('#mailSuccess').css('display', 'none');
                        }
                        else if (data.d == true) {
                            $('#pGeneral').css('display', 'none');
                            $('#MailResponse').css('display', 'block');
                            $('#MailResponse').addClass('alert-success');
                            $('#mailFail').css('display', 'none');
                            $('#mailSuccess').css('display', 'block');
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $('#pGeneral').css('display', 'none');
                        $('#MailResponse').css('display', 'block');
                        $('#MailResponse').addClass('alert-danger');
                        $('#mailFail').css('display', 'block');
                        $('#mailSuccess').css('display', 'none');
                    }
                });
            }
        }

        function resetMailForm()
        {
            $('#MailResponse').css('display', 'none');
            $('#MailResponse').removeClass('alert-success');
            $('#MailResponse').removeClass('alert-danger');
            $('#mailFail').css('display', 'none');
            $('#mailSuccess').css('display', 'none');
            $('#<%= MailAnswer.ClientID %>').val("");
            $('#<%= Email.ClientID %>').val("");
            $("#<%= MailQuestion.ClientID %>").attr('selectedIndex', 0);
        }

        function changePass() {
            if ($('#<%= Password.ClientID %>').val() != '') {
                $('#pGeneral').css('display', 'block');
                $.ajax({
                    url: "../Services/Services.asmx/changePass",
                    dataType: "json",
                    type: "post",
                    data: "{'oldpass':'" + $('#<%= uiTextBoxOldPass.ClientID %>').val() + "', 'question':'" + $('#<%= PassQuestion.ClientID %>').val() + "', 'answer':'" + $('#<%= PassAnswer.ClientID %>').val() + "', 'pass' : '" + $('#<%= Password.ClientID %>').val() + "'}",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        if (data.d == false) {
                            $('#pGeneral').css('display', 'none');
                            $('#PassResponse').css('display', 'block');
                            $('#PassResponse').addClass('alert-danger');
                            $('#passFail').css('display', 'block');
                            $('#passSuccess').css('display', 'none');
                        }
                        else if (data.d == true) {
                            $('#pGeneral').css('display', 'none');
                            $('#PassResponse').css('display', 'block');
                            $('#PassResponse').addClass('alert-success');
                            $('#passFail').css('display', 'none');
                            $('#passSuccess').css('display', 'block');
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $('#pGeneral').css('display', 'none');
                        $('#PassResponse').css('display', 'block');
                        $('#PassResponse').addClass('alert-danger');
                        $('#passFail').css('display', 'block');
                        $('#passSuccess').css('display', 'none');
                    }
                });
            }
        }        

        function resetPassForm() {
            $('#PassResponse').css('display', 'none');
            $('#PassResponse').removeClass('alert-success');
            $('#PassResponse').removeClass('alert-danger');
            $('#passFail').css('display', 'none');
            $('#passSuccess').css('display', 'none');
            $('#<%= PassAnswer.ClientID %>').val("");
            $('#<%= Password.ClientID %>').val("");
            $('#<%= uiTextBoxOldPass.ClientID %>').val("");
            $("#<%= PassQuestion.ClientID %>").attr('selectedIndex', 0);
        }

        function closeDone()
        {
            $.prettyPhoto.close();
        }
    </script>
    <style type="text/css">
        .datepicker {z-index: 999999 !important;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div class="blockBoxshadow pull-right margin20" style="width:66.5%;padding:13px;min-height:235px;"> 
            <div style="width:16%;float:right;position:relative;">
                <div class="profileImageEdit">
                <asp:Image ID="uiImageMain" runat="server" ImageUrl="~/images/defaultavatar.png" style="height:100px;" CssClass="img-thumbnail"/>
                <div class="btn-group" id="EditProfilePic">                    
                  <button type="button" class="btn btn-main dropdown-toggle" data-toggle="dropdown" style="font-size:12px;">
                    تعديل الصورة  <span class="caret"></span> 
                  </button>
                  <ul class="dropdown-menu" role="menu">
                    <li><a id="selectProfilePic" href="#selectprofilephoto" data-toggle="modal" style="text-decoration:none;"><i class="icon-picture"></i>&nbsp;إختر من صورك الخاصة</a></li>
                    <li><a id="addProfilePic"  href="#addprofilephoto" data-toggle="modal" style="text-decoration:none;"><i class="icon-plus"></i>&nbsp;تحميل صورة جديدة</a></li>
                    <li><a id="clearCurrentProfilePic"><i class="icon-remove"></i>&nbsp;حذف الصورة الحالية</a></li>                    
                  </ul>
                    
                </div>
                </div>
                <div class="clearfix" style="height:15px;"></div>
                <div style="width:80%;" class="center-block">
                    <i class="icon icon-thumbs-up" style="border:1px solid #808080;border-radius:5px;-moz-border-radius:5px;-webkit-border-radius:5px;-ms-border-radius:5px;padding:5px;"></i>
                    &nbsp;<span style="color:#ffd800">
                        <asp:Label ID="uiLabelLikeCount" runat="server" />
                          </span>&nbsp;
                    أعجبنى
                </div>
                <div class="clearfix"  style="height:15px;"></div>
                <div style="width:80%;" class="center-block Profilesocials">
                    <asp:HyperLink ID="uiHyperLinkFb" runat="server" Target="_blank"><img src="images/facebook.png" /></asp:HyperLink>
                    &nbsp;&nbsp;
                    <asp:HyperLink ID="uiHyperLinktwitter" runat="server" Target="_blank"><img src="images/twitter.png" /></asp:HyperLink>
                        &nbsp;&nbsp;
                    <asp:HyperLink ID="uiHyperLinkyt" runat="server" Target="_blank"><img src="images/youtube.png" /></asp:HyperLink>
                </div>
            </div>
            <div style="width:81%;float:right;">
                <div>
                    <div class="col-lg-4 pull-right" >
                        <asp:Label ID="Label1" runat="server" Text="الإسم :"></asp:Label>
                        <asp:Label ID="uiLabelName" runat="server"></asp:Label>
                    </div>
                    <div class="col-lg-4 pull-right" >
                        <asp:Label ID="Label2" runat="server" Text="تاريخ الميلاد :"></asp:Label>
                        <asp:Label ID="uiLabelDOP" runat="server" ></asp:Label>
                    </div>
                    <div class="col-lg-3 pull-right" >
                        <asp:Label ID="Label3" runat="server" Text="الديانة :"></asp:Label>
                        <asp:Label ID="uiLabelReligion" runat="server" ></asp:Label>
                    </div>
                    
                </div>
                <div class="clearfix"></div>
                <div class="col-lg-12 " style="margin:5px 0px;">
                        <asp:Label ID="Label4" runat="server" Text="المهنة :"></asp:Label>
                        <asp:Label ID="uiLabelJob" runat="server" ></asp:Label>
                    </div>
                <div class="clearfix"></div>
                <div  class="col-lg-12" style="margin:5px 0px;">
                    <asp:Label ID="Label5" runat="server" Text="البلد :"></asp:Label>
                        <asp:Label ID="uiLabelCountry" runat="server" ></asp:Label>
                </div>
                <div class="clearfix"></div>
                <div class="col-lg-12" style="margin:5px 0px;">
                    <asp:Label ID="Label6" runat="server" Text="أفضل فريق :"></asp:Label>
                        <asp:Label ID="uiLabelBestTeam" runat="server" ></asp:Label>
                </div>
                <div class="clearfix"></div>
                <div class="col-lg-12" style="margin:5px 0px;">
                    <asp:Label ID="Label7" runat="server" Text="أفضل أكلة :"></asp:Label>
                        <asp:Label ID="uiLabelBestFood" runat="server" ></asp:Label>
                </div>
                <div class="clearfix"></div>
                <div class="col-lg-12" style="margin:5px 0px;">
                    <asp:Label ID="Label8" runat="server" Text="السيارة المفضلة :"></asp:Label>
                        <asp:Label ID="uiLabelBestCar" runat="server" ></asp:Label>
                </div>
                <div class="clearfix"></div>
                <div class="col-lg-10 pull-right" style="margin:5px 0px;">
                    <asp:Label ID="Label9" runat="server" Text="البلد المفضلة للسياحة :"></asp:Label>
                        <asp:Label ID="uiLabelBestCountry" runat="server" ></asp:Label>
                </div>
               
                
                
            </div>
            <div class="pull-left" style="width:1%;margin-left:10px;">
                    <a href="#mainprofile" data-toggle="modal" style="text-decoration:none;">
                        <i class="icon-3x entypoicon iconentypo-menu"  data-toggle="tooltip" title="تعديل" style="height:25px;"></i>
                    </a>
                </div>
        </div>
            
        <div class="blockBoxshadow pull-left margin20" style="width:30%;">
             <asp:Label ID="Label10" runat="server" Text="معلومات عن الحساب"></asp:Label>
            <hr style="background:#ffd800;width:100%;margin:5px auto;"/>
            <div class="clearfix"></div>
            <div class="col-lg-12" style="margin:8px 0px;padding-right:0px;">
                    <asp:Label ID="Label11" runat="server" Text="تاريخ الإنشاء :"></asp:Label>
                        <asp:Label ID="uiLabelCreatedDate" runat="server" ></asp:Label>
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-12" style="margin:8px 0px;padding-right:0px;">
                    <asp:Label ID="Label13" runat="server" Text="لون الصبغة :"></asp:Label>
                        <asp:Label ID="uiLabelAccountType" runat="server" ></asp:Label>
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-12" style="margin:8px 0px;padding-right:0px;">
                    <asp:Label ID="Label15" runat="server" Text="تاريخ إنتهاء الصبغة :"></asp:Label>
                        <asp:Label ID="uiLabelTypeExpiry" runat="server" ></asp:Label>                 
            </div>
            <div class="clearfix"></div>
            
            <div class="col-lg-12" style="width:100%;margin:8px 0px;padding-right:0px;">
                <div class="pull-right" style="width:87%">
                    البريد الإلكترونى : <asp:Label ID="uiLabelMail" runat="server" style="font-family:Arial;font-weight:bold;font-size:13px;"></asp:Label>
                </div>
                <div class="pull-left" style="width:10%">
                   <a href="#accountmail" class="btn btn-main" data-toggle="modal" role="button" style="font-size:11px;padding:3px;">تعديل</a>
                    </div>
                <div class="clearfix" style="height:2px;"></div>
            </div>
            
            <div class="col-lg-12" style="width:100%;margin:7px 0px;padding-right:0px;">
                <div class="pull-right" style="width:87%">
                    كلمة المرور : ************
                    </div>
                <div class="pull-left" style="width:10%">
                   <a href="#accountPass" class="btn btn-main" data-toggle="modal" role="button" style="font-size:11px;padding:3px;">تعديل</a>
                    </div>
            </div>
            <div class="clearfix"></div>
            <div class="center-block" style="width:63%;">
                   <a href="#accountsettings" class="btn btn-main" data-toggle="modal" role="button" style="font-size:11px;padding:3px;width:130px;">إعدادت حسابى</a>                
            </div>
            <div class="clearfix"></div>
            
        </div>
        
        <div class="clearfix"></div>
        <div class="blockBoxshadow pull-right col-lg-3 margin20 " style="height:210px;max-height:210px;">
            <div style="padding:5px 0px;">
                <div class="pull-right">الغرف</div>
                <div class="pull-left"></div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
            <div>
                <asp:Repeater ID="uiRepeaterMyRooms" runat="server">
                    <ItemTemplate>
                        <div class="Altodd">
                            <%# Eval("Name") %>
                        </div>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <div class="Alteven">
                            <%# Eval("Name") %>
                        </div>
                    </AlternatingItemTemplate>
                </asp:Repeater>
            </div>
            <div class="clearfix"></div>

        </div>
        <div class="blockBoxshadow pull-right col-lg-4 margin20" style="width:40%;height:210px;max-height:210px;">
            <div>
                <div class="pull-right">صورى</div>
                <div class="pull-left">
                    <a href="#addphoto" data-toggle="modal" style="text-decoration:none;">
                        <i class="icon icon-plus"  data-toggle="tooltip" title="إضافة"></i>
                    </a>
                </div>
                <div class="clearfix"></div>
                <div class="col-lg-12">
                     <div id="links" class="SScroll" data-height="170px">
                         <asp:Repeater ID="uiRepeaterPhotos" runat="server" OnItemCommand="uiRepeaterPhotos_ItemCommand">
                             <ItemTemplate>
                                 <div style="position:relative;" class="col-lg-3">
                                 <a href='<%# Eval("PicPath") %>' data-gallery title='<%# Eval("Description") %>' data-description='<%# Eval("Description") %>' > 
                                     <img src="images.aspx?Image=<%# Eval("PicPath") %>&profile=1" class="img-thumbnail" style="width:100px;" alt='<%# Eval("Description") %>'/>                             
                                     
                                </a>          
                                 <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("MemberPicID") %>' Text="Delete" OnClientClick="return confirm('هل تريد حذف هذه الصورة؟');" CommandName="Delete" ForeColor="#000099" style="position:absolute;top:0;right:0;text-decoration:none;color:#ccc;" >  <i class="icon-remove"></i>  </asp:LinkButton>
                                 </div>
                             </ItemTemplate>

                         </asp:Repeater>                         
                     </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-12">


            </div>
        </div>
        <div class="blockBoxshadow pull-left col-lg-4 margin20" style="width:30%;height:210px;max-height:210px;">
            <div>
                <div class="pull-right">حائط البروفايل</div>
                <div class="pull-left">
                    <a href="#interest" data-toggle="modal" style="text-decoration:none;">
                        <i class="icon-3x entypoicon iconentypo-menu"  data-toggle="tooltip" title="تعديل"></i>
                    </a>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-12" style="margin:15px 0px;word-break:break-all;">
                <asp:Label ID="uiLabelInterests" runat="server" ></asp:Label>
            </div>
        </div>        
        <div class="clearfix"></div>
    <asp:HiddenField ID="uiHiddenFieldCID_profile" runat="server" ClientIDMode="Static" />

    <!-- popups -->
    <div id="mainprofile" class="modal fade" role="modal" aria-hidden="true">
        <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration:none;" >
                            ×</a>
                        <i class="icon-2x icon-edit" style="float:left;margin-left:10px;"></i>
                        <h3 >
                            تعديل بياناتى</h3>
                    </div>
                    <div class="modal-body">
                            <div class="form-horizontal blockBox">
                                    
                                <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label>الإسم </label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                        <asp:TextBox ID="uiTextBoxName" runat="server" CssClass="form-control"></asp:TextBox>
                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label>تاريخ الميلاد </label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                        <asp:TextBox ID="uiTextBoxDOP" runat="server" CssClass="form-control datecontrol"></asp:TextBox>
                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label>الديانة </label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                        <asp:DropDownList ID="uiDropDownListReligion" runat="server" CssClass="form-control" style="width:210px;" Visible="false"></asp:DropDownList>
                                        <asp:TextBox ID="uiTextBoxReligion" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label>المهنة </label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                        <asp:TextBox ID="uiTextBoxJob" runat="server" CssClass="form-control"></asp:TextBox>
                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label>البلد </label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                        <asp:DropDownList ID="uiDropDownListCountry" runat="server" CssClass="form-control" ></asp:DropDownList>
                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label>أفضل فريق </label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                        <asp:TextBox ID="uiTextBoxBestTeam" runat="server" CssClass="form-control"></asp:TextBox>
                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label>أفضل أكلة </label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                        <asp:TextBox ID="uiTextBoxBestFood" runat="server" CssClass="form-control"></asp:TextBox>
                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label>السيارة المفضلة </label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                        <asp:TextBox ID="uiTextBoxBestCar" runat="server" CssClass="form-control"></asp:TextBox>
                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label>البلد المفضلة للسياحة </label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                        <asp:TextBox ID="uiTextBoxBestCountry" runat="server" CssClass="form-control"></asp:TextBox>
                                        
                                    </div>
                                </div>
                                <hr style="width:90%;"/>
                                <div class="form-group">
                                    <div class="col-sm-1 control-label pull-right">
                                        <img src="images/facebook.png" />
                                    </div>
                                    <div class="col-sm-11 pull-right">
                                        <asp:TextBox ID="uiTextBoxfb" runat="server" CssClass="form-control" placeholder="انسخ رابط حسابك أو صفحتك أو جروبك وضعها هنا"></asp:TextBox>
                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-1 control-label pull-right">
                                        <img src="images/twitter.png" />
                                    </div>
                                    <div class="col-sm-11 pull-right">
                                        <asp:TextBox ID="uiTextBoxTwitter" runat="server" CssClass="form-control" placeholder="انسخ رابط صفحتك وضعها هنا"></asp:TextBox>
                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-1 control-label pull-right">
                                        <img src="images/youtube.png" />
                                    </div>
                                    <div class="col-sm-11 pull-right">
                                        <asp:TextBox ID="uiTextBoxyt" runat="server" CssClass="form-control" placeholder="انسخ رابط صفحتك أو قناتك وضعها هنا"></asp:TextBox>
                                        
                                    </div>
                                </div>
                            </div>

                   </div>
                    <div class="modal-footer">
                        <a href="#" class="btn btn-default" data-dismiss="modal" style="text-decoration:none;">إغلاق</a>
                        <asp:LinkButton CssClass="btn btn-warning" runat="server" ID="uiLinkButtonSave" style="text-decoration:none;" OnClick="uiLinkButtonSave_Click">حفظ</asp:LinkButton>
                    </div>
                    </div>
            </div>
    </div>
    
    <div id="interest" class="modal fade" role="modal" aria-hidden="true">
        <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration:none;" >
                            ×</a>
                        <i class="icon-2x icon-edit" style="float:left;margin-left:10px;"></i>
                        <h3 >
                            تعديل حائط البروفايل</h3>
                    </div>
                    <div class="modal-body">
                            <div class="form-horizontal blockBox">
                                
                                <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label>حائط البروفايل</label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                        <asp:TextBox ID="uiTextBoxInterests" runat="server" CssClass="form-control" TextMode="MultiLine" MaxLength="300" Rows="10"></asp:TextBox><br />
                                        <asp:CustomValidator id="CustomValidator2" runat="server" 
                                          ControlToValidate = "uiTextBoxInterests" Display="Dynamic"
                                          ErrorMessage = "أقصى عدد 300 حرف" ValidationGroup="wallValidation"
                                          ClientValidationFunction="validateLength" ForeColor="Red">
                                        </asp:CustomValidator>
                                        <span id="WallCount" style="position:absolute;left:40px;bottom:25px;color:#ccc;"></span>
                                    </div>
                                </div>                                
                            </div>
                   </div>
                    <div class="modal-footer">
                        <a href="#" class="btn btn-default" data-dismiss="modal" style="text-decoration:none;">إغلاق</a>
                        <asp:LinkButton CssClass="btn btn-warning" runat="server" ID="uiLinkButtonSaveInterests" style="text-decoration:none;" OnClick="uiLinkButtonSaveInterests_Click" ValidationGroup="wallValidation">حفظ</asp:LinkButton>
                    </div>
                    </div>
            </div>
    </div>

    <div id="accountsettings" class="modal fade" role="modal" aria-hidden="true">
        <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration:none;" >
                            ×</a>
                        <i class="icon-2x icon-cogs" style="float:left;margin-left:10px;"></i>
                        <h3 >
                            إعدادات حسابى</h3>
                    </div>
                    <div class="modal-body">
                            <div class="form-horizontal blockBox">
                                
                                <div class="form-group">
                                    <div class="col-sm-12 control-label pull-right" style="display:none;">
                                        <asp:CheckBox ID="uiCheckBoxHidePics" runat="server" CssClass="checkbox-main pull-right" Text="إخفاء صور الأصدقاء من قائمة الأصدقاء"/>                                        
                                    </div>                                   
                                    <div class="col-sm-12 control-label pull-right" style="display:none;"> 
                                        <asp:CheckBox ID="uiCheckBoxHideRoomPics" runat="server" CssClass="checkbox-main pull-right" Text=" إخفاء صور المتواجدين بالغرف"/>                                        
                                    </div>                                   
                                    <div class="col-sm-12 control-label pull-right">
                                        <asp:CheckBox ID="uiCheckBoxHideProfile" runat="server" CssClass="checkbox-main pull-right" Text=" لا تعرض ملف التعريف خاصتى"/>                                        
                                    </div>                                   
                                    <div class="col-sm-12 control-label pull-right">
                                        <asp:CheckBox ID="uiCheckBoxNotifyOnPrivateChat" runat="server" CssClass="checkbox-main pull-right" Text=" تنبيه عند استلامى محادثة خاصة"/>                                        
                                    </div>                                   
                                    <div class="col-sm-12 control-label pull-right">
                                        <asp:CheckBox ID="uiCheckBoxNotifyOnFriendsOnOff" runat="server" CssClass="checkbox-main pull-right" Text=" تنبيه عند دخول وخروج إصدقائى"/>                                        
                                    </div>                                   
                                    <div class="col-sm-12 control-label pull-right">
                                        <asp:CheckBox ID="uiCheckBoxNotifyOnFriendChangeStatus" runat="server" CssClass="checkbox-main pull-right" Text="تنبيه عند تغير حالة أصدقائى"/>                                        
                                    </div>                                   
                                    <div class="col-sm-12 control-label pull-right">
                                        <asp:CheckBox ID="uiCheckBoxNotifyOnGetMsg" runat="server" CssClass="checkbox-main pull-right" Text=" تنبيه عند استلامى رسالة على صندوق البريد"/>                                        
                                    </div>                                   
                                    <div class="col-sm-12 control-label pull-right" style="display:none;">
                                        <asp:CheckBox ID="uiCheckBoxNotifyOnVoiceMail" runat="server" CssClass="checkbox-main pull-right" Text=" تنبيه عند استلامى بريد صوتى"/>                                        
                                    </div>                                   
                                    <div class="col-sm-12 control-label pull-right">
                                        <asp:CheckBox ID="uiCheckBoxSearchMeByMail" runat="server" CssClass="checkbox-main pull-right" Text=" السماح بالبحث عنى عن طريق البريد الإلكترونى"/>                                        
                                    </div>                                   
                                    <div class="col-sm-12 control-label pull-right">
                                        <asp:CheckBox ID="uiCheckBoxVoiceNotfication" runat="server" CssClass="checkbox-main pull-right" Text=" تشغيل تنبيه صوتى عند أى حدث"/>                                        
                                    </div>           
                                    <div class="col-sm-4 control-label pull-right">
                                        <asp:Label runat="server" Text="قبول محادثة خاصة من" style="font-weight:normal;font-size:13px;"></asp:Label>                                        
                                    </div>   
                                    <div class="col-sm-5 control-label pull-right">
                                        <asp:RadioButtonList ID="uiRadioButtonListAcceptPM" runat="server" RepeatColumns="2" RepeatLayout="Flow" RepeatDirection="Horizontal" >
                                            <asp:ListItem Value="0" class="radio-inlineMain">الأصدقاء</asp:ListItem>
                                            <asp:ListItem Value="1" class="radio-inlineMain">الجميع</asp:ListItem>                                            
                                        </asp:RadioButtonList>
                                    </div>
                                    <div style="display:none">
                                     <div class="col-sm-4 control-label pull-right">
                                        <asp:Label runat="server" Text="قبول sms من" style="font-weight:normal;font-size:13px;"></asp:Label>
                                         </div>
                                    <div class="col-sm-5 control-label pull-right">
                                        <asp:RadioButtonList ID="uiRadioButtonListAcceptSMS" runat="server" RepeatColumns="2" RepeatLayout="Flow" RepeatDirection="Horizontal" >
                                            <asp:ListItem Value="0" class="radio-inlineMain">الأصدقاء</asp:ListItem>
                                            <asp:ListItem Value="1" class="radio-inlineMain">الجميع</asp:ListItem>                                            
                                        </asp:RadioButtonList>
                                    </div>
                                        </div>   
                                     <div class="col-sm-4 control-label pull-right">
                                        <asp:Label runat="server" Text="قبول رسالة بريد من" style="font-weight:normal;font-size:13px;"></asp:Label>
                                         </div>
                                    <div class="col-sm-5 control-label pull-right">
                                        <asp:RadioButtonList ID="uiRadioButtonListAcceptMsg" runat="server" RepeatColumns="2" RepeatLayout="Flow" RepeatDirection="Horizontal" >
                                            <asp:ListItem Value="0" class="radio-inlineMain">الأصدقاء</asp:ListItem>
                                            <asp:ListItem Value="1" class="radio-inlineMain">الجميع</asp:ListItem>                                            
                                        </asp:RadioButtonList>
                                    </div>   
                                     <div class="col-sm-4 control-label pull-right" style="display:none;">
                                        <asp:Label runat="server" Text="قبول رسالة صوتية من" style="font-weight:normal;font-size:13px;"></asp:Label>
                                         </div>
                                    <div class="col-sm-5 control-label pull-right" style="display:none;">
                                        <asp:RadioButtonList ID="uiRadioButtonListAcceptVoiceMail" runat="server" RepeatColumns="2" RepeatLayout="Flow" RepeatDirection="Horizontal" >
                                            <asp:ListItem Value="0" class="radio-inlineMain">الأصدقاء</asp:ListItem>
                                            <asp:ListItem Value="1" class="radio-inlineMain">الجميع</asp:ListItem>                                            
                                        </asp:RadioButtonList>
                                    </div>   
                                     <div class="col-sm-4 control-label pull-right">
                                        <asp:Label runat="server" Text="قبول ملفات بالخاص من" style="font-weight:normal;font-size:13px;"></asp:Label>
                                         </div>
                                    <div class="col-sm-5 control-label pull-right">
                                        <asp:RadioButtonList ID="uiRadioButtonListAcceptFiles" runat="server" RepeatColumns="2" RepeatLayout="Flow" RepeatDirection="Horizontal" >
                                            <asp:ListItem Value="0" class="radio-inlineMain">الأصدقاء</asp:ListItem>
                                            <asp:ListItem Value="1" class="radio-inlineMain">الجميع</asp:ListItem>                                            
                                        </asp:RadioButtonList>
                                    </div>   
                                     <div class="col-sm-4 control-label pull-right">
                                        <asp:Label runat="server" Text="قبول دعوات للغرف من" style="font-weight:normal;font-size:13px;"></asp:Label>
                                         </div>
                                    <div class="col-sm-5 control-label pull-right">
                                        <asp:RadioButtonList ID="uiRadioButtonListAcceptInvitations" runat="server" RepeatColumns="2" RepeatLayout="Flow" RepeatDirection="Horizontal" >
                                            <asp:ListItem Value="0" class="radio-inlineMain">الأصدقاء</asp:ListItem>
                                            <asp:ListItem Value="1" class="radio-inlineMain">الجميع</asp:ListItem>                                            
                                        </asp:RadioButtonList>
                                    </div>                         
                                    <div class="col-sm-12 control-label pull-right">
                                        <asp:CheckBox ID="uiCheckBoxChangeMyStatus" runat="server" CssClass="checkbox-main pull-right" Text="إجعل حالتى بعيد بعد"/>   
                                        &nbsp;<asp:TextBox ID="uiTextBoxChangeMyStatusMin" runat="server" Width="35px"></asp:TextBox>&nbsp;
                                        <asp:Label runat="server" Text="دقيقة من عدم تحريك الفأرة على الصفحة" style="font-weight:normal;font-size:13px;"></asp:Label>
                                    </div>                                   
                                    
                                </div>                                
                            </div>
                   </div>
                    <div class="modal-footer">
                        <a href="#" class="btn btn-default" data-dismiss="modal" style="text-decoration:none;">إغلاق</a>
                        <asp:LinkButton CssClass="btn btn-warning" runat="server" ID="uiLinkButtonSaveMemberSettings" style="text-decoration:none;" OnClick="uiLinkButtonSaveMemberSettings_Click">حفظ</asp:LinkButton>
                    </div>
                    </div>
            </div>
    </div>

    <div id="accountmail" class="modal fade" role="modal" aria-hidden="true">
        <div class="modal-dialog">
                <div class="modal-content">                    
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration:none;" >
                            ×</a>
                        <i class="icon-2x icon-envelope" style="float:left;margin-left:10px;"></i>
                        <h3 >
                            تغيير البريد الإلكترونى</h3>
                    </div>
                    <div class="modal-body">
                            <div class="form-horizontal blockBox">
                                <div class="alert" id="MailResponse" style="display:none;">
                                    <div id="mailSuccess" style="display:none;">
                                        <strong>تم تغيير البريد الإلكترونى بنجاح.</strong>
                                    </div>
                                    <div id="mailFail" style="display:none;">
                                        <strong>حدث خطأ. تأكد من السؤال والإجابة.</strong>
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label>السؤال السرى</label>
                                    </div>
                                    <div class="col-sm-8 pull-right">                                        
                                        <asp:DropDownList ID="MailQuestion" runat="server" CssClass="form-control" >                     
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
                                        <asp:TextBox ID="MailAnswer" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="MailAnswer" ErrorMessage="من فضلك أدخل إجابة السؤال السرى." ToolTip="من فضلك أدخل إجابة السؤال السرى." ValidationGroup="CreateUserWizard1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div> 
                                <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label>البريد الإلكترونى</label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                        <asp:TextBox ID="Email" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="من فضلك أدخل البريد الإلكترونى." ToolTip="من فضلك أدخل البريد الإلكترونى." ValidationGroup="CreateUserWizard1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>                                                               
                            </div>
                   </div>
                    <div class="modal-footer">
                        <a href="#" class="btn btn-default" data-dismiss="modal" style="text-decoration:none;" onclick="resetMailForm();">إغلاق</a>
                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-warning" OnClientClick="changeMail();return false;" ValidationGroup="CreateUserWizard">حفظ</asp:LinkButton>
                        <%--<a Class="btn btn-primary" ID="ChangeMail" style="text-decoration:none;" onclick="changeMail();">حفظ</a>--%>
                    </div>
                    </div>
            </div>
    </div>

    <div id="accountPass" class="modal fade" role="modal" aria-hidden="true">
        <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration:none;" >
                            ×</a>
                        <i class="icon-2x icon-lock" style="float:left;margin-left:10px;"></i>
                        <h3 >
                            تغيير كلمة المرور</h3>
                    </div>
                    <div class="modal-body">
                            <div class="form-horizontal blockBox">
                                <div class="alert" id="PassResponse" style="display:none;">
                                    <div id="passSuccess" style="display:none;">
                                        <strong>تم تغيير كلمة المرور بنجاح.</strong>
                                    </div>
                                    <div id="passFail" style="display:none;">
                                        <strong>حدث خطأ. تأكد من السؤال والإجابة أو كلمة المرور الحالية.</strong>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label>كلمة المرور القديمة</label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                        <asp:TextBox ID="uiTextBoxOldPass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="uiTextBoxOldPass" ErrorMessage="من فضلك أدخل كلمة المرور." ToolTip="من فضلك أدخل كلمة المرور." ValidationGroup="CreateUserWizard2" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div> 
                                 <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label>السؤال السرى</label>
                                    </div>
                                    <div class="col-sm-8 pull-right">                                        
                                        <asp:DropDownList ID="PassQuestion" runat="server" CssClass="form-control" >                     
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
                                        <asp:TextBox ID="PassAnswer" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="PassAnswer" ErrorMessage="من فضلك أدخل إجابة السؤال السرى." ToolTip="من فضلك أدخل إجابة السؤال السرى." ValidationGroup="CreateUserWizard2" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div> 
                                <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label>كلمة المرور الجديدة</label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                        <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" ErrorMessage="من فضلك أدخل كلمة المرور." ToolTip="من فضلك أدخل كلمة المرور." ValidationGroup="CreateUserWizard2" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>                                                               
                            </div>
                   </div>
                    <div class="modal-footer">
                        <a href="#" class="btn btn-default" data-dismiss="modal" style="text-decoration:none;" onclick="resetPassForm();">إغلاق</a>
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-warning" OnClientClick="changePass();return false;" ValidationGroup="CreateUserWizard2">حفظ</asp:LinkButton>
                        <%--<a Class="btn btn-primary" ID="ChangePass" style="text-decoration:none;" onclick="changePass();" ValidationGroup="CreateUserWizard2">حفظ</a>--%>
                    </div>
                    </div>
            </div>
    </div>

    <div id="addphoto" class="modal fade" role="modal" aria-hidden="true">
        <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration:none;" >
                            ×</a>
                        <i class="icon-2x icon-camera" style="float:left;margin-left:10px;"></i>
                        <h3 >
                            إضافة صورة</h3>
                    </div>
                    <div class="modal-body">
                            <div class="form-horizontal blockBox">
                                
                                <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label>إختر الصورة</label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                        <asp:FileUpload ID="uiFileUploadAddImage" runat="server" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="من فضلك اختر صورة" ControlToValidate="uiFileUploadAddImage" ValidationGroup="addPhoto" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>    
                                 <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label>الوصف</label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                         <asp:TextBox ID="uiTextBoxPhotoDesc" runat="server" CssClass="form-control" > </asp:TextBox>
                                        
                                    </div>
                                </div>                                
                            </div>
                   </div>
                    <div class="modal-footer">
                        <a href="#" class="btn btn-default" data-dismiss="modal" style="text-decoration:none;">إغلاق</a>
                        <asp:LinkButton CssClass="btn btn-warning" runat="server" ID="uiLinkButtonAddPhoto" style="text-decoration:none;" OnClick="uiLinkButtonAddPhoto_Click" ValidationGroup="addPhoto">حفظ</asp:LinkButton>
                    </div>
                    </div>
            </div>
    </div>


    <div id="addprofilephoto" class="modal fade" role="modal" aria-hidden="true">
        <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration:none;" >
                            ×</a>
                        <i class="icon-2x icon-camera" style="float:left;margin-left:10px;"></i>
                        <h3 >
                            إضافة صورة لحسابك</h3>
                    </div>
                    <div class="modal-body">
                            <div class="form-horizontal blockBox">
                                
                                <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label>إختر الصورة</label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                        <asp:FileUpload ID="uiFileUploadAddProfileImage" runat="server" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="من فضلك اختر صورة" ControlToValidate="uiFileUploadAddProfileImage" ValidationGroup="addProfilePhoto" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>                                                                  
                            </div>
                   </div>
                    <div class="modal-footer">
                        <a href="#" class="btn btn-default" data-dismiss="modal" style="text-decoration:none;">إغلاق</a>
                        <asp:LinkButton CssClass="btn btn-warning" runat="server" ID="uiLinkButtonAddProfilePhoto" style="text-decoration:none;" OnClick="uiLinkButtonAddProfilePhoto_Click" ValidationGroup="addProfilePhoto">حفظ</asp:LinkButton>
                    </div>
                    </div>
            </div>
    </div>

    <div id="selectprofilephoto" class="modal fade" role="modal" aria-hidden="true">
        <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration:none;" >
                            ×</a>
                        <i class="icon-2x icon-camera" style="float:left;margin-left:10px;"></i>
                        <h3 >
                            إختر صورة لحسابك</h3>
                    </div>
                    <div class="modal-body">
                            <div class="form-horizontal blockBox">
                                
                                <div class="form-group">
                                    <asp:Repeater ID="uiRepeaterProfilePics" runat="server">
                                        <HeaderTemplate>
                                             <ul class="ProfilePics">                                                                            
                                        </HeaderTemplate>
                                        <FooterTemplate>
                                            </ul>
                                    <div class="clearfix" style="height: 10px;"></div>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <li>
                                            <input type="radio" name="profilePic" class="input_hidden" value="<%# Eval("MemberPicID") %>" id="profile_<%# Eval("MemberPicID")  %>" />
                                            <label class="profileselect" data-Picid='<%# Eval("MemberPicID") %>'>
                                                <img src="<%# Eval("PicPath")%>" />                                                
                                            </label>
                                        </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>                                                                  
                            </div>
                   </div>
                    <div class="modal-footer">
                        <a href="#" class="btn btn-default" data-dismiss="modal" style="text-decoration:none;">إغلاق</a>
                        <a class="btn btn-warning" ID="LinkSelectProfilePhoto" style="text-decoration:none;" >حفظ</a>
                    </div>
                    </div>
            </div>
    </div>

    <!-- gallery popup -->
    <div id="blueimp-gallery" class="blueimp-gallery">
    <!-- The container for the modal slides -->
    <div class="slides"></div>
    <!-- Controls for the borderless lightbox -->
    <h3 class="title"></h3>
    <p class="description"></p>
    <a class="prev">‹</a>
    <a class="next">›</a>
    <a class="close">×</a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
    <!-- The modal dialog, which will be used to wrap the lightbox content -->
    <div class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body next ">
                <div class="description"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left prev">
                        <i class="glyphicon glyphicon-chevron-left"></i>
                        السابق
                    </button>
                    <button type="button" class="btn btn-warning next">
                        التالى
                        <i class="glyphicon glyphicon-chevron-right"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
    </div>
</asp:Content>
