function chatWindow(data, viewModel) {
    ko.mapping.fromJS(data, {}, this);
    var self = this;
    self.viewModel = viewModel;

    this.uniqueID = ko.computed(function () {
        if (this.Type() == 'Private') {
            // generated id for private chat
            var newroomid = (this.ID() < self.viewModel.memberID) ? this.ID() + "_" + self.viewModel.memberID : self.viewModel.memberID + "_" + this.ID();
            return this.Type() + '_' + newroomid;
        }
        return this.Type() + '_' + this.ID();
    }, this);

    this.Editor = null;
    this.AdminsEditor = null;
    this.selectedGift = null;
    this.IsActive = false;
    // default editor styles
    this.IsBold = ko.observable(false);
    this.IsItalic = ko.observable(false);
    this.FontSize = ko.observable('meduim');
    this.ForeColor = ko.observable('black');
    this.toggleBold = function () {
        self.IsBold(!self.IsBold());
        self.saveEditorSetting();
    };
    this.toggleItalic = function () {
        self.IsItalic(!self.IsItalic());
        self.saveEditorSetting();
    };
    this.setFontSize = function (fontsize) {
        self.FontSize(fontsize);
        self.saveEditorSetting();
    };
    this.setForeColor = function (color) {
        self.ForeColor(color);
        self.saveEditorSetting();
    };

    this.getMember = function (id) {
        return ko.utils.arrayFirst(self.Members(), function (mem) {
            return mem.MemberID() == id;
        });
    }
    //Existing Members
    this.ExistingMembers = ko.computed(function () {
        /*if (self.Type() == 'Private')
            return null;*/
        return ko.utils.arrayFilter(self.Members(), function (mem) {
            return mem.InRoom();
        });
    }, this);
    //Room Members
    this.RoomMembers = ko.computed(function () {
        return ko.utils.arrayFilter(self.ExistingMembers(), function (mem) {
            return (mem.QueueOrder() == null);
        });
    }, this);
    //Queue Members
    this.QueueMembers = ko.computed(function () {
        return ko.utils.arrayFilter(self.ExistingMembers(), function (mem) {
            return (mem.QueueOrder() != null);
        }).slice().sort(function (a, b) {
            return a.QueueOrder() > b.QueueOrder() ? 1 : -1;
        });
    }, this);
    //Admin Members
    this.AdminMembers = ko.computed(function () {
        return ko.utils.arrayFilter(self.ExistingMembers(), function (mem) {
            return (mem.MemberLevelID() > 1);
        });
    }, this);
    //Current member
    this.CurrentMember = ko.computed(function () {
        return self.getMember(self.CurrentMemberID());
    }, this);
    //Owner
    this.OwnerMember = ko.computed(function () {
        if (self.Type() == 'Private')
            return null;
        return self.getMember(self.CreatedBy());
    }, this);
    //MicMember
    this.MicMember = ko.observable();
    // openedCams
    this.OpenedCams = ko.computed(function () {
        return ko.utils.arrayFilter(self.ExistingMembers(), function (mem) {
            return mem.IsCamOpened();
        });
    }, this);

    this.updateSetting = function (settingName) {
        var window = this;
        var newValue = !window.CurrentMember()[settingName]();
        window.CurrentMember()[settingName](newValue);
        if (self.Type() == "Room") {
            $.ajax({
                url: '../Services/Services.asmx/UpdateRoomMemberSetting',
                dataType: 'json',
                type: 'post',
                data: "{'mid':" + self.CurrentMember().MemberID() + ", 'rid' : " + window.ID() + ",'setting':'" + settingName + "','newValue':" + newValue + " }",
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    notify('success', 'تم تغيير الإعدادات بنجاح');
                    return;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    notify('error', 'حدث خطأ . من فضلك أعد المحاولة');
                }
            });
        }
        else {
            notify('success', 'تم تغيير الإعدادات بنجاح');
        }
        return true;
    }

    //member menu
    this.toggleFriend = function (friend) {
        var window = this;
        var mid = window.CurrentMember().MemberID();
        var fid = friend.MemberID();
        var isFriend = friend.IsFriend();
        friend.IsFriend(!isFriend);
        $.ajax({
            url: '../Services/Services.asmx/AddRemoveFriend',
            type: 'GET',
            data: { mid: mid, fid: fid, isFriend: isFriend },
            success: function (result) {
            }
        });

        // update friend list
        if (isFriend) {
            $("#usernode-" + fid).remove();
        }
        else {
            $.ajax({
                url: '../Services/Services.asmx/GetMemberNode',
                type: 'GET',
                data: { mid: fid },
                success: function (result) {
                    $(result).appendTo("#onlinepeople");
                    initPopupMenu();
                    // init link in friends menu 
                    $('.openGiftModal').click(function () {
                        $('#GeneralGiftModal').modal('show');
                        $('#GeneralGiftModal input.checkboxes').each(function () {
                            $(this).attr('checked', false);
                        });
                        $('#GeneralGiftModal input.checkboxes[value="' + $(this).attr('data-mid') + '"]').attr('checked', 'checked');
                    });
                }
            });
        }

        // update friend list counter
        setTimeout(CountFriends, 1500);
    };
    this.toggleMark = function (window, friend) {
        var newvalue = !friend.IsMarked();
        friend.IsMarked(newvalue);
        friend.CanWrite(newvalue);
        self.viewModel.rHub.server.toggleUserMark(window.ID(), newvalue, friend.MemberID());
        if (!newvalue) {
            window.stopMic(friend.MemberID());
        }
    };

    this.SelectedMember = ko.observable(this.CurrentMember());
    this.showRoomMemberLevelsPopup = function (mid) {
        var member = self.getMember(mid);
        if (member == null)
            return;
        self.SelectedMember(member);
        $("#changeLevelModal_" + self.uniqueID()).modal('show');
    };
    this.updateMemberLevel = function () {
        var window = this;
        self.viewModel.rHub.server.updateMemberLevel(window.ID(), self.SelectedMember().MemberID(), self.SelectedMember().MemberLevelID());
        $("#changeLevelModal_" + self.uniqueID()).modal('hide');
        return true;
    };
    this.HamsaText = ko.observable();
    this.showSendHamsa = function (member) {
        self.SelectedMember(member);
        $("#sendHamsaModal_" + self.uniqueID()).modal('show');
    };
    this.sendHamsa = function () {
        self.viewModel.rHub.server.sendHamsa(self.ID(), self.SelectedMember().MemberID(), self.HamsaText(), self.CurrentMember().MemberName());
        $("#sendHamsaModal_" + self.uniqueID()).modal('hide');
        self.HamsaText("");
        return true;
    };
    //control panel
    this.bannedMember = ko.observable();
    this.banMember = function (id) {
        var member = self.getMember(id);
        if (member == null)
            return;
        self.bannedMember(member);
        $("#banModal_" + self.uniqueID()).modal('show');
    };
    this.saveBanMember = function () {
        var window = this;
        $.ajax({
            url: '../Services/Services.asmx/BanRoomMember',
            dataType: 'json',
            type: 'post',
            data: "{'memberID':" + window.bannedMember().MemberID() + ", 'roomID' : " + window.ID() + ",'type':'" + window.bannedType() + "','adminID':" + self.CurrentMemberID() + "}",
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                notify('success', 'تم حجب العضو بنجاح');
                $("#banModal_" + window.uniqueID()).modal('hide');
                self.viewModel.rHub.server.banMemberFromRoom(window.bannedMember().MemberID(), window.ID(), window.bannedType(), window.CurrentMember().MemberName());
                window.bannedMember().BanType(window.bannedType());
                window.bannedMember().IsMemberBanned(true);
                self.BanMemberName("");
                return;
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                $("#banModal_" + window.uniqueID()).modal('hide');
                notify('error', 'حدث خطأ . من فضلك أعد المحاولة');
            }
        });
    };
    this.BannedMembers = ko.computed(function () {
        if (self.Type() == 'Private')
            return null;
        return ko.utils.arrayFilter(self.Members(), function (mem) {
            return mem.IsMemberBanned();
        });
    }, this);
    this.NotBannedMembers = ko.computed(function () {
        if (self.Type() == 'Private')
            return null;
        return ko.utils.arrayFilter(self.Members(), function (mem) {
            return !mem.IsMemberBanned() && mem.MemberID() != self.CurrentMemberID() && mem.MemberLevelID() < self.CurrentMember().MemberLevelID();
        });
    }, this);
    this.bannedType = ko.observable();
    this.BanMemberName = ko.observable("");
    this.banMemberByName = function () {
        var name = $("#txtBanMemberName_" + self.uniqueID()).val();
        var member = ko.utils.arrayFirst(self.NotBannedMembers(), function (mem) {
            return mem.MemberName() == name;
        });
        if (member == null)
            return;
        self.bannedMember(member);
        self.saveBanMember();
    }
    this.showControlPanel = function () {
        var window = this;
        $("#controlPanelModal_" + window.uniqueID()).modal('show');
    };
    this.removeSelectedBannedType = function (type) {
        var bannedMembers = [];
        $('#' + type).each(function (i, selected) {
            var id;
            if (this.options == undefined)
                id = $(this).val();
            else
                id = $(this.options[i]).val();
            var member = self.getMember(id);
            if (member != null) {
                member.BanType(null);
                member.IsMemberBanned(false);
                bannedMembers[i] = id;
            }
        });
        if (bannedMembers.length > 0) {
            $.ajax({
                url: '../Services/Services.asmx/RemoveBanningFromRoomMembers',
                type: 'GET',
                traditional: true,
                data: { membersID: bannedMembers, roomID: self.ID() },
                success: function (result) {
                    notify('success', 'تم حذف الحجب بنجاح');
                }
            });
        }
    }
    this.closeRoom = function () {
        var window = this;
        var currentMemberLevel = window.CurrentMember().MemberLevelID();
        var topMember = ko.utils.arrayFirst(this.Members(), function (mem) {
            return mem.MemberLevelID() > currentMemberLevel;
        });
        if (topMember != null) {
            notify('error', 'لا يمكنك غلق الغرفة فى وجود ' + topMember.MemberName());
            return;
        }
        self.viewModel.rHub.server.closeRoom(window.ID(), window.CurrentMember().MemberID(), window.CurrentMember().MemberName());
        $("#controlPanelModal_" + window.uniqueID()).modal('hide');
    };
    this.saveRoomTopic = function () {
        var window = this;
        self.viewModel.rHub.server.updateRoomTopic(window.ID(), window.RoomTopic());
    }
    this.updateSocialLinks = function () {
        var window = this;
        self.viewModel.rHub.server.updateSocialLinks(window.ID(), window.fbURL(), window.tURL(), window.utURL());
    };
    // invite friends
    this.ShowInviteFriends = function () {
        $("#inviteModal_" + self.uniqueID()).modal('show');
    };
    this.Invitefriends = function () {
        var window = this;
        var cbs = $('#inviteMembers_' + window.uniqueID() + ' input:checked');
        var ToMember = '';
        $.each(cbs, function () {
            ToMember += $(this).val() + ',';
        });
        $.ajax({
            url: '../Services/Services.asmx/InviteFriends',
            dataType: 'json',
            type: 'post',
            data: "{'memberName':'" + self.CurrentMember().MemberName() + "', 'roomID' : " + window.ID() + ", 'roomName' :'" + window.Name() + "','friendsIDs':'" + ToMember + "'}",
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                notify('success', 'تم دعوة الأصدقاء بنجاح');
                $("#inviteModal_" + window.uniqueID()).modal('hide');
                return;
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                $("#inviteModal_" + window.uniqueID()).modal('hide');
                notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
            }
        });
    };
    // send gifts to friends
    this.ShowSendGift = function () {
        $("#giftModal_" + self.uniqueID()).modal('show');
    };
    this.selectGift = function () {
        self.selectedGift = this;
        $('#giftUL_' + self.uniqueID()).find('label').removeClass('selected');
        $('#giftUL_' + self.uniqueID() + ' #gift_' + self.selectedGift.giftid()).next('label').addClass('selected');

    };
    this.SendGift = function () {
        var window = this;
        // get selected members
        var cbs = $('#giftMembers_' + window.uniqueID() + ' input:checked');
        var ToMember = [];
        $.each(cbs, function () {
            var member = { ID: $(this).val(), Name: $(this).attr('data-member-name') };
            ToMember.push(member);
        });
        var total = window.selectedGift.price() * ToMember.length;
        if (total > self.viewModel.creditPoints()) {
            notify('error', 'حدث خطأ . ليس لديك رصيد كافى.');
            $("#giftModal_" + window.uniqueID()).modal('hide');
            return;
        }
        else {
            $.ajax({
                url: '../Services/Services.asmx/SendGift',
                dataType: 'json',
                type: 'post',
                data: "{'memberName':'" + self.CurrentMember().MemberName() + "', 'roomID' : " + window.ID() + ", 'roomName' :'" + window.Name() + "','friends':" + JSON.stringify(ToMember) + ", 'giftid':" + window.selectedGift.giftid() + "}",
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    $("#giftModal_" + window.uniqueID()).modal('hide');
                    notify('success', 'تم إرسال الهدية بنجاح');
                    $('#uiHiddenFieldCreditPoints').val(self.viewModel.creditPoints() - total);
                    self.viewModel.creditPoints($('#uiHiddenFieldCreditPoints').val());
                    return;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    $("#giftModal_" + window.uniqueID()).modal('hide');
                    notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
                }
            });
        }
    };
    // attach
    this.ShowAttachFiles = function () {
        $("#attachModal_" + self.uniqueID()).modal('show');

        // clear fields & init hiddenfields
        var hiddenfield = $('#UploadFileName_' + self.uniqueID());
        hiddenfield.val('');
        $('#UploadFileName_' + self.uniqueID()).val('');
        $('#UploadStatus_' + self.uniqueID()).html('');
        $('#UploadButton_' + self.uniqueID()).show();
        $('#uploadSendbtn_' + self.uniqueID()).hide();
        $('#UploadedFile_' + self.uniqueID()).html('');
        $('#videoURL_' + self.uniqueID()).val('');
    };
    // audio 
    this.audioAttachment = "";
    this.UpdateAudioAttachment = function (audioDiv) {
        this.audioAttachment = audioDiv;
    };
    this.SendAudio = function () {
        if (this.audioAttachment != "") {
            self.viewModel.rHub.server.sendToRoom(self.ID(), self.CurrentMember().MemberID(), self.CurrentMember().MemberName(), self.audioAttachment, self.CurrentMember().MemberLevelID(), self.CurrentMember().ProfileImg(), self.CurrentMember().MemberTypeID());
            $("#attachModal_" + self.uniqueID()).modal('hide');
            self.audioAttachment = "";
        }
    };

    //admin part
    this.showAdminPart = ko.observable(false);
    if (this.Type() == "Room" && this.CurrentMember().MemberLevelID() > 1) {
        this.showAdminPart = ko.observable(true);
    }
    this.toggleAdminPart = function () {
        self.showAdminPart(!self.showAdminPart());
        yscroll = $(".MsgHistroy", " #" + self.uniqueID()).prop('scrollHeight') + 'px';
        if (self.showAdminPart()) {
            $(".MsgHistroy", " #" + self.uniqueID()).slimScroll({
                railVisible: true,
                height: "250px",
                color: '#FEC401',
                railColor: '#C7C5C0',
                position: 'left',
                scrollTo: yscroll  //$(".MsgHistroy", " #" + this.uniqueID()).height()
            });
            $(".MsgHistroy", " #" + self.uniqueID()).parent().animate({ height: 250 }, 700);
        }
        else {
            $(".MsgHistroy", " #" + self.uniqueID()).slimScroll({
                railVisible: true,
                height: "400px",
                color: '#FEC401',
                railColor: '#C7C5C0',
                position: 'left',
                scrollTo: yscroll  //$(".MsgHistroy", " #" + this.uniqueID()).height()
            });
            $(".MsgHistroy", " #" + self.uniqueID()).parent().animate({ height: 400 }, 700);
        }

    };

    // flash object 
    this.showFlashObject = ko.observable(true);
    this.toggleFlashObj = function (window) {
        self.showFlashObject(!self.showFlashObject());
    }
    //messages
    this.AdminMessageHistory = ko.observableArray();
    this.toggleMessageTime = function () { };
    function chatMessage(msg, senderImg) {
        if (senderImg == null || senderImg == undefined || senderImg == '')
            senderImg = 'images/defaultavatar.png';
        var msgData = { ID: 9999999, FromName: "", Message: msg, MessageDate: null, MemberLevel: 1, FromProfileImg: senderImg, FromID: 0, MemberTypeID: 1 };
        return ko.mapping.fromJS(msgData, {}, this);
    }
    this.oldestMsgID = function () {
        var id = Math.min.apply(null, ko.utils.arrayMap(self.MessageHistory(), function (m) {
            return m.ID();
        }));
        return id;
    };
    this.addNotificationMessage = function (msg) {
        var message = new chatMessage(msg);
        this.addMessage(message);
    };
    this.addBotMsg = function (msg, botImg) {
        botImg = botImg + '_' + this.Settings.TypeID() + '.png';
        msg = '<span class="botMsg" style="color:' + this.Settings.Color() + '">' + msg + '</span>';
        var message = new chatMessage(msg, botImg);
        this.addMessage(message);
    };
    this.addMessage = function (msg) {
        this.MessageHistory.push(msg);
        yscroll = $(".MsgHistroy", " #" + this.uniqueID()).prop('scrollHeight') + 'px';
        $(".MsgHistroy").slimScroll({
            railVisible: true,
            height: $(".MsgHistroy", " #" + this.uniqueID()).attr('data-height'),
            color: '#FEC401',
            railColor: '#C7C5C0',
            position: 'left',
            scrollTo: yscroll  //$(".MsgHistroy", " #" + this.uniqueID()).height()
        });

        if (!this.IsActive) {
            $('#MainTabs a[href="#' + this.uniqueID() + '"]').addClass('RoomAlertRed');
        }

        /* update save coversation link*/
        this.SaveConversation();

    };
    this.addAdminMessage = function (msg) {
        this.AdminMessageHistory.push(msg);
        $(".AdminMsgHistroy").slimScroll({
            railVisible: true,
            height: $(".AdminMsgHistroy", " #" + this.uniqueID()).attr('data-height'),
            color: '#FEC401',
            railColor: '#C7C5C0',
            position: 'left',
            scrollTo: "'" + $(".AdminMsgHistroy", " #" + this.uniqueID()).prop('scrollHeight') + "px'" //$(".AdminMsgHistroy", " #" + this.uniqueID()).height()
        });
    };
    this.SaveConversation = function () {
        var str = "<link href='http://chat2connect.com/css/bootstrap.min.css' rel='stylesheet' /> <link href='http://chat2connect.com/css/main.css' rel='stylesheet' /> ";
        ko.utils.arrayForEach(self.MessageHistory(), function (msg) {
            if (msg.FromName && msg.Message)
                str += msg.FromName + ":" + msg.Message + "<br />";
        });

        $('#SaveConv_' + self.ID()).click(function () {
            this.href = "data:html/plain;charset=UTF-8," + str;
        });
    };
    this.showOlderMessages = function () {
        var window = this;
        var oldestID = window.oldestMsgID();
        $.ajax({
            url: '../Services/Services.asmx/GetRoomOlderMessages',
            type: 'GET',
            data: { roomid: window.ID(), oldestMsgID: oldestID },
            success: function (result) {
                $.each(result, function (index) {
                    self.MessageHistory.splice(index, 0, result[index]);
                });
            }
        });
    };
    //Room supervisor
    this.clearQueue = function () {
        var window = this;
        self.viewModel.rHub.server.clearQueue(window.ID());
    };
    this.updateRoomSetting = function (settingName) {
        var window = this;
        var newValue = !window.Settings[settingName]();

        // change opposite settings
        if (settingName == "MarkOnLoginWithWrite" && newValue) {
            self.viewModel.rHub.server.updateRoomSetting(window.ID(), "MarkOnLoginWithoutWrite", !newValue);
            window.Settings["MarkOnLoginWithoutWrite"](!newValue);
        }

        if (settingName == "MarkOnLoginWithoutWrite" && newValue) {
            self.viewModel.rHub.server.updateRoomSetting(window.ID(), "MarkOnLoginWithWrite", !newValue);
            window.Settings["MarkOnLoginWithWrite"](!newValue);
        }

        // apply new settings
        self.viewModel.rHub.server.updateRoomSetting(window.ID(), settingName, newValue);
        window.Settings[settingName](newValue);

        return true;
    }
    this.MarkAllWithWriteCheck = ko.observable(false);
    this.markAllWithWrite = function () {
        var window = this;
        var newValue = !window.MarkAllWithWriteCheck();
        // change opposite settings
        if (newValue) {
            self.viewModel.rHub.server.markAllWithoutWrite(window.ID(), !newValue, window.CurrentMember().MemberID());
            window.MarkAllWithoutWriteCheck(!newValue);
        }

        // apply new settings
        self.viewModel.rHub.server.markAllWithWrite(window.ID(), newValue, window.CurrentMember().MemberID());
        window.MarkAllWithWriteCheck(newValue);


        return true;
    };
    this.MarkAllWithoutWriteCheck = ko.observable(false);
    this.markAllWithoutWrite = function () {
        var window = this;
        var newValue = !window.MarkAllWithoutWriteCheck();
        // change opposite settings
        if (newValue) {
            self.viewModel.rHub.server.markAllWithWrite(window.ID(), !newValue, window.CurrentMember().MemberID());
            window.MarkAllWithWriteCheck(!newValue);
        }

        // apply new settings
        self.viewModel.rHub.server.markAllWithoutWrite(window.ID(), newValue, window.CurrentMember().MemberID());
        window.MarkAllWithoutWriteCheck(newValue);


        return true;
    };

    //Mic Methods
    this.toggleMic = function () {
        var window = this;
        if (window.CurrentMember().IsMicOpened() == false) {
            window.startMic(window.CurrentMember().MemberID());
        }
        else {
            window.stopMic(window.CurrentMember().MemberID());
        }
    }
    this.requestMic = function () {
        var window = this;
        $.ajax({
            url: '../Services/Services.asmx/GetQueueOrder',
            dataType: 'json',
            type: 'post',
            data: "{'memberID':'" + window.CurrentMember().MemberID() + "', 'roomID' : '" + window.ID() + "' }",
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                if (data.d > 0) {
                    //move from roomMembers to queueMembers
                    window.CurrentMember().QueueOrder(data.d);
                    self.viewModel.rHub.server.userRaisHand(window.ID(), window.CurrentMember().MemberID(), window.CurrentMember().QueueOrder());
                }
                else {
                    //move from queueMembers to roomMembers
                    window.CurrentMember().QueueOrder(null);
                    self.viewModel.rHub.server.userDownHand(window.ID(), window.CurrentMember().MemberID());
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                notify('error', 'حدث خطأ . من فضلك أعد المحاولة')
            }
        });
    }
    this.startMic = function (memberid) {
        var window = this;
        var member = window.getMember(memberid);
        if (member != null) {
            getFlashMovie('chat2connect_' + window.uniqueID()).startMic(memberid);
            member.IsMicOpened(true);
            if (window.Type() == 'Private') {
                // start mic to friend
                if (window.CurrentMember().MemberID() == memberid) {
                    self.viewModel.rHub.server.userStartMic_Private(window.ID(), memberid);
                }
                else {
                    if (window.CurrentMember().NotifyOnMicOn()) {
                        var msg = member.MemberName() + ' أخذ المايك ';
                        addMsgToWindow(window, msg, "joinalert");
                    }
                }
                return;
            }
            // remove member from list and add it to mic
            member.QueueOrder(null);
            window.MicMember(member);
            if (window.CurrentMember().MemberID() == memberid) {
                self.viewModel.rHub.server.userStartMic(window.ID(), memberid);
            }
            else {
                if (window.CurrentMember().NotifyOnMicOn()) {
                    var msg = member.MemberName() + ' أخذ المايك ';
                    addMsgToWindow(window, msg, "joinalert");
                }
            }
        }
    }
    this.stopMic = function (memberid) {
        var window = this;
        var member = window.getMember(memberid);
        if (member != null) {
            getFlashMovie('chat2connect_' + window.uniqueID()).stopMic(memberid);
            member.IsMicOpened(false);
            if (window.Type() == 'Private') {
                // stop mic for friend            
                if (window.CurrentMember().MemberID() == memberid) {
                    self.viewModel.rHub.server.userStopMic_Private(window.ID(), memberid);
                }
                else {
                    if (window.CurrentMember().NotifyOnMicOff()) {
                        var msg = member.MemberName() + ' ترك المايك ';
                        addMsgToWindow(window, msg, "leftalert");
                    }
                }
                return;
            }
            member.QueueOrder(null);
            window.MicMember(null);
            if (window.CurrentMember().MemberID() == memberid)
                self.viewModel.rHub.server.userStopMic(window.ID(), memberid)
            else {
                if (window.CurrentMember().NotifyOnMicOff()) {
                    var msg = member.MemberName() + ' ترك المايك ';
                    addMsgToWindow(window, msg, "leftalert");
                }
            }
        }
    }
    //cam methods
    this.toggleCam = function () {
        var window = this;
        if (window.CurrentMember().IsCamOpened() == false) {
            window.startCam(window.CurrentMember().MemberID());
        }
        else {
            window.stopCam(window.CurrentMember().MemberID());
        }
    }
    this.startCam = function (memberID) {
        var window = this;
        var member = window.getMember(memberID);
        getFlashMovie('chat2connect_' + window.uniqueID()).startCam(memberID, member.MemberName());

        if (window.Type() == 'Private') {
            // show cam to friend 
            if (window.CurrentMember().MemberID() == memberID) {
                self.viewModel.rHub.server.userStartCam_Private(window.ID(), memberID);
            }
            else {
                if (window.CurrentMember().NotifyOnOpenCam()) {
                    var msg = member.MemberName() + ' قد بدأ فتح الكمراء';
                    addMsgToWindow(window, msg, "joinalert");
                }
            }
            return;
        }
        if (window.CurrentMember().MemberID() == memberID) {
            self.viewModel.rHub.server.userStartCam(window.ID(), window.CurrentMember().MemberID());
            member.IsCamOpened(true);
        }
    }
    this.stopCam = function (memberID) {
        var window = this;
        getFlashMovie('chat2connect_' + window.uniqueID()).stopCam(memberID);
        var member = window.getMember(memberID);
        if (member == null)
            return;

        if (window.Type() == 'Private') {
            // close cam on friend
            if (window.CurrentMember().MemberID() == memberID) {
                self.viewModel.rHub.server.userStopCam_Private(window.ID(), memberID);
            }
            else {
                if (window.CurrentMember().NotifyOnCloseCam()) {
                    var msg = member.MemberName() + ' أغلق الكمراء';
                    addMsgToWindow(window, msg, "leftalert");
                }
            }
            return;
        }
        if (window.CurrentMember().MemberID() == memberID) {
            self.viewModel.rHub.server.userStopCam(window.ID(), window.CurrentMember().MemberID());
            member.IsCamOpened(false);
        }
    }

    $.ajax({
        url: '../Services/Services.asmx/LoadWindowEditorSettings?mid=' + self.viewModel.memberID + '&windowID=' + this.ID() + '&type=' + this.Type(),
        success: function (data) {
            self.IsBold(data.IsBold);
            self.IsItalic(data.IsItalic);
            self.FontSize(data.FontSize);
            self.ForeColor(data.ForeColor);
        }
    });
    this.initEditor = function () {
        this.Editor.setValue("");
        if (self.IsBold()) {
            self.Editor.composer.commands.exec("bold");
            $('btnBold_' + self.uniqueID()).click();
        }
        if (self.IsItalic()) {
            self.Editor.composer.commands.exec("italic");
            $('btnItalic_' + self.uniqueID()).click();
        }
        // self.Editor.composer.commands.exec("fontSize", self.FontSize);
        self.Editor.composer.commands.exec("foreColor", self.ForeColor());

    }

    this.saveEditorSetting = function () {
        var settings = JSON.stringify({ IsBold: self.IsBold(), IsItalic: self.IsItalic(), FontSize: self.FontSize(), ForeColor: self.ForeColor() });
        $.post("../Services/Services.asmx/UpdateWindowEditorSettings", { mid: self.viewModel.memberID, windowID: self.ID(), type: self.Type(), settings: settings });
    };
    this.showRoomInfo = function () {
        $("#infoModal_" + self.uniqueID()).modal('show');
    };

    this.RoomBots = ko.observableArray([]);
    if (this.Type() == 'Room') {
        $.ajax({
            url: '../Services/Services.asmx/LoadRoomBots?roomID=' + this.ID(),
            success: function (data) {
                ko.utils.arrayMap(data, function (item) {
                    self.RoomBots.push(ko.mapping.fromJS(item));
                })
            }
        });
    }
    this.roomBotsModalID = "roomBotModal_" + this.uniqueID();
    this.showRoomBots = function () {
        var window = this;
        $("#" + this.roomBotsModalID).modal('show');
    };
    this.saveRoomBots = function () {
        var window = this;
        $.post("../Services/Services.asmx/SaveRoomBots", { roomBots: ko.toJSON(window.RoomBots) })
            .done(function (data) {

            });
        $("#" + window.roomBotsModalID).modal('hide');
    };
    this.addRoomBot = function (roomBot) {
        this.RoomBots.push(ko.mapping.fromJS(roomBot));
    };
    this.allowInviteFriends = ko.computed(function () {
        if (self.Type() == 'Private')
            return null;
        var inviteBanBot = ko.utils.arrayFirst(self.RoomBots(), function (bot) {
            return bot.IsEnabled() && bot.BotID() == inviteFriendBanBotID;
        });
        if (inviteBanBot != null && inviteBanBot != undefined) {
            var currentMemberBan = ko.utils.arrayFirst(inviteBanBot.Settings.BannedMemberLevels(), function (bannedLevel) {
                return bannedLevel == self.CurrentMember().MemberLevelID();
            });
            return currentMemberBan == null;
        }
        return true;
    }, this);
    this.hasEmailOwnerBot = ko.computed(function () {
        if (self.Type() == 'Private')
            return null;
        var emailOwnerBot = ko.utils.arrayFirst(self.RoomBots(), function (bot) {
            return bot.IsEnabled() && bot.BotID() == emailOwnerBotID;
        });
        if (emailOwnerBot != null && emailOwnerBot != undefined) {
            return true;
        }
        return false;
    }, this);
    this.roomEmailOwnerBotMsg = ko.observable();
    this.roomEmailOwnerBotModal = "roomEmailOwnerBotModal_" + this.uniqueID();
    this.showEmailOwnerBot = function () {
        $("#" + self.roomEmailOwnerBotModal).modal('show');
    };
    this.sendRoomEmailOwnerBotMsg = function () {
        $.ajax({
            url: "../Services/Services.asmx/SendEmailOwnerBotMsg",
            dataType: "json",
            type: "post",
            data: JSON.stringify({ roomID: self.ID(), message: self.roomEmailOwnerBotMsg() }),
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                if (data.d == false) {
                    notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
                }
                else if (data.d == true) {
                    notify('success', 'تم الإرسال بنجاح.');
                }
                $("#" + self.roomEmailOwnerBotModal).modal('hide');
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
            }
        });
    };
    this.roomFriendsBotMsg = ko.observable();
    this.roomFriendsBotModalID = "roomFriendsBotModal_" + this.uniqueID();
    this.hasRoomFriendsBot = ko.computed(function () {
        if (self.Type() == 'Private')
            return null;
        var bot = ko.utils.arrayFirst(self.RoomBots(), function (item) {
            return item.IsEnabled() && item.BotID() == roomFriendsBotID;
        });
        if (bot != null && bot != undefined) {
            return true;
        }
        return false;
    }, this);
    this.showRoomFriendsBot = function () {
        $("#" + self.roomFriendsBotModalID).modal('show');
    };
    this.sendRoomFriendsBotMsg = function () {
        var msg = this.roomFriendsBotMsg();
        $.ajax({
            url: "../Services/Services.asmx/SendRoomFriendsBotMsg",
            dataType: "json",
            type: "post",
            data: JSON.stringify({ roomID: self.ID(), message: msg }),
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                if (data.d == false) {
                    notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
                }
                else if (data.d == true) {
                    notify('success', 'تم الإرسال بنجاح.');
                }
                $("#" + self.roomFriendsBotModalID).modal('hide');
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
            }
        });
    };
    this.hasRoomLawBot = ko.computed(function () {
        if (self.Type() == 'Private')
            return null;
        var bot = ko.utils.arrayFirst(self.RoomBots(), function (item) {
            return item.IsEnabled() && item.BotID() == roomLawBotID;
        });
        if (bot != null && bot != undefined) {
            return true;
        }
        return false;
    }, this);
    this.hasRoomProgramBot = ko.computed(function () {
        if (self.Type() == 'Private')
            return null;
        var bot = ko.utils.arrayFirst(self.RoomBots(), function (item) {
            return item.IsEnabled() && item.BotID() == roomProgramBotID;
        });
        if (bot != null && bot != undefined) {
            return true;
        }
        return false;
    }, this);

    this.showRoomLaw = function () {
        $.post("../Services/Services.asmx/ShowRoomLaw", { roomID: this.ID() })
            .done(function (data) {
            });
    };
    this.showRoomProgram = function () {
        $.post("../Services/Services.asmx/ShowRoomProgram", { roomID: this.ID() })
            .done(function (data) {
            });
    };

    this.updateMemberType = function (mid, mTypeSpecID) {
        var member = this.getMember(mid);
        if (member != null) {
            member.MemberTypeID(mTypeSpecID);
        }
    }
    this.ToggleFav = function () {
        var window = this;
        $.ajax({
            url: "../Services/Services.asmx/ToggleFav",
            dataType: "json",
            type: "post",
            data: "{'rid':'" + window.ID() + "'}",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                if (data.d == false) {
                    notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
                }
                else if (data.d == true) {
                    var oldvalue = window.CurrentMember().IsFavorite();
                    window.CurrentMember().IsFavorite(!oldvalue);
                    if (oldvalue)
                        notify('success', 'تم حذف الغرفة من المفضلة بنجاح.');
                    else
                        notify('success', 'تم إضافة الغرفة إلى المفضلة بنجاح.');
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                //$('#pGeneral').css('display', 'none');
                $("#favlink_" + rid).css('display', 'block');
                notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
            }
        });
    };

    self.rateRoom = function (val) {
        var room = this;
        RateRoom(room.ID(), val);
        room.CurrentMember().UserRate(val);
        return true;
    }
    self.sendMessage = function () {
        var window = this;
        if (window.Type() == "Room") {
            if (!window.CurrentMember().InRoom()) {
                self.viewModel.rHub.server.showMemberInRoom(window.ID(), window.CurrentMember().MemberID());
            }
            self.viewModel.rHub.server.sendToRoom(window.ID(), window.CurrentMember().MemberID(), window.CurrentMember().MemberName(), window.Editor.getValue(), window.CurrentMember().MemberLevelID(), window.CurrentMember().ProfileImg(), window.CurrentMember().MemberTypeID());
        }
        else {
            self.viewModel.rHub.server.sendPrivateMessage(window.ID(), window.Editor.getValue(), window.CurrentMember().ProfileImg());
        }
        //window.Message("");
        window.initEditor();
        /* window.Editor.setValue("");*/
        $('#emotionMenu_' + window.ID()).hide();
    }
    self.sendAdminMessage = function (window) {
        if (window == null)
            window = this;
        if (window.Type() == "Room" && window.CurrentMember().MemberLevelID() > 1) {
            self.viewModel.rHub.server.sendToRoomAdmins(window.ID(), window.CurrentMember().MemberID(), window.CurrentMember().MemberName(), window.AdminsEditor.getValue(), window.CurrentMember().ProfileImg(), window.CurrentMember().MemberLevelID());
            window.AdminsEditor.setValue("");
        }
    };
    self.muteRoom = function (window) {
        if ($('#mute_' + window.uniqueID()).attr('data-mute') == 'false') {
            self.setListenVolume(window, 0);
            $('#mute_' + window.uniqueID()).attr('data-mute', 'true');
        }
        else {
            self.setListenVolume(window, $('#uiListenVolume_' + window.uniqueID()).data('slider').getValue());
            $('#mute_' + window.uniqueID()).attr('data-mute', 'false');
        }

    };
    self.setListenVolume = function setPlaybackVolume(window, volume) {
        getFlashMovie('chat2connect_' + window.uniqueID()).setPlaybackVolume(volume / 10.0);
    };

    self.sendVideo = function (window) {
        var url = $('#videoURL_' + window.uniqueID()).val();
        if (url == '')
            return false;
        var arr = url.split('v='); // remove "youtube.com/watch?v="
        var id = [];
        if (arr.length > 1)
            id = arr[1].split('&'); // extract vedio id from query string - first element in the array

        var randomid = Math.floor((Math.random() * 100000) + 1);
        var videoLink = "<div style='margin:0 auto;text-align:center;'><a href='#videoModal_" + randomid + "' data-toggle='modal' style='text-decoration:none;'><img src='http://img.youtube.com/vi/" + id[0] + "/0.jpg' style='width:160px;margin:0 !important;' /></a></div>";
        var iframe = "<iframe id='player' type='text/html' src='http://www.youtube.com/embed/" + id[0] + "?enablejsapi=1' frameborder='0' style='max-width:100%;min-height:400px;width:450px;'></iframe>"
        var modaldiv = "<div id='videoModal_" + randomid + "' class='modal fade' role='modal' aria-hidden='true'><div class='modal-dialog'><div class='modal-content'><div class='modal-header'><a class='close pull-left' data-dismiss='modal' aria-hidden='true' style='text-decoration: none;'>×</a><h3 id='myModalLabel1' class='pull-right'>فيديو</h3><div style='clear:both;height:1px;'></div></div><div class='modal-body'><div class='form-horizontal blockBox'><div class='row'><div class='col-sm-12 center'>" + iframe + "</div></div></div></div></div></div></div>";
        var newMsg = videoLink + modaldiv;
        self.viewModel.rHub.server.sendToRoom(window.ID(), window.CurrentMember().MemberID(), window.CurrentMember().MemberName(), newMsg, window.CurrentMember().MemberLevelID(), window.CurrentMember().ProfileImg(), window.CurrentMember().MemberTypeID());
        $("#attachModal_" + window.uniqueID()).modal('hide');
    }

    self.sendAudio = function (window) {
        if (window.audioAttachment != "") {
            self.viewModel.rHub.server.sendToRoom(window.ID(), window.CurrentMember().MemberID(), window.CurrentMember().MemberName(), window.audioAttachment, window.CurrentMember().MemberLevelID(), window.CurrentMember().ProfileImg(), window.CurrentMember().MemberTypeID());
            $("#attachModal_" + window.uniqueID()).modal('hide');
            window.audioAttachment = "";
        }
    };

    self.sendImage = function (window) {
        if (window == null)
            return;
        var hiddenfield = $('#UploadFileName_' + window.uniqueID());
        if (hiddenfield.val() != '') {
            var randomid = Math.floor((Math.random() * 100000) + 1);
            var imageDiv = "<div style='margin:0 auto;text-align:center;'><a href='#imageModal_" + randomid + "' data-toggle='modal' style='text-decoration:none;'><img src='images.aspx?Image=files/rooms/attachedimages/" + hiddenfield.val() + "' style='margin:0 !important;'/></a></div>";

            var modaldiv = "<div id='imageModal_" + randomid + "' class='modal fade' role='modal' aria-hidden='true'><div class='modal-dialog'><div class='modal-content'><div class='modal-header'><a class='close pull-left' data-dismiss='modal' aria-hidden='true' style='text-decoration: none;'>×</a><h3 id='myModalLabel1' class='pull-right'>صورة</h3><div style='clear:both;height:1px;'></div></div><div class='modal-body'><div class='form-horizontal blockBox'><div class='row'><div class='col-sm-10 center'><img src='files/rooms/attachedimages/" + hiddenfield.val() + "' style='max-height:400px;max-width:450px;'/></div></div></div></div></div></div></div>";

            self.viewModel.rHub.server.sendToRoom(window.ID(), window.CurrentMember().MemberID(), window.CurrentMember().MemberName(), imageDiv + modaldiv, window.CurrentMember().MemberLevelID(), window.CurrentMember().ProfileImg(), window.CurrentMember().MemberTypeID());
        }
        hiddenfield.val('');
        $('#UploadFileName_' + window.uniqueID()).val('');
        $('#UploadStatus_' + window.uniqueID()).html('');
        $('#UploadButton_' + window.uniqueID()).show();
        $('#uploadSendbtn_' + window.uniqueID()).hide();
        $('#UploadedFile_' + window.uniqueID()).html('');
        $("#attachModal_" + window.uniqueID()).modal('hide');
    }

    self.Init = function () {
        var window = this;
        $("#" + window.uniqueID() + " .emotionMenu > button.dropdown-toggle").click(function (e) {
            e.stopPropagation();
            $(this).next('.dropdown-menu').toggle();
        });
/*
        $("#" + window.uniqueID() + " .adminSettingsMenu > button.dropdown-toggle").click(function (e) {
            e.stopPropagation();            
            $(this).next('.dropdown-menu').toggle();
        });  */

        $("#" + window.uniqueID() + ' .adminSettingsMenu .dropdown-menu').on({
            "click": function (e) {
                e.stopPropagation();
            }
        });


        window.Editor = new wysihtml5.Editor('uiTextMsg_' + window.uniqueID(), { toolbar: 'toolbar' + window.uniqueID(), parserRules: wysihtml5ParserRules, useLineBreaks: false, stylesheets: 'css/main.css' });

        if (window.Type() == 'Room' && $('#uiTextAdminMsg_' + window.uniqueID()).length > 0) {
            window.AdminsEditor = new wysihtml5.Editor('uiTextAdminMsg_' + window.uniqueID(), { parserRules: wysihtml5ParserRules, useLineBreaks: false, stylesheets: 'css/main.css' });
            if (window.AdminsEditor != null && window.AdminsEditor != undefined) {
                window.AdminsEditor.observe('load', function () {
                    window.AdminsEditor.composer.element.addEventListener('keyup', function (e) {
                        if (e.which == 13) {
                            e.preventDefault();
                            self.sendAdminMessage(window);
                        }
                    });
                });
            }
        }
        // apply enter key listener
        window.Editor.observe('load', function () {
            window.Editor.composer.element.addEventListener('keyup', function (e) {
                if (e.which == 13) {
                    e.preventDefault();
                    if (window.Type() == 'Room' && !window.CurrentMember().CanWrite())
                        return;
                    self.sendMessage(window);
                }
            });
        });
        // popover menu for members
        initPopover(window);

        // tooltips 
        $(".roomMenuItem").tooltip();
        // apply scroll to all
        $('.SScroll').each(function () {
            $(this).slimScroll({
                railVisible: true,
                height: $(this).attr('data-height'),
                color: '#FEC401',
                railColor: '#C7C5C0',
                position: 'left'
            });
        });
        // token input for invite members
        $("#invite_" + window.uniqueID()).tokenInput("Services/Services.asmx/SearchMembersFriends?memberID=" + self.CurrentMemberID, {
            theme: "facebook",
            preventDuplicates: true,
            hintText: "",
            noResultsText: "لا يوجد",
            searchingText: "بحث فى الأصدقاء..."
        });

        //view gifts 
        // get all prices loaded
        var items = {};
        $('#giftUL_' + window.uniqueID() + ' ul li').each(function () {
            items[$(this).attr('data-cat')] = true;
        });

        // select distinct price values
        var result = new Array();
        for (var i in items) {
            result.push(i);
        }

        // group gifts by prices
        for (i = 0; i < result.length; i++) {
            var wrapper = $('#giftUL_' + window.uniqueID() + ' li[data-cat="' + result[i] + '"]').wrapAll('<div id="wrapper_' + window.uniqueID() + "_" + i + '" class="collapse" />');
            $('<a class="btn btn-default" data-toggle="collapse" data-target="#wrapper_' + window.uniqueID() + "_" + i + '" style="width:100%">' + result[i] + ' نقطة' + '</a><div class="clear" style="height:2px;"></div>').insertBefore(wrapper.parent());
            $('<div class="clear" style="height:2px;"></div>').appendTo(wrapper.parent());
            // open 1st panel only
            if (i == 0)
                wrapper.parent().addClass('in');
        }

        // init send gift link for room member 
        $('.MemberSendGift').click(function () {
            $("#giftModal_" + window.uniqueID()).modal('show');
            $('#giftModal_' + window.uniqueID() + ' input.checkboxes').each(function () {
                $(this).attr('checked', false);
            });
            $('#giftModal_' + window.uniqueID() + ' input.checkboxes[value="' + $(this).attr('data-mid') + '"]').attr('checked', true);
        });


        // volume controls       

        $('#uiListenVolume_' + window.uniqueID()).slider()
          .on('slide', function (ev) {
              // check if room is not muted
              if ($('#mute_' + window.uniqueID()).attr('data-mute') == 'false')
                  self.setListenVolume(window, $('#uiListenVolume_' + window.uniqueID()).data('slider').getValue());
          });
        $('#uiMicVolume_' + window.uniqueID()).slider()
         .on('slide', function (ev) {
             self.setMicVolume(window, $('#uiMicVolume_' + window.uniqueID()).data('slider').getValue());
         });


        // attach files
        new AjaxUpload('#UploadButton_' + window.uniqueID(), {
            action: '../services/FileUploader.ashx',
            onComplete: function (file, response) {
                var div = '<div><img src="../images/btndelete.png" onclick="' + "DeleteFile(" + window.ID() + ",'" + response + "')\" class='delete' style='cursor:pointer;' title='حذف الصورة'/>" + response + '</div>';
                $(div).appendTo('#UploadedFile_' + window.uniqueID());
                $('#UploadFileName_' + window.uniqueID()).val(response);
                $('#UploadStatus_' + window.uniqueID()).html('تم رفع الصورة بنجاح');
                $('#UploadButton_' + window.uniqueID()).hide();
                $('#uploadSendbtn_' + window.uniqueID()).show();
            },
            onSubmit: function (file, ext) {
                if (!(ext && /^(png|gif|jpg)$/i.test(ext))) {
                    alert('حدث خطأ . تأكد من نوع ملف الصورة');
                    return false;
                }
                $('#UploadStatus_' + window.uniqueID()).html('جارى التحميل...');
            }
        });

        if (window.Type() == "Room" && window.CurrentMember().MemberLevelID() > 1) //MemberLevelID>1>>> Admin
        {
            var names = ko.utils.arrayMap(window.Members(), function (item) {
                return item.MemberName();
            });

            $("#txtBanMemberName_" + window.uniqueID()).autocomplete({
                source: names
            });
        }

        // add welcome message
        if (window.Type() == "Room") {
            if (window.WelcomeBot.hasOwnProperty("LoginMsgPart1")) {
                var msg = window.WelcomeBot.LoginMsgPart1() + ' ' + window.CurrentMember().MemberName() + ' ' + window.WelcomeBot.LoginMsgPart2();
                var botImg = "/images/bots/welcome";
                window.addBotMsg(msg,botImg);
            }
        }

        

    };
}
