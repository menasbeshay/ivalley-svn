<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Chat2Connect.home" %>

<%@ Register Src="usercontrols/ucRooms.ascx" TagName="ucRooms" TagPrefix="uc1" %>
<%@ Register Src="usercontrols/ucFriends.ascx" TagName="ucFriends" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/bootstrap-slider.js"></script>
    <link href="css/slider.css" rel="stylesheet" />
    <%--<script src="js/wysihtml5-0.3.0.min.js"></script>--%>
    <script src="js/advanced.js"></script>

    <%--<script src="js/wysihtml5-0.4.0pre.js"></script>--%>
    <script src="js/wysihtml5-0.3.0.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.iconentypo-addfriend').tooltip();
            $('#cpmain').addClass('selected');

            $(".catLink").click(function () {
                $("#roomsDiv").load("getRooms2.aspx",
                    { data_related: "" + $(this).attr("data-related") + "" },
                    function (content) {
                        $(this).hide().fadeIn("slow");
                        return false;
                    });
            });
            $(".subcatLink").click(function () {
                $("#roomsDiv").load("getRooms2.aspx",
                    { data_related: "" + $(this).attr("data-related") + "" },
                    function (content) {
                        $(this).hide().fadeIn("slow");
                        return false;
                    });
            });


            $("#<%= uiTextBoxFriendSearch.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "../Services/Services.asmx/SearchMembersExceptFriends",
                        dataType: "json",
                        type: "post",
                        data: "{'query':'" + request.term.toString() + "','MemberID' : '" + $("#<%=uiHiddenFieldCurrent.ClientID %>").val() + "'}",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            response(jQuery.map(data.d, function (item) {
                                return {
                                    val: item.split('##')[0],
                                    label: item.split('##')[1]
                                }
                            }))
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(textStatus);
                        }
                    });

                },
                select: function (e, i) {
                    $("#<%=uiHiddenFieldFriendID.ClientID %>").val(i.item.val);
                },
                minLength: 1
            });

        });

    </script>
    <script src="Scripts/knockout-3.1.0.js"></script>
    <script src="js/jquery.tokeninput.js"></script>
    <link href="css/token-input-facebook.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="blockBoxshadow pull-right col-lg-2 margin20 " style="width: 21% !important;">
        <div style="border-bottom: 1px solid #FEC200">
            <div class="pull-right">
                <i class="icon-2x modernicon iconmodern-friends"></i>
                أصدقائى
            </div>
            <div class="pull-left">
                <a href="#addfriends" data-toggle="modal" style="text-decoration: none;"><i class="icon-3x entypoicon iconentypo-addfriend" data-toggle="tooltip" title="إضافة صديق" style="width: 10px !important; height: 10px !important;"></i></a>
            </div>
            <div class="clearfix"></div>
        </div>

        <div style="height: 5px;" class="clearfix"></div>

        <uc2:ucFriends ID="ucFriends1" runat="server" />

    </div>
    <div id="MainTabs">
        <div style="padding: 5px; padding-right: 0px; margin-left: 10px;" class="pull-left col-lg-9" id="homeNav">
            <ul class="nav nav-tabs">
                <li class="pull-right active"><a href="#home" data-toggle="tab" data-bind="click: changeCurrent.bind('home')">الرئيسية</a></li>
                <!-- ko foreach: windows -->
                <li class="pull-right"><a style="display: block; height: 28px;" data-toggle="tab" data-bind="attr: { href: '#' + Type() + '_' + ID() }, click: $parent.changeCurrent.bind($data, $data.Type() + '_' + $data.ID())">
                    <span data-bind="text: Name" class="pull-right"></span>
                    <button type="button" class="close" data-bind="click: $parent.removeWindow">×</button></a></li>
                <!-- /ko -->
            </ul>
        </div>
        <div style="height: 1px;" class="clearfix"></div>

        <div class="blockBoxshadow pull-left col-lg-9 margin20" style="margin-top: 2px;">
            <div class="tab-content">
                <div class="tab-pane fade in active" id="home">
                    <div style="border-bottom: 1px solid #FEC200">
                        <div class="pull-right ">
                            <i class="icon-2x modernicon iconmodern-mainlist"></i>
                            القائمة الرئيسية
                        </div>
                        <div class="pull-left">

                            <div class="form-group">
                                <asp:TextBox ID="uiTextBoxRoomSearch" runat="server" placeholder="ابحث عن غرفة" Style="padding: 5px; padding-top: 7px;"></asp:TextBox>
                                <a href="#" style="font-size: 20px; text-decoration: none;"><i class="icon icon-search"></i></a>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>

                    <div class="col-lg-3 pull-right" style="padding: 5px; border-left: 2px solid #FEC200; margin-top: 2px;">
                        <uc1:ucRooms ID="ucRooms1" runat="server" />
                    </div>
                    <div class="col-lg-9 pull-left" style="padding: 5px;" id="roomsDiv">
                    </div>
                </div>
                <!-- ko template: { name: 'chatTemplate', foreach: windows } -->
                <!-- /ko -->
            </div>
        </div>
    </div>
    <div id="addfriends" class="modal fade" role="modal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>
                    <i class="icon-3x entypoicon iconentypo-addfriend" style="float: left; margin-left: 10px;"></i>
                    <h3>أضف صديق</h3>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal blockBox">

                        <div class="form-group">
                            <div class="col-sm-4 control-label pull-right">
                                <label>بحث</label>
                            </div>
                            <div class="col-sm-7 pull-right">
                                <asp:TextBox ID="uiTextBoxFriendSearch" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal" style="text-decoration: none;">إغلاق</a>
                    <asp:LinkButton CssClass="btn btn-warning" runat="server" ID="uiLinkButtonAddFriend" Style="text-decoration: none;" OnClick="uiLinkButtonAddFriend_Click">حفظ</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>

    <asp:HiddenField ID="uiHiddenFieldFriendID" runat="server" />
    <asp:HiddenField ID="uiHiddenFieldCurrent" runat="server" />
    <asp:HiddenField ID="uiHiddenFieldCurrentName" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="uiHiddenFieldMaxNoOfRooms" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="uiHiddenFieldOpenedRooms" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="uiHiddenFieldMaxCams" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="uiHiddenFieldOpenedCams" ClientIDMode="Static" runat="server" />

    <script src="Scripts/knockout.mapping-latest.js"></script>
    <script src="js/chatwindows.js"></script>
    <script>
        $(document).ready(function () {
            var currentMemberID=eval($("#<%=uiHiddenFieldCurrent.ClientID %>").val());
            var currentMemberName=$("#<%=uiHiddenFieldCurrentName.ClientID %>").val();
            var maxRooms=eval($("#<%=uiHiddenFieldMaxNoOfRooms.ClientID %>").val());
            InitChat(maxRooms,currentMemberID,currentMemberName);
        });
    </script>
    <script id="chatTemplate" type="text/html">
        <div data-bind="attr: { id: uniqueID() }" class="tab-pane fade" style="">
            <div id="roomContents">
                <div class="col-lg-12" style="padding: 5px;">
                    <div>
                        <div class="pull-right ">
                            <i class="icon-2x modernicon iconmodern-mainlist"></i>
                            <span id="uiLabelRoomName" data-bind="text:Name"></span>
                        </div>
                        <div class="pull-right " style="margin-right: 30px; height: 15px; padding: 8px; font-weight: bold;">
                            <span id="uiLabelRoomTopic" data-bind="text:RoomTopic"></span>
                        </div>
                        <div class="pull-left">
                            <div class="form-group">
                                <!-- ko if: Type()=="Room" -->

                                <div id="admin-menu" class="btn-group" data-bind="if :CurrentMemberSettings.IsAdmin">
                                    <button style="position: relative;" data-toggle="dropdown" class="btn btn-main dropdown-toggle" type="button">
                                        المشرف  <span class="caret"></span>
                                    </button>
                                    <ul role="menu" class="dropdown-menu RoomAdminMenu">
                                        <li>
                                            <input type="checkbox" data-bind="attr: { onclick: 'ClearQueue('+ID()+');'}">&nbsp;إزالة الأيدى&nbsp;
                                        </li>
                                        <li>
                                            <input type="checkbox" data-bind="attr: { onclick: 'MarkMember(this,'+ID()+', true);'}">&nbsp;تنقيط الجميع ومسموح الكتابة&nbsp;
                                        </li>
                                        <li>
                                            <input type="checkbox" data-bind="attr: { onclick: 'MarkMember(this,'+ID()+',false);'}">&nbsp;تنقيط الجميع بدون كتابة&nbsp;
                                        </li>
                                        <li>
                                            <input type="checkbox" data-bind="attr: { onclick: 'MarkMemberOnLogin(this,'+ID()+', true);'}">&nbsp;تنقيط عند الدخول ومسموح الكتابة&nbsp;
                                        </li>
                                        <li>
                                            <input type="checkbox" data-bind="attr: { onclick: 'MarkMemberOnLogin(this,'+ID()+', false);'}">&nbsp;تنقيط عند الدخول وبدون كتابة&nbsp;
                                        </li>
                                        <li>
                                            <input type="checkbox" data-bind="attr: { onclick: 'DisableCams(this,'+ID()+');'}">&nbsp;ممنوع الكمراء&nbsp;
                                        </li>
                                        <li>
                                            <input type="checkbox" data-bind="attr: { onclick: 'EnableMic(this,'+ID()+', false);'}">&nbsp;مسموح المكرفون للجميع&nbsp;
                                        </li>
                                        <li>
                                            <input type="checkbox" data-bind="attr: { onclick: 'EnableMic(this,'+ID()+', true);'}">&nbsp;مسموح المكرفون للأدمنية فقط&nbsp;
                                        </li>
                                        <li>
                                            <a style="cursor: pointer;" data-bind="click:showControlPanel" href="#"><i class=" icon-dashboard"></i>&nbsp;لوحة تحكم المشرف </a>
                                        </li>
                                    </ul>
                                </div>

                                <div class="btn-group">
                                    <button style="position: relative;" data-toggle="dropdown" class="btn btn-main dropdown-toggle" type="button">
                                        إعدادت  <span class="caret"></span>
                                    </button>
                                    <ul role="menu" class="dropdown-menu">
                                        <li><a href="#"><i class="icon-time"></i>&nbsp;طابع زمنى&nbsp;</a></li>
                                        <li><a href="#"><i class="icon-reply"></i>
                                            <input type="checkbox" data-bind="click:updateSetting.bind($data,'NotifyOnFriendsLogOn'),checked:CurrentMemberSettings.NotifyOnFriendsLogOn" />&nbsp;تنبيه عند دخول أشخاص&nbsp;</a></li>
                                        <li><a href="#"><i class="icon-share-alt"></i>
                                            <input type="checkbox" data-bind="click:updateSetting.bind($data,'NotifyOnFriendsLogOff'),checked:CurrentMemberSettings.NotifyOnFriendsLogOff" />&nbsp;تنبيه عند خروح أشخاص&nbsp;</a></li>
                                        <li><a href="#"><i class="icon-eye-open"></i>
                                            <input type="checkbox" data-bind="click:updateSetting.bind($data,'NotifyOnOpenCam'),checked:CurrentMemberSettings.NotifyOnOpenCam" />&nbsp;تنبيه عند فتح كمراء&nbsp;</a></li>
                                        <li><a href="#"><i class="icon-eye-close"></i>
                                            <input type="checkbox" data-bind="click:updateSetting.bind($data,'NotifyOnCloseCam'),checked:CurrentMemberSettings.NotifyOnCloseCam" />&nbsp;تنبيه عند قفل كمراء&nbsp;</a></li>
                                        <li><a href="#"><i class="icon-microphone"></i>
                                            <input type="checkbox" data-bind="click:updateSetting.bind($data,'NotifyOnMicOn'),checked:CurrentMemberSettings.NotifyOnMicOn" />&nbsp;تنبيه عند أخذ المكرفون&nbsp;</a></li>
                                        <li><a href="#"><i class="icon-microphone-off"></i>
                                            <input type="checkbox" data-bind="click:updateSetting.bind($data,'NotifyOnMicOff'),checked:CurrentMemberSettings.NotifyOnMicOff" />&nbsp;تنبيه عند ترك المكروفن&nbsp;</a></li>
                                    </ul>

                                </div>
                                <!-- /ko -->
                                <a download="room.txt" data-bind="attr:{id:'SaveConv_'+uniqueID()}" class="btn btn-main" href="#">حفظ النقاش</a>
                                <a class="btn btn-main" href="#" data-bind="click: $parent.removeWindow">خروج</a>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>

                </div>

                <!-- ko if: Type()=="Room" -->
                <div class="col-lg-12">
                    <div style="padding: 5px;" class="pull-right col-lg-3">
                        <label><span id="Label1">مدير الغرفة:</span></label>
                        <span id="uiLabelAdmin" data-bind="text:AdminName"></span>
                    </div>
                    <div style="padding: 5px;" class="pull-right col-lg-3">
                        <label><span id="Label2">كاميرات:</span></label>
                        <span id="Label4" data-bind="text:OpenCams"></span>
                        |
                        <label><span id="Label3">متواجدين:</span></label>
                        <span id="uiLabelMemberCount" data-bind="text:MemberCount"></span>
                    </div>

                    <!-- ko if: !CurrentMemberSettings.IsFav() -->
                    <div style="padding: 5px;" class="pull-right col-lg-2">
                        <a style="cursor: pointer;" data-bind="attr:{onclick:'addtoFav('+ID()+');',id:'favlink_'+uniqueID()}"><i style="color: #FEC200;" class="icon-star"></i>أضف إلى المفضلة</a>
                    </div>
                    <!-- /ko -->
                    <div style="padding: 5px;" class="pull-right col-lg-2">
                        <div>
                            <a data-bind="attr{href:fbURL}" target="_blank" id="uiHyperLinkFb">
                                <img src="images/facebook.png"></a>
                            &nbsp;&nbsp;
                    <a data-bind="attr{href:tURL}" target="_blank" id="uiHyperLinktwitter">
                        <img src="images/twitter.png"></a>
                            &nbsp;&nbsp;
                    <a data-bind="attr{href:utURL}" target="_blank" id="uiHyperLinkyt">
                        <img src="images/youtube.png"></a>
                        </div>
                    </div>
                    <div style="padding: 5px;" class="pull-right col-lg-2">
                        <span class="rating">
                            <input type="radio" class='rating-input' data-bind="click:$parent.rateRoom.bind($data,5), checked:CurrentMemberSettings.UserRate,checkedValue: 5,attr:{id:'rating-input-1-5_'+uniqueID()}" name="rating-input-1" />
                            <label data-bind="attr:{'for':'rating-input-1-5_'+uniqueID()}" class="rating-star fa icon-star"></label>
                            <input type="radio" class="rating-input" data-bind="click:$parent.rateRoom.bind($data,4), checked:CurrentMemberSettings.UserRate,checkedValue: 4,attr:{id:'rating-input-1-4_'+uniqueID()}" name="rating-input-1" />
                            <label data-bind="attr:{'for':'rating-input-1-4_'+uniqueID()}" class="rating-star fa icon-star"></label>
                            <input type="radio" class="rating-input" data-bind="click:$parent.rateRoom.bind($data,3), checked:CurrentMemberSettings.UserRate,checkedValue: 3,attr:{id:'rating-input-1-3_'+uniqueID()}" name="rating-input-1" />
                            <label data-bind="attr:{'for':'rating-input-1-3_'+uniqueID()}" class="rating-star fa icon-star"></label>
                            <input type="radio" class="rating-input" data-bind="click:$parent.rateRoom.bind($data,2), checked:CurrentMemberSettings.UserRate,checkedValue: 2,attr:{id:'rating-input-1-2_'+uniqueID()}" name="rating-input-1" />
                            <label data-bind="attr:{'for':'rating-input-1-2_'+uniqueID()}" class="rating-star fa icon-star"></label>
                            <input type="radio" class="rating-input" data-bind="click:$parent.rateRoom.bind($data,1), checked:CurrentMemberSettings.UserRate,checkedValue: 1,attr:{id:'rating-input-1-1_'+uniqueID()}" name="rating-input-1" />
                            <label data-bind="attr:{'for':'rating-input-1-1_'+uniqueID()}" class="rating-star fa icon-star"></label>
                        </span>
                        <input id="uiHiddenFieldUserRate" type="hidden" name="uiHiddenFieldUserRate" data-bind="value:CurrentMemberSettings.UserRate">
                    </div>
                </div>
                <div style="height: 5px;" class="clear"></div>
                <span class="col-lg-12" style="height: 16px; cursor: pointer; border-bottom: 1px solid #FEC200; color: #000;" data-bind="click:$parent.toggleFlashObj($data)"><i class="icon-arrow-down"></i>&nbsp;&nbsp;الكاميرات</span>
                <div style="padding: 5px; border-bottom: 1px solid #FEC200; padding-top: 0px;" class="col-lg-12">

                    <div style="padding: 2px;" class="pull-left col-lg-12" data-bind="attr:{id: 'flashWrapper_' +uniqueID()}">

                        <object style="width: 100%; height: 180px;" data="testswf/chat2connect.swf" class="flashmovie" data-bind="attr:{id:'chat2connect_'+uniqueID(), name:'chat2connect_'+uniqueID()}" type="application/x-shockwave-flash">
                            <param name="quality" value="high">
                            <param value="always" name="allowScriptAccess">
                            <param name="wmode" value="opaque" />
                            <param data-bind="attr:{value:'roomId='+uniqueID()+'&amp;userId='+CurrentMemberSettings.MemberID()+'&amp;allowedCams='+Settings.CamCount()+'&amp;conn=<%= System.Configuration.ConfigurationManager.AppSettings["amsCoonection"]%>'}" name="flashvars">
                        </object>

                    </div>
                </div>
                <!-- /ko -->
                <!-- ko if: Type()=="Private" -->
                <span class="col-lg-12" style="height: 16px; cursor: pointer; border-bottom: 1px solid #FEC200; color: #000;" data-bind="click:$parent.toggleFlashObj($data)"><i class="icon-arrow-down"></i>&nbsp;&nbsp;الكاميرات</span>
                <div style="padding: 5px; border-bottom: 1px solid #FEC200; padding-top: 0px;" class="col-lg-12">

                    <div style="padding: 2px;" class="pull-left col-lg-12" data-bind="attr:{id: 'flashWrapper_' +uniqueID()}">

                        <object style="width: 100%; height: 180px;" data="testswf/chat2connect.swf" class="flashmovie" data-bind="attr:{id:'chat2connect_'+uniqueID(), name:'chat2connect_'+uniqueID()}" type="application/x-shockwave-flash">
                            <param name="quality" value="high">
                            <param value="always" name="allowScriptAccess">
                            <param name="wmode" value="opaque" />
                            <param data-bind="attr:{value:'roomId='+uniqueID()+ '_' + CurrentMemberSettings.MemberID() +'&amp;userId='+CurrentMemberSettings.MemberID()+'&amp;allowedCams=2&amp;conn=<%= System.Configuration.ConfigurationManager.AppSettings["amsCoonection"]%>'}" name="flashvars">
                        </object>

                    </div>
                </div>

                <!-- /ko -->
                <div style="height: 5px;" class="clear"></div>
                <div style="padding: 5px;" class="col-lg-12">
                    <!-- ko if: Type()=="Room" -->
                    <div style="padding: 5px; margin-top: 2px; position: relative;" class="col-lg-3 pull-right">
                        <div id="roomMembersDiv" data-height="530px" class="SScroll" style="overflow-y: hidden; width: auto; height: 530px; overflow-x: visible; background-color: #D9D9D9;">
                            <div id="MicDiv">
                                <div class="friend-link rm Altodd roomMemberlink" data-bind="with:MicMember">

                                    <div class="pull-left controls">
                                        <div class="cameraHolder">
                                            <a data-bind="attr:{'data-related':$parent.ID()+'$'+MemberID()}" class="camera" href="#">
                                                <img style="width: 20px;" src="images/video_camera.png"></a>
                                        </div>
                                        <img src="images/microphone_1.png" style="width: 16px; display: block;" class="mic" /><i class="icon-ban-circle mark"></i>
                                    </div>

                                    <a data-bind="text:MemberName,css:'memberlink pull-left jslink type_'+MemberTypeID()"></a>
                                    <div class="clear" style="height: 1px;"></div>
                                    <!-- ko if: MemberID()!=$root.CurrentMemberID-->
                                    <div class="clear" style="height: 1px;"></div>
                                    <div class="friendSubMenu">
                                        <div class="popup-menu profileMenu">
                                            <div class="col-lg-3 pull-right">
                                                <div class=" thumbnail">
                                                    <img data-bind="attr:{'src':ProfileImg}" />
                                                </div>
                                                <div class="clearfix" style="height: 1px;">
                                                </div>
                                                <div style="text-align: right;">
                                                    <span data-bind="text:$data.MemberName()"></span>
                                                </div>
                                            </div>
                                            <div class="col-lg-9 pull-right">
                                                <div class="col-lg-7 pull-right">
                                                    <ul>
                                                        <li><a class="jslink" data-bind="click:$root.openWindow.bind($data,$data.MemberID(),$data.MemberName(),'Private')"><span class="awesome">&#xf0e6;</span> محادثة خاصة</a></li>
                                                        <li><a class="jslink"><span class="awesome">&#xf030;</span> عرض الكاميرا</a></li>
                                                        <li><a class="jslink" data-bind="attr:{href:'userprofile.aspx?uid='+MemberID()}" target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a></li>
                                                        <li><a class="jslink"><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-5 pull-right">
                                                    <ul>
                                                        <li><a class="jslink"><span class="awesome">&#xf06b;</span> أرسل هدية</a></li>
                                                        <li><a data-bind="attr:{href:'Messages.aspx?t=createmsg&u='+MemberID()+'&un='+MemberName()}" target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a></li>
                                                        <!-- ko if:$parent.CurrentMemberSettings.IsAdmin()-->
                                                        <li><a class="jslink" data-bind="click:$parent.banMember.bind($data,$data.MemberID())"><span class="awesome">&#xf05e;</span> حجب</a></li>
                                                        <!-- /ko -->
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="clear" style="height: 1px;"></div>
                                        </div>
                                    </div>
                                    <%--                                    <ul class="popup-menu profileMenu g-dark g-dark-list">
                                        <li><a class="jslink" data-bind="click:$root.openWindow.bind($data,$data.MemberID(),$data.MemberName(),'Private')"><span class="awesome">&#xf0e6;</span> محادثة خاصة</a></li>
                                        <li><a class="jslink"><span class="awesome">&#xf030;</span> عرض الكاميرا</a></li>
                                        <li><a class="jslink" data-bind="attr:{href:'userprofile.aspx?uid='+MemberID()}" target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a></li>
                                        <li><a class="jslink"><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a></li>
                                        <li><a class="jslink"><span class="awesome">&#xf06b;</span> أرسل هدية</a></li>
                                        <li><a data-bind="attr:{href:'Messages.aspx?t=createmsg&u='+MemberID()+'&un='+MemberName()}" target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a></li>
                                        <!-- ko if:$parent.CurrentMemberSettings.IsAdmin()-->
                                        <li><a class="jslink" data-bind="click:$parent.banMember.bind($data,$data.MemberID())"><span class="awesome">&#xf05e;</span> حجب</a></li>
                                        <!-- /ko -->
                                    </ul>--%>
                                    <!-- /ko -->
                                </div>
                            </div>
                            <div id="queueDiv">
                                <!-- ko foreach: QueueMembers-->
                                <div class="friend-link rm roomMemberlink" data-bind="attr:{id:'m_'+MemberID()}, css:{Altodd:$index()%2,Alteven:!$index()%2}">

                                    <div class="pull-left controls">
                                        <div class="cameraHolder">
                                            <a data-bind="attr:{'data-related':$parent.ID()+'$'+MemberID()}" class="camera" href="#">
                                                <img style="width: 20px;" src="images/video_camera.png"></a>
                                        </div>
                                        <img src="images/hand.png" style="width: 16px; display: block;" class="hand" /><i class="icon-ban-circle mark"></i>
                                    </div>
                                    <a data-bind="text:MemberName,css:'memberlink pull-left jslink type_'+MemberTypeID()"></a>
                                    <div class="clear" style="height: 1px;"></div>
                                    <!-- ko if: MemberID()!=$root.CurrentMemberID-->
                                    <div class="clear" style="height: 1px;"></div>
                                    <div class="friendSubMenu">
                                        <div class="popup-menu profileMenu">
                                            <div class="col-lg-3 pull-right">
                                                <div class=" thumbnail">
                                                    <img data-bind="attr:{'src':ProfileImg}" />
                                                </div>
                                                <div class="clearfix" style="height: 1px;">
                                                </div>
                                                <div style="text-align: right;">
                                                    <span data-bind="text:$data.MemberName()"></span>
                                                </div>
                                            </div>
                                            <div class="col-lg-9 pull-right">
                                                <div class="col-lg-7 pull-right">
                                                    <ul>
                                                        <li><a class="jslink" data-bind="click:$root.openWindow.bind($data,$data.MemberID(),$data.MemberName(),'Private')"><span class="awesome">&#xf0e6;</span> محادثة خاصة</a></li>
                                                        <li><a class="jslink"><span class="awesome">&#xf030;</span> عرض الكاميرا</a></li>
                                                        <li><a class="jslink" data-bind="attr:{href:'userprofile.aspx?uid='+MemberID()}" target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a></li>
                                                        <li><a class="jslink"><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-5 pull-right">
                                                    <ul>
                                                        <li><a class="jslink"><span class="awesome">&#xf06b;</span> أرسل هدية</a></li>
                                                        <li><a data-bind="attr:{href:'Messages.aspx?t=createmsg&u='+MemberID()+'&un='+MemberName()}" target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a></li>
                                                        <!-- ko if:$parent.CurrentMemberSettings.IsAdmin()-->
                                                        <li><a class="jslink" data-bind="click:$parent.banMember.bind($data,$data.MemberID())"><span class="awesome">&#xf05e;</span> حجب</a></li>
                                                        <!-- /ko -->
                                                    </ul>
                                                </div>

                                            </div>
                                            <div class="clear" style="height: 1px;"></div>
                                        </div>
                                    </div>
                                    <%-- <ul class="popup-menu profileMenu g-dark g-dark-list">
                                        <li><a class="jslink" data-bind="click:$root.openWindow.bind($data,$data.MemberID(),$data.MemberName(),'Private')"><span class="awesome" >&#xf0e6;</span> محادثة خاصة</a></li>
                                        <li><a class="jslink"><span class="awesome">&#xf030;</span> عرض الكاميرا</a></li>
                                        <li><a class="jslink" data-bind="attr:{href:'userprofile.aspx?uid='+MemberID()}" target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a></li>
                                        <li><a class="jslink"><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a></li>
                                        <li><a class="jslink"><span class="awesome">&#xf06b;</span> أرسل هدية</a></li>
                                        <li><a data-bind="attr:{href:'Messages.aspx?t=createmsg&u='+MemberID()+'&un='+MemberName()}" target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a></li>
                                        <!-- ko if:$parent.CurrentMemberSettings.IsAdmin()-->
                                        <li><a class="jslink" data-bind="click:$parent.banMember.bind($data,$data.MemberID())"><span class="awesome">&#xf05e;</span> حجب</a></li>
                                        <!-- /ko -->
                                    </ul>--%>
                                    <!-- /ko -->
                                </div>
                                <!-- /ko -->
                            </div>
                            <div id="regular">
                                <!-- ko foreach: RoomMembers-->
                                <div class="friend-link rm roomMemberlink" data-bind="css:{Altodd:$index()%2,Alteven:!$index()%2}">

                                    <div class="pull-left controls">
                                        <div class="cameraHolder">
                                            <a data-bind="attr:{'data-related':$parent.ID()+'$'+MemberID()}" class="camera" href="#">
                                                <img style="width: 20px;" src="images/video_camera.png"></a>
                                        </div>
                                        <i class="icon-ban-circle mark"></i>
                                    </div>
                                    <a data-bind="text:MemberName,css:'memberlink pull-left jslink type_'+MemberTypeID()"></a>
                                    <div class="clear" style="height: 1px;"></div>
                                    <!-- ko if: MemberID()!=$root.CurrentMemberID-->
                                    <div class="clear" style="height: 1px;"></div>
                                    <div class="friendSubMenu">
                                        <div class="popup-menu profileMenu">
                                            <div class="col-lg-3 pull-right">
                                                <div class=" thumbnail">
                                                    <img data-bind="attr:{'src':ProfileImg}" />
                                                </div>
                                                <div class="clearfix" style="height: 1px;">
                                                </div>
                                                <div style="text-align: right;">
                                                    <span data-bind="text:$data.MemberName()"></span>
                                                </div>
                                            </div>
                                            <div class="col-lg-9 pull-right">
                                                <div class="col-lg-7 pull-right">
                                                    <ul>
                                                        <li><a class="jslink" data-bind="click:$root.openWindow.bind($data,$data.MemberID(),$data.MemberName(),'Private')"><span class="awesome">&#xf0e6;</span> محادثة خاصة</a></li>
                                                        <li><a class="jslink"><span class="awesome">&#xf030;</span> عرض الكاميرا</a></li>
                                                        <li><a class="jslink" data-bind="attr:{href:'userprofile.aspx?uid='+MemberID()}" target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a></li>
                                                        <li><a class="jslink"><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-5 pull-right">
                                                    <ul>
                                                        <li><a class="jslink"><span class="awesome">&#xf06b;</span> أرسل هدية</a></li>
                                                        <li><a data-bind="attr:{href:'Messages.aspx?t=createmsg&u='+MemberID()+'&un='+MemberName()}" target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a></li>
                                                        <!-- ko if:$parent.CurrentMemberSettings.IsAdmin()-->
                                                        <li><a class="jslink" data-bind="click:$parent.banMember.bind($data,$data.MemberID())"><span class="awesome">&#xf05e;</span> حجب</a></li>
                                                        <!-- /ko -->
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="clear" style="height: 1px;"></div>
                                        </div>
                                    </div>
                                    <%--<ul class="popup-menu profileMenu g-dark g-dark-list">
                                        <li><a class="jslink" data-bind="click:$root.openWindow.bind($data,$data.MemberID(),$data.MemberName(),'Private')"><span class="awesome">&#xf0e6;</span> محادثة خاصة</a></li>
                                        <li><a class="jslink"><span class="awesome">&#xf030;</span> عرض الكاميرا</a></li>
                                        <li><a class="jslink" data-bind="attr:{href:'userprofile.aspx?uid='+MemberID()}" target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a></li>
                                        <li><a class="jslink"><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a></li>
                                        <li><a class="jslink"><span class="awesome">&#xf06b;</span> أرسل هدية</a></li>
                                        <li><a data-bind="attr:{href:'Messages.aspx?t=createmsg&u='+MemberID()+'&un='+MemberName()}" target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a></li>
                                        <!-- ko if:$parent.CurrentMemberSettings.IsAdmin()-->
                                        <li><a class="jslink" data-bind="click:$parent.banMember.bind($data,$data.MemberID())"><span class="awesome">&#xf05e;</span> حجب</a></li>
                                        <!-- /ko -->
                                    </ul>--%>
                                    <!-- /ko -->
                                </div>
                                <!-- /ko -->
                            </div>
                        </div>
                    </div>
                    <!-- /ko -->

                    <div id="roomTextDiv" class='pull-left ' data-bind="css:{ 'col-lg-9' :Type()=='Room', 'col-lg-12': Type() == 'Private'}, style:{padding: '5px', 'border-right': Type() == 'Room'? '2px solid #FEC200' :'0px'}">

                        <div data-height="400px;" style="width: 100%; background-color: #D9D9D9; min-height: 400px; padding: 5px; direction: rtl;" class="MsgHistroy" data-bind="html:MessageHistory"></div>

                        <div style="height: 5px;" class="clearfix"></div>

                        <a style="width: 8%; height: 70px; padding-top: 25px; float: right;" class="btn btn-main" data-bind="click:$parent.sendMessage,attr:{id:'a_Send_'+uniqueID()}">إرسال</a>
                        <textarea data-bind="value:Message, attr:{id:'uiTextMsg_'+uniqueID()}" type='text' style='width: 91.5%; background-color: #D9D9D9; height: 70px; border: 0px; float: left;'></textarea>

                        <div style="height: 20px;" class="clear"></div>

                        <div class="col-lg-12" style="padding: 0px;">
                            <div class="pull-right">
                                <!-- ko if: Type()=="Room" -->
                                <a data-placement="top" title="" class="btn btn-default roomMenuItem" data-bind="click:$parent.requestMic,attr:{id:'requestMic_'+uniqueID()}" data-original-title="طلب/إلغاء مايك">
                                    <img src="images/hand-icon.png" style="width: 15px;">
                                </a>
                                <!-- /ko -->
                                <a data-placement="top" title="" class="btn btn-default roomMenuItem" data-bind="click:$parent.mic,attr:{id:'Mic_'+uniqueID()}" data-original-title="تحدث">
                                    <i class="icon-microphone" style="font-size: 17px;"></i>
                                </a>
                                <a data-placement="top" title="" class="btn btn-default roomMenuItem" data-bind="click:$parent.cam,attr:{id:'Cam_'+uniqueID()}" data-original-title="تشغيل/ إيقاف الكاميرا">
                                    <i class="icon-camera" style="font-size: 17px;"></i>
                                </a>
                            </div>
                            <div class="pull-right" style="margin-right: 3px;">
                                <div data-bind="attr:{id: 'toolbar'+uniqueID()}">
                                    <div data-toggle="buttons" class="btn-group">

                                        <button title="CTRL+B" data-wysihtml5-command="bold" class="btn btn-default" href="javascript:;" unselectable="on"><span class="icon-bold" style="font-size: 17px;"></span></button>
                                    </div>
                                    <div data-toggle="buttons" class="btn-group">
                                        <button title="CTRL+I" data-wysihtml5-command="italic" class="btn btn-default" href="javascript:;" unselectable="on"><span class="icon-italic" style="font-size: 17px;"></span></button>
                                    </div>


                                    <div class="btn-group dropup">
                                        <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button">
                                            <span class="icon-text-height" style="font-size: 17px;"></span>
                                        </button>
                                        <ul role="menu" class="dropdown-menu">
                                            <li><a data-wysihtml5-command-value="xsmall" data-wysihtml5-command="fontSize" href="javascript:;" unselectable="on">صغير جداً</a></li>
                                            <li><a data-wysihtml5-command-value="small" data-wysihtml5-command="fontSize" href="javascript:;" unselectable="on">صغير</a></li>
                                            <li><a data-wysihtml5-command-value="medium" data-wysihtml5-command="fontSize" href="javascript:;" unselectable="on">متوسط</a></li>
                                            <li><a data-wysihtml5-command-value="large" data-wysihtml5-command="fontSize" href="javascript:;" unselectable="on">كبير</a></li>
                                            <li><a data-wysihtml5-command-value="xlarge" data-wysihtml5-command="fontSize" href="javascript:;" unselectable="on">كبير جداً</a></li>
                                        </ul>
                                    </div>

                                    <div class="btn-group dropup">
                                        <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button">
                                            <img src="images/font-color-icon.png" style="width: 15px;" />
                                        </button>
                                        <ul id="colorsMenu" role="menu" class="dropdown-menu">
                                            <li class="itemColor"><a data-wysihtml5-command-value="black" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #000;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Burntorange" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #993300;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Darkolive" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #333300;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Darkgreen" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #003300;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Darkazure" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #003366;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="NavyBlue" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #000080;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Indigo" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #333399;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Verydarkgray" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #333333;" class="colorDiv"></div>
                                            </a></li>

                                            <li class="itemColor"><a data-wysihtml5-command-value="Orange" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #FF6600;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Olive" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #808000;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Green" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #008000;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Teal" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #008080;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Blue" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #0000FF;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Grayishblue" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #666699;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Gray" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #808080;" class="colorDiv"></div>
                                            </a></li>

                                            <li class="itemColor"><a data-wysihtml5-command-value="Amber" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #FF9900;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Yellowgreen" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #99CC00;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Seagreen" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #339966;" class="colorDiv"></div>
                                            </a></li>


                                            <li class="itemColor"><a data-wysihtml5-command-value="Turquoise" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #33CCCC;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Royalblue" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #3366FF;" class="colorDiv"></div>
                                            </a></li>

                                            <li class="itemColor"><a data-wysihtml5-command-value="Purple" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #800080;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Mediumgray" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #999999;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Gold" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #FFCC00;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Yellow" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #FFFF00;" class="colorDiv"></div>
                                            </a></li>

                                            <li class="itemColor"><a data-wysihtml5-command-value="Lime" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #00FF00;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Aqua" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #00FFFF;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Skyblue" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #00CCFF;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Brown" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #993366;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Silver" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #C0C0C0;" class="colorDiv"></div>
                                            </a></li>

                                            <li class="itemColor"><a data-wysihtml5-command-value="Pink" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #FF99CC;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Peach" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #FFCC99;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Lightyellow" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #FFFF99;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Palegreen" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #CCFFCC;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Palecyan" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #CCFFFF;" class="colorDiv"></div>
                                            </a></li>

                                            <li class="itemColor"><a data-wysihtml5-command-value="Lightskyblue" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #99CCFF;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="Plum" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #CC99FF;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="White" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #FFFFFF;" class="colorDiv"></div>
                                            </a></li>
                                        </ul>
                                    </div>

                                    <div class="btn-group dropup">
                                        <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button">
                                            <img src="images/Emotes-icon.png" style="width: 15px;" />
                                        </button>
                                        <ul style="width: 300px !important" role="menu" class="dropdown-menu ">
                                            <li>
                                                <ul data-height="120px" class="SScroll" id="smilesMenu" style="overflow: hidden; width: auto; height: 120px;">
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (1).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (1).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (2).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (2).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (3).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (3).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (4).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (4).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (5).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (5).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (6).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (6).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (7).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (7).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (8).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (8).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (9).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (9).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (10).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (10).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (11).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (11).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (12).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (12).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (13).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (13).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (14).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (14).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (15).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (15).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (16).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (16).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (17).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (17).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (18).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (18).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (19).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (19).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (20).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (20).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (21).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (21).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (22).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (22).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (23).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (23).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (24).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (24).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (25).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (25).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (26).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (26).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (27).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (27).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (28).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (28).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (29).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (29).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (30).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (30).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (31).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (31).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (32).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (32).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (33).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (33).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (34).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (34).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (35).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (35).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (36).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (36).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (37).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (37).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (38).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (38).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (39).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (39).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (40).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (40).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (41).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (41).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (42).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (42).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (43).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (43).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (44).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (44).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (45).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (45).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (46).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (46).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (47).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (47).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (48).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (48).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (49).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (49).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (50).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (50).png"></a></li>

                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (51).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (51).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (52).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (52).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (53).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (53).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (54).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (54).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (55).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (55).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (56).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (56).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (57).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (57).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (58).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (58).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (59).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (59).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (60).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (60).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (61).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (61).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (62).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (62).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (63).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (63).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (64).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (64).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (65).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (65).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (66).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (66).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (67).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (67).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (68).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (68).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (69).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (69).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (70).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (70).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (71).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (71).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (72).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (72).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (73).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (73).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (74).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (74).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (75).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (75).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (76).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (76).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (77).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (77).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (78).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (78).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (79).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (79).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (80).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (80).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (81).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (81).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (82).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (82).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (83).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (83).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (84).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (84).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (85).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (85).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (86).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (86).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (87).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (87).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (88).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (88).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (89).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (89).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (90).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (90).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (91).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (91).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (92).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (92).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (93).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (93).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (94).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (94).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (95).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (95).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (96).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (96).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (97).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (97).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (98).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (98).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (99).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (99).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (100).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (100).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (101).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (101).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (102).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (102).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (103).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (103).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (104).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (104).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (105).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (105).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (106).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (106).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (107).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (107).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (108).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (108).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (109).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (109).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (110).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (110).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (111).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (111).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (112).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (112).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (113).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (113).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (114).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (114).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (115).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (115).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (116).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (116).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (117).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (117).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (118).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (118).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (119).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (119).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (120).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (120).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (121).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (121).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (122).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (122).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (123).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (123).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (124).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (124).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (125).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (125).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (126).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (126).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (127).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (127).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (128).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (128).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (129).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (129).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (130).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (130).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (131).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (131).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (132).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (132).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (133).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (133).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (134).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (134).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (135).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (135).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (136).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (136).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (137).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (137).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (138).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (138).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (139).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (139).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (140).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (140).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (141).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (141).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (142).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (142).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (143).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (143).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (144).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (144).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (145).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (145).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (146).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (146).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (147).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (147).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (148).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (148).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (149).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (149).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (150).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (150).png"></a></li>

                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (151).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (151).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (152).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (152).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (153).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (153).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (154).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (154).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (155).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (155).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (156).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (156).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (157).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (157).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (158).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (158).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (159).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (159).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (160).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (160).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (161).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (161).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (162).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (162).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (163).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (163).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (164).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (164).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (165).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (165).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (166).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (166).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (167).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (167).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (168).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (168).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (169).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (169).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (170).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (170).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (171).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (171).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (172).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (172).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (173).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (173).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (174).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (174).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (175).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (175).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (176).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (176).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (177).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (177).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (178).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (178).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (179).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (179).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (180).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (180).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (181).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (181).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (182).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (182).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (183).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (183).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (184).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (184).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (185).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (185).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (186).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (186).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (187).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (187).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (188).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (188).png"></a></li>
                                                    <li class="itemImage"><a data-wysihtml5-command-value="images/emotions/icon (189).png" data-wysihtml5-command="insertImage" href="javascript:;" unselectable="on">
                                                        <img src="images/emotions/icon (189).png"></a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                            <div class="pull-right" style="margin-right: 3px;">

                                <a data-placement="top" title="" class="btn btn-default roomMenuItem" data-binding="attr:{id:'gift_'+uniqueID()}" data-original-title="إرسال هدايا" data-bind="click:ShowSendGift">
                                    <img src="images/gift-icon.png" style="width: 15px;" /></a>
                                <!-- ko if: Type()=="Room" -->
                                <a data-placement="top" title="" class="btn btn-default roomMenuItem" data-binding="attr:{id:'invite_'+uniqueID()}" data-original-title="دعوة أصدقاء" data-bind="click:ShowInviteFriends">
                                    <img src="images/friends-icon.png" style="width: 15px;" /></a>
                                <!-- /ko -->
                                <a data-placement="top" title="" class="btn btn-default roomMenuItem" data-binding="attr:{id:'attach_'+uniqueID()}" data-original-title="تحميل ملفات" data-bind="click:ShowAttachFiles"><i class="icon-paper-clip" style="font-size: 17px;"></i></a>

                            </div>
                            <div class="pull-right btn-group" style="margin-right: 3px;" data-toggle="buttons-checkbox">                                
                                    <button class="btn btn-default" data-bind="attr:{id:'mute_'+uniqueID()}, click:$parent.MuteRoom.bind($data)" data-mute='false'>×<i class="icon-volume-off" style="font-size: 17px;"></i></button>                                
                            </div>

                            <div class="pull-left col-lg-3" style="direction: ltr; padding-left: 0px; width: 22%;">
                                <div class="pull-left col-lg-3" style="direction: ltr;"><i class="icon-volume-up" style="font-size: 17px;"></i></div>
                                <div class="pull-left col-lg-9" style="direction: ltr;">
                                    <input type="text" value="" data-bind="attr:{'data-slider-id':'uiListenVolume_'+uniqueID() + 'slider', id:'uiListenVolume_'+uniqueID()}" data-slider-value="5" data-slider-orientation="horizontal" data-slider-selection="after" data-slider-tooltip="hide" style="width: 70px;">
                                </div>
                                <div class="clear" style="height: 1px;"></div>
                                <div class="pull-left col-lg-3" style="direction: ltr;">
                                    <i class="icon-microphone" style="font-size: 17px;"></i>
                                </div>
                                <div class="pull-left col-lg-9" style="direction: ltr;">
                                    <input type="text" value="" data-bind="attr:{'data-slider-id':'uiMicVolume_'+uniqueID() + 'slider', id:'uiMicVolume_'+uniqueID()}" data-slider-value="5" data-slider-orientation="horizontal" data-slider-selection="after" data-slider-tooltip="hide" style="width: 70px;">
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ko if:Type()=="Room" && CurrentMemberSettings.IsAdmin()-->
        <div data-bind="attr:{id:'banModal_'+uniqueID()}" class="modal fade" role="modal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>
                        <i class="icon-4x" style="float: left; font-family: 'entypo'; margin-left: 10px;">-</i>
                        <h3 id="myModalLabel1">حجب عضو</h3>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal blockBox validationGroup">
                            <h4>حجب عضو</h4>
                            <div class="form-group" style="display: none">
                                <div class="col-sm-4 control-label pull-right">
                                    <label>إسم العضو</label>
                                </div>
                                <div class="col-sm-7 pull-right">
                                    <span id="banMemberName" data-bind="text:bannedMember.MemberName"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 control-label pull-right">
                                    <label>نوع الحجب</label>
                                </div>
                                <div class="col-sm-7 pull-right">
                                    <!-- ko foreach: BanningTypes -->
                                    <label>
                                        <input type="radio" name="banMember" data-bind="value:ID, checked:$parent.bannedType,checkedValue: ID" />
                                        <span data-bind="text:Name"></span>
                                    </label>
                                    <br />
                                    <!-- /ko -->
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-6 pull-left">
                                    <input type="button" id="btnBanMember" value="إعتمد" class="btn btn-warning" style="width: 100px;" data-bind="click:saveBanMember" />
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div data-bind="attr:{id:'controlPanelModal_'+uniqueID()}" class="modal fade" role="modal" aria-hidden="true">
            <div class="modal-dialog" style="width: 865px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>
                        <i class="icon-4x icon-dashboard+" style="float: left; font-family: 'entypo'; margin-left: 10px;">-</i>
                        <h3 id="myModalLabel1">لوحة تحكم المشرف</h3>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal blockBox validationGroup">
                            <h4>لوحة تحكم المشرف</h4>

                            <div class="">
                                <!-- ko foreach: BanningTypes -->
                                <div style="float: right; width: 190px; background-color: #EEEEEE; padding: 10px; margin-left: 10px;">
                                    الأشخاص الممنوعين <span data-bind="text:Name"></span>
                                    <br>
                                    <select style="width: 100%; height: 100px;" multiple="multiple" data-bind="foreach: $parent.BannedMembers,attr{id:'selectBanType_'+$parent.uniqueID()+'_'+ID()}">
                                        <!-- ko if: $parent.ID() == BanType() -->
                                        <option data-bind="text:MemberName,value:MemberID"></option>
                                        <!-- /ko -->
                                    </select>

                                    <br>
                                    <a class="style2" href="" data-bind="{click:$parent.removeSelectedBannedType.bind($data,'selectBanType_'+$parent.uniqueID()+'_'+ID())}">حذف الجميع</a>
                                    <a class="style2" href="" data-bind="{click:$parent.removeSelectedBannedType.bind($data,'selectBanType_'+$parent.uniqueID()+'_'+ID()+' :selected')}">حذف شخص</a>
                                </div>
                                <!-- /ko -->
                                <div class="clearfix"></div>
                                <h4>إضافة عضو للقوائم</h4>
                                <label class="mini">إسم العضو</label>
                                <select style="display: none;" data-bind="options: NotBannedMembers, optionsText: 'MemberName',value: bannedMember"></select>
                                <input type="text" data-bind="value:BanMemberName,attr{id:'txtBanMemberName_'+uniqueID()}" style="width: 120px;" maxlength="20" />
                                <!-- ko foreach: BanningTypes -->
                                <label style="min-width: 120px !important;">
                                    <input type="radio" name="banMember" data-bind="value:ID, checked:$parent.bannedType,checkedValue: ID" />
                                    <span data-bind="text:Name"></span>
                                </label>
                                <!-- /ko -->
                                <input type="button" id="btnBanNewMember" value="إعتمد" class="btn btn-warning" style="width: 100px;" data-bind="click:banMemberByName" />
                                <div class="clearfix"></div>
                                <h4>توبيك الغرفة</h4>
                                <input type="text" data-bind="value:RoomTopic" style="width: 400px" size="140" placeholder="140 حرف">
                                <input type="button" id="btnSaveRoomTopic" value="إعتمد" class="btn btn-warning" style="width: 100px;" data-bind="click:saveRoomTopic" />
                                <div class="clearfix"></div>
                                <h4>شبكات التواصل</h4>
                                <lablel class="col-lg-2 pull-right">فيسبوك</lablel>
                                <input type="text" data-bind="value:fbURL" style="width: 400px"/>
                                <div class="clearfix"></div>
                                <lablel class="col-lg-2 pull-right">تويتر</lablel>
                                <input type="text" data-bind="value:tURL" style="width: 400px"/>
                                <div class="clearfix"></div>
                                <lablel class="col-lg-2 pull-right">يوتيوب</lablel>
                                <input type="text" data-bind="value:utURL" style="width: 400px"/>
                                <input type="button" id="btnupdateSocialLinks" value="إعتمد" class="btn btn-warning" style="width: 100px;" data-bind="click:updateSocialLinks" />
                                <br />
                                <br />
                                <input type="button" id="btnCloseRoom" value="إغلاق الغرفة" class="btn btn-warning" style="width: 100px;" data-bind="click:closeRoom" />
                                
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- /ko -->

        <div data-bind="attr:{id:'inviteModal_'+uniqueID()}" class="modal fade" role="modal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>
                        <i class="icon-4x" style="float: left; font-family: 'entypo'; margin-left: 10px;">-</i>
                        <h3 id="myModalLabel1">دعوة أصدقاء</h3>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal blockBox validationGroup">

                            <div class="form-group">
                                <div class="col-sm-4 control-label pull-right">
                                    <label>إرسال دعوة إلى </label>
                                </div>
                                <div class="col-sm-7 pull-right">
                                    <input type="text" data-bind="attr:{id:'invite_'+uniqueID()}" class="form-control " />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-6 pull-left">
                                    <input type="button" id="btnInviteFriend" value="إرسال" class="btn btn-warning" style="width: 100px;" data-bind="click:Invitefriends" />
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div data-bind="attr:{id:'giftModal_'+uniqueID()}" class="modal fade" role="modal" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>
                        <i class="icon-4x" style="float: left; font-family: 'entypo'; margin-left: 10px;">-</i>
                        <h3 id="myModalLabel1">أرسل هدية</h3>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal blockBox validationGroup">

                            <div class="form-group">
                                <div class="col-sm-4 control-label pull-right">
                                    <label>إرسال هدية إلى </label>
                                </div>
                                <div class="col-sm-7 pull-right">
                                    <input type="text" data-bind="attr:{id:'gift_'+uniqueID()}" class="form-control " />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12 control-label pull-right">
                                    <ul class="gifts" data-bind="foreach:Gifts">
                                        <li>
                                            <input type="radio" name="gift" data-bind="attr:{id:'gift_' + giftid()},checkedValue: giftid" class="input_hidden" />
                                            <label data-bind="attr:{for:'gift_' + giftid()}, click:$parent.selectGift">
                                                <img data-bind="attr:{src:picPath}" />
                                                <br />
                                                <span class="giftname" data-bind="text:name"></span>
                                                <br />
                                                <span class="giftprice" data-bind="text:price"></span>
                                            </label>
                                        </li>
                                    </ul>
                                    <div class="clearfix" style="height: 10px;"></div>
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-6 pull-left">
                                    <input type="button" id="btnSendGift" value="إرسال" class="btn btn-warning" style="width: 100px;" data-bind="click:SendGift" />
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div data-bind="attr:{id:'attachModal_'+uniqueID()}" class="modal fade" role="modal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>
                        <i class="icon-4x" style="float: left; font-family: 'entypo'; margin-left: 10px;">-</i>
                        <h3 id="myModalLabel1">إرسال ملفات</h3>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal blockBox validationGroup">

                            <div class="form-group">
                                <div class="col-sm-4 control-label pull-right">
                                    <label>مقطع فيديو</label>
                                </div>
                                <div class="col-sm-7 pull-right">
                                    <input type="text" class="form-control" data-bind="attr:{id:'videoURL_' + uniqueID()}">
                                    <div class="clear" style="height: 5px;"></div>
                                    <a style="cursor: pointer;" class="btn btn-default" data-bind="click:sendvideo(ID(),$('#videoURL_' + uniqueID()).val() ,$('#uiHiddenFieldCurrentName').val(), $('#videoURL_' + uniqueID()))">إرسال</a>
                                </div>
                            </div>
                            <div style="height: 1px; background-color: #ccc; clear: both; width: 80%; margin: 5px auto;"></div>
                            <div class="form-group">
                                <div class="col-sm-4 control-label pull-right">
                                    أضف صورة
                                </div>
                                <div class="col-sm-7 pull-right">

                                    <div class="UploadDiv">
                                        <div data-bind="attr:{id:'UploadStatus_'+uniqueID()}">
                                        </div>
                                        <input type="button" class="UploadButton" data-bind="attr:{id:'UploadButton_'+uniqueID()}" value="إختر صورة">
                                        <input type="hidden" data-bind="attr:{id:'UploadFileName_'+uniqueID()}" />
                                        <div data-bind="attr:{id:'UploadedFile_'+uniqueID()}">
                                        </div>
                                        <div class="clear" style="height: 5px;"></div>
                                        <a style="cursor: pointer;" class="btn btn-default" data-bind="click:$parent.SendImage($data)">إرسال</a>
                                    </div>
                                </div>
                            </div>
                            <div style="height: 1px; background-color: #ccc; clear: both; width: 80%; margin: 5px auto;"></div>

                            <div class="form-group">
                                <div class="col-sm-4 control-label pull-right">
                                    سجل مقطع صوت
                                </div>
                                <div class="col-sm-7 pull-right">
                                    <object style="height: 138px;" data="testswf/recorder.swf" class="flashmovie" data-bind="attr:{id:'recorder_'+uniqueID(), name:'recorder_'+uniqueID()}" type="application/x-shockwave-flash">
                                        <param name="quality" value="high">
                                        <param value="always" name="allowScriptAccess">
                                        <param data-bind="attr:{value:'roomId='+ ID() +'&amp;userId='+ CurrentMemberSettings.MemberID()+'&amp;recordUrl=audioUploader.ashx'}" name="flashvars">
                                    </object>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </script>

</asp:Content>


