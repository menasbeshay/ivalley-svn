function registerRoomHubEvents(rHub,viewModel)
{
    var chatVM = viewModel;
    rHub.client.getPrivateMessage = function (fromId, message) {
        var window = chatVM.getWindow(fromId, "Private", message.FromName);
        window.addMessage(message);
    };
    rHub.client.getAdminMessage = function (rid, msg) {
        var type = "Room";
        var window = chatVM.getWindow(rid, type);
        if (window == null)
            return;
        window.addAdminMessage(msg);
    };
    rHub.client.showMemberInRoom = function (rid, mid) {
        var window = chatVM.getWindow(rid, "Room");
        if (window == null)
            return;
        var member = window.getMember(mid);
        if (member == null)
            return;
        member.InRoom(true);
        if (member.MemberID() != window.CurrentMember().MemberID() && window.CurrentMember().NotifyOnFriendsLogOn()) {
            var msg = member.MemberName() + ' قد إنضم للغرفة ';
            addMsgToWindow(window, msg, "joinalert");
        }
    };
    rHub.client.getMessage = function (rid, msg) {
        var type = "Room";
        var window = chatVM.getWindow(rid, type);
        if (window == null)
            return;
        window.addMessage(msg);
    };

    rHub.client.addNewMember = function (rid, memberData) {
        var newMember = ko.mapping.fromJS(memberData);
        var type = "Room";
        var window = chatVM.getWindow(rid, type);
        if (window == null)
            return;
        var existingMember = window.getMember(newMember.MemberID());
        if (existingMember == null) {
            window.Members().push(newMember);
            existingMember = newMember;
        }
        else {
            existingMember.InRoom(newMember.InRoom());
        }
        if (newMember.InRoom() && newMember.MemberID() != window.CurrentMember().MemberID() && window.CurrentMember().NotifyOnFriendsLogOn()) {
            var msg = newMember.MemberName() + ' قد إنضم للغرفة ';
            addMsgToWindow(window, msg, "joinalert");
        }
        // init popover menu for new members
        initPopover(window);
        // init send gift
        $('.MemberSendGift').click(function () {
            $("#giftModal_" + window.uniqueID()).modal('show');
            $('#giftModal_' + window.uniqueID() + ' input.checkboxes').each(function () {
                $(this).attr('checked', false);
            });
            $('#giftModal_' + window.uniqueID() + ' input.checkboxes[value="' + $(this).attr('data-mid') + '"]').attr('checked', true);
        });
    };
    rHub.client.removeMember = function (mid, roomId) {
        var window = chatVM.getWindow(roomId, "Room", "");
        if (window == null)
            return;
        var member = window.getMember(mid);
        if (member == null)
            return;
        member.QueueOrder(null);
        member.InRoom(false);
        if (window.CurrentMember().NotifyOnFriendsLogOff()) {
            var msg = member.MemberName() + ' خرج من الغرفة ';
            addMsgToWindow(window, msg, "leftalert");
        }
        if (mid == chatVM.CurrentMemberID) {
            chatVM.windows.remove(window);
        }
    };
    function banMemberFromroom(mid, roomId, banTypeName, adminName) {
        var window = chatVM.getWindow(roomId, "Room", "");
        if (window == null)
            return;
        var member = window.getMember(mid);
        if (member == null)
            return;
        member.QueueOrder(null);
        member.InRoom(false);
        if (chatVM.CurrentMemberID == mid) {
            notify('error', ' تم طردك ' + banTypeName + ' من الغرفة ' + window.Name() + ' من قبل ' + adminName);
            chatVM.windows.remove(window);
            $('.nav-tabs a:last').tab('show');
        }
        else {
            var msg = 'تم طرد العضو ' + member.MemberName() + ' ' + banTypeName + ' من قبل ' + adminName + '';
            addMsgToWindow(window, msg, "banalert");
        }
    }
    rHub.client.banMemberFromRoom = function (mid, roomId, banTypeName, adminName) {
        banMemberFromroom(mid, roomId, banTypeName, adminName);
    };
    rHub.client.updateMemberLevel = function (roomId, mid, level) {
        var window = chatVM.getWindow(roomId, "Room", "");
        if (window == null)
            return;
        var member = window.getMember(mid);
        if (member == null)
            return;
        member.MemberLevelID(level);
    };
    rHub.client.updateRoomTopic = function (roomID, topic) {
        var type = "Room";
        var window = chatVM.getWindow(roomID, type);
        if (window == null)
            return;
        window.RoomTopic(topic);
    }
    rHub.client.closeRoom = function (roomID, adminName) {
        var type = "Room";
        var window = chatVM.getWindow(roomID, type);
        if (window == null)
            return;

        notify('error', 'تم غلق الغرفة ' + window.Name() + ' من قبل الأدمن ' + adminName);
        chatVM.windows.remove(window);
        $('.nav-tabs a:last').tab('show');
    }
    rHub.client.updateSocialLinks = function (roomID, fbURL, tURL, utURL) {
        var type = "Room";
        var window = chatVM.getWindow(roomID, type);
        if (window == null)
            return;
        window.fbURL(fbURL);
        window.tURL(tURL);
        window.utURL(utURL);
    }
    rHub.client.ListenMic = function (memberid, rid) {
        var type = "Room";
        var window = chatVM.getWindow(rid, type);
        if (window == null)
            return;

        window.startMic(memberid);
        initPopover(window);
    };
    rHub.client.StopListenMic = function (memberid, rid) {
        var type = "Room";
        var window = chatVM.getWindow(rid, type);
        if (window == null)
            return;

        window.stopMic(memberid);
        initPopover(window);
    };

    /* private chat handlres */
    rHub.client.ListenMic_Private = function (memberid) {
        var type = "Private";
        var window = chatVM.getWindow(memberid, type);
        if (window == null)
            return;
        window.startMic(memberid);
    };
    rHub.client.StopListenMic_Private = function (memberid) {
        var type = "Private";
        var window = chatVM.getWindow(memberid, type);
        if (window == null)
            return;

        window.stopMic(memberid);
    };

    rHub.client.StartCam_Private = function (memberid) {
        var type = "Private";
        var window = chatVM.getWindow(memberid, type);
        if (window == null)
            return;
        window.startCam(memberid);
    };
    rHub.client.StopCam_Private = function (memberid) {
        var type = "Private";
        var window = chatVM.getWindow(memberid, type);
        if (window == null)
            return;

        window.stopCam(memberid);
    };


    rHub.client.UserRaisHand = function (rid, memberid, queueOrder) {
        var window = chatVM.getWindow(rid, "Room");
        if (window != null) {
            var member = window.getMember(memberid);
            if (member != null) {
                member.QueueOrder(queueOrder);
                initPopover(window);
            }
        }
    };
    rHub.client.UserDownHand = function (rid, memberid) {
        var window = chatVM.getWindow(rid, "Room");
        if (window != null) {
            var member = window.getMember(memberid);
            if (member != null) {
                member.QueueOrder(null);
                initPopover(window);
            }
        }
    };
    rHub.client.UserMarked = function (rid, memberid) {
        var window = chatVM.getWindow(rid, "Room");
        if (window != null) {
            var member = window.getMember(memberid);
            if (member != null) {
                member.IsMarked(true);
                member.CanWrite(false);
            }
        }
        //  $("#Room_" + rid + " #roomMembersDiv #m_" + memberid + " .controls .mark").css('display', 'block');
    };
    rHub.client.UserUnMarked = function (rid, memberid) {
        var window = chatVM.getWindow(rid, "Room");
        if (window != null) {
            var member = window.getMember(memberid);
            if (member != null) {
                member.IsMarked(false);
                member.CanWrite(true);
            }
        }
        //   $("#Room_" + rid + " #roomMembersDiv #m_" + memberid + " .controls .mark").css('display', 'none');
    };
    rHub.client.ShowCamLink = function (mid, rid) {//member opened cam
        var window = chatVM.getWindow(rid, "Room");
        if (window != null) {
            var member = window.getMember(mid);
            if (member != null) {
                member.IsCamOpened(true);
                if (window.CurrentMember().MemberID() != member.MemberID() && window.CurrentMember().NotifyOnOpenCam()) {
                    var msg = member.MemberName() + ' قد بدأ فتح الكمراء';
                    addMsgToWindow(window, msg, "joinalert");
                }
            }
        }
        // $('#Room_' + rid + ' #roomMembersDiv #m_' + mid + ' .controls .camera').css('display', 'inline-block');
    };
    rHub.client.HideCamLink = function (mid, rid) {
        var window = chatVM.getWindow(rid, "Room");
        if (window != null) {
            var member = window.getMember(mid);
            if (member != null) {
                member.IsCamOpened(false);
                if (window.CurrentMember().MemberID() != member.MemberID() && window.CurrentMember().NotifyOnCloseCam()) {
                    var msg = member.MemberName() + ' أغلق الكمراء';
                    addMsgToWindow(window, msg, "leftalert");
                }
            }
        }
        //  $('#Room_' + rid + ' #roomMembersDiv #m_' + mid + ' .controls .camera').css('display', 'none');
    };
    rHub.client.clearQueue = function (rid) {
        var window = chatVM.getWindow(rid, "Room");
        if (window != null) {
            ko.utils.arrayForEach(window.QueueMembers(), function (member) {
                member.QueueOrder(null);
            });
            initPopover(window);

        }
    };
    rHub.client.updateRoomSetting = function (rid, setting, newValue) {
        var window = chatVM.getWindow(rid, "Room");
        if (window != null) {
            window.Settings[setting](newValue);
        }
    };
    rHub.client.markAllWithWrite = function (rid, isMarked, adminID) {
        var window = chatVM.getWindow(rid, "Room");
        var adminMember = window.getMember(adminID);
        if (window != null) {
            ko.utils.arrayForEach(window.ExistingMembers(), function (member) {
                if (adminMember == null || member.MemberLevelID() < adminMember.MemberLevelID()) {
                    member.IsMarked(isMarked);
                    member.CanWrite(true);
                }
            });
        }
    };
    rHub.client.markAllWithoutWrite = function (rid, isMarked, adminID) {
        var window = chatVM.getWindow(rid, "Room");
        var adminMember = window.getMember(adminID);
        if (window != null) {
            ko.utils.arrayForEach(window.ExistingMembers(), function (member) {
                if (adminMember == null || member.MemberLevelID() < adminMember.MemberLevelID()) {
                    member.IsMarked(isMarked);
                    member.CanWrite(!isMarked);
                }
            });
        }
    };
    rHub.client.GiftSentInRoom = function (roomID, memberName, friendName, giftName, friendID, giftpath, audiopath) {
        var window = chatVM.getWindow(roomID, "Room");
        message = "<div class='pull-left giftmsg'>" + memberName + " أرسل هدية (" + giftName + ") إلى " + friendName + "</div><div style='clear:both;height:1px;'></div>";
        window.addNotificationMessage(message);

        var receiverMember = window.getMember(friendID);
        if (receiverMember != null) {
            receiverMember.HasGift(true);
            setTimeout(function () { receiverMember.HasGift(false); }, 60000);
        }

        if (window.CurrentMemberID() == friendID) {
            var modaldiv = "<div class='modal fade' role='modal' aria-hidden='true'><div class='modal-dialog'><div class='modal-content'><div class='modal-header'><a class='close pull-left' data-dismiss='modal' aria-hidden='true' style='text-decoration: none;'>×</a><h3 id='myModalLabel1'>هدية</h3></div><div class='modal-body'><div class='form-horizontal blockBox'><div class='row'><div class='col-sm-10 center'><img src='" + giftpath + "' style='max-height:400px;'/></div></div></div></div></div></div>" + "<audio autoplay><source src='" + audiopath + "'></audio>" + "</div>";

            var $div = $(modaldiv);
            $('#MainTabs').prepend($div);
            $div.modal('show');
        }
    };

    rHub.client.getHamsa = function (fromMember, hamsa) {
        createHamsaWindow(hamsa, fromMember);
    };
    /*****************************************/
    rHub.client.getBotMsg = function (rid, msg, botImg) {
        var window = chatVM.getWindow(rid, "Room");
        if (window != null) {
            window.addBotMsg(msg, botImg);
        }
    };
    rHub.client.updateRoomType = function (rid, settings) {
        var roomInList = $("#rooms_rm_" + rid);
        if (roomInList.length > 0) {
            $(roomInList).css({ 'color': settings.Color });
        }

        var window = chatVM.getWindow(rid, "Room");
        if (window != null) {
            window.Settings.CamCount(settings.CamCount);
            window.Settings.MaxMic(settings.MaxMic);
            window.Settings.TypeID(settings.TypeID);
            window.Settings.Color(settings.Color);
        }
    }
    rHub.client.addRoomBot = function (rid, roomBot) {
        var window = chatVM.getWindow(rid, "Room");
        if (window != null) {
            window.addRoomBot(roomBot);
        }
    }
    rHub.client.updateRoomMemberType = function (mid, memberTypeSpecId, rid) {
        var window = chatVM.getWindow(rid, "Room");
        if (window != null) {
            window.updateMemberType(mid, memberTypeSpecId);
        }
    }
}