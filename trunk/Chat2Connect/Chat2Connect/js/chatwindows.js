//ko.bindingHandlers.scrollToEnd = {
//    update: function(element, valueAccessor) {

//    }
//};
function Chat(maxWin, memberID, memberName) {
    var self = this;
    self.CurrentMemberID = memberID;
    self.CurrentMemberName = memberName;
    self.maxRoom = ko.observable(maxWin);
    self.windows = ko.observableArray();
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

        this.getMember = function (id) {
            return ko.utils.arrayFirst(this.RoomMembers(), function (mem) {
                return mem.MemberID() == id;
            });
        }
        this.addMember = function (id, name) {
            var member =this.getMember(id);
            if (member != undefined)
                return;
            member = { MemberID: id, MemberName: name, MemberTypeID: 1 };
            var memberVM = ko.mapping.fromJS(member);
            this.RoomMembers.push(memberVM);
        };
        this.removeMember = function (id) {
            var member = this.getMember(id);
            if (member != undefined) {
                this.RoomMembers.remove(member);
            }
        };
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
            var room = { ID: id, Name: name, Type: type, IsTemp: true, Message: "", MessageHistory: "" };
            self.windows.push(ko.mapping.fromJS(room, mapping));
            self.changeCurrent(type + '_' + id);
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
                    self.changeCurrent(type + '_' + id);
                    rHub.server.addToRoom(id); 
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
        room.UserRate(val);
        return true;
    }
    self.sendMessage = function (window) {
        if (window == null)
            window = this;
        if (window.Type() == "Room")
        {
            rHub.server.sendToRoom(window.ID(), self.CurrentMemberName, window.Message());
        }
        else
        {
            rHub.server.sendPrivateMessage(window.ID(), window.Message());
        }
        window.Message("");
    }
    self.keyboardCmd = function (data, event) {
        if (event.keyCode == 13)
            self.sendMessage(this);
        return true;
    };

    self.removeMember = function (mid)
    {
        ko.utils.arrayForEach(self.allRooms(), function (room) {
            room.removeMember(mid);
        });
    };
}
function addChatRoom(id, name) {
    if (chatVM == undefined)
        InitChat(100);
    chatVM.openWindow(id, name, 'Room');
}
var chatVM;
function InitChat(maxWinRooms, memberID, memberName) {
    chatVM = new Chat(maxWinRooms, memberID, memberName);
    ko.applyBindings(chatVM);

    /****** signalR ********/
    rHub = $.connection.chatRoomHub;
    rHub.client.getPrivateMessage = function (fromId, fromUserName, message) {
        var window = chatVM.getWindow(fromId,"Private",fromUserName);
        
        var history = window.MessageHistory();
        var newMsg = "<div class='pull-left' style='width:auto;margin-right:5px;'><b>" + fromUserName + ":</b></div><div class='pull-left' style='width:auto;'> " + message + "</div><div style='clear:both;height:1px;'></div>";
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
        var newMsg = "<div class='pull-left' style='width:auto;margin-right:5px;'><b>" + sname + ":</b></div><div class='pull-left' style='width:auto;'> " + msg + "</div><div style='clear:both;height:1px;'></div>";
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
        var newMsg = "<div class='pull-left' style='width:auto;margin-right:5px;'><b>" + sname + ":</b></div><div class='pull-left' style='width:auto;'><a href='" + url + "' target='_blank'><img src='http://img.youtube.com/vi/" + id[0] + "/0.jpg' style='max-width:120px;' /></div><div style='clear:both;height:1px;'></div>";
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
        window.addMember(mid, name);
    };
    rHub.client.removeMember = function (mid) {
        chatVM.removeMember(mid);
    };

    rHub.client.ListenMic = function (listenmic, memberid, rid) {
        var fn = window[listenmic];
        var fnparams = [memberid];
        if (typeof fn === 'function') {
            fn.apply(null, fnparams);
        }
        $("#room_" + rid + " #roomMembersDiv #m_" + memberid + " .controls .hand").css('display', 'none');
        $("#room_" + rid + " #roomMembersDiv #m_" + memberid + " .controls .mic").css('display', 'inline-block');
        $("#room_" + rid + " #roomMembersDiv #queueDiv #m_" + memberid).appendTo("#room_" + rid + " #roomMembersDiv #MicDiv");
    };

    rHub.client.StopListenMic = function (listenmic, memberid, rid) {
        var fn = window[listenmic];
        var fnparams = [memberid];
        if (typeof fn === 'function') {
            fn.apply(null, fnparams);
        }
        $("#room_" + rid + " #roomMembersDiv #m_" + memberid + " .controls .mic").css('display', 'none');
        $("#room_" + rid + " #roomMembersDiv #MicDiv #m_" + memberid).appendTo("#room_" + rid + " #roomMembersDiv #regular");
    };

    rHub.client.UserRaisHand = function (rid, memberid) {
        $("#room_" + rid + " #roomMembersDiv #regular #m_" + memberid + " .controls .hand").css('display', 'inline-block');

        $("#room_" + rid + " #roomMembersDiv #regular #m_" + memberid).appendTo("#room_" + rid + " #roomMembersDiv #queueDiv");
    };

    rHub.client.UserDownHand = function (rid, memberid) {
        $("#room_" + rid + " #roomMembersDiv #queueDiv #m_" + memberid + " .controls .hand").css('display', 'none');
        $("#room_" + rid + " #roomMembersDiv #queueDiv #m_" + memberid).appendTo("#room_" + rid + " #roomMembersDiv #regular");

    };

    rHub.client.UserMarked = function (rid, memberid) {
        $("#room_" + rid + " #roomMembersDiv #m_" + memberid + " .controls .mark").css('display', 'block');
    };

    rHub.client.UserUnMarked = function (rid, memberid) {
        $("#room_" + rid + " #roomMembersDiv #m_" + memberid + " .controls .mark").css('display', 'none');
    };

    rHub.client.ShowCamLink = function (mid, rid) {
        $('#room_' + rid + ' #roomMembersDiv #m_' + mid + ' .controls .camera').css('display', 'inline-block');
    };

    rHub.client.HideCamLink = function (mid, rid) {
        $('#room_' + rid + ' #roomMembersDiv #m_' + mid + ' .controls .camera').css('display', 'none');
    };

    /*****************************************/
}
