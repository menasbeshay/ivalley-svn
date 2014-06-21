
ko.bindingHandlers.slideVisible = {
    init: function (element, valueAccessor) {
        var value = valueAccessor();
        $(element).toggle(ko.unwrap(value));
    },
    update: function (element, valueAccessor) {
        var value = valueAccessor();
        ko.unwrap(value) ? $(element).slideDown(700) : $(element).slideUp(700);
    }
};

ko.bindingHandlers.date = {
    update: function (element, valueAccessor, allBindingsAccessor, viewModel) {
        var value = valueAccessor();
        var allBindings = allBindingsAccessor();
        var valueUnwrapped = ko.utils.unwrapObservable(value);
        // Date formats: http://momentjs.com/docs/#/displaying/format/
        var pattern = allBindings.format || 'DD/MM/YYYY';
        var output = "-";
        if (valueUnwrapped !== null && valueUnwrapped !== undefined && valueUnwrapped.length > 0) {
            output = moment(valueUnwrapped).format(pattern);
        }

        if ($(element).is("input") === true) {
            $(element).val(output);
        } else {
            $(element).text(output);
        }
    }
};
function Chat(maxWin, memberID, memberName) {
    var self = this;
    self.CurrentMemberID = memberID;
    self.CurrentMemberName = memberName;
    self.CreditPoints = ko.observable($("#uiHiddenFieldCreditPoints").val());
    self.maxRoom = ko.observable(maxWin);
    self.windows = ko.observableArray();
    self.OnlineFriends = ko.observableArray();

    self.notTempRoom = ko.computed(function () {
        return ko.utils.arrayFilter(self.windows(), function (win) {
            return win.IsTemp() == false && win.Type() == "Room";
        });
    }, self);
    self.allRooms = ko.computed(function () {
        return ko.utils.arrayFilter(self.windows(), function (win) {
            return win.Type() == "Room";
        });
    }, self);
    self.getWindow = function (id, type, name) {
        var window = ko.utils.arrayFirst(self.windows(), function (win) {
            return win.ID() == id && win.Type() == type;
        });
        if (window == null) {
            if (type == "Private") {
                chatVM.addWindow(id, name, type);
                // generated id for private chat
                //var newroomid = (id < self.CurrentMemberID) ? id + "_" + self.CurrentMemberID : self.CurrentMemberID + "_" + id;
                //window = chatVM.getWindow(newroomid, type);
                window = chatVM.getWindow(id, type);
            }
        }
        return window;
    }

    // init online friends    
    $.ajax({
        url: '../services/Services.asmx/GetOnlineFriends',
        async: false,
        success: function (data) {
            self.OnlineFriends = data;
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            return;
        }
    });

    self.addOnlineFriend = function (member) {
        self.OnlineFriends.push(member);
    }

    self.removeOnlineFriend = function (member) {
        $.each(self.OnlineFriends, function () {
            if (this.id == member.id) {
                self.OnlineFriends.remove(this);
                return;
            }
        });

    }

    var mapping = {
        '': {
            create: function (options) {
                return new windowModel(options.data);
            }
        }
    }
    var windowModel = function (data) {
        ko.mapping.fromJS(data, {}, this);
        var self = this;

        this.uniqueID = ko.computed(function () {
            return this.Type() + '_' + this.ID();
        }, this);

        this.Editor = null;
        this.AdminsEditor = null;
        this.selectedGift = null;
        // default editor styles
        this.IsBold = false;
        this.IsItalic = false;
        this.FontSize = 'small';
        this.ForeColor = 'black';

        this.getMember = function (id) {
            return ko.utils.arrayFirst(this.Members(), function (mem) {
                return mem.MemberID() == id;
            });
        }
        //Existing Members
        this.ExistingMembers = ko.computed(function () {
            if (self.Type() == 'Private')
                return null;
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

        this.updateSetting = function (settingName) {
            var window = this;
            var newValue = !window.CurrentMember()[settingName]();
            window.CurrentMember()[settingName](newValue);
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
            return true;
        }

        //member menu
        this.toggleFriend = function (window,friend) {
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
            rHub.server.updateMemberLevel(window.ID(), self.SelectedMember().MemberID(), self.SelectedMember().MemberLevelID());
            $("#changeLevelModal_" + self.uniqueID()).modal('hide');
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
                data: "{'memberID':" + window.bannedMember().MemberID() + ", 'roomID' : " + window.ID() + ",'type':'" + window.bannedType() + "','adminID':" + chatVM.CurrentMemberID + "}",
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    notify('success', 'تم حجب العضو بنجاح');
                    $("#banModal_" + window.uniqueID()).modal('hide');
                    rHub.server.banMemberFromRoom(window.bannedMember().MemberID(), window.ID(), window.bannedType(), window.CurrentMember().MemberName());
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
            rHub.server.closeRoom(window.ID(), window.CurrentMember().MemberID(), window.CurrentMember().MemberName());
            $("#controlPanelModal_" + window.uniqueID()).modal('hide');
        };
        this.saveRoomTopic = function () {
            var window = this;
            rHub.server.updateRoomTopic(window.ID(), window.RoomTopic());
        }
        this.updateSocialLinks = function () {
            var window = this;
            rHub.server.updateSocialLinks(window.ID(), window.fbURL(), window.tURL(), window.utURL());
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
            if (total > chatVM.CreditPoints()) {
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
                        $('#uiHiddenFieldCreditPoints').val(chatVM.CreditPoints() - total);
                        chatVM.CreditPoints($('#uiHiddenFieldCreditPoints').val());
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
                rHub.server.sendToRoom(self.ID(), self.CurrentMember().MemberID(), self.CurrentMember().MemberName(), self.audioAttachment);
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
        };

        // flash object 
        this.showFlashObject = ko.observable(true);
        this.toggleFlashObj = function (window) {
            self.showFlashObject(!self.showFlashObject());
        }
        //messages
        this.AdminMessageHistory = ko.observableArray();
        this.toggleMessageTime = function () { };
        function chatMessage(msg) {
            var msgData = { ID: 9999999, FromName: "", Message: msg, MessageDate: null };
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
        this.addMessage = function (msg) {
            this.MessageHistory.push(msg);
            $(".MsgHistroy").slimScroll({
                railVisible: true,
                height: $(".MsgHistroy", " #" + this.uniqueID()).attr('data-height'),
                color: '#FEC401',
                railColor: '#C7C5C0',
                position: 'left',
                scrollTo: $(".MsgHistroy", " #" + this.uniqueID()).prop('scrollHeight')  //$(".MsgHistroy", " #" + this.uniqueID()).height()
            });
            // update save coversation link
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
                scrollTo: $(".AdminMsgHistroy", " #" + this.uniqueID()).prop('scrollHeight') //$(".AdminMsgHistroy", " #" + this.uniqueID()).height()
            });
        };
        this.SaveConversation = function () {
            var str = "<link href='http://chat2connect.com/css/bootstrap.min.css' rel='stylesheet' /> <link href='http://chat2connect.com/css/main.css' rel='stylesheet' /> ";
            ko.utils.arrayForEach(self.MessageHistory(), function (msg) {
                str += msg.Message;
            });

            $('#SaveConv_' + self.ID()).attr("href", "data:text/plain;charset=UTF-8," + str);
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
            rHub.server.clearQueue(window.ID());
        };
        this.updateRoomSetting = function (settingName) {
            var window = this;
            var newValue = !window.Settings[settingName]();
            rHub.server.updateRoomSetting(window.ID(), settingName, newValue);
            window.Settings[settingName](newValue);
            return true;
        }
        this.MarkAllWithWriteCheck = ko.observable(false);
        this.markAllWithWrite = function () {
            var window = this;
            var newValue = !window.MarkAllWithWriteCheck();
            rHub.server.markAllWithWrite(window.ID(), newValue, window.CurrentMember().MemberID());
            window.MarkAllWithWriteCheck(newValue);
            return true;
        };
        this.MarkAllWithoutWriteCheck = ko.observable(false);
        this.markAllWithoutWrite = function () {
            var window = this;
            var newValue = !window.MarkAllWithoutWriteCheck();
            rHub.server.markAllWithoutWrite(window.ID(), newValue, window.CurrentMember().MemberID());
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
                        rHub.server.userRaisHand(window.ID(), window.CurrentMember().MemberID(), window.CurrentMember().QueueOrder());
                    }
                    else {
                        //move from queueMembers to roomMembers
                        window.CurrentMember().QueueOrder(null);
                        rHub.server.userDownHand(window.ID(), window.CurrentMember().MemberID());
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
                    return;
                }
                // remove member from list and add it to mic
                member.QueueOrder(null);
                window.MicMember(member);
                if (window.CurrentMember().MemberID() == memberid) {
                    rHub.server.userStartMic(window.ID(), memberid);
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
                if (window.Type() == 'Private')
                    return;

                member.QueueOrder(null);
                window.MicMember(null);
                if (window.CurrentMember().MemberID() == memberid)
                    rHub.server.userStopMic(window.ID(), memberid)
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
            member.IsCamOpened(true);
            if (window.Type() == 'Private')
                return;
            if (window.CurrentMember().MemberID() == memberID) {
                rHub.server.userStartCam(window.ID(), window.CurrentMember().MemberID());
            }
        }
        this.stopCam = function (memberID) {
            var window = this;
            getFlashMovie('chat2connect_' + window.uniqueID()).stopCam(memberID);
            var member = window.getMember(memberID);
            if (member == null)
                return;
            member.IsCamOpened(false);
            if (window.Type() == 'Private')
                return;
            if (window.CurrentMember().MemberID() == memberID) {
                rHub.server.userStopCam(window.ID(), window.CurrentMember().MemberID());
            }
        }

        this.initEditor = function () {
            this.Editor.setValue("");
            if (this.IsBold) {
                this.Editor.composer.commands.exec("bold");
            }
            if (this.IsItalic) {
                this.Editor.composer.commands.exec("italic");
            }
            this.Editor.composer.commands.exec("fontSize", this.FontSize);
            this.Editor.composer.commands.exec("foreColor", this.ForeColor);
        }

        this.toggleBold = function () {
            self.IsBold = !self.IsBold;
        };
        this.toggleItalic = function () {
            self.IsItalic = !self.IsItalic;
        };
        this.setFontSize = function (fontsize) {
            self.FontSize = fontsize;
        };
        this.setForeColor = function (color) {
            self.ForeColor = color;
        };
    }

    self.changeCurrent = function (selctor) {
        if (document.getElementById(selctor)) {
            $('#MainTabs a[href="#' + selctor + '"]').tab('show');
            return;
        }
    };
    self.openWindow = function (id, name, type, istemp, ishidden, levelid) {
        var window = self.getWindow(id, type, name);
        if (window == undefined) {
            self.addWindow(id, name, type, istemp, ishidden, levelid);
        }
        else
            self.changeCurrent(window.uniqueID());
    };
    self.addWindow = function (id, name, type, istemp, isHidden, levelid) {
        if (istemp == undefined)
            istemp = false;
        if (type == 'Private') {
            var gifts = [];
            $.ajax({
                url: '../services/Services.asmx/GetGifts',
                async: false,
                success: function (data) {
                    gifts = data;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
                    return;
                }
            });

            var room = { ID: id, Name: name, Type: type, IsTemp: true, Message: "", MessageHistory: [], Members: [{ MemberID: self.CurrentMemberID, MemberName: self.CurrentMemberName, IsMicOpened: false, IsCamOpened: false, IsCamViewed: false }], CurrentMemberID: self.CurrentMemberID, Gifts: gifts };
            var win = ko.mapping.fromJS(room, mapping);
            self.windows.push(win);
            self.changeCurrent(win.uniqueID());
            self.Init(win);
            rHub.server.enterPrivateChatLog(id, name);
        }
        else {
            if (self.notTempRoom().length == self.maxRoom()) {
                notify('error', 'عفواً ، لقد قمت بدخول العدد الأقصى من الغرف فى نفس الوقت.');
                return;
            }

            $.post("../services/Services.asmx/GetChatRoom", { id: id, isTemp: istemp })
                .done(function (data) {
                    if (data.Status != 1) {
                        notify('error', data.Data);
                        return;
                    }
                    var win = ko.mapping.fromJS(data.Data, mapping);
                    self.windows.push(win);
                    self.changeCurrent(win.uniqueID());

                    rHub.server.addToRoom(id, win.CurrentMember().InRoom());
                    self.Init(win);
                });

            // save opened rooms
            $.post("../services/Services.asmx/SaveChatRoom", { id: id, add: true });
        }
    }
    self.removeWindow = function () {
        if (this.Type() == "Room") {
            rHub.server.removeFromRoom(this.ID());
            // save opened rooms
            $.post("../services/Services.asmx/SaveChatRoom", { id: this.ID(), add: false });
        }
        self.windows.remove(this);
        $('.nav-tabs a:last').tab('show');
    }
    self.rateRoom = function (val) {
        var room = this;
        RateRoom(room.ID(), val);
        room.CurrentMember().UserRate(val);
        return true;
    }
    self.sendMessage = function (window) {
        if (window == null)
            window = this;
        if (window.Type() == "Room") {
            if (!window.CurrentMember().InRoom()) {
                rHub.server.showMemberInRoom(window.ID(), window.CurrentMember().MemberID());
            }
            rHub.server.sendToRoom(window.ID(), window.CurrentMember().MemberID(), window.CurrentMember().MemberName(), window.Editor.getValue());
        }
        else {
            rHub.server.sendPrivateMessage(window.ID(), window.Editor.getValue());
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
            rHub.server.sendToRoomAdmins(window.ID(), window.CurrentMember().MemberID(), window.CurrentMember().MemberName(), window.AdminsEditor.getValue());
            window.AdminsEditor.setValue("");
        }
    };

    // init html Editor 
    // tooltips for toolbar
    // scroll bars
    self.Init = function (window) {
        $(".emotionMenu > button.dropdown-toggle").click(function (e) {
            e.stopPropagation();
            $(this).next('.dropdown-menu').toggle();
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

        // popover menu for members
        initPopover(window);

        if (window.Type() == "Room" && window.CurrentMember().MemberLevelID() > 1) //MemberLevelID>1>>> Admin
        {
            var names = ko.utils.arrayMap(window.Members(), function (item) {
                return item.MemberName();
            });

            $("#txtBanMemberName_" + window.uniqueID()).autocomplete({
                source: names
            });
        }



    };

    self.removeMember = function (mid) { //remove member from rooms and private chate
        ko.utils.arrayForEach(self.windows(), function (room) {
            if (room.Type() == 'Private' && room.ID() == mid)
                self.windows().remove(room);
            else {
                var member = room.getMember(mid);
                if (member != null) {
                    member.InRoom(false);
                    member.IsCamOpened(false);
                    member.QueueOrder(null);
                }
            }
        });
    };
    // set the playback volume (volume value is from 0 to 1)
    self.setListenVolume = function setPlaybackVolume(window, volume) {
        getFlashMovie('chat2connect_' + window.uniqueID()).setPlaybackVolume(volume / 10.0);
    }

    self.MuteRoom = function (window) {
        if ($('#mute_' + window.uniqueID()).attr('data-mute') == 'false') {
            self.setListenVolume(window, 0);
            $('#mute_' + window.uniqueID()).attr('data-mute', 'true');
        }
        else {
            self.setListenVolume(window, $('#uiListenVolume_' + window.uniqueID()).data('slider').getValue());
            $('#mute_' + window.uniqueID()).attr('data-mute', 'false');
        }

    }

    // set the recording volume (volume value is from 0 to 1)
    self.setMicVolume = function setMicVolume(window, volume) {
        getFlashMovie('chat2connect_' + window.uniqueID()).setMicVolume(volume / 10.0);
    }

    self.SendImage = function (window) {
        if (window == null)
            return;
        var hiddenfield = $('#UploadFileName_' + window.uniqueID());
        if (hiddenfield.val() != '') {
            var randomid = Math.floor((Math.random() * 100000) + 1);
            var imageDiv = "<a href='#imageModal_" + randomid + "' data-toggle='modal' style='text-decoration:none;'><img src='files/rooms/attachedimages/" + hiddenfield.val() + "' style='max-width:100px;margin:0 !important;'/></a>";

            var modaldiv = "<div id='imageModal_" + randomid + "' class='modal fade' role='modal' aria-hidden='true'><div class='modal-dialog'><div class='modal-content'><div class='modal-header'><a class='close pull-left' data-dismiss='modal' aria-hidden='true' style='text-decoration: none;'>×</a><h3 id='myModalLabel1'>صورة</h3></div><div class='modal-body'><div class='form-horizontal blockBox'><div class='row'><div class='col-sm-10 center'><img src='files/rooms/attachedimages/" + hiddenfield.val() + "' style='max-height:400px;'/></div></div></div></div></div></div></div>";

            rHub.server.sendToRoom(window.ID(), window.CurrentMember().MemberID(), window.CurrentMember().MemberName(), imageDiv + modaldiv);
        }
        hiddenfield.val('');
        $('#UploadFileName_' + window.uniqueID()).val('');
        $('#UploadStatus_' + window.uniqueID()).html('');
        $('#UploadButton_' + window.uniqueID()).show();
        $('#uploadSendbtn_' + window.uniqueID()).hide();
        $('#UploadedFile_' + window.uniqueID()).html('');
        $("#attachModal_" + window.uniqueID()).modal('hide');
    }

    self.SendVideo = function (window) {
        var url = $('#videoURL_' + window.uniqueID()).val();
        if (url == '')
            return false;
        var arr = url.split('v='); // remove "youtube.com/watch?v="
        var id = [];
        if (arr.length > 1)
            id = arr[1].split('&'); // extract vedio id from query string - first element in the array

        var randomid = Math.floor((Math.random() * 100000) + 1);
        var videoLink = "<a href='#videoModal_" + randomid + "' data-toggle='modal' style='text-decoration:none;'><img src='http://img.youtube.com/vi/" + id[0] + "/0.jpg' style='max-width:100px;margin:0 !important;' /></a>";
        var iframe = "<iframe id='player' type='text/html' src='http://www.youtube.com/embed/" + id[0] + "?enablejsapi=1' frameborder='0' style='max-width:100%;min-height:400px;width:450px;'></iframe>"
        var modaldiv = "<div id='videoModal_" + randomid + "' class='modal fade' role='modal' aria-hidden='true'><div class='modal-dialog'><div class='modal-content'><div class='modal-header'><a class='close pull-left' data-dismiss='modal' aria-hidden='true' style='text-decoration: none;'>×</a><h3 id='myModalLabel1'>صورة</h3></div><div class='modal-body'><div class='form-horizontal blockBox'><div class='row'><div class='col-sm-12 center'>" + iframe + "</div></div></div></div></div></div></div>";
        var newMsg = videoLink + modaldiv;
        rHub.server.sendToRoom(window.ID(), window.CurrentMember().MemberID(), window.CurrentMember().MemberName(), newMsg);
        $("#attachModal_" + window.uniqueID()).modal('hide');
    }
}

//function onCamClose(userId, roomId) {
//    var window = chatVM.getWindow(roomId.substr(roomId.indexOf("_") + 1), 'Room');
//    if (window == null)
//        return;
//    window.stopCam(userId);
//}

function onMicRecordSaveSuccess(fileName) {
    // returned file name & roomid in this format [roomId,filename]
    var window = chatVM.getWindow(fileName.substr(0, fileName.indexOf(",")), 'Room');
    if (window == null)
        return;
    var audioDiv = "<audio controls><source src='files/rooms/attacheaudio/" + fileName.substr(fileName.indexOf(",") + 1) + "' type='audio/mpeg'>Your browser does not support this audio format.</audio>";
    window.UpdateAudioAttachment(audioDiv);

}

function DeleteFile(roomid, file) {

    $('#UploadStatus_Room_' + roomid).html('جارى الحذف...');
    $.ajax({
        url: 'services/FileUploader.ashx?file=' + file,
        type: 'GET',
        cache: false,
        async: true,
        success: function (html) {
            $('#UploadedFile_Room_' + roomid).html('');
            $('#UploadStatus_Room_' + roomid).html('تم حذف الملف');
            $('#UploadButton_Room_' + roomid).show();
            $('#uploadSendbtn_Room_' + roomid).hide();
            $('#UploadFileName_Room_' + roomid).val('');

        }
    });

}

function addChatRoom(id, name, type, istemp, isHidden, levelid) {
    if (chatVM == undefined)
        InitChat(100);
    chatVM.openWindow(id, name, type, istemp, isHidden, levelid);
}

function getFlashMovie(movieName) {
    return document[movieName] || window[movieName];
}
var chatVM;
function addMsgToWindow(window, msg, css) {
    msg = "<div class='pull-left msgHolder " + css + "' style='width:auto;margin-right:5px;'>" + msg + "</div><div style='clear:both;height:3px;'></div>";
    window.addNotificationMessage(msg);
}
function InitChat(maxWinRooms, memberID, memberName) {
    chatVM = new Chat(maxWinRooms, memberID, memberName);
    ko.applyBindings(chatVM);

    /****** signalR ********/

    rHub = $.connection.chatRoomHub;
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
    rHub.client.GiftSentInRoom = function (roomID, memberName, friendName, giftName, friendID) {
        var window = chatVM.getWindow(roomID, "Room");
        message = "<div class='pull-left giftmsg'>" + memberName + " أرسل هدية (" + giftName + ") إلى " + friendName + "</div><div style='clear:both;height:1px;'></div>";
        window.addNotificationMessage(message);
        $(".MsgHistroy").slimScroll({
            railVisible: true,
            height: $(".MsgHistroy", "#" + window.uniqueID()).attr('data-height'),
            color: '#FEC401',
            railColor: '#C7C5C0',
            position: 'left',
            scrollTo: $(".MsgHistroy", "#" + window.uniqueID()).height()
        });
        var receiverMember = window.getMember(friendID);
        if (receiverMember != null) {
            receiverMember.HasGift(true);
            setTimeout(function () { receiverMember.HasGift(false); }, 60000);
        }
    };

    /*****************************************/
}


/********* common functions ****************/
function initPopover(window) {
    // popover menu for members
    $('.roomMemberlink').each(function () {
        var $this = $(this);
        var popoverContent = $this.find('.friendSubMenu');
        // check if popover content exists
        if (popoverContent.length > 0) {
            $this.popover({
                trigger: 'click',
                placement: 'left',
                html: true,
                content: popoverContent,
                container: '#' + window.uniqueID()
            }).on('hidden.bs.popover', function () {
                $this.append(popoverContent);
            });
        }
    });
}
