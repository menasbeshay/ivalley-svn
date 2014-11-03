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
            registerRoomHubEvents(srHub,viewModel);

            $.connection.hub.start().done(function () {
                ko.applyBindings(viewModel);
            });

            
        });
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
