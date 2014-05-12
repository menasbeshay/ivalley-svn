
function Chat(maxWin, memberID, memberName) {
    var self = this;
    self.CurrentMemberID = memberID;
    self.CurrentMemberName = memberName;
    self.maxRoom = ko.observable(maxWin);
    self.windows = ko.observableArray();
    self.Editor = null;
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
    var mapping = {
        '': {
            create: function (options) {
                return new windowModel(options.data);
            }
        }
    }
    var windowModel = function (data) {
        ko.mapping.fromJS(data, {}, this);

        this.uniqueID = ko.computed(function () {
            return this.Type() + '_' + this.ID();
        }, this);

        //Room Members
        this.getMember = function (id) {
            return ko.utils.arrayFirst(this.RoomMembers(), function (mem) {
                return mem.MemberID() == id;
            });
        }
        this.addMember = function (member) {
            this.RoomMembers.push(member);
            
        };
        this.newMember = function (id, name) {
            var member = { MemberID: id, MemberName: name, MemberTypeID: 1, IsCamOpened: false, IsMicOpened: false };
            return ko.mapping.fromJS(member);
        }
        this.removeMember = function (id) {
            var member = this.getMember(id);
            if (member != null) {
                this.RoomMembers.remove(member);
                
            }
        };
        //Queue Members
        this.getQueueMember = function (id) {
            return ko.utils.arrayFirst(this.QueueMembers(), function (mem) {
                return mem.MemberID() == id;
            });
        }
        this.addQueueMember = function (member) {
            if (member == null)
                return;
            this.QueueMembers.push(member);
        };
        this.removeQueueMember = function (id) {
            var member = this.getQueueMember(id);
            if (member != null) {
                this.QueueMembers.remove(member);
            }
        };

        this.updateSetting = function (settingName) {
            var window = this;
            var newValue = !window.CurrentMemberSettings[settingName]();
            window.CurrentMemberSettings[settingName](newValue);
            $.ajax({
                url: '../Services/Services.asmx/UpdateRoomSetting',
                dataType: 'json',
                type: 'post',
                data: "{'mid':" + self.CurrentMemberID + ", 'rid' : " + window.ID() + ",'setting':'" + settingName + "','newValue':"+newValue+" }",
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    notify('success', 'تم تغيير الإعدادات بنجاح');
                    return;

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
            return true;
        }
        var self = this;
        this.banMember = function (id) {
            var member = self.getMember(id);
            if (member == null)
                member = self.getQueueMember(id);
            if (member == null)
                return;

            self.bannedMember.MemberName(member.MemberName());
            self.bannedMember.MemberID(member.MemberID());
            self.bannedMember.Days(1);

            $("#banModal_" + self.uniqueID() ).modal('show');
        };
        this.saveBanMember = function () {
            var window = this;
            $.ajax({
                url: '../Services/Services.asmx/BanRoomMember',
                dataType: 'json',
                type: 'post',
                data: "{'memberID':" + window.bannedMember.MemberID() + ", 'roomID' : " + window.ID() + ",'days':'" + window.bannedMember.Days() + "'}",
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    notify('success', 'تم حجب العضو بنجاح');
                    $("#banModal_" + window.uniqueID()).modal('hide');
                    rHub.server.banMemberFromRoom(window.bannedMember.MemberID(), window.ID());
                    return;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    $("#banModal_" + window.uniqueID()).modal('hide');
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
        };
        this.bannedMember = new banMemberModel(this.newMember(0, ""));
        //control panel
        this.BannedMembers = ko.computed(function () {
            return ko.utils.arrayFilter(self.AllMembersSettings(), function (mem) {
                return mem.IsMemberBanned();
            });
        }, this);
        this.showControlPanel = function () {
            var window = this;
            $("#controlPanelModal_" + window.uniqueID()).modal('show');
        };
        this.removeBannedMember = function () {
            var member = this;
            member.IsMemberBanned(false);
            member.BanDays("");
            //send to server to update
            rHub.server.updateRoomMemberSettings(self.ID(), member.MemberID(), member.CanWrite(),member.CanAccessMic(),member.CanAccessCam(),member.BanDays());
        };
        this.updateBannedMember=function()
        {
            var member = this;
            if (member.BanDays() == '')
                member.IsMemberBanned(false);
            rHub.server.updateRoomMemberSettings(self.ID(), member.MemberID(), member.CanWrite(), member.CanAccessMic(), member.CanAccessCam(), member.BanDays());
        }
        this.updateRoomMemberSettings = function () {
            var member = this;
            if (member.BanDays() != '')
                member.IsMemberBanned(true);
            else
                member.IsMemberBanned(false);
            rHub.server.updateRoomMemberSettings(self.ID(), member.MemberID(), member.CanWrite(), member.CanAccessMic(), member.CanAccessCam(), member.BanDays());
        };
        this.getMemberSetting = function (mid) {
            var member = ko.utils.arrayFirst(self.AllMembersSettings(), function (mem) {
                    return mem.MemberID() == mid;
            });
            return member;
        };
        
    }
    var banMemberModel=function(member)
    {
        var baned = { MemberID: member.MemberID(), MemberName: member.MemberName(), Days:1};
        return ko.mapping.fromJS(baned);
    }

    self.changeCurrent = function (selctor) {
        if (document.getElementById(selctor)) {
            $('#MainTabs a[href="#' + selctor + '"]').tab('show');
            return;
        }
    };
    self.openWindow = function (id, name, type) {
        var window = self.getWindow(id, type, name);
        if (window == undefined) {
            self.addWindow(id, name, type);
        }
    };
    self.addWindow = function (id, name, type) {
        if (type == 'Private') {
            //var room = { ID: id, Name: name, Type: type, IsTemp: true, Message: "", MessageHistory: "", CurrentMemberSettings: { MemberID: self.CurrentMemberID } };
			//var roomid = (id < self.CurrentMemberID) ? id + "_" + self.CurrentMemberID : self.CurrentMemberID + "_" + id;
			var room = { ID: id, Name: name, Type: type, IsTemp: true, Message: "", MessageHistory: "", CurrentMemberSettings: { MemberID: self.CurrentMemberID, IsMicOpened: false, IsCamOpened: false, CanAccessCam: true, CanAccessMic: true, CanWrite: true }, Settings: { EnableCam: true, EnableMic: true, MaxMic: 2, CamCount: 2 }, RoomMembers: {}, QueueMembers: {}, MicMember:{}, AllMembersSettings:[] };
            var win = ko.mapping.fromJS(room, mapping);
            self.windows.push(win);
            self.changeCurrent(win.uniqueID());
            self.Init(win);
        }
        else {
            if (self.notTempRoom().length == self.maxRoom()) {
                $.pnotify({
                    text: 'عفواً ، لقد قمت بدخول العدد الأقصى من الغرف فى نفس الوقت.',
                    type: 'error',
                    history: false,
                    closer_hover: false,
                    delay: 5000,
                    sticker: false
                });
                return;
            }
            $.post("../services/Services.asmx/GetChatRoom", { id: id, isTemp: false })
                .done(function (data) {
                    var win = ko.mapping.fromJS(data, mapping);
                    self.windows.push(win);
                    self.changeCurrent(win.uniqueID());
                    rHub.server.addToRoom(id);
                    self.Init(win);
                });
        }

    }
    self.removeWindow = function () {
        if (this.Type() == "Room") {
            rHub.server.removeFromRoom(this.ID());
        }
        self.windows.remove(this);
        $('.nav-tabs a:last').tab('show');
    }
    self.rateRoom = function (val) {
        var room = this;
        RateRoom(room.ID(), val);
        room.CurrentMemberSettings.UserRate(val);
        return true;
    }
    self.sendMessage = function (window) {
        if (window == null)
            window = this;
        if (window.Type() == "Room") {
            //rHub.server.sendToRoom(window.ID(), self.CurrentMemberName, window.Message());
            rHub.server.sendToRoom(window.ID(), self.CurrentMemberName, self.Editor.getValue());
        }
        else {
            //rHub.server.sendPrivateMessage(window.ID(), window.Message());
            rHub.server.sendPrivateMessage(window.ID(), self.Editor.getValue());
        }
        //window.Message("");
        self.Editor.setValue("");
    }
    
    // init html Editor 
    // tooltips for toolbar
    // scroll bars
    self.Init = function (window) {
        self.Editor = new wysihtml5.Editor('uiTextMsg_' + window.uniqueID(), { toolbar: 'toolbar' + window.uniqueID(), parserRules: wysihtml5ParserRules, useLineBreaks: false, stylesheets: 'css/main.css' });
        if (!window.CurrentMemberSettings.CanWrite())
            self.Editor.disable();
        // apply enter key listener
        self.Editor.observe('load', function () {
            self.Editor.composer.element.addEventListener('keyup', function (e) {
                if (e.which == 13) {
                    e.preventDefault();
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
    };

    self.removeMember = function (mid) {
        ko.utils.arrayForEach(self.allRooms(), function (room) {
            room.removeMember(mid);
            room.removeQueueMember(mid);
        });
    };
    self.requestMic = function () {
        var currentWindow = this;
        $.ajax({
            url: '../Services/Services.asmx/GetQueueOrder',
            dataType: 'json',
            type: 'post',
            data: "{'memberID':'" + self.CurrentMemberID + "', 'roomID' : '" + currentWindow.ID() + "' }",
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                if (data.d > 0) {
                    //move from roomMembers to queueMembers
                    var member = currentWindow.getMember(self.CurrentMemberID);
                    currentWindow.addQueueMember(member);
                    currentWindow.removeMember(self.CurrentMemberID);
                    rHub.server.userRaisHand(currentWindow.ID(), self.CurrentMemberID);
                }
                else {
                    //move from queueMembers to roomMembers
                    var member = currentWindow.getQueueMember(self.CurrentMemberID);
                    currentWindow.addMember(member);
                    currentWindow.removeQueueMember(self.CurrentMemberID);
                    rHub.server.userDownHand(currentWindow.ID(), self.CurrentMemberID);
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
    self.mic = function () {
        var currentWindow = this;
        if (currentWindow.CurrentMemberSettings.IsMicOpened() == false) {
            self.startMic(currentWindow, self.CurrentMemberID);
            //currentWindow.NoOfMics(currentWindow.NoOfMics() + 1);
            //set current member as micMember
            var member = currentWindow.getQueueMember(self.CurrentMemberID);
            if (member != null) {
                currentWindow.removeQueueMember(self.CurrentMemberID);
                currentWindow.MicMember(member);
            }
            currentWindow.CurrentMemberSettings.IsMicOpened(true);
        }
        else {
            self.stopMic(currentWindow, self.CurrentMemberID);
            //currentWindow.NoOfMics(currentWindow.NoOfMics() - 1);
            var micMember = currentWindow.MicMember();//remove from mic member to room members
            if (micMember != null) {
                currentWindow.addMember(micMember.MemberID(), micMember.MemberName());
                currentWindow.MicMember(null);
            }
            currentWindow.CurrentMemberSettings.IsMicOpened(false);
        }
    }
    self.startMic = function (window, memberid) {
        var member = window.getMember(memberid);
        if (member == null)
            member = window.getQueueMember(memberid);
        if (member != null) {
            member.IsMicOpened(true);
            
            getFlashMovie('chat2connect_' + window.uniqueID()).startMic(memberid);
            if (self.CurrentMemberID == memberid) {
                rHub.server.userStartMic(window.ID(), memberid);
            }
            else
            {
                if (window.CurrentMemberSettings.NotifyOnMicOn()) {
                    notify('info', 'العضو ' + member.MemberName() + ' أخذ المايك');
                }
            }
        }
    }
    self.stopMic = function (window, memberid) {
        var member = window.getMember(memberid);
        if (member == null)
            member = window.getQueueMember(memberid);
        if (member != null) {
            member.IsMicOpened(false);
            
            getFlashMovie('chat2connect_' + window.uniqueID()).stopMic(memberid);
            if (self.CurrentMemberID == memberid)
                rHub.server.userStopMic(window.ID(), memberid)
            else
            {
                if (window.CurrentMemberSettings.NotifyOnMicOff()) {
                    notify('info', 'العضو ' + member.MemberName() + ' ترك المايك');
                }
            }
        }
        //$('#Room_5 #roomMembersDiv #m_6 .controls .mic').css('display', 'none');
    }

    self.cam = function () {
        var currentWindow = this;
        if (currentWindow.CurrentMemberSettings.IsCamOpened() == false) {
            self.startCam(currentWindow, self.CurrentMemberID);
            currentWindow.CurrentMemberSettings.IsCamOpened(true);
        }
        else {
            self.stopCam(currentWindow, self.CurrentMemberID);
            currentWindow.CurrentMemberSettings.IsCamOpened(false);
        }
    }
    self.startCam = function (window, memberID) {
        getFlashMovie('chat2connect_' + window.uniqueID()).startCam(memberID);
        if (self.CurrentMemberID == memberID) {
            rHub.server.userStartCam(window.ID(), self.CurrentMemberID);
            // $('#Room_5 #roomMembersDiv #m_6 .controls .camera').css('display', 'inline-block');
        }
    }
    self.stopCam = function (window, memberID) {
        getFlashMovie('chat2connect_' + window.uniqueID()).stopCam(memberID);
        if (self.CurrentMemberID == memberID) {
            rHub.server.userStopCam(window.ID(), self.CurrentMemberID);
            //$('#Room_5 #roomMembersDiv #m_6 .controls .camera').css('display', 'none');
        }
    }
}

function addChatRoom(id, name, type) {
    if (chatVM == undefined)
        InitChat(100);
    chatVM.openWindow(id, name, type);
}

function getFlashMovie(movieName) {
    return document[movieName] || window[movieName];
}
var chatVM;
function InitChat(maxWinRooms, memberID, memberName) {
    chatVM = new Chat(maxWinRooms, memberID, memberName);
    ko.applyBindings(chatVM);

    /****** signalR ********/
    rHub = $.connection.chatRoomHub;
    rHub.client.getPrivateMessage = function (fromId, fromUserName, message) {
        var window = chatVM.getWindow(fromId, "Private", fromUserName);

        var history = window.MessageHistory();
        var newMsg = "<div class='pull-left' style='width:auto;margin-right:5px;'><b>" + fromUserName + "</b></div><div class='pull-left'><b>:</b></div><div class='pull-left' style='width:auto;'> " + message + "</div><div style='clear:both;height:1px;'></div>";
        window.MessageHistory(history + newMsg);
        $(".MsgHistroy").slimScroll({
            railVisible: true,
            height: '400px',
            color: '#FEC401',
            railColor: '#C7C5C0',
            position: 'left',
            scrollTo: $(".MsgHistroy", "#" + window.uniqueID()).height()
        });
    };
    rHub.client.getMessage = function (rid, sname, msg) {
        var type = "Room";
        var window = chatVM.getWindow(rid, type, sname);
        if (window == null)
            return;
        var history = window.MessageHistory();
        var newMsg = "<div class='pull-left' style='width:auto;margin-right:5px;'><b>" + sname + "</b></div><div class='pull-left'><b>:</b></div><div class='pull-left' style='width:auto;'> " + msg + "</div><div style='clear:both;height:1px;'></div>";
        window.MessageHistory(history + newMsg);
        $(".MsgHistroy").slimScroll({
            railVisible: true,
            height: '400px',
            color: '#FEC401',
            railColor: '#C7C5C0',
            position: 'left',
            scrollTo: $(".MsgHistroy", "#" + window.uniqueID()).height()
        });
        // update save link 
        //SaveConversation(rid);
    };
    rHub.client.getVideoMessage = function (rid, sname, url) {
        var arr = url.split('v='); // remove "youtube.com/watch?v="
        var id = arr[1].split('&'); // extract vedio id from query string - first element in the array

        var type = "Room";
        var window = chatVM.getWindow(rid, type, sname);
        if (window == null)
            return;
        var history = window.MessageHistory();
        var newMsg = "<div class='pull-left' style='width:auto;margin-right:5px;'><b>" + sname + "</b></div><div class='pull-left'><b>:</b></div><div class='pull-left' style='width:auto;'><a href='" + url + "' target='_blank'><img src='http://img.youtube.com/vi/" + id[0] + "/0.jpg' style='max-width:120px;' /></div><div style='clear:both;height:1px;'></div>";
        window.MessageHistory(history + newMsg);
        $(".MsgHistroy").slimScroll({
            railVisible: true,
            height: '400px',
            color: '#FEC401',
            railColor: '#C7C5C0',
            position: 'left',
            scrollTo: $(".MsgHistroy", "#" + window.uniqueID()).height()
        });

    };
    rHub.client.addNewMember = function (mid, name, rid) {
        var type = "Room";
        var window = chatVM.getWindow(rid, type, name);
        if (window == null)
            return;
        var member = window.getMember(mid);
        if (member == null)
            member = window.getQueueMember(mid);
        if (member != null)
            return;
        member = window.newMember(mid, name);
        window.addMember(member);
        if (window.CurrentMemberSettings.NotifyOnFriendsLogOn()) {
            notify('info', '' + member.MemberName() + ' دخل الان فى الغرفة ' + window.Name() + '');
        }
    };
    rHub.client.removeMember = function (mid, roomId) {
        var window = chatVM.getWindow(roomId, "Room", "");
        if (window == null)
            return;
        var member = window.getMember(mid);
        if (member == null) {
            member = window.getQueueMember(mid);
            window.removeQueueMember(mid);
        }
        else
            window.removeMember(mid);

        if (member == null)
            return;
        if (window.CurrentMemberSettings.NotifyOnFriendsLogOff()) {
            notify('info', '' + member.MemberName() + ' خرج الان من الغرفة ' + window.Name() + '');
        }
        if(mid==chatVM.CurrentMemberID)
        {
            chatVM.windows.remove(window);
        }
    };
    function banMemberFromroom(mid, roomId) {
        var window = chatVM.getWindow(roomId, "Room", "");
        if (window == null)
            return;
        var member = window.getMember(mid);
        if (member == null) {
            member = window.getQueueMember(mid);
            window.removeQueueMember(mid);
        }
        else
            window.removeMember(mid);

        if (member == null)
            return;
        if (window.CurrentMemberSettings.NotifyOnFriendsLogOff()) {
            notify('info', '' + member.MemberName() + ' خرج الان من الغرفة ' + window.Name() + '');
        }
        if (chatVM.CurrentMemberID == mid) {
            chatVM.windows.remove(window);
            $('.nav-tabs a:last').tab('show');
        }
    }
    rHub.client.banMemberFromRoom = function (mid, roomId) {
        banMemberFromroom(mid, roomId);
    };
    rHub.client.updateRoomMemberSettings = function (roomid, memberid, canWrite, canAccessMic, canAccessCam, banDays){
        if(banDays!='' && banDays!=null)
        {
            banMemberFromroom(memberid, roomid);
        }
        var window = chatVM.getWindow(roomid, "Room");
        if (window != null) {
            var settingMember = window.getMemberSetting(memberid);
            settingMember.CanWrite(canWrite);
            settingMember.CanAccessCam(canAccessCam);
            settingMember.CanAccessMic(canAccessMic);
            settingMember.BanDays(banDays);
            if (banDays != '') {
                settingMember.IsMemberBanned(true);
            }
            else {
                settingMember.IsMemberBanned(false);
            }
        }
        if (chatVM.CurrentMemberID == memberid) {
            chatVM.CurrentMemberSettings.CanWrite(canWrite);
            chatVM.CurrentMemberSettings.CanAccessMic(canAccessMic);
            chatVM.CurrentMemberSettings.CanAccessCam(canAccessCam);
        }
    };
    
    rHub.client.ListenMic = function (memberid, rid) {
        /* var fn = window[listenmic];
         var fnparams = [memberid];
         if (typeof fn === 'function') {
             fn.apply(null, fnparams);
         }*/
        var type = "Room";
        var window = chatVM.getWindow(rid, type);
        if (window == null)
            return;

        $("#Room_" + rid + " #roomMembersDiv #m_" + memberid + " .controls .hand").css('display', 'none');
        $("#Room_" + rid + " #roomMembersDiv #m_" + memberid + " .controls .mic").css('display', 'inline-block');
        $("#Room_" + rid + " #roomMembersDiv #queueDiv #m_" + memberid).appendTo("#Room_" + rid + " #roomMembersDiv #MicDiv");
    };

    rHub.client.StopListenMic = function (memberid, rid) {
        var type = "Room";
        var window = chatVM.getWindow(rid, type);
        if (window == null)
            return;

        chatVM.stopMic(window, memberid);

        $("#Room_" + rid + " #roomMembersDiv #m_" + memberid + " .controls .mic").css('display', 'none');
        $("#Room_" + rid + " #roomMembersDiv #MicDiv #m_" + memberid).appendTo("#Room_" + rid + " #roomMembersDiv #regular");
    };

    rHub.client.UserRaisHand = function (rid, memberid) {
        var window = chatVM.getWindow(rid, "Room");
        if (window != null) {
            var member = window.getMember(memberid);
            if (member != null) {
                window.removeMember(memberid);
                window.addQueueMember(member);
            }
        }
    };

    rHub.client.UserDownHand = function (rid, memberid) {
        var window = chatVM.getWindow(rid, "Room");
        if (window != null) {
            var member = window.getQueueMember(memberid);
            if (member != null) {
                window.removeQueueMember(memberid);
                window.addMember(member);
            }
        }
    };

    rHub.client.UserMarked = function (rid, memberid) {
        $("#Room_" + rid + " #roomMembersDiv #m_" + memberid + " .controls .mark").css('display', 'block');
    };

    rHub.client.UserUnMarked = function (rid, memberid) {
        $("#Room_" + rid + " #roomMembersDiv #m_" + memberid + " .controls .mark").css('display', 'none');
    };

    rHub.client.ShowCamLink = function (mid, rid) {//member opened cam
        var window = chatVM.getWindow(rid, "Room");
        if (window != null) {
            var member = window.getMember(mid);
            if (member == null) {
                member = window.getQueueMember(mid);
            }
            if (member != null) {
                member.IsCamOpened(true);
                if (window.CurrentMemberSettings.NotifyOnOpenCam()) {
                    notify('info', 'العضو ' + member.MemberName() + ' فتح الكاميرا');
                }
            }
        }
        $('#Room_' + rid + ' #roomMembersDiv #m_' + mid + ' .controls .camera').css('display', 'inline-block');
    };

    rHub.client.HideCamLink = function (mid, rid) {
        var window = chatVM.getWindow(rid, "Room");
        if (window != null) {
            var member = window.getMember(mid);
            if (member == null) {
                member = window.getQueueMember(mid);
            }
            if (member != null) {
                member.IsCamOpened(false);
                if (window.CurrentMemberSettings.NotifyOnCloseCam()) {
                    notify('info', 'العضو ' + member.MemberName() + ' أغلق الكاميرا');
                }
            }
        }
        $('#Room_' + rid + ' #roomMembersDiv #m_' + mid + ' .controls .camera').css('display', 'none');
    };

    /*****************************************/
}
