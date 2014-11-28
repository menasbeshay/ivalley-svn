<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Chat2Connect.home" %>

<%@ Register Src="usercontrols/ucRooms.ascx" TagName="ucRooms" TagPrefix="uc1" %>
<%@ Register Src="usercontrols/Friends.ascx" TagPrefix="uc1" TagName="Friends" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        label {
            font-weight: normal;
        }

        .draggable {
            position: absolute;
            border: #5f9482 solid 1px !important;
            width: 250px;
            z-index: 99999;
        }

            .draggable .header {
                cursor: move;
                background-color: #d7e5e4;
                border-bottom: #5f9482 solid 1px;
                color: #1e4638;
                background-image: none;
                min-height: 20px;
                padding: 10px;
                z-index: 99999;
            }

            .draggable .selText {
                color: black;
                padding: 4px;
            }

            .draggable .messageArea {
                width: 250px;
                overflow-y: scroll;
                height: 100px;
                border-bottom: #5f9482 solid 1px;
                padding: 10px;
                z-index: 99999;
            }

        .hamsa {
            /*bottom:0px;*/
        }

        .hamsaModal {
            width: 400px;
        }

        .list-group-item {
            display: list-item;
        }

        .botMsg ol {
            margin: 0px;
        }

        .botMsg li {
            display: list-item;
            font-size: 90%;
        }

        .type_0 {
            color: #f00;
        }
    </style>
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
                scrollRooms();
                $('#accordion').find('.catLink').removeClass('selected');
                $('#accordion').find('.subcatLink').removeClass('selected');
                $(this).addClass('selected');
                
            });
            $(".subcatLink").click(function () {
                $("#roomsDiv").load("getRooms2.aspx",
                    { data_related: "" + $(this).attr("data-related") + "" },
                    function (content) {
                        $(this).hide().fadeIn("slow");
                        return false;
                    });
                scrollRooms();
                $('#accordion').find('.catLink').removeClass('selected');
                $('#accordion').find('.subcatLink').removeClass('selected');
                $(this).addClass('selected');
            });

            $("#SearchRooms").click(function () {
                $("#roomsDiv").load("getRooms2.aspx",
                    { data_related: "" + "s=1&st=" + $('#<%= uiTextBoxRoomSearch.ClientID %>').val()  + "" },
                    function (content) {
                        $(this).hide().fadeIn("slow");
                        return false;
                    });
                scrollRooms();
            });

            $('#<%= uiTextBoxRoomSearch.ClientID %>').keyup(function(event){
                if(event.keyCode == 13){
                    $("#SearchRooms").click();
                }
            });

            <%--$("#<%= uiTextBoxFriendSearch.ClientID %>").autocomplete({
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
            });--%>

           

        });

    </script>
    <script src="Scripts/moment.min.js"></script>
    <script src="Scripts/knockout-3.1.0.js"></script>
    <script src="js/jquery.tokeninput.js"></script>
    <link href="css/token-input-facebook.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="blockBoxshadow pull-right col-lg-2 margin20 " style="width: 21% !important; position: fixed;">
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

        <uc1:Friends runat="server" ID="Friends" />
    </div>
    <div id="MainTabs" class="pull-right" style="width: 76%; margin-right: 23%;">
        <div style="padding: 5px; padding-right: 0px; margin-left: 10px; padding-right: 20px;" class="col-lg-12" id="homeNav">
            <ul class="nav nav-tabs">
                <li class="pull-right active"><a href="#home" data-toggle="tab" data-bind="click: changeCurrent.bind('home')">الرئيسية</a></li>
                <!-- ko foreach: windows -->
                <li class="pull-right"><a style="display: block; height: 28px;" data-toggle="tab" data-bind="attr: { href: '#' + uniqueID() }, click: $parent.changeCurrent.bind($data, $data.uniqueID(), $data.ID(), $data.Type())">
                    <span data-bind="text: Name,css:'type_'+Settings.TypeID()" class="pull-right"></span>
                    <button type="button" class="close" data-bind="click: $parent.removeWindow">×</button></a></li>
                <!-- /ko -->
            </ul>
        </div>
        <div style="height: 1px;" class="clear"></div>

        <div class="blockBoxshadow pull-right col-lg-12 margin20" style="margin-top: 2px;">
            <div class="tab-content">
                <div class="tab-pane fade in active" id="home">
                    <div style="border-bottom: 1px solid #FEC200">
                        <div class="pull-right ">
                            <i class="icon-2x modernicon iconmodern-mainlist"></i>
                            القائمة الرئيسية
                        </div>
                        <div class="pull-left col-lg-4" style="padding-left: 0px;">

                            <div class="form-group">
                                <asp:TextBox ID="uiTextBoxRoomSearch" runat="server" placeholder="ابحث عن غرفة" Style="padding: 5px; padding-top: 7px;" CssClass="col-lg-11 pull-right"></asp:TextBox>
                                <a href="#" class="col-lg-1" style="font-size: 20px; text-decoration: none; padding-left: 0px; padding-right: 5px; padding-top: 5px;" id="SearchRooms"><i class="icon icon-search"></i></a>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>

                    <div class="col-lg-3 pull-right" style="padding: 5px; border-left: 2px solid #FEC200; margin-top: 2px;">
                        <uc1:ucRooms ID="ucRooms1" runat="server" />
                    </div>
                    <div class="col-lg-9 pull-left " style="padding: 5px;">
                        <div class="SScroll" data-height="500px" id="roomsDiv">
                        </div>
                    </div>
                </div>
                <!-- ko template: { name: function(win){if(win.Type()=='loading'){return 'loadingRoomTemplate';} else {return 'chatTemplate';}}, foreach: windows} -->
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
                            <div class="col-sm-3 control-label pull-right">
                                <label>بحث</label>
                            </div>
                            <div class="col-sm-6 pull-right">
                                <asp:TextBox ID="uiTextBoxFriendSearch" runat="server" CssClass="form-control " data-bind="value:SearchText"></asp:TextBox>

                            </div>
                            <div class="col-sm-1 pull-right">
                                <a data-bind="click:SearchPeople()" class="btn btn-small btn-main">بحث</a>
                            </div>

                        </div>
                        <div class="form-group">
                            <div id="loadingAddFriends" class="col-lg-11" style="text-align: center; display: none; text-align: center; position: fixed; z-index: 2000; background: #fff; width: 100%; height: 100%; top: 0; left: 0; opacity: .7;">
                                <img src="images/addfriend_loadinf.gif" style="margin: 0 auto; padding-top: 20px;" />

                            </div>
                            <div id="errorAddFriends" class="col-lg-12" style="text-align: center; display: none; text-align: center;">
                                حدث خطأ من فضلك أعد المحاولة
                            </div>
                            <div id="noFriendsAddFriends" class="col-lg-12" style="text-align: center; display: none; text-align: center;">
                                لا يوجد                          

                            </div>
                            <ul class="findFriends SScroll" data-height="400px">
                                <!-- ko foreach:People -->
                                <li>
                                    <div style="width: 27%; float: left; margin-right: 3px;">
                                        <img style="width: 50px;" data-bind="attr:{src:ProfileImg}" />
                                    </div>
                                    <div style="width: 70%; float: left; text-align: left;">
                                        <span data-bind="text:MemberName"></span>
                                        <div class="clear" style="height: 2px;"></div>
                                        <!--ko if: !IsFriend() -->
                                        <a href="#" data-bind="click:$parent.AddNewFriend.bind($data,$data.MemberID())" class="btn btn-main smallbtn">أضف صديق</a>
                                        <!-- /ko -->

                                        &nbsp;<span style="font-family: Arial !important;" data-bind="text:FriendsCount"></span>
                                        &nbsp;<i class="icon icon-group"></i>


                                    </div>
                                    <div class="clear" style="height: 2px;"></div>
                                </li>

                                <!-- /ko -->
                            </ul>
                            <div class="clear" style="height: 2px;"></div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal" style="text-decoration: none;">إغلاق</a>
                    <asp:LinkButton CssClass="btn btn-warning" runat="server" ID="uiLinkButtonAddFriend" Style="text-decoration: none; display: none;" OnClick="uiLinkButtonAddFriend_Click">حفظ</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>

    <asp:HiddenField ID="uiHiddenFieldFriendID" runat="server" />
    <asp:HiddenField ID="uiHiddenFieldCurrent" runat="server" />
    <asp:HiddenField ID="uiHiddenFieldProfilePic" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="uiHiddenFieldCurrentName" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="uiHiddenFieldMaxNoOfRooms" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="uiHiddenFieldOpenedRooms" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="uiHiddenFieldMaxCams" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="uiHiddenFieldOpenedCams" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="uiHiddenFieldCreditPoints" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="uiHiddenFieldMemberType" ClientIDMode="Static" runat="server" />

    <script src="Scripts/knockout.mapping-latest.js"></script>
    <script src="js/chatwindows.js"></script>
    <script>
        $(document).ready(function () {
            emailOwnerBotID=<%= (int)Helper.Enums.Bot.EmailOwner%>;
            inviteFriendBanBotID=<%= (int)Helper.Enums.Bot.InviteFriendsBan%>;
            roomFriendsBotID=<%= (int)Helper.Enums.Bot.RoomFriends%>;
            roomLawBotID=<%= (int)Helper.Enums.Bot.RoomLaw%>;
            roomProgramBotID=<%= (int)Helper.Enums.Bot.RoomProgram%>;

            var currentMemberID=eval($("#<%=uiHiddenFieldCurrent.ClientID %>").val());
            var currentMemberName=$("#<%=uiHiddenFieldCurrentName.ClientID %>").val();
            var maxRooms=eval($("#<%=uiHiddenFieldMaxNoOfRooms.ClientID %>").val());
            var profilePic=$("#<%=uiHiddenFieldProfilePic.ClientID %>").val();
            var membertype=$("#<%=uiHiddenFieldMemberType.ClientID %>").val();
            var openedRooms=eval(<%=OpenedRooms %>);
            InitChat(maxRooms,currentMemberID,currentMemberName,openedRooms,profilePic, membertype);            
            
        });
    </script>
    <script id="chatMsgTemplate" type="text/html">
        <div class="clear" style="height: 2px;"></div>
        <div class="row">
            <div class="imgholder col-lg-1 pull-left">
                <img data-bind="attr:{'src': (FromProfileImg != '') ? FromProfileImg : 'images/defaultavatar.png' }" class="thumbnail" style="max-width: 40px; margin-bottom: 0px; max-height: 40px;" />
            </div>
            <div class="callout border-callout col-lg-11 pull-left" data-bind="css:FromID == $parent.CurrentMemberID() ? 'msgFromMe' : ''">
                <b class="border-notch notch" data-bind="css:FromID == $parent.CurrentMemberID() ? 'msgFromMe' : ''"></b>
                <b class="notch" data-bind="css:FromID == $parent.CurrentMemberID() ? 'msgFromMe' : ''"></b>
                <div class='pull-left msgHolder' style='width: auto; margin-right: 5px; font-size: 12px; font-family: tahoma;'>
                    <b data-bind="if:FromName">:</b>
                    <b data-bind="text:FromName, css:'type_' + MemberTypeID"></b>
                </div>
                <div class='pull-left msgHolder msgbody' data-bind="html:Message">
                </div>
                <div class="pull-right MessageTime" data-bind="visible:$parent.CurrentMember().ShowMessageTime">
                    <%--<span data-bind="date:MessageDate, format:' D-M-YYYY '" class="pull-left" style="margin-right: 2px;"></span>--%>
                    <span data-bind="date:MessageDate, format:' A '" class="pull-right" style="margin-left: 2px;"></span>
                    <span data-bind="date:MessageDate, format:'H:m '" class="pull-right"></span>
                </div>
                <!-- ko if:MemberLevel -->
                <div class="pull-right" data-bind="css:MemberLevel == 2 ? 'adminrole_reviewer' : 'adminrole' , visible:MemberLevel != 1">
                    <!-- ko if: MemberLevel == 4 -->
                    المالك
                <!-- /ko -->
                    <!-- ko if: MemberLevel == 3 -->
                    مدير
                <!-- /ko -->
                    <!-- ko if: MemberLevel == 2 -->
                    مراقب
                <!-- /ko -->
                </div>
                <!-- /ko -->
            </div>
        </div>
    </script>
    <script id="adminMemberTemplate" type="text/html">
        <div class="friend-link rm roomMemberlink" data-bind="attr:{id:'m_'+MemberID()}, css:'Alteven'">
            <a data-bind="text:MemberName()+(MemberLevelID() > 1 ?' @ ':''),css:'memberlink pull-left jslink type_'+MemberTypeID()"></a>
            <div class="clear" style="height: 1px;"></div>
        </div>
    </script>
    <script id="memberTemplate" type="text/html">
        <div class="friend-link rm roomMemberlink" data-bind="attr:{id:'m_'+MemberID()}, css:'Alteven'">
            <div class="pull-left controls">
                <div class="cameraHolder">

                    <!-- ko if: IsCamOpened()-->
                    <!-- ko if: IsCamViewed()-->
                    <i class="icon-circle" style="color: #f00; font-size: 8px; float: left;"></i>
                    <!-- /ko -->
                    <a class="camera" style="display: block; margin-left: 5px;">
                        <img style="width: 20px;" src="images/video_camera.png"></a>
                    <!-- /ko -->
                </div>
                <div class="MicHandHolder">
                    <!-- ko if: QueueOrder()-->
                    <img src="images/hand.png" style="width: 16px; display: block;" class="hand" />
                    <!-- /ko -->
                    <!-- ko if: IsMicOpened()-->
                    <img src="images/microphone_1.png" style="width: 16px; display: block;" class="mic" />
                    <!-- /ko -->
                </div>
                <div class="MarkHolder">
                    <!-- ko if: IsMarked()-->
                    <i class="icon-ban-circle" style="color: #f00;"></i>
                    <!-- /ko -->
                </div>
            </div>
            <a data-bind="text:MemberName()+(MemberLevelID() > 1 ?' @ ':''),css:'memberlink pull-left jslink type_'+MemberTypeID()"></a>
            <div class="GiftHolder">
                <!-- ko if: HasGift() -->
                <img src="images/gift-icon.png" style="width: 15px;" />
                <!-- /ko -->
            </div>
            <div class="clear" style="height: 1px;"></div>
            <!-- ko if: MemberID()!=$root.CurrentMemberID && !$root.isBlockingMe(MemberID())-->
            <div class="clear" style="height: 1px;"></div>
            <div class="friendSubMenu">
                <div class="popup-menu profileMenu">
                    <div class="col-lg-3 pull-right">
                        <div class=" thumbnail">
                            <img data-bind="attr:{'src':ProfileImg}" style="max-height: 70px;" />
                        </div>
                        <div class="clearfix" style="height: 1px;">
                        </div>
                        <div style="text-align: right;">
                            <span data-bind="text:$data.MemberName()"></span>
                        </div>
                    </div>
                    <div class="col-lg-9 pull-right" style="padding: 0 5px;">
                        <div class="col-lg-6 pull-right" style="padding: 0 5px;">
                            <ul>
                                <li><a class="jslink" data-bind="click:$root.openWindow.bind($data,$data.MemberID(),$data.MemberName(),'Private', false, false, 1, $data.IsFriend(),false,$data.MemberTypeID(), true,$data.ProfileImg)"><span class="awesome">&#xf0e6;</span> محادثة خاصة</a></li>
                                <!-- ko if: IsCamOpened()-->
                                <li><a class="jslink" data-bind="click:$parent.startCam.bind($parent,$data.MemberID())"><span class="awesome">&#xf030;</span> عرض الكاميرا</a></li>
                                <!-- /ko -->
                                <li><a class="jslink" data-bind="click:OpenPopup.bind($data,'../userprofile.aspx?uid='+MemberID(),'حساب صديق')" target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a></li>
                                <li><a class="jslink" data-bind="click:$parent.toggleFriend.bind($data,$parent,$data)"><span class="awesome">&#xf00d;</span> <span data-bind="    text:IsFriend()?' حذف من ':'إضافة إلى'"></span>الأصدقاء</a></li>
                                <li><a class="jslink" data-bind="click:$parent.showSendHamsa.bind($data,$data)"><span class="awesome">&#xf0a4;</span> إرسال همسة</a></li>
                            </ul>
                        </div>
                        <div class="col-lg-6 pull-right" style="padding: 0 5px;">
                            <ul>
                                <li><a class="jslink MemberSendGift" data-bind="attr:{'data-mid':MemberID()}"><span class="awesome">&#xf06b;</span> أرسل هدية</a></li>
                                <li><a data-bind="click:OpenPopup.bind($data,'../popuppages/Messages_popup.aspx?t=createmsg&u='+MemberID()+'&un='+MemberName(),'الرسائل')" style="cursor: pointer;"><span class="awesome">&#xf003;</span> أرسل رسالة</a></li>
                                <li><a class="jslink" data-bind="click:$parent.toggleMark.bind($data,$parent,$data)"><span class="awesome">&#xf00d;</span> <span data-bind="    text:IsMarked() ?' إلغاء الإسكات ':'إسكات'"></span></a></li>
                                <!-- ko if:$parent.CurrentMember().MemberLevelID() > MemberLevelID()-->
                                <li><a class="jslink" data-bind="click:$parent.banMember.bind($data,$data.MemberID())"><span class="awesome">&#xf05e;</span> حجب</a></li>
                                <li><a class="jslink" data-bind="click:$parent.showRoomMemberLevelsPopup.bind($data,$data.MemberID())"><span class="awesome">&#xf085;</span> تعديل الصلاحيات</a></li>
                                <!-- /ko -->
                            </ul>
                        </div>

                    </div>
                    <div class="clear" style="height: 1px;"></div>
                </div>
            </div>
            <!-- /ko -->
        </div>
    </script>
    <script id="editorToolbarTemplate" type="text/html">
        <div data-toggle="buttons" class="btn-group">

            <button title="CTRL+B" data-wysihtml5-command="bold" class="btn btn-default" href="javascript:;" unselectable="on" data-bind="click:toggleBold,attr:{id:'btnBold_'+uniqueID()}"><span class="icon-bold" style="font-size: 17px;"></span></button>
        </div>
        <div data-toggle="buttons" class="btn-group">
            <button title="CTRL+I" data-wysihtml5-command="italic" class="btn btn-default" href="javascript:;" unselectable="on" data-bind="click:toggleItalic,attr:{id:'btnItalic_'+uniqueID()}"><span class="icon-italic" style="font-size: 17px;"></span></button>
        </div>
        <div class="btn-group dropup">
            <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button">
                <img src="images/font-color-icon.png" style="width: 15px;" />
            </button>
            <ul id="colorsMenu" role="menu" class="dropdown-menu" style="width: 280px !important">

                <li class="itemColor"><a data-wysihtml5-command-value="IndianRed" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'IndianRed')" style="color: IndianRed;" href="javascript:;" unselectable="on">
                    <div style="background-color: IndianRed;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="LightCoral" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'LightCoral')" style="color: LightCoral;" href="javascript:;" unselectable="on">
                    <div style="background-color: LightCoral;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Salmon" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Salmon')" style="color: Salmon;" href="javascript:;" unselectable="on">
                    <div style="background-color: Salmon;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="DarkSalmon" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'DarkSalmon')" style="color: DarkSalmon;" href="javascript:;" unselectable="on">
                    <div style="background-color: DarkSalmon;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="LightSalmon" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'LightSalmon')" style="color: LightSalmon;" href="javascript:;" unselectable="on">
                    <div style="background-color: LightSalmon;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Crimson" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Crimson')" style="color: Crimson;" href="javascript:;" unselectable="on">
                    <div style="background-color: Crimson;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Red" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Red')" style="color: Red;" href="javascript:;" unselectable="on">
                    <div style="background-color: Red;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="FireBrick" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'FireBrick')" style="color: FireBrick;" href="javascript:;" unselectable="on">
                    <div style="background-color: FireBrick;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="DarkRed" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'DarkRed')" style="color: DarkRed;" href="javascript:;" unselectable="on">
                    <div style="background-color: DarkRed;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="HotPink" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'HotPink')" style="color: HotPink;" href="javascript:;" unselectable="on">
                    <div style="background-color: HotPink;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="DeepPink" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'DeepPink')" style="color: DeepPink;" href="javascript:;" unselectable="on">
                    <div style="background-color: DeepPink;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="MediumVioletRed" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'MediumVioletRed')" style="color: MediumVioletRed;" href="javascript:;" unselectable="on">
                    <div style="background-color: MediumVioletRed;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="PaleVioletRed" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'PaleVioletRed')" style="color: PaleVioletRed;" href="javascript:;" unselectable="on">
                    <div style="background-color: PaleVioletRed;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="LightSalmon" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'LightSalmon')" style="color: LightSalmon;" href="javascript:;" unselectable="on">
                    <div style="background-color: LightSalmon;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Coral" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Coral')" style="color: Coral;" href="javascript:;" unselectable="on">
                    <div style="background-color: Coral;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Tomato" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Tomato')" style="color: Tomato;" href="javascript:;" unselectable="on">
                    <div style="background-color: Tomato;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="OrangeRed" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'OrangeRed')" style="color: OrangeRed;" href="javascript:;" unselectable="on">
                    <div style="background-color: OrangeRed;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="DarkOrange" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'DarkOrange')" style="color: DarkOrange;" href="javascript:;" unselectable="on">
                    <div style="background-color: DarkOrange;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Orange" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Orange')" style="color: Orange;" href="javascript:;" unselectable="on">
                    <div style="background-color: Orange;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Yellow" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Yellow')" style="color: Yellow;" href="javascript:;" unselectable="on">
                    <div style="background-color: Yellow;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="DarkKhaki" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'DarkKhaki')" style="color: DarkKhaki;" href="javascript:;" unselectable="on">
                    <div style="background-color: DarkKhaki;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Orchid" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Orchid')" style="color: Orchid;" href="javascript:;" unselectable="on">
                    <div style="background-color: Orchid;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Fuchsia" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Fuchsia')" style="color: Fuchsia;" href="javascript:;" unselectable="on">
                    <div style="background-color: Fuchsia;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Magenta" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Magenta')" style="color: Magenta;" href="javascript:;" unselectable="on">
                    <div style="background-color: Magenta;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="MediumOrchid" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'MediumOrchid')" style="color: MediumOrchid;" href="javascript:;" unselectable="on">
                    <div style="background-color: MediumOrchid;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="MediumPurple" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'MediumPurple')" style="color: MediumPurple;" href="javascript:;" unselectable="on">
                    <div style="background-color: MediumPurple;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="BlueViolet" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'BlueViolet')" style="color: BlueViolet;" href="javascript:;" unselectable="on">
                    <div style="background-color: BlueViolet;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="DarkViolet" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'DarkViolet')" style="color: DarkViolet;" href="javascript:;" unselectable="on">
                    <div style="background-color: DarkViolet;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="DarkOrchid" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'DarkOrchid')" style="color: DarkOrchid;" href="javascript:;" unselectable="on">
                    <div style="background-color: DarkOrchid;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="DarkMagenta" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'DarkMagenta')" style="color: DarkMagenta;" href="javascript:;" unselectable="on">
                    <div style="background-color: DarkMagenta;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Purple" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Purple')" style="color: Purple;" href="javascript:;" unselectable="on">
                    <div style="background-color: Purple;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Indigo" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Indigo')" style="color: Indigo;" href="javascript:;" unselectable="on">
                    <div style="background-color: Indigo;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="SlateBlue" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'SlateBlue')" style="color: SlateBlue;" href="javascript:;" unselectable="on">
                    <div style="background-color: SlateBlue;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="DarkSlateBlue" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'DarkSlateBlue')" style="color: DarkSlateBlue;" href="javascript:;" unselectable="on">
                    <div style="background-color: DarkSlateBlue;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="MediumSlateBlue" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'MediumSlateBlue')" style="color: MediumSlateBlue;" href="javascript:;" unselectable="on">
                    <div style="background-color: MediumSlateBlue;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="GreenYellow" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'GreenYellow')" style="color: GreenYellow;" href="javascript:;" unselectable="on">
                    <div style="background-color: GreenYellow;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Chartreuse" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Chartreuse')" style="color: Chartreuse;" href="javascript:;" unselectable="on">
                    <div style="background-color: Chartreuse;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="MediumSeaGreen" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'MediumSeaGreen')" style="color: MediumSeaGreen;" href="javascript:;" unselectable="on">
                    <div style="background-color: MediumSeaGreen;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="SeaGreen" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'SeaGreen')" style="color: SeaGreen;" href="javascript:;" unselectable="on">
                    <div style="background-color: SeaGreen;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="ForestGreen" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'ForestGreen')" style="color: ForestGreen;" href="javascript:;" unselectable="on">
                    <div style="background-color: ForestGreen;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Green" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Green')" style="color: Green;" href="javascript:;" unselectable="on">
                    <div style="background-color: Green;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="DarkGreen" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'DarkGreen')" style="color: DarkGreen;" href="javascript:;" unselectable="on">
                    <div style="background-color: DarkGreen;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="OliveDrab" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'OliveDrab')" style="color: OliveDrab;" href="javascript:;" unselectable="on">
                    <div style="background-color: OliveDrab;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Olive" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Olive')" style="color: Olive;" href="javascript:;" unselectable="on">
                    <div style="background-color: Olive;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="DarkOliveGreen" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'DarkOliveGreen')" style="color: DarkOliveGreen;" href="javascript:;" unselectable="on">
                    <div style="background-color: DarkOliveGreen;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="LightSeaGreen" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'LightSeaGreen')" style="color: LightSeaGreen;" href="javascript:;" unselectable="on">
                    <div style="background-color: LightSeaGreen;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="DarkCyan" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'DarkCyan')" style="color: DarkCyan;" href="javascript:;" unselectable="on">
                    <div style="background-color: DarkCyan;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Teal" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Teal')" style="color: Teal;" href="javascript:;" unselectable="on">
                    <div style="background-color: Teal;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Cyan" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Cyan')" style="color: Cyan;" href="javascript:;" unselectable="on">
                    <div style="background-color: Cyan;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="LightCyan" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'LightCyan')" style="color: LightCyan;" href="javascript:;" unselectable="on">
                    <div style="background-color: LightCyan;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="CadetBlue" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'CadetBlue')" style="color: CadetBlue;" href="javascript:;" unselectable="on">
                    <div style="background-color: CadetBlue;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="SteelBlue" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'SteelBlue')" style="color: SteelBlue;" href="javascript:;" unselectable="on">
                    <div style="background-color: SteelBlue;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="DodgerBlue" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'DodgerBlue')" style="color: DodgerBlue;" href="javascript:;" unselectable="on">
                    <div style="background-color: DodgerBlue;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="CornflowerBlue" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'CornflowerBlue')" style="color: CornflowerBlue;" href="javascript:;" unselectable="on">
                    <div style="background-color: CornflowerBlue;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="MediumSlateBlue" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'MediumSlateBlue')" style="color: MediumSlateBlue;" href="javascript:;" unselectable="on">
                    <div style="background-color: MediumSlateBlue;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="RoyalBlue" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'RoyalBlue')" style="color: RoyalBlue;" href="javascript:;" unselectable="on">
                    <div style="background-color: RoyalBlue;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Blue" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Blue')" style="color: Blue;" href="javascript:;" unselectable="on">
                    <div style="background-color: Blue;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="MediumBlue" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'MediumBlue')" style="color: MediumBlue;" href="javascript:;" unselectable="on">
                    <div style="background-color: MediumBlue;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="DarkBlue" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'DarkBlue')" style="color: DarkBlue;" href="javascript:;" unselectable="on">
                    <div style="background-color: DarkBlue;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Navy" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Navy')" style="color: Navy;" href="javascript:;" unselectable="on">
                    <div style="background-color: Navy;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="MidnightBlue" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'MidnightBlue')" style="color: MidnightBlue;" href="javascript:;" unselectable="on">
                    <div style="background-color: MidnightBlue;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="RosyBrown" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'RosyBrown')" style="color: RosyBrown;" href="javascript:;" unselectable="on">
                    <div style="background-color: RosyBrown;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="SandyBrown" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'SandyBrown')" style="color: SandyBrown;" href="javascript:;" unselectable="on">
                    <div style="background-color: SandyBrown;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Goldenrod" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Goldenrod')" style="color: Goldenrod;" href="javascript:;" unselectable="on">
                    <div style="background-color: Goldenrod;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="DarkGoldenrod" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'DarkGoldenrod')" style="color: DarkGoldenrod;" href="javascript:;" unselectable="on">
                    <div style="background-color: DarkGoldenrod;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Peru" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Peru')" style="color: Peru;" href="javascript:;" unselectable="on">
                    <div style="background-color: Peru;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Chocolate" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Chocolate')" style="color: Chocolate;" href="javascript:;" unselectable="on">
                    <div style="background-color: Chocolate;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="SaddleBrown" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'SaddleBrown')" style="color: SaddleBrown;" href="javascript:;" unselectable="on">
                    <div style="background-color: SaddleBrown;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Sienna" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Sienna')" style="color: Sienna;" href="javascript:;" unselectable="on">
                    <div style="background-color: Sienna;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Brown" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Brown')" style="color: Brown;" href="javascript:;" unselectable="on">
                    <div style="background-color: Brown;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Maroon" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Maroon')" style="color: Maroon;" href="javascript:;" unselectable="on">
                    <div style="background-color: Maroon;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="White" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'White')" style="color: White;" href="javascript:;" unselectable="on">
                    <div style="background-color: White;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Gray" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Gray')" style="color: Gray;" href="javascript:;" unselectable="on">
                    <div style="background-color: Gray;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="DimGray" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'DimGray')" style="color: DimGray;" href="javascript:;" unselectable="on">
                    <div style="background-color: DimGray;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="LightSlateGray" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'LightSlateGray')" style="color: LightSlateGray;" href="javascript:;" unselectable="on">
                    <div style="background-color: LightSlateGray;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="SlateGray" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'SlateGray')" style="color: SlateGray;" href="javascript:;" unselectable="on">
                    <div style="background-color: SlateGray;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="DarkSlateGray" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'DarkSlateGray')" style="color: DarkSlateGray;" href="javascript:;" unselectable="on">
                    <div style="background-color: DarkSlateGray;" class="colorDiv"></div>
                </a></li>
                <li class="itemColor"><a data-wysihtml5-command-value="Black" data-wysihtml5-command="foreColor" data-bind="click:setForeColor.bind($data,'Black')" style="color: Black;" href="javascript:;" unselectable="on">
                    <div style="background-color: Black;" class="colorDiv"></div>
                </a></li>
            </ul>
        </div>

        <div class="btn-group dropup emotionMenu">
            <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button">
                <img src="images/Emotes-icon.png" style="width: 15px;" />
            </button>
            <ul style="width: 300px !important" role="menu" class="dropdown-menu" data-bind="attr:{id: 'emotionMenu_' + ID()}">
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
    </script>
    <script id="roomMemberLevel" type="text/html">
        <div data-bind="attr:{id:'changeLevelModal_'+uniqueID()}" class="modal fade" role="modal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>
                        <i class="icon-4x" style="float: left; font-family: 'entypo'; margin-left: 10px;">-</i>
                        <h3>تغيير صلاحيات عضو</h3>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal blockBox validationGroup">
                            <h3>تغيير صلاحيات <span data-bind="text:SelectedMember().MemberName"></span></h3>

                            <div class="form-group">
                                <div class="col-sm-4 control-label pull-right">
                                    <label>الصلاحيات</label>
                                </div>
                                <div class="col-sm-7 pull-right">
                                    <!-- ko foreach: MemberLevels -->
                                    <label>
                                        <input type="radio" name="memberLevel" data-bind="value:ID, checked:$parent.SelectedMember().MemberLevelID,checkedValue: ID" />
                                        <span data-bind="text:Name"></span>
                                    </label>
                                    <br />
                                    <!-- /ko -->
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-6 pull-left">
                                    <input type="button" value="إعتمد" class="btn btn-warning" style="width: 100px;" data-bind="click:updateMemberLevel" />
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </script>
    <script id="hamsaModal" type="text/html">
        <div data-bind="attr:{id:'sendHamsaModal_'+uniqueID()}" class="modal fade" role="modal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content hamsaModal">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>
                        <i class="icon-4x" style="float: left; font-family: 'entypo'; margin-left: 10px;">-</i>
                        <h3>إرسال همسة</h3>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal blockBox validationGroup">
                            <h3>همسة إلى <span data-bind="text:SelectedMember().MemberName"></span></h3>

                            <div class="form-group">
                                <textarea name="txtHamsa" data-bind="value:HamsaText" class="form-control" maxlength="40"></textarea>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-6 pull-left">
                                    <input type="button" value="إرسال" class="btn btn-warning" style="width: 100px;" data-bind="click:sendHamsa" />
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </script>
    <script id="loadingRoomTemplate" type="text/html">
        <div data-bind="attr: { id: uniqueID() }" class="tab-pane fade loading" style="min-height:200px;">
        </div>
    </script>
    <script id="chatTemplate" type="text/html">
        <div data-bind="attr: { id: uniqueID() }" class="tab-pane fade" style="">
            <div id="roomContents">
                <div class="col-lg-12" style="padding: 5px;">
                    <div>
                        <div class="pull-right ">
                            <i class="icon-2x modernicon iconmodern-mainlist"></i>
                            <!-- ko if: Type()=="Room" -->
                            <a data-bind="click:showRoomInfo" style="font-weight: bold; text-decoration: none; cursor: pointer;">
                                <span data-bind="text:Name,css:'type_'+Settings.TypeID()"></span>
                            </a>
                            <!-- /ko -->
                            <!-- ko if: Type()!="Room" -->
                            <a style="font-weight: bold; text-decoration: none; cursor: pointer;">
                                <span data-bind="text:Name,css:'type_'+Settings.TypeID()"></span>
                            </a>
                            <!-- /ko -->
                        </div>
                        <!-- ko if: Type()=="Room" -->
                        <div class="pull-right " style="margin-right: 30px; height: 15px; padding: 8px; font-weight: bold;">
                            <span id="uiLabelRoomTopic" data-bind="text:RoomTopic"></span>
                        </div>
                        <!-- /ko -->
                        <div class="pull-left">
                            <div class="form-group">
                                <!-- ko if: Type()=="Room" -->

                                <div id="admin-menu" class="btn-group adminSettingsMenu" data-bind="if :CurrentMember().MemberLevelID() > 1">
                                    <button style="position: relative;" data-toggle="dropdown" class="btn btn-main dropdown-toggle" type="button">
                                        المشرف  <span class="caret"></span>
                                    </button>
                                    <ul role="menu" class="dropdown-menu RoomAdminMenu">
                                        <li>
                                            <a href="#" data-bind="click:clearQueue">&nbsp;إزالة الأيدى&nbsp;</a>
                                        </li>
                                        <li>
                                            <label>
                                                <input type="checkbox" data-bind="click:markAllWithWrite,checked:MarkAllWithWriteCheck">&nbsp;تنقيط الجميع ومسموح الكتابة&nbsp;
                                            </label>
                                        </li>
                                        <li>
                                            <label>
                                                <input type="checkbox" data-bind="click:markAllWithoutWrite,checked:MarkAllWithoutWriteCheck">&nbsp;تنقيط الجميع بدون كتابة&nbsp;
                                            </label>
                                        </li>
                                        <li>
                                            <label>
                                                <input type="checkbox" data-bind="click:updateRoomSetting.bind($data,'MarkOnLoginWithWrite'),checked:Settings.MarkOnLoginWithWrite">&nbsp;تنقيط عند الدخول ومسموح الكتابة&nbsp;
                                            </label>
                                        </li>
                                        <li>
                                            <label>
                                                <input type="checkbox" data-bind="click:updateRoomSetting.bind($data,'MarkOnLoginWithoutWrite'),checked:Settings.MarkOnLoginWithoutWrite">&nbsp;تنقيط عند الدخول وبدون كتابة&nbsp;
                                            </label>
                                        </li>
                                        <%--<li>
                                            <label>
                                                <input type="checkbox" data-bind="click:updateRoomSetting.bind($data,'EnableCam'),checked:Settings.EnableCam">&nbsp;مسموح الكمراء&nbsp;
                                            </label>
                                        </li>
                                        <li>
                                            <label>
                                                <input type="checkbox" data-bind="click:updateRoomSetting.bind($data,'EnableMic'),checked:Settings.EnableMic">&nbsp;مسموح المكرفون للجميع&nbsp;
                                            </label>
                                        </li>
                                        <li>
                                            <label>
                                                <input type="checkbox" data-bind="click:updateRoomSetting.bind($data,'EnableMicForAdminsOnly'),checked:Settings.EnableMicForAdminsOnly">&nbsp;مسموح المكرفون للأدمنية فقط&nbsp;
                                            </label>
                                        </li>--%>
                                        <li>
                                            <label>
                                                <a style="cursor: pointer;" data-bind="click:showRoomBots" href="#"><i class=" icon-dashboard"></i>&nbsp;البوتات </a>
                                            </label>
                                        </li>
                                        <li>
                                            <label>
                                                <a style="cursor: pointer;" data-bind="click:showControlPanel" href="#"><i class=" icon-dashboard"></i>&nbsp;لوحة تحكم المشرف </a>
                                            </label>
                                        </li>
                                    </ul>
                                </div>
                                <!-- /ko -->
                                <!-- ko if: Type()=="Private" -->

                                <div id="admin-menu" class="btn-group adminSettingsMenu">
                                    <button style="position: relative;" data-toggle="dropdown" class="btn btn-main dropdown-toggle" type="button">
                                        إجراءات  <span class="caret"></span>
                                    </button>
                                    <ul role="menu" class="dropdown-menu RoomAdminMenu">
                                        <li><a class="jslink" data-bind="attr:{'onclick':'OpenPopup(\'../userprofile.aspx?uid='+ID()+ '\',\'حساب صديق\');'}" target="_blank"><span class="awesome ">&#xf08e;</span> عرض البروفايل</a></li>
                                        <li><a class="jslink" data-bind="click:toggleFriend.bind($data,$data,$data.getMember(ID()))"><span data-bind="    css:$data.getMember(ID()).IsFriend() ? 'icon icon-remove' : 'icon icon-plus' "></span><span data-bind="    text:$data.getMember(ID()).IsFriend() ? ' حذف من ' : ' إضافة إلى' "></span>الأصدقاء</a></li>
                                        <li><a class="jslink MemberSendGift" data-bind="attr:{'data-mid':ID()}"><span class="awesome">&#xf06b;</span> أرسل هدية</a></li>
                                        <li><a class="jslink" data-bind="attr:{'onclick':'OpenPopup(\'../popuppages/Messages_popup.aspx?t=createmsg&u='+ID()+'&un='+Name()+ '\',\'الرسائل\');' }" target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a></li>
                                        <li><a data-bind="click:$parent.toggleBlockMember.bind($data,$data.ID(), !$parent.isBlocked($data.ID()))" style="cursor: pointer;"><i class="icon icon-ban-circle"></i><span data-bind="    text:$parent.isBlocked($data.ID()) ? 'إلغاء الحظر':'حظر'"></span></a></li>
                                    </ul>
                                </div>
                                <!-- /ko -->
                                <div class="btn-group adminSettingsMenu">
                                    <button style="position: relative;" data-toggle="dropdown" class="btn btn-main dropdown-toggle" type="button">
                                        إعدادت  <span class="caret"></span>
                                    </button>
                                    <ul role="menu" class="dropdown-menu">
                                        <li><a href="#"><i class="icon-time"></i>
                                            <label style="font-weight: normal;">
                                                <input type="checkbox" data-bind="click:updateSetting.bind($data,'ShowMessageTime'),checked:CurrentMember().ShowMessageTime" />&nbsp;طابع زمنى&nbsp;</label></a></li>
                                        <!-- ko if: Type()=="Room" -->
                                        <li><a href="#"><i class="icon-reply"></i>
                                            <label style="font-weight: normal;">
                                                <input type="checkbox" data-bind="click:updateSetting.bind($data,'NotifyOnFriendsLogOn'),checked:CurrentMember().NotifyOnFriendsLogOn" />&nbsp;تنبيه عند دخول أشخاص&nbsp;</label></a></li>
                                        <li><a href="#"><i class="icon-share-alt"></i>
                                            <label style="font-weight: normal;">
                                                <input type="checkbox" data-bind="click:updateSetting.bind($data,'NotifyOnFriendsLogOff'),checked:CurrentMember().NotifyOnFriendsLogOff" />&nbsp;تنبيه عند خروح أشخاص&nbsp;</label></a></li>
                                        <!-- /ko -->
                                        <li><a href="#"><i class="icon-eye-open"></i>
                                            <label style="font-weight: normal;">
                                                <input type="checkbox" data-bind="click:updateSetting.bind($data,'NotifyOnOpenCam'),checked:CurrentMember().NotifyOnOpenCam" />&nbsp;تنبيه عند فتح كمراء&nbsp;</label></a></li>
                                        <li><a href="#"><i class="icon-eye-close"></i>
                                            <label style="font-weight: normal;">
                                                <input type="checkbox" data-bind="click:updateSetting.bind($data,'NotifyOnCloseCam'),checked:CurrentMember().NotifyOnCloseCam" />&nbsp;تنبيه عند قفل كمراء&nbsp;</label></a></li>
                                        <li><a href="#"><i class="icon-microphone"></i>
                                            <label style="font-weight: normal;">
                                                <input type="checkbox" data-bind="click:updateSetting.bind($data,'NotifyOnMicOn'),checked:CurrentMember().NotifyOnMicOn" />&nbsp;تنبيه عند أخذ المكرفون&nbsp;</label></a></li>
                                        <li><a href="#"><i class="icon-microphone-off"></i>
                                            <label style="font-weight: normal;">
                                                <input type="checkbox" data-bind="click:updateSetting.bind($data,'NotifyOnMicOff'),checked:CurrentMember().NotifyOnMicOff" />&nbsp;تنبيه عند ترك المكرفون&nbsp;</label></a></li>
                                    </ul>

                                </div>

                                <a download="room.html" data-bind="attr:{id:'SaveConv_' + ID()}" class="btn btn-main" href="#">حفظ النقاش</a>
                                <a class="btn btn-main" href="#" data-bind="click: $parent.removeWindow">خروج</a>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>

                </div>

                <!-- ko if: Type()=="Room" && !IsTemp()-->
                <div class="col-lg-12">
                    <div style="padding: 5px;" class="pull-right col-lg-3">
                        <label><span id="Label1">مدير الغرفة</span></label>
                        <span id="uiLabelAdmin" data-bind="text:OwnerMember().MemberName"></span>
                    </div>
                    <div style="padding: 5px;" class="pull-right col-lg-3">
                        <label><span id="Label2">كاميرات</span></label>
                        <span id="Label4" data-bind="text:OpenedCams().length"></span>
                        &nbsp;&nbsp;
                        <label><span id="Label3">متواجدين</span></label>
                        <span id="uiLabelMemberCount" data-bind="text:ExistingMembers().length"></span>
                    </div>


                    <div style="padding: 5px;" class="pull-right col-lg-2">
                        <a style="cursor: pointer;" data-bind="attr:{id:'favlink_'+uniqueID()},click:ToggleFav.bind($data)"><i style="color: #FEC200;" class="icon-star"></i><span data-bind="    text:CurrentMember().IsFavorite() ? 'حذف من' : 'أضف إلى'"></span>المفضلة</a>
                    </div>

                    <div style="padding: 5px;" class="pull-right col-lg-2">
                        <div>
                            <a data-bind="attr:{href:fbURL}" target="_blank" id="uiHyperLinkFb">
                                <img src="images/facebook.png"></a>
                            &nbsp;&nbsp;
                    <a data-bind="attr:{href:tURL}" target="_blank" id="uiHyperLinktwitter">
                        <img src="images/twitter.png"></a>
                            &nbsp;&nbsp;
                    <a data-bind="attr:{href:utURL}" target="_blank" id="uiHyperLinkyt">
                        <img src="images/youtube.png"></a>
                        </div>
                    </div>
                    <div style="padding: 5px;" class="pull-right col-lg-2">
                        <span class="rating">
                            <input type="radio" class='rating-input' data-bind="click:$parent.rateRoom.bind($data,5), checked:CurrentMember().UserRate,checkedValue: 5,attr:{id:'rating-input-1-5_'+uniqueID()}" name="rating-input-1" />
                            <label data-bind="attr:{'for':'rating-input-1-5_'+uniqueID()}" class="rating-star fa icon-star"></label>
                            <input type="radio" class="rating-input" data-bind="click:$parent.rateRoom.bind($data,4), checked:CurrentMember().UserRate,checkedValue: 4,attr:{id:'rating-input-1-4_'+uniqueID()}" name="rating-input-1" />
                            <label data-bind="attr:{'for':'rating-input-1-4_'+uniqueID()}" class="rating-star fa icon-star"></label>
                            <input type="radio" class="rating-input" data-bind="click:$parent.rateRoom.bind($data,3), checked:CurrentMember().UserRate,checkedValue: 3,attr:{id:'rating-input-1-3_'+uniqueID()}" name="rating-input-1" />
                            <label data-bind="attr:{'for':'rating-input-1-3_'+uniqueID()}" class="rating-star fa icon-star"></label>
                            <input type="radio" class="rating-input" data-bind="click:$parent.rateRoom.bind($data,2), checked:CurrentMember().UserRate,checkedValue: 2,attr:{id:'rating-input-1-2_'+uniqueID()}" name="rating-input-1" />
                            <label data-bind="attr:{'for':'rating-input-1-2_'+uniqueID()}" class="rating-star fa icon-star"></label>
                            <input type="radio" class="rating-input" data-bind="click:$parent.rateRoom.bind($data,1), checked:CurrentMember().UserRate,checkedValue: 1,attr:{id:'rating-input-1-1_'+uniqueID()}" name="rating-input-1" />
                            <label data-bind="attr:{'for':'rating-input-1-1_'+uniqueID()}" class="rating-star fa icon-star"></label>
                        </span>
                        <input id="uiHiddenFieldUserRate" type="hidden" name="uiHiddenFieldUserRate" data-bind="value:CurrentMember().UserRate">
                    </div>
                </div>

                <div data-bind="visible:(Settings.EnableCam())">
                    <div style="height: 5px;" class="clear"></div>
                    <span class="col-lg-12" style="height: 16px; cursor: pointer; border-bottom: 1px solid #FEC200; color: #000;" data-bind="click:toggleFlashObj"><i class="icon-arrow-down" data-bind="    css:{ 'icon-arrow-up' :showFlashObject, 'icon-arrow-down': showFlashObject()==false}"></i>&nbsp;&nbsp;الكاميرات</span>
                    <div style="padding: 5px; border-bottom: 1px solid #FEC200; padding-top: 0px;" class="col-lg-12">

                        <div style="padding: 2px;" class="pull-left col-lg-12" data-bind="attr:{id: 'flashWrapper_' +uniqueID()}">

                            <object style="width: 100%; height: 180px;" data="testswf/chat2connect.swf" class="flashmovie" data-bind="attr:{id:'chat2connect_'+uniqueID(), name:'chat2connect_'+uniqueID()}, style:{height: showFlashObject() == true? '180px' : '0px'}" type="application/x-shockwave-flash">
                                <param name="quality" value="high">
                                <param value="always" name="allowScriptAccess">
                                <param name="wmode" value="opaque" />
                                <param data-bind="attr:{value:'roomId='+uniqueID()+'&amp;userId='+CurrentMember().MemberID()+'&amp;allowedCams='+Settings.CamCount()+'&amp;conn=<%= System.Configuration.ConfigurationManager.AppSettings["amsCoonection"]%>    '}" name="flashvars">
                            </object>

                        </div>
                    </div>
                </div>
                <!-- /ko -->
                <!-- ko if: Type()=="Room" && IsTemp()-->
                <div data-bind="visible:(Settings.EnableCam())">
                    <div style="height: 5px;" class="clear"></div>
                    <span class="col-lg-12" style="height: 16px; cursor: pointer; border-bottom: 1px solid #FEC200; color: #000;" data-bind="click:toggleFlashObj"><i class="icon-arrow-down" data-bind="    css:{ 'icon-arrow-up' :showFlashObject, 'icon-arrow-down': showFlashObject()==false}"></i>&nbsp;&nbsp;الكاميرات</span>
                    <div style="padding: 5px; border-bottom: 1px solid #FEC200; padding-top: 0px;" class="col-lg-12">

                        <div style="padding: 2px;" class="pull-left col-lg-12" data-bind="attr:{id: 'flashWrapper_' +uniqueID()}">

                            <object style="width: 100%; height: 180px;" data="testswf/chat2connect.swf" class="flashmovie" data-bind="attr:{id:'chat2connect_'+uniqueID(), name:'chat2connect_'+uniqueID()}, style:{height: showFlashObject() == true? '180px' : '0px'}" type="application/x-shockwave-flash">
                                <param name="quality" value="high">
                                <param value="always" name="allowScriptAccess">
                                <param name="wmode" value="opaque" />
                                <param data-bind="attr:{value:'roomId='+uniqueID()+'&amp;userId='+CurrentMember().MemberID()+'&amp;allowedCams='+Settings.CamCount()+'&amp;conn=<%= System.Configuration.ConfigurationManager.AppSettings["amsCoonection"]%>    '}" name="flashvars">
                            </object>

                        </div>
                    </div>
                </div>
                <!-- /ko -->
                <!-- ko if: Type()=="Private" && (!$data.hasOwnProperty('IsHelp') || !IsHelp())-->
                <span class="col-lg-12" style="height: 16px; cursor: pointer; border-bottom: 1px solid #FEC200; color: #000;" data-bind="click:toggleFlashObj"><i class="icon-arrow-down" data-bind="    css:{ 'icon-arrow-up' :showFlashObject, 'icon-arrow-down': showFlashObject()==false}"></i>&nbsp;&nbsp;الكاميرات</span>
                <div style="padding: 5px; border-bottom: 1px solid #FEC200; padding-top: 0px;" class="col-lg-12">

                    <div style="padding: 2px;" class="pull-left col-lg-12" data-bind="attr:{id: 'flashWrapper_' +uniqueID()}">

                        <object style="width: 100%; height: 180px;" data="testswf/chat2connect.swf" class="flashmovie" data-bind="attr:{id:'chat2connect_'+uniqueID(), name:'chat2connect_'+uniqueID()}, style:{height: showFlashObject() == true? '180px' : '0px'}" type="application/x-shockwave-flash">
                            <param name="quality" value="high">
                            <param value="always" name="allowScriptAccess">
                            <param name="wmode" value="opaque" />
                            <param data-bind="attr:{value:'roomId='+uniqueID()+ '&amp;userId='+$root.CurrentMemberID+'&amp;allowedCams=2&amp;conn=<%= System.Configuration.ConfigurationManager.AppSettings["amsCoonection"]%>    '}" name="flashvars">
                        </object>

                    </div>
                </div>
                <!-- /ko -->
                <div style="height: 5px;" class="clear"></div>
                <!-- ko -->
                <!-- ko if: Type()=="Room" -->
                <div class="clearfix bordered round center-block botholder col-lg-12" data-bind="style:{'display' : RoomBots.length == 0 ? 'none;' : 'block'}">
                    <!-- ko if: $root.ActivWindow() -->
                    <div class="col-lg-1 botIcon">
                        <img data-bind="attr:{'src' : 'images/bots/Room_'+ Settings.TypeID() +'.png','title':Settings.TypeID()==1?'غرفة مجانية':'غرفة ترقية' }">
                        <div class="botInfo">
                            <div style="direction: rtl; text-align: right; color: #fff; min-width: 160px;">
                                <span data-bind="text: 'بوت : ' + (Settings.TypeID()==1?'غرفة مجانية':'غرفة ترقية')"></span>
                                <div style="clear: both; height: 3px"></div>
                                <%--<span data-bind="text: 'الحالة : فعال'"></span>--%>
                            </div>
                        </div>
                    </div>
                    <!--/ko -->
                    <!-- ko foreach: RoomBots -->
                    <div data-bind="if:ID()>0,attr:{id:'b_'+ID()}" class="col-lg-1 botIcon">
                        <img data-bind="attr:{'src' : Bot.IconPath() + '_'+ $parent.Settings.TypeID() +'.png', 'alt': Bot.Title(), 'title' : Bot.Title() }">
                        <div class="botInfo">
                            <div style="direction: rtl; text-align: right; color: #fff; min-width: 160px;">
                                <span data-bind="text: 'بوت : ' + Bot.Title()"></span>
                                <div style="clear: both; height: 3px"></div>
                                <span data-bind="text: (IsEnabled() == true) ? 'الحالة : فعال' : 'الحالة : معطل'"></span>
                            </div>
                        </div>
                    </div>
                    <!--/ko -->
                </div>
                <!--/ko -->
                <!--/ko -->
                <div style="padding: 5px;" class="col-lg-12">
                    <!-- ko if: Type()=="Room" -->
                    <div style="padding: 5px; margin-top: 2px; position: relative;" class="col-lg-3 pull-right">
                        <div id="roomMembersDiv" data-bind="attr:{'data-height' : CurrentMember().MemberLevelID() > 1 ? '550px' : '510px'}, style:{height:CurrentMember().MemberLevelID() > 1 ? '550px' : '510px' }" class="SScroll" style="overflow-y: hidden; width: auto; overflow-x: visible; background-color: #D9D9D9;">
                            <div id="MicDiv">
                                <!-- ko template: { name: 'memberTemplate', foreach: MicMember } -->
                                <!-- /ko -->
                            </div>
                            <div id="queueDiv">
                                <!-- ko template: { name: 'memberTemplate', foreach: QueueMembers } -->
                                <!-- /ko -->
                            </div>
                            <div id="CamsDiv">
                                <!-- ko template: { name: 'memberTemplate', foreach: CamOnlyMembers } -->
                                <!-- /ko -->
                            </div>

                            <div id="regular">
                                <!-- ko template: { name: 'memberTemplate', foreach: RoomMembers } -->
                                <!-- /ko -->
                            </div>
                        </div>
                    </div>
                    <!-- /ko -->

                    <div id="roomTextDiv" class='pull-left ' data-bind="css:{ 'col-lg-9' :Type()=='Room', 'col-lg-12': Type() == 'Private'}, style:{padding: '5px', 'border-right': Type() == 'Room'? '2px solid #FEC200' :'0px'}">
                        <!-- ko if: Type()=="Room" && CurrentMember().MemberLevelID()>1 -->
                        <div>
                            <div data-bind="slideVisible:showAdminPart">
                                <div style="width: 20%; padding: 5px; padding-top: 0px; position: relative;" class="pull-left">
                                    <div id="roomAdminMembersDiv" data-height="140px" class="SScroll" style="overflow-y: hidden; width: auto; height: 140px; overflow-x: visible; background-color: #D9D9D9;">
                                        <div id="regular">
                                            <!-- ko template: { name: 'adminMemberTemplate', foreach: AdminMembers } -->
                                            <!-- /ko -->
                                        </div>
                                    </div>
                                </div>
                                <div data-height="100px" style="width: 80%; background-color: #D9D9D9; min-height: 100px; padding: 5px; direction: rtl;" class="AdminMsgHistroy" data-bind="template: { name: 'chatMsgTemplate', foreach: AdminMessageHistory },attr:{id:'MsgAdminHistroy_'+uniqueID()}"></div>

                                <div style="height: 5px;" class="clearfix"></div>

                                <a style="width: 8%; height: 35px; padding-top: 7px; float: right;" class="btn btn-main" data-bind="click:$parent.sendAdminMessage">إرسال</a>
                                <textarea data-bind="value:AdminMessage, attr:{id:'uiTextAdminMsg_'+uniqueID()}" type='text' style='width: 71.5%; background-color: #D9D9D9; height: 35px; border: 0px; float: right; margin-right: 3px;'></textarea>

                                <div style="height: 5px;" class="clearfix"></div>
                            </div>
                            <div class="col-lg-12" style="padding: 0px; padding-bottom: 5px; border-bottom: 1px solid #FEC200;">
                                <div class="pull-right">
                                    <!-- ko if: Type()=="Room" && hasRoomFriendsBot -->
                                    <a title="أصدقاء الغرفة" data-bind="click:showRoomFriendsBot" data-placement="top" class="btn btn-default" style="max-height: 35px; padding: 3px;">
                                        <img data-bind="attr:{src:'/images/bots/RoomFriends_'+Settings.TypeID()+'.png'}" width="30" height="30">
                                    </a>
                                    <!-- /ko -->
                                    <!-- ko if: Type()=="Room" && hasRoomProgramBot -->
                                    <a title="برامج الغرفة" data-bind="click:showRoomProgram" data-placement="top" class="btn btn-default" style="max-height: 35px; padding: 3px;">
                                        <img data-bind="attr:{src:'/images/bots/RoomProgram_'+Settings.TypeID()+'.png'}" width="30" height="30">
                                    </a>
                                    <!-- /ko -->
                                    <!-- ko if: Type()=="Room" && hasRoomLawBot -->
                                    <a title="قانون الغرفة" data-bind="click:showRoomLaw" data-placement="top" class="btn btn-default" style="max-height: 35px; padding: 3px;">
                                        <img data-bind="attr:{src:'/images/bots/RoomLaw_'+Settings.TypeID()+'.png'}" width="30" height="30">
                                    </a>
                                    <!-- /ko -->
                                </div>
                                <div class="pull-left" style="padding: 5px;">
                                    <a href="#" data-bind="click:toggleAdminPart" style="text-decoration: none;">
                                        <i class="icon-arrow-down" data-bind="click:toggleAdminPart, css:{ 'icon-arrow-up' :showAdminPart, 'icon-arrow-down': showAdminPart()==false},"></i>
                                        غرفة الإدارة
                                    </a>
                                </div>
                            </div>
                            <div style="height: 10px;" class="clear"></div>
                        </div>
                        <!-- /ko -->
                        <div style="width: 100%; background-color: #fff; padding: 5px; direction: rtl; border: 1px solid #ccc; border-radius: 5px; -moz-border-radius: 5px; -ms-border-radius: 5px; -webkit-border-radius: 5px;" class="MsgHistroy SScroll" data-bind="style:{minHeight:(showAdminPart()==true?'250px':'400px')},attr:{'data-height':(showAdminPart()==true?'250px':'400px'),id:'MsgHistroy_'+uniqueID()}">
                            <!-- ko if: Type()=="Room" -->
                            <%--<input type="button" class="pull-left btn btn-link" data-bind="click:showOlderMessages" value="عرض رسائل أقدم" />--%>
                            <!-- /ko -->
                            <!-- ko template: { name: 'chatMsgTemplate', foreach: MessageHistory }-->
                            <!-- /ko -->
                        </div>
                        <div style="height: 5px;" class="clearfix"></div>

                        <div data-bind="visible:!(Type()=='Private' || CurrentMember().CanWrite())" style="position: absolute; left: 0; width: 100%; height: 70px; z-index: 2; opacity: 0.4; filter: alpha(opacity = 50)"></div>
                        <a style="width: 8%; height: 35px; padding-top: 7px; float: right;" class="btn btn-main" data-bind="click:$parent.sendMessage,attr:{id:'a_Send_'+uniqueID()}">إرسال</a>
                        <textarea data-bind="value:Message, attr:{id:'uiTextMsg_'+uniqueID()}" type='text' style='width: 91.5%; background-color: #D9D9D9; height: 35px; border: 0px; float: left; line-height: normal;'></textarea>

                        <div style="height: 20px;" class="clear"></div>

                        <div class="col-lg-12" style="padding: 0px;">
                            <div class="pull-right">
                                <!-- ko if: Type()=="Room" -->
                                <a data-placement="top" title="" class="btn btn-default roomMenuItem" data-bind="visible:(Settings.EnableMic() ||  (Settings.EnableMicForAdminsOnly() && CurrentMember().MemberLevelID()>1) ), click:requestMic" data-original-title="طلب/إلغاء مايك">
                                    <img src="images/hand-icon.png" style="width: 15px;">
                                </a>
                                <!-- /ko -->
                                <!-- ko if:(!$data.hasOwnProperty('IsHelp') || !IsHelp()) -->
                                <a data-placement="top" title="" class="btn btn-default roomMenuItem" data-bind="visible:(Type()=='Private' || Settings.EnableMic() ||  (Settings.EnableMicForAdminsOnly() && CurrentMember().MemberLevelID()>1)), click:toggleMic" data-original-title="تحدث">
                                    <i class="icon-microphone" style="font-size: 17px;"></i>
                                </a>
                                <a data-placement="top" title="" class="btn btn-default roomMenuItem" data-bind="visible:(Type()=='Private' || Settings.EnableCam()), click:toggleCam" data-original-title="تشغيل/ إيقاف الكاميرا">
                                    <i class="icon-camera" style="font-size: 17px;"></i>
                                </a>
                                <!-- /ko -->
                            </div>
                            <div class="pull-right" style="margin-right: 3px;" data-bind="visible:(Type()=='Private' || CurrentMember().CanWrite())">
                                <div data-bind="template:{ name: 'editorToolbarTemplate'},attr:{id: 'toolbar'+uniqueID()}">
                                </div>
                            </div>
                            <div class="pull-right" style="margin-right: 3px;">
                                <!-- ko if:(!$data.hasOwnProperty('IsHelp') || !IsHelp()) -->
                                <a data-placement="top" title="" class="btn btn-default roomMenuItem" data-binding="attr:{id:'gift_'+uniqueID()}" data-original-title="إرسال هدايا" data-bind="click:ShowSendGift">
                                    <img src="images/gift-icon.png" style="width: 15px;" /></a>
                                <!-- /ko -->
                                <!-- ko if: Type()=="Room" && allowInviteFriends -->
                                <a data-placement="top" title="" class="btn btn-default roomMenuItem" data-binding="attr:{id:'invite_'+uniqueID()}" data-bind="click:ShowInviteFriends" data-original-title="دعوة أصدقاء">
                                    <img src="images/friends-icon.png" style="width: 15px;" /></a>
                                <!-- /ko -->
                                <!-- ko if: Type()=="Room" && hasEmailOwnerBot -->
                                <a title="بريد المالك" data-bind="click:showEmailOwnerBot" data-placement="top" class="btn btn-default roomMenuItem" style="padding: 5px; max-height: 35px;">
                                    <img data-bind="attr:{src:'/images/bots/EmailOwner_'+Settings.TypeID()+'.png'}" width="30" height="30">
                                </a>
                                <!-- /ko -->
                                <a data-placement="top" title="" class="btn btn-default roomMenuItem" data-binding="attr:{id:'attach_'+uniqueID()}" data-original-title="تحميل ملفات" data-bind="click:ShowAttachFiles"><i class="icon-paper-clip" style="font-size: 17px;"></i></a>

                            </div>
                            <!-- ko if:(!$data.hasOwnProperty('IsHelp') || !IsHelp()) -->
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
                            <!-- /ko -->


                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ko if:Type()=="Room" && CurrentMember().MemberLevelID() > 1 -->
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
                                    <!-- ko if: ($parent.CurrentMember().MemberLevelID() > 2 || $index()==4)  -->
                                    <a class="style2" href="" data-bind="{click:$parent.removeSelectedBannedType.bind($data,'selectBanType_'+$parent.uniqueID()+'_'+ID())}">حذف الجميع</a>
                                    <a class="style2" href="" data-bind="{click:$parent.removeSelectedBannedType.bind($data,'selectBanType_'+$parent.uniqueID()+'_'+ID()+' :selected')}">حذف شخص</a>
                                    <!-- /ko -->
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
                                <input type="text" data-bind="value:RoomTopic" maxlength="60" size="65" placeholder="60 حرف">
                                <input type="button" id="btnSaveRoomTopic" value="إعتمد" class="btn btn-warning" style="width: 100px;" data-bind="click:saveRoomTopic" />
                                <div class="clearfix"></div>
                                <h4>شبكات التواصل</h4>
                                <table>
                                    <tr>
                                        <td>
                                            <label class="col-lg-2 pull-right">فيسبوك</label>
                                        </td>
                                        <td>
                                            <input type="text" data-bind="value:fbURL" style="width: 400px" />
                                        </td>
                                        <td rowspan="3" style="vertical-align: bottom; padding-right: 5px;">
                                            <input type="button" id="btnupdateSocialLinks" value="إعتمد" class="btn btn-warning" style="width: 100px;" data-bind="click:updateSocialLinks" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="col-lg-2 pull-right">تويتر</label>
                                        </td>
                                        <td>
                                            <input type="text" data-bind="value:tURL" style="width: 400px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="col-lg-2 pull-right">يوتيوب</label>
                                        </td>
                                        <td>
                                            <input type="text" data-bind="value:utURL" style="width: 400px" />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <br />
                                <input type="button" id="btnCloseRoom" value="إغلاق الغرفة" class="btn btn-warning" style="width: 100px;" data-bind="click:closeRoom" />

                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div data-bind="template: { name: 'roomBotsModal'}"></div>
        <div data-bind="template: { name: 'roomMemberLevel'}"></div>
        <!-- /ko -->
        <!-- ko if:Type()=="Room" -->
        <div data-bind="template: { name: 'hamsaModal'}"></div>
        <div data-bind="template: { name: 'roomFriendsBotModal'}"></div>
        <div data-bind="template: { name: 'roomEmailOwnerBotModal'}"></div>
        <!-- /ko -->
        <!-- ko if:Type()=="Room" -->
        <div data-bind="attr:{id:'inviteModal_'+uniqueID()}" class="modal fade" role="modal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>
                        <i class="icon icon-group" style="float: left; margin-left: 10px;"></i>
                        <h3 id="myModalLabel1">دعوة أصدقاء</h3>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal validationGroup">

                            <div class="form-group">
                                <div class="col-sm-3 control-label pull-right">
                                    <label>إرسال دعوة إلى </label>
                                </div>
                                <div class="col-sm-8 pull-right bordered">
                                    <div style="padding-right: 15px;">
                                        <ul class="giftMembers">
                                            <li style="width: 100%; border-bottom: 1px solid;">
                                                <input type="checkbox" data-bind="click:$parent.selectAllOnlineFriendsToInvite, checked:$parent.AllOnlineFriendsSelected" /><span style="padding-right: 5px;">إختيار الكل</span></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-sm-12 SScroll" data-height="130px" style="width: 100% !important; float: right">
                                        <ul class="giftMembers" data-bind="foreach:$parent.OnlineFriends, attr:{id:'inviteMembers_' + uniqueID()}">
                                            <li>
                                                <input type="checkbox" class="invitecheckboxes" data-bind="attr:{value:id, 'data-member-name':name}, checked:IsSelected, click:$root.selectOnlineFriendToInvite" />
                                                <span data-bind="text:name"></span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-3 control-label pull-right"></div>
                                <div class=" col-sm-8 pull-right">
                                    <input type="button" id="btnInviteFriend" value="إرسال" class="btn btn-warning" style="width: 100px;" data-bind="click:Invitefriends" />
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- /ko -->
        <div data-bind="attr:{id:'giftModal_'+uniqueID()}" class="modal fade" role="modal" aria-hidden="true">
            <div class="modal-dialog modal-lg" style="width: 700px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>
                        <i class="icon icon-gift" style="float: left; margin-left: 10px;"></i>
                        <h3 id="myModalLabel1">أرسل هدية</h3>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal blockBox validationGroup">
                            <div class="form-group">
                                <h4>لديك
                                    <label data-bind="text:$parent.CreditPoints"></label>
                                    نقطة
                                    <input type="hidden" data-bind="attr:{id: 'points_' + uniqueID(), value:$parent.CreditPoints}" />
                                </h4>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2 control-label pull-right">
                                    <label>إرسال هدية إلى </label>
                                </div>
                                <div class="col-sm-9 pull-right bordered" style="padding: 3px;">
                                    <div class="col-sm-12 SScroll" data-height="130px" style="width: 100% !important; float: right">
                                        <ul class="giftMembers" data-bind="foreach:ExistingMembers, attr:{id:'giftMembers_' + uniqueID()}">
                                            <li>
                                                <input type="checkbox" class="checkboxes" data-bind="attr:{value:MemberID, 'data-member-name':MemberName()}" />
                                                <span data-bind="text:MemberName()"></span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12 control-label pull-right" data-bind="attr:{id:'giftUL_'+uniqueID()}">
                                    <ul class="gifts" data-bind="foreach:Gifts">
                                        <li data-bind="attr:{'data-cat':price}">
                                            <input type="radio" name="gift" data-bind="attr:{id:'gift_' + giftid()},checkedValue: giftid" class="input_hidden" />
                                            <label data-bind="attr:{for:'gift_' + giftid()}, click:$parent.selectGift">
                                                <img data-bind="attr:{src:picPath}" />
                                                <br />
                                                <span class="giftname" data-bind="text:name"></span>
                                                <br />
                                                <span class="giftprice" data-bind="text:price() + ' نقطة'"></span>
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
                        <i class="icon icon-paperclip" style="float: left; margin-left: 10px;"></i>
                        <h3 id="myModalLabel1">إرسال ملفات</h3>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal blockBox validationGroup">
                            <div class="form-group">
                                <div class="col-sm-3 control-label pull-right">
                                    <label>مقطع فيديو</label>
                                </div>
                                <div class="col-sm-7 pull-right">
                                    <input type="text" class="form-control " data-bind="attr:{id:'videoURL_' + uniqueID()}">
                                </div>
                                <div class="col-sm-2 pull-right">
                                    <a style="cursor: pointer;" class="btn btn-default " data-bind="click:$parent.SendVideo($data)">إرسال</a>
                                </div>
                            </div>
                            <div style="height: 1px; background-color: #ccc; clear: both; width: 95%; margin: 5px auto;"></div>
                            <div class="form-group">
                                <div class="col-sm-3 control-label pull-right">
                                    أضف صورة
                                </div>
                                <div class="col-sm-7 pull-right">

                                    <div class="UploadDiv">
                                        <div data-bind="attr:{id:'UploadStatus_'+uniqueID()}">
                                        </div>
                                        <input type="button" class="UploadButton pull-right" data-bind="attr:{id:'UploadButton_'+uniqueID()}" value="إختر صورة">
                                        <input type="hidden" data-bind="attr:{id:'UploadFileName_'+uniqueID()}" />
                                        <div data-bind="attr:{id:'UploadedFile_'+uniqueID()}">
                                        </div>

                                    </div>
                                </div>
                                <div class="col-sm-2 control-label pull-right">
                                    <a style="cursor: pointer;" class="btn btn-default pull-right" data-bind="click:$parent.SendImage($data)">إرسال</a>
                                </div>
                            </div>
                            <div style="height: 1px; background-color: #ccc; clear: both; width: 95%; margin: 5px auto;"></div>

                            <div class="form-group">
                                <div class="col-sm-3 control-label pull-right">
                                    سجل مقطع صوت
                                </div>
                                <div class="col-sm-7 pull-right center">
                                    <object style="height: 138px;" data="testswf/recorder.swf" class="flashmovie" data-bind="attr:{id:'recorder_'+uniqueID(), name:'recorder_'+uniqueID()}" type="application/x-shockwave-flash">
                                        <param name="quality" value="high">
                                        <param value="always" name="allowScriptAccess">
                                        <param name="wmode" value="opaque" />
                                        <param data-bind="attr:{value:'roomId='+ ID() +'&amp;userId='+ $root.CurrentMemberID+'&amp;recordUrl=audioUploader.ashx'}" name="flashvars">
                                    </object>
                                </div>


                                <div class="col-sm-2 control-label pull-right">
                                    <a style="cursor: pointer;" class="btn btn-default" data-bind="click:$parent.SendAudio($data)">إرسال</a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- ko if:Type()=="Room" && !IsTemp() -->
        <div data-bind="attr:{id:'infoModal_'+uniqueID()}" class="modal fade" role="modal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>
                        <i class="modernicon iconmodern-createroom pull-right icon-2x"></i>
                        <h3 id="myModalLabel1" data-bind="text:Name"></h3>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal blockBox validationGroup">
                            <div class="form-group">
                                <div class="col-sm-4 control-label pull-right">
                                    <label>القسم</label>
                                </div>
                                <div class="col-sm-7  control-label pull-right">
                                    <span data-bind="text:CategoryName"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 control-label pull-right">
                                    <label>الفرع</label>
                                </div>
                                <div class="col-sm-7  control-label pull-right">
                                    <span data-bind="text:SubCategoryName"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 control-label pull-right">
                                    <label>تاريخ إنشائها</label>
                                </div>
                                <div class="col-sm-7 control-label pull-right">
                                    <span data-bind="date:CreatedDate, format:' D-M-YYYY '"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 control-label pull-right">
                                    <label>المالك</label>
                                </div>
                                <div class="col-sm-7 control-label pull-right">
                                    <span data-bind="text:OwnerMember().MemberName"></span>
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="col-sm-6 control-label pull-right">
                                    <label>المدير</label>
                                    <div class="col-sm-12 pull-right" style="border: 1px solid #FEC200; border-radius: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px; -ms-border-radius: 5px; min-height: 30px;">
                                        <ul data-bind="foreach:AdminMembers">
                                            <!-- ko if:MemberLevelID() == 3 -->
                                            <li>
                                                <span data-bind="text:MemberName()"></span></li>
                                            <!-- /ko -->
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-sm-6 control-label pull-right">
                                    <label>مراقب</label>
                                    <div class="col-sm-12 pull-right" style="border: 1px solid #FEC200; border-radius: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px; -ms-border-radius: 5px; min-height: 30px;">
                                        <ul data-bind="foreach:AdminMembers">
                                            <!-- ko if:MemberLevelID() == 2 -->
                                            <li>
                                                <span data-bind="text:MemberName()"></span></li>
                                            <!-- /ko -->
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 control-label pull-right">
                                    <label>عدد الزوار</label>
                                </div>
                                <div class="col-sm-7 control-label pull-right">
                                    <span data-bind="text:ExistingMembers().length"></span>
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 control-label pull-right">
                                    <label>إستيعاب الغرفة</label>
                                </div>
                                <div class="col-sm-7 control-label pull-right">
                                    <span>500</span>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- /ko -->

        <div data-bind="attr:{id:'AduioNotification_'+uniqueID()}"></div>

    </script>
    <div id="TempRoomInvitationModal" class="modal fade" role="modal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content hamsaModal">
                <div class="modal-header">
                    <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>
                    <i class="icon  icon-envelope" style="float: left; margin-left: 10px;"></i>
                    <h3>دعوة </h3>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal blockBox validationGroup">
                        <h3>دعوة إلى غرفة مؤقتة</h3>

                        <div class="form-group" id="TempRoomInvitationModalContent">
                        </div>


                    </div>
                </div>

            </div>
        </div>
    </div>

    <div id="RoomInvitationModal" class="modal fade" role="modal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content hamsaModal">
                <div class="modal-header">
                    <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>
                    <i class="icon  icon-envelope" style="float: left; margin-left: 10px;"></i>
                    <h3>دعوة </h3>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal blockBox validationGroup">
                        <h3>دعوة إلى غرفة </h3>

                        <div class="form-group" id="RoomInvitationModalContent">
                        </div>


                    </div>
                </div>

            </div>
        </div>
    </div>

    <div id='GeneralGiftModal' class="modal fade " role="modal" aria-hidden="true">
        <div class="modal-dialog modal-lg" style="width: 700px;">
            <div class="modal-content">
                <div class="modal-header">
                    <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>
                    <i class="icon icon-gift" style="float: left; margin-left: 10px;"></i>
                    <h3 id="myModalLabel1">أرسل هدية</h3>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal blockBox validationGroup">
                        <div class="form-group">
                            <h4>لديك
                                    <label id="generalGiftPoints" data-bind="text:CreditPoints"></label>
                                نقطة
                                   
                            </h4>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2 control-label pull-right">
                                <label>إرسال هدية إلى </label>
                            </div>
                            <div class="col-sm-9 pull-right bordered" style="padding: 3px;">
                                <div class="col-sm-12 SScroll" data-height="130px" style="width: 100% !important; float: right">
                                    <asp:Repeater ID="uiRepeaterGiftFriends" runat="server">
                                        <HeaderTemplate>
                                            <ul class="giftMembers" id='GeneralGiftMembers'>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <li>
                                                <input type="checkbox" class="checkboxes" value='<%#Eval("FriendID") %>' data-member-name='<%# Eval("UserName") %>' />
                                                <span><%# Eval("UserName") %></span></li>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </ul>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12 control-label pull-right" id='GeneralGiftUL'>
                                <asp:Repeater ID="uiRepeaterGeneralGifts" runat="server">
                                    <HeaderTemplate>
                                        <ul class="gifts">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li data-cat='<%# Eval("Price_Point") %>'>
                                            <input type="radio" name="gift" id='gift_<%# Eval("GiftID") %>' value='<%# Eval("GiftID") %>' class="input_hidden" />
                                            <label for='gift_<%# Eval("GiftID") %>' class="GiftLabel" data-giftid='<%# Eval("GiftID") %>' data-giftprice='<%# Eval("Price_Point")%>'>
                                                <img src='<%# Eval("PicPath") %>' />
                                                <br />
                                                <span class="giftname"><%# Eval("Name") %></span>
                                                <br />
                                                <span class="giftprice"><%# Eval("Price_Point") + " نقطة" %></span>
                                            </label>
                                        </li>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul>
                                    </FooterTemplate>
                                </asp:Repeater>

                                <div class="clearfix" style="height: 10px;"></div>
                            </div>

                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-6 pull-left">
                                <input type="button" id="btnGeneralSendGift" value="إرسال" class="btn btn-warning" style="width: 100px;" />
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>

    <script id="roomFriendsBotModal" type="text/html">
        <div data-bind="attr:{id:roomFriendsBotModalID}" class="modal fade" role="modal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content hamsaModal">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>
                        <i class="icon icon-group" style="float: left; margin-left: 10px;"></i>
                        <h3>بوت أصدقاء الغرفة</h3>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal blockBox validationGroup">
                            <h3>رسالة أصدقاء الغرفة</h3>

                            <div class="form-group">
                                <textarea data-bind="value:roomFriendsBotMsg, valueUpdate:['afterkeydown','propertychange','input']" class="form-control" maxlength="500"></textarea>
                                <!-- ko if:roomFriendsBotMsg-->
                                <span data-bind="text:500-roomFriendsBotMsg().length"></span>
                                <!-- /ko -->
                                <!-- ko ifnot:roomFriendsBotMsg-->
                                <span>500</span>
                                <!-- /ko -->
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-6 pull-left">
                                    <input type="button" value="إرسال" class="btn btn-warning" style="width: 100px;" data-bind="click:sendRoomFriendsBotMsg" />
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </script>
    <script id="roomEmailOwnerBotModal" type="text/html">
        <div data-bind="attr:{id:roomEmailOwnerBotModal}" class="modal fade" role="modal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content hamsaModal">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>
                        <i class="icon  icon-envelope" style="float: left; margin-left: 10px;"></i>
                        <h3>بوت بريد المالك</h3>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal blockBox validationGroup">
                            <h3>رسالة لمالك الغرفة</h3>

                            <div class="form-group">
                                <textarea data-bind="value:roomEmailOwnerBotMsg, valueUpdate:['afterkeydown','propertychange','input']" class="form-control" maxlength="500"></textarea>
                                <!-- ko if:roomEmailOwnerBotMsg-->
                                <span data-bind="text:500-roomEmailOwnerBotMsg().length"></span>
                                <!-- /ko -->
                                <!-- ko ifnot:roomEmailOwnerBotMsg-->
                                <span>500</span>
                                <!-- /ko -->
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-6 pull-left">
                                    <input type="button" value="إرسال" class="btn btn-warning" style="width: 100px;" data-bind="click:sendRoomEmailOwnerBotMsg" />
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </script>
    <script id="roomBotsModal" type="text/html">
        <div data-bind="attr:{id:roomBotsModalID}" class="modal fade" role="modal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>
                        <i class="icon-2x icon-cogs" style="float: left;"></i>
                        <h3>إعدادات البوت</h3>
                    </div>
                    <div class="modal-body">
                        <div class="panel-group" data-bind="attr{id:'accordion_'+ID()}">
                            <!-- ko with:RoomBots-->
                            <div class="panel panel-default" data-bind="foreach:$data">
                                <div class="panel-heading" style="padding: 0 15px;">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-bind="text:Bot.Title,attr:{'data-parent':'#accordion_'+RoomID(),'href':'#cp_'+ID()}"></a>
                                    </h4>
                                </div>
                                <div class="panel-collapse collapse" data-bind="attr:{id:'cp_'+ID()}">
                                    <div class="panel-body" data-bind="template: { name: 'bot_editTemplate'}">
                                    </div>
                                </div>
                            </div>
                            <!-- /ko -->
                        </div>
                        <div class="row">
                            <input type="button" class="btn btn-warning" value="حفظ" data-bind="click:saveRoomBots" />
                            <input type="button" class="btn btn-warning" value="غلق" data-dismiss="modal" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </script>
    <script type="text/html" id="bot_editTemplate">
        <div class="box">
            <div class="icon">
                <img class="image" data-bind="attr:{'src' : Bot.IconPath() +'_'+$root.ActivWindow().Settings.TypeID()+'.png'}" />
                <div class="info">
                    <span class="title" data-bind="text:Bot.Title"></span>
                    <div>
                        <span style="color: green;" class="col-lg-2" data-bind="date:StartDate, format: 'YYYY/MM/DD'"></span>
                        <span style="color: green;" class="col-lg-2">شراء</span>
                        <br />
                        <span style="color: red;" class="col-lg-2">
                            <span data-bind="date:EndDate, format: 'YYYY/MM/DD'"></span>
                        </span>
                        <span style="color: red;" class="col-lg-2">إنتهاء</span>
                    </div>

                    <div class="more">
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label for="rdStatus" class="col-md-4 control-label pull-right">حالة البوت</label>
                                <div class="col-md-4 pull-right">
                                    <label>
                                        <input name="status" type="radio" data-bind="checkedValue: true,checked: IsEnabled" />
                                        <span>فعال</span>
                                    </label>
                                    <label>
                                        <input name="status" type="radio" data-bind="checkedValue: false,checked: IsEnabled" />
                                        <span>معطل</span>
                                    </label>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div data-bind="template: { name: $root.getBotTemplate.bind($data,$data.BotID())}"></div>
                            <div class="clearfix"></div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="space"></div>
        </div>
    </script>
    <script type="text/html" id="bot_template_<%= (int)Helper.Enums.Bot.Welcome %>">
        <div class="form-group">
            <div class="col-sm-2 control-label pull-right">
                <label>عند الدخول</label>
            </div>
            <div class="col-sm-4 pull-right">
                <input type="text" class="form-control" data-bind="value:Settings.LoginMsgPart1" maxlength="20" />
            </div>
            <label class="col-sm-2 control-label pull-right">(إسم الحساب)</label>
            <div class="col-sm-4 pull-right">
                <input type="text" class="form-control" data-bind="value:Settings.LoginMsgPart2" maxlength="20" />
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="form-group">
            <label class="col-sm-2 control-label pull-right">عند الخروج</label>
            <div class="col-sm-4 pull-right">
                <input type="text" class="form-control" data-bind="value:Settings.LogoutMsgPart1" maxlength="20" />
            </div>

            <label class="col-sm-2 control-label pull-right">(إسم الحساب)</label>
            <div class="col-sm-4 pull-right">
                <input type="text" class="form-control" data-bind="value:Settings.LogoutMsgPart2" maxlength="20" />
            </div>
        </div>
    </script>
    <script type="text/html" id="bot_template_<%= (int)Helper.Enums.Bot.InviteFriendsBan %>">
        <div class="form-group">
            <label for="rdStatus" class="col-md-4 control-label pull-right"></label>
            <ul data-bind="foreach: Settings.MemberLevels" class="col-md-8 pull-right">
                <li class="pull-right">
                    <label>
                        <input type="checkbox" data-bind="value: ID, checked: $parent.Settings.BannedMemberLevels" />
                        <span data-bind="text: Name"></span>
                    </label>
                </li>
            </ul>
        </div>
    </script>
    <script type="text/html" id="bot_template_<%= (int)Helper.Enums.Bot.MemberTypeLogin %>">
        <div class="form-group">
            <label for="rdStatus" class="col-md-4 control-label pull-right"></label>
            <ul data-bind="foreach: Settings.MemberTypes" class="col-md-8 pull-right">
                <li class="pull-right">
                    <label>
                        <input type="checkbox" data-bind="value: ID, checked: $parent.Settings.AcceptedMemberTypes" />
                        <span data-bind="text: Name"></span>
                    </label>
                </li>
            </ul>
        </div>
    </script>
    <script type="text/html" id="bot_template_<%= (int)Helper.Enums.Bot.FollowAdmin %>">
        <div class="form-group">
            <label for="rdStatus" class="col-md-4 control-label pull-right"></label>
            <ul data-bind="foreach: Settings.MemberLevels" class="col-md-8 pull-right">
                <li class="pull-right">
                    <label>
                        <input type="checkbox" data-bind="value: ID, checked: $parent.Settings.FollowMemberLevels" />
                        <span data-bind="text: Name"></span>
                    </label>
                </li>
            </ul>
        </div>
        <div class="form-group">
            <label for="rdStatus" class="col-md-4 control-label pull-right"></label>
            <div class="col-md-4 pull-right">
                <select class="form-control" data-bind="options: Settings.Schedule,optionsText: 'Name',optionsValue:'ID',value: Settings.FollowSchedule"></select>
            </div>
        </div>
    </script>
    <script type="text/html" id="bot_template_<%= (int)Helper.Enums.Bot.EmailOwner %>">
    </script>
    <script type="text/html" id="bot_template_<%= (int)Helper.Enums.Bot.RoomFriends %>">
    </script>
    <script type="text/html" id="bot_template_<%= (int)Helper.Enums.Bot.RoomLaw %>">
        <div class="form-group">
            <label for="rdStatus" class="col-md-4 control-label pull-right">الوقت</label>
            <div class="col-md-4 pull-right">
                <select class="form-control" data-bind="options: Settings.Schedule,optionsText: 'Name',optionsValue:'ID',value: Settings.LawScheduleString"></select>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th colspan="4" class="center">قوانين الغرفة
                        </th>
                    </tr>
                </thead>
                <tbody data-bind="foreach:Settings.Laws">
                    <tr>
                        <td data-bind="text:$index()+1"></td>
                        <td>
                            <input type="text" class="form-control" data-bind="value:Law" maxlength="45" /></td>
                        <td>
                            <input type="checkbox" data-bind="checked:IsActive" />
                        </td>
                        <td><a href="#" data-bind="click:function(){$parent.Settings.Laws.remove(this);}">حذف</a></td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <!-- ko if:Settings.Laws().length<10-->
                            <a href="#" data-bind="click:function(){copyObjectToarray(ko.toJS(Settings.LawItemObject),Settings.Laws);}">إضافة</a>
                            <!--/ko-->
                            <!-- ko if:Settings.Laws().length==10-->
                            <span>حد أقصى 10</span>
                            <!--/ko-->
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </script>
    <script type="text/html" id="bot_template_<%= (int)Helper.Enums.Bot.RoomProgram %>">
        <div class="form-group">
            <label for="rdStatus" class="col-md-4 control-label pull-right">الوقت</label>
            <div class="col-md-4 pull-right">
                <select class="form-control" data-bind="options: Settings.Schedule,optionsText: 'Name',optionsValue:'ID',value: Settings.ProgramScheduleString"></select>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th colspan="4" class="center">برامج الغرفة
                        </th>
                    </tr>
                </thead>
                <tbody data-bind="foreach:Settings.Programms">
                    <tr>
                        <td data-bind="text:$index()+1"></td>
                        <td>
                            <input type="text" class="form-control" data-bind="value:Program" maxlength="45" /></td>
                        <td>
                            <input type="checkbox" data-bind="checked:IsActive" />
                        </td>
                        <td><a href="#" data-bind="click:function(){$parent.Settings.Programms.remove(this);}">حذف</a></td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>

                            <!-- ko if:Settings.Programms().length<10-->
                            <a href="#" data-bind="click:function(){copyObjectToarray(ko.toJS(Settings.ProgramItemObject),Settings.Programms);}">إضافة</a>
                            <!--/ko-->
                            <!-- ko if:Settings.Programms().length==10-->
                            <span>حد أقصى 10</span>
                            <!--/ko-->
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </script>
    <script type="text/javascript">
        function copyObjectToarray(obj,arr)
        {
            var newObject = jQuery.extend({}, obj);
            arr.push(newObject);
        }
    </script>

</asp:Content>


