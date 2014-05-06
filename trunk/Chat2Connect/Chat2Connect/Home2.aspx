<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="Home2.aspx.cs" Inherits="Chat2Connect.Home2" %>

<%@ Register Src="usercontrols/ucRooms.ascx" TagName="ucRooms" TagPrefix="uc1" %>
<%@ Register Src="usercontrols/ucFriends.ascx" TagName="ucFriends" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                <li class="pull-right"><a style="display:block;height:28px;" data-toggle="tab" data-bind="attr: { href: '#' + Type() + '_' + ID() }, click: $parent.changeCurrent.bind($data, $data.Type() + '_' + $data.ID())">
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
                <div class="col-lg-12" style="padding:5px;">
                    <div >
                        <div class="pull-right ">
                            <i class="icon-2x modernicon iconmodern-mainlist"></i>
                            <span id="uiLabelRoomName" data-bind="text:Name"></span>
                        </div>
                        <div class="pull-left">
                            <div class="form-group">
                                <!-- ko if: Type()=="Room" -->
                                <div id="admin-menu" class="btn-group">
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
                                            <a style="cursor: pointer;" href="#"><i class=" icon-dashboard"></i>&nbsp;لوحة تحكم المشرف </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="btn-group">
                                    <button style="position: relative;" data-toggle="dropdown" class="btn btn-main dropdown-toggle" type="button">
                                        إعدادت  <span class="caret"></span>
                                    </button>
                                    <ul role="menu" class="dropdown-menu">
                                        <li><a href="#"><i class="icon-time"></i>&nbsp;طابع زمنى&nbsp;</a></li>
                                        <li><a href="#"><i class="icon-reply"></i>&nbsp;تنبيه عند دخول أشخاص&nbsp;</a></li>
                                        <li><a href="#"><i class="icon-share-alt"></i>&nbsp;تنبيه عند خروح أشخاص&nbsp;</a></li>
                                        <li><a href="#"><i class="icon-eye-open"></i>&nbsp;تنبيه عند فتح كمراء&nbsp;</a></li>
                                        <li><a href="#"><i class="icon-eye-close"></i>&nbsp;تنبيه عند قفل كمراء&nbsp;</a></li>
                                        <li><a href="#"><i class="icon-microphone"></i>&nbsp;تنبيه عند أخذ المكرفون&nbsp;</a></li>
                                        <li><a href="#"><i class="icon-microphone-off"></i>&nbsp;تنبيه عند ترك المكروفن&nbsp;</a></li>
                                        <li><a href="#"><i class="icon-save"></i>&nbsp;حفظ الإعدادات&nbsp;</a></li>
                                        <li><a href="#"><i class=" icon-remove"></i>&nbsp;حذف </a></li>
                                        <li><a href="#"><i class="icon-power-off"></i>&nbsp;خروج&nbsp;</a></li>
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
                <div style="height: 1px;" class="clear"></div>
                <div style="padding: 5px; border-bottom: 1px solid #FEC200;padding-top:0px;" class="col-lg-12">
                    <div style="padding: 5px;" class="pull-right col-lg-3">
                        <label><span id="Label1">مدير الغرفة:</span></label>
                        <span id="uiLabelAdmin" data-bind="text:AdminName"></span>
                        <div style="height: 1px;" class="clearfix"></div>
                        <label><span id="Label2">كاميرات:</span></label>
                        <span id="Label4" data-bind="text:OpenCams"></span>
                        <div style="height: 1px;" class="clearfix"></div>
                        <label><span id="Label3">متواجدين:</span></label>
                        <span id="uiLabelMemberCount" data-bind="text:MemberCount"></span>
                        <div style="height: 10px;" class="clearfix"></div>
                        <!-- ko if: !CurrentMemberSettings.IsFav() -->
                        <a style="cursor: pointer;" data-bind="attr:{onclick:'addtoFav('+ID()+');',id:'favlink_'+uniqueID()}"><i style="color: #FEC200;" class="icon-star"></i>أضف إلى المفضلة</a>
                        <!-- /ko -->
                        <div style="height: 10px;" class="clearfix"></div>
                        <div>
                            <a target="_blank" id="uiHyperLinkFb">
                                <img src="images/facebook.png"></a>
                            &nbsp;&nbsp;
                    <a target="_blank" id="uiHyperLinktwitter">
                        <img src="images/twitter.png"></a>
                            &nbsp;&nbsp;
                    <a target="_blank" id="uiHyperLinkyt">
                        <img src="images/youtube.png"></a>
                        </div>
                        <div class="clearfix" style="height: 10px;"></div>
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
                    <div style="padding: 2px;" class="pull-left col-lg-9">
                        
                        <object style="width:100%;" data="testswf/chat2connect.swf" class="flashmovie" name="chat2connect" data-bind="attr:{id:'chat2connect_'+uniqueID()}" type="application/x-shockwave-flash">
                            <param value="always" name="allowScriptAccess">
                            <param data-bind="attr:{value:'roomId='+uniqueID()+'&amp;userId='+CurrentMemberSettings.MemberID()+'&amp;allowedCams='+Settings.CamCount()+'&amp;conn=<%= System.Configuration.ConfigurationManager.AppSettings["amsCoonection"]%>    '}" name="flashvars">
                        </object>
                       
                    </div>
                </div>
                <!-- /ko -->
                 <!-- ko if: Type()=="Private" -->
                <div style="padding: 5px; border-bottom: 1px solid #FEC200;padding-top:0px;" class="col-lg-12">
                <div style="padding: 2px;" class="pull-left col-lg-12">
                        
                        <object style="width:100%;" data="testswf/chat2connect.swf" class="flashmovie" name="chat2connect" data-bind="attr:{id:'chat2connect_'+uniqueID()}" type="application/x-shockwave-flash">
                            <param value="always" name="allowScriptAccess">
                            <param data-bind="attr:{value:'roomId='+uniqueID()+ '_' + CurrentMemberSettings.MemberID() +'&amp;userId='+CurrentMemberSettings.MemberID()+'&amp;allowedCams=2&amp;conn=<%= System.Configuration.ConfigurationManager.AppSettings["amsCoonection"]%>    '}" name="flashvars">
                        </object>
                       
                    </div>
                    </div>
                
                <!-- /ko -->
                <div style="height: 5px;" class="clearfix"></div>
                <div style="padding: 5px;" class="col-lg-12">
                    <!-- ko if: Type()=="Room" -->
                    <div style="padding: 5px; margin-top: 2px;" class="col-lg-3 pull-right">                        
                            <div id="roomMembersDiv" data-height="400px" class="SScroll" style="overflow: hidden; width: auto; height: 400px;">
                                <div id="MicDiv">
                                    <div class="friend-link rm Altodd" data-bind="with:MicMember">
                                        <a data-bind="text:MemberName,css:'jslink type_'+MemberTypeID()"></a>
                                        <div class="pull-left controls">
                                            <a data-bind="attr:{'data-related':$parent.ID()+'$'+MemberID()}" class="camera" href="#">
                                                <img style="width: 16px;" src="images/video_camera.png"></a>
                                            <img src="images/hand.png" style="width: 16px; " class="hand" /><img src="images/microphone_1.png" style="width: 16px;display:block;" class="mic" /><i class="icon-ban-circle mark"></i>
                                        </div>
                                        <div class="clearfix" style="height: 1px;"></div>

                                        <ul class="popup-menu profileMenu g-dark g-dark-list">
                                            <li><a class="jslink" data-bind="click:$root.openWindow.bind($data,$data.MemberID(),$data.MemberName(),'Private')"><span class="awesome">&#xf0e6;</span> محادثة خاصة</a></li>
                                            <li><a class="jslink"><span class="awesome">&#xf030;</span> عرض الكاميرا</a></li>
                                            <li><a class="jslink" data-bind="attr:{href:'userprofile.aspx?uid='+MemberID()}" target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a></li>
                                            <li><a class="jslink"><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a></li>
                                            <li><a class="jslink"><span class="awesome">&#xf06b;</span> أرسل هدية</a></li>
                                            <li><a data-bind="attr:{href:'Messages.aspx?t=createmsg&u='+MemberID()+'&un='+MemberName()}" target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a></li>
                                            <li><a class="jslink"><span class="awesome">&#xf10b;</span> أرسل SMS</a></li>
                                            <li><a class="jslink"><span class="awesome">&#xf093;</span> أرسل ملف</a></li>
                                            <li><a class="jslink"><span class="awesome">&#xf05e;</span> حجب</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div id="queueDiv">
                                    <!-- ko foreach: QueueMembers-->
                                    <div class="friend-link rm" data-bind="attr:{id:'m_'+MemberID()}, css:{Altodd:$index()%2,Alteven:!$index()%2}">
                                        <a data-bind="text:MemberName,css:'jslink type_'+MemberTypeID()"></a>
                                        <div class="pull-left controls">
                                            <a data-bind="attr:{'data-related':$parent.ID()+'$'+MemberID()}" class="camera" href="#">
                                                <img style="width: 16px;" src="images/video_camera.png"></a>
                                            <img src="images/hand.png" style="width: 16px;display:block;" class="hand" /><img src="images/microphone_1.png" style="width: 16px;" class="mic" /><i class="icon-ban-circle mark"></i>
                                        </div>
                                        <div class="clearfix" style="height: 1px;"></div>
                                        <ul class="popup-menu profileMenu g-dark g-dark-list">
                                            <li><a class="jslink"><span class="awesome" data-bind="click:$root.openWindow.bind($data,$data.MemberID(),$data.MemberName(),'Private')">&#xf0e6;</span> محادثة خاصة</a></li>
                                            <li><a class="jslink"><span class="awesome">&#xf030;</span> عرض الكاميرا</a></li>
                                            <li><a class="jslink" data-bind="attr:{href:'userprofile.aspx?uid='+MemberID()}" target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a></li>
                                            <li><a class="jslink"><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a></li>
                                            <li><a class="jslink"><span class="awesome">&#xf06b;</span> أرسل هدية</a></li>
                                            <li><a data-bind="attr:{href:'Messages.aspx?t=createmsg&u='+MemberID()+'&un='+MemberName()}" target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a></li>
                                            <li><a class="jslink"><span class="awesome">&#xf10b;</span> أرسل SMS</a></li>
                                            <li><a class="jslink"><span class="awesome">&#xf093;</span> أرسل ملف</a></li>
                                            <li><a class="jslink"><span class="awesome">&#xf05e;</span> حجب</a></li>
                                        </ul>
                                    </div>
                                    <!-- /ko -->
                                </div>
                                <div id="regular">
                                    <!-- ko foreach: RoomMembers-->
                                    <div class="friend-link rm" data-bind="css:{Altodd:$index()%2,Alteven:!$index()%2}">
                                        <a data-bind="text:MemberName,css:'jslink type_'+MemberTypeID()"></a>
                                        <div class="pull-left controls">
                                            <a data-bind="attr:{'data-related':$parent.ID()+'$'+MemberID()}" class="camera" href="#">
                                                <img style="width: 16px;" src="images/video_camera.png"></a>
                                            <img src="images/hand.png" style="width: 16px;" class="hand" /><img src="images/microphone_1.png" style="width: 16px;" class="mic" /><i class="icon-ban-circle mark"></i>
                                        </div>
                                        <div class="clearfix" style="height: 1px;"></div>

                                        <ul class="popup-menu profileMenu g-dark g-dark-list">
                                            <li><a class="jslink" data-bind="click:$root.openWindow.bind($data,$data.MemberID(),$data.MemberName(),'Private')"><span class="awesome">&#xf0e6;</span> محادثة خاصة</a></li>
                                            <li><a class="jslink"><span class="awesome">&#xf030;</span> عرض الكاميرا</a></li>
                                            <li><a class="jslink" data-bind="attr:{href:'userprofile.aspx?uid='+MemberID()}" target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a></li>
                                            <li><a class="jslink"><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a></li>
                                            <li><a class="jslink"><span class="awesome">&#xf06b;</span> أرسل هدية</a></li>
                                            <li><a data-bind="attr:{href:'Messages.aspx?t=createmsg&u='+MemberID()+'&un='+MemberName()}" target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a></li>
                                            <li><a class="jslink"><span class="awesome">&#xf10b;</span> أرسل SMS</a></li>
                                            <li><a class="jslink"><span class="awesome">&#xf093;</span> أرسل ملف</a></li>
                                            <li><a class="jslink"><span class="awesome">&#xf05e;</span> حجب</a></li>
                                        </ul>
                                    </div>
                                    <!-- /ko -->
                                </div>
                            </div>                        
                    </div>
                    <!-- /ko -->
                    
                    <div id="roomTextDiv" class='pull-left ' data-bind="css:{ 'col-lg-9' :Type()=='Room', 'col-lg-12': Type() == 'Private'}, style:{padding: '5px', 'border-right': Type() == 'Room'? '2px solid #FEC200' :'0px'}">
                        
                        <div data-height="400px;" style="width:100%;background-color:#D9D9D9;min-height:400px;padding:5px;direction:rtl;" class="MsgHistroy" data-bind="html:MessageHistory"></div>
                        
                        <div style="height: 5px;" class="clearfix"></div>
                        <a style="width: 8%; height: 70px; padding-top: 25px;" class="btn btn-main" data-bind="click:$parent.sendMessage,attr:{id:'a_Send_'+uniqueID()}">إرسال</a>
                        <textarea data-bind="value:Message, valueUpdate: 'afterkeydown', event: { keypress: $parent.keyboardCmd}, attr:{id:'uiTextMsg_'+uniqueID()}"  type='text' style='width:91.5%;background-color:#D9D9D9;height:70px;border:0px;' ></textarea>
                        
                        <div style="height: 20px;" class="clearfix"></div>

                        <div class="col-lg-12">
                            <div class="pull-right">
                                <a data-placement="top" title="" class="btn btn-default roomMenuItem" data-bind="click:$parent.requestMic,attr:{id:'requestMic_'+uniqueID()}" data-original-title="طلب/إلغاء مايك">
                                    <img style="width: 14px;" src="images/hand.png">
                                </a>
                                <a data-placement="top" title="" class="btn btn-default roomMenuItem" data-bind="click:$parent.mic,attr:{id:'Mic_'+uniqueID()}" data-original-title="تحدث">
                                    <i class="icon-microphone"></i>
                                </a>
                                <a data-placement="top" title="" class="btn btn-default roomMenuItem" data-bind="click:$parent.cam,attr:{id:'Cam_'+uniqueID()}" data-original-title="تشغيل/ إيقاف الكاميرا">
                                    <i class="icon-camera"></i>
                                </a>
                            </div>
                            <div class="pull-right">
                                <div data-bind="attr:{id: 'toolbar'+uniqueID()}">
                                    <div data-toggle="buttons" class="btn-group">

                                        <button title="CTRL+B" data-wysihtml5-command="bold" class="btn btn-default" href="javascript:;" unselectable="on"><span class="icon-bold"></span></button>

                                        <button title="CTRL+I" data-wysihtml5-command="italic" class="btn btn-default" href="javascript:;" unselectable="on"><span class="icon-italic"></span></button>

                                    </div>

                                    <div class="btn-group">
                                        <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button">
                                            <span class="icon-text-height"></span>
                                        </button>
                                        <ul role="menu" class="dropdown-menu">
                                            <li><a data-wysihtml5-command-value="xsmall" data-wysihtml5-command="fontSize" href="javascript:;" unselectable="on">صغير جداً</a></li>
                                            <li><a data-wysihtml5-command-value="small" data-wysihtml5-command="fontSize" href="javascript:;" unselectable="on">صغير</a></li>
                                            <li><a data-wysihtml5-command-value="medium" data-wysihtml5-command="fontSize" href="javascript:;" unselectable="on">متوسط</a></li>
                                            <li><a data-wysihtml5-command-value="large" data-wysihtml5-command="fontSize" href="javascript:;" unselectable="on">كبير</a></li>
                                            <li><a data-wysihtml5-command-value="xlarge" data-wysihtml5-command="fontSize" href="javascript:;" unselectable="on">كبير جداً</a></li>
                                        </ul>
                                    </div>

                                    <div class="btn-group">
                                        <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button">
                                            <span class="icon-dashboard"></span>
                                        </button>
                                        <ul id="colorsMenu" role="menu" class="dropdown-menu">

                                            <li class="itemColor"><a data-wysihtml5-command-value="yellow" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #fff200;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="green" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #0f0;" class="colorDiv"></div>
                                            </a></li>
                                            <li class="itemColor"><a data-wysihtml5-command-value="blue" data-wysihtml5-command="foreColor" href="javascript:;" unselectable="on">
                                                <div style="background-color: #00f;" class="colorDiv"></div>
                                            </a></li>
                                        </ul>
                                    </div>

                                    <div class="btn-group">
                                        <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button">
                                            <span class="icon-smile"></span>
                                        </button>
                                        <ul style="width: 300px !important" role="menu" class="dropdown-menu ">
                                            <li>
                                                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 120px;">
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
                                                    <div class="slimScrollBar" style="background: none repeat scroll 0% 0% rgb(254, 196, 1); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; left: 1px;"></div>
                                                    <div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: none repeat scroll 0% 0% rgb(199, 197, 192); opacity: 0.2; z-index: 90; left: 1px;"></div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                            <div class="pull-right">
                                <a data-placement="top" title="" class="btn btn-default roomMenuItem" data-binding="attr:{id:'gift_'+uniqueID()}" data-original-title="إرسال هدايا"><i class="icon-gift"></i></a><a data-placement="top" title="" class="btn btn-default roomMenuItem" data-binding="attr:{id:'invite_'+uniqueID()}" data-original-title="دعوة أصدقاء"><i class="icon-group"></i></a>
                                <div style="display: inline-block; position: relative;" data-placement="top" title="" class="roomMenuItem" data-original-title="تحميل ملفات">
                                    <button onclick="animateMenu($(this));" id="attachbtn" data-toggle="dropdown" class="btn btn-default dropdown-toggle btn-group" type="button"><i class="icon-paper-clip"></i></button>
                                    <ul role="menu" class="dropdown-menu" style="display: none;" id="myul">
                                        <li><a onclick="$(this).next('#mydiv').toggle();" id="yt_12">مقطع فيديو</a><div style="display: none;" id="mydiv">
                                            <input type="text" class="form-control"><a style="cursor: pointer;" class="btn btn-default" data-binding="attr:{onclick:'sendvideo('+ID()+',$(this).prev(&quot;input&quot;).val() ,$(&quot;#uiHiddenFieldCurrentName&quot;).val(), $(this).prev(&quot;input&quot;)); return false;'}">إرسال</a>
                                        </div>
                                        </li>
                                        <li>
                                            <div class="UploadDiv">
                                                <div data-binding="attr:{id:'UploadStatus_'+uniqueID()}">
                                                </div>
                                                <input type="button" class="UploadButton" data-binding="attr:{id:'UploadButton_'+uniqueID()}">
                                                <div data-binding="attr:{id:'UploadedFile_'+uniqueID()}">
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

    </script>
    
</asp:Content>

