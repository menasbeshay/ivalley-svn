<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="Home1.aspx.cs" Inherits="Chat2Connect.Home1" %>

<%@ Register Src="~/templates/Friends.ascx" TagPrefix="uc1" TagName="Friends" %>
<%@ Register Src="~/templates/PrivateChat.ascx" TagPrefix="uc1" TagName="PrivateChat" %>
<%@ Register Src="~/templates/Rooms.ascx" TagPrefix="uc1" TagName="Rooms" %>
<%@ Register Src="~/templates/RoomChat.ascx" TagPrefix="uc1" TagName="RoomChat" %>

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
    <script src="js/advanced.js"></script>
    <script src="js/wysihtml5-0.3.0.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.iconentypo-addfriend').tooltip();
            $('#cpmain').addClass('selected');
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
            <ul class="nav nav-tabs" data-bind="foreach: tabs">
                <li class="pull-right" data-bind="css: { active: $parent.selectedTab() === $data }">
                    <a style="display: block; height: 28px;" data-toggle="tab" data-bind="click: function () { $parent.selectedTab($data); return true; }">
                        <span data-bind="text: name, css: 'type_' + typeSpecID()" class="pull-right"></span>
                        <button type="button" class="close" data-bind="click: $parent.removeWindow">×</button>
                    </a>
                </li>
            </ul>
        </div>
        <div style="height: 1px;" class="clear"></div>
        <div class="blockBoxshadow pull-right col-lg-12 margin20" style="margin-top: 2px;">
            <div class="tab-content" data-bind="with: selectedTab">
                <div class="tab-pane fade in active" data-bind="template: { name: 'template_' + $data.type, data: $data }">
                </div>
            </div>
        </div>
    </div>
    <script id="template_RoomsList" type="text/html">
        <uc1:Rooms runat="server" ID="Rooms" />
    </script>
    <script id="template_RoomChat" type="text/html">
        <uc1:RoomChat runat="server" ID="RoomChat" />
    </script>
    <script id="template_PrivateChat" type="text/html">
        <uc1:PrivateChat runat="server" ID="PrivateChat" />
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
    <script src="Scripts/knockout.mapping-latest.js"></script>
    <script src="Scripts/chat2onnect/knockout.extensions.js"></script>
    <script src="Scripts/chat2onnect/roomHubEvents.js"></script>
    <script src="Scripts/chat2onnect/tab.js"></script>
    <script src="Scripts/chat2onnect/member.js"></script>
    <script src="Scripts/chat2onnect/chatwindow.js"></script>
    <script>
        var emailOwnerBotID=<%= (int)Helper.Enums.Bot.EmailOwner%>;
        var inviteFriendBanBotID=<%= (int)Helper.Enums.Bot.InviteFriendsBan%>;
        var roomFriendsBotID=<%= (int)Helper.Enums.Bot.RoomFriends%>;
        var roomLawBotID=<%= (int)Helper.Enums.Bot.RoomLaw%>;
        var roomProgramBotID=<%= (int)Helper.Enums.Bot.RoomProgram%>;
        var mid = eval(<%= BLL.Member.CurrentMemberID%>);
        var name = '<%= BLL.Member.CurrentMember.Name%>';
        var pic = '<%= BLL.Member.CurrentMember.ProfilePic%>';
        var points = eval(<%= BLL.Member.CurrentMember.Credit_Point%>);
        var viewModel;
        $(function () {
            var srHub = $.connection.chatRoomHub;

            viewModel = new member(srHub, mid, name, pic, points);
            //registerRoomHubEvents(srHub,viewModel);

            $.connection.hub.start().done(function () {
                ko.applyBindings(viewModel);
            });

            
        });
        function onCamClose(userId, roomId) {
            var window = viewModel.getRoomChatWindow(roomId.substr(roomId.indexOf("_") + 1));
            if (window == null)
                return;
            window.room().stopCam(userId);
        }
        function onMicRecordSaveSuccess(fileName) {
            // returned file name & roomid in this format [roomId,filename]
            var window = viewModel.getRoomChatWindow(fileName.substr(0, fileName.indexOf(",")));
            if (window == null)
                return;
            var audioDiv = "<div style='margin:0 auto;text-align:center;'><audio controls><source src='files/rooms/attacheaudio/" + fileName.substr(fileName.indexOf(",") + 1) + "' type='audio/mpeg'>Your browser does not support this audio format.</audio></div>";
            window.room().UpdateAudioAttachment(audioDiv);

        }
    </script>
    <script>
        $(document).on('click', '.friend-link', function (e) {
            var $this = $(this);
            var popoverContent = $this.find('.friendSubMenu');
            // check if popover content exists
            if (popoverContent.length > 0) {
                $this.popover({
                    trigger: 'click',
                    placement: 'left',
                    html: true,
                    title: '<a class="close pull-left closepopover" style="color:#fff;" onclick="$(&#39;#' + $this.attr('id') + '&#39;).popover(&#39;hide&#39;);">&times;</a>',
                    content: popoverContent,
                    container: 'body'
                }).on('hidden.bs.popover', function () {
                    $this.append(popoverContent);
                });
            }
        });
    </script>
</asp:Content>
