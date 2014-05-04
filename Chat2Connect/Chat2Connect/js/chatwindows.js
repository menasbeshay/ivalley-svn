//ko.bindingHandlers.scrollToEnd = {
//    update: function(element, valueAccessor) {

//    }
//};
function Chat(maxWin, memberID, memberName) {
    var self = this;
    var editor;
    self.CurrentMemberID = memberID;
    self.CurrentMemberName = memberName;
    self.maxRoom = ko.observable(maxWin);
    self.windows = ko.observableArray();
    self.Editor = editor;
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

        //Room Members
        this.getMember = function (id) {
            return ko.utils.arrayFirst(this.RoomMembers(), function (mem) {
                return mem.MemberID() == id;
            });
        }
        this.addMember = function (id, name) {
            var member = this.getMember(id);
            if (member != null)
                return;
            member = { MemberID: id, MemberName: name, MemberTypeID: 1 };
            var memberVM = ko.mapping.fromJS(member);
            this.RoomMembers.push(memberVM);
        };
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
        this.addQueueMember = function (id, name) {
            var member = this.getQueueMember(id);
            if (member != null)
                return;
            member = { MemberID: id, MemberName: name, MemberTypeID: 1 };
            var memberVM = ko.mapping.fromJS(member);
            this.QueueMembers.push(memberVM);
        };
        this.removeQueueMember = function (id) {
            var member = this.getQueueMember(id);
            if (member != null) {
                this.QueueMembers.remove(member);
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
            var room = { ID: id, Name: name, Type: type, IsTemp: true, Message: editor.getValue(), MessageHistory: "" };
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
                    self.InitEditor(id);
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
    self.keyboardCmd = function (data, event) {
        if (event.keyCode == 13)
            self.sendMessage(this);
        return true;
    };

    // init html editor 
    self.InitEditor = function (id) {        
        self.Editor = new wysihtml5.Editor('uiTextMsg_' + id, { toolbar: 'toolbar' + id, parserRules: wysihtml5ParserRules, useLineBreaks: false, stylesheets: 'css/main.css' });
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
                    currentWindow.removeMember(self.CurrentMemberID);
                    currentWindow.addQueueMember(self.CurrentMemberID, self.CurrentMemberName);
                    rHub.server.userRaisHand(currentWindow.ID(), self.CurrentMemberID);
                }
                else {
                    //move from queueMembers to roomMembers
                    currentWindow.removeQueueMember(self.CurrentMemberID);
                    currentWindow.addMember(self.CurrentMemberID, self.CurrentMemberName);
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
        if (currentWindow.IsMicOpened() == false) {
            self.startMic(currentWindow, self.CurrentMemberID);
            //currentWindow.NoOfMics(currentWindow.NoOfMics() + 1);
            //set current member as micMember
            var member = currentWindow.getQueueMember(self.CurrentMemberID);
            if (member != null) {
                currentWindow.removeQueueMember(self.CurrentMemberID);
                currentWindow.MicMember(member);
            }
            currentWindow.IsMicOpened(true);
        }
        else {
            self.stopMic(currentWindow, self.CurrentMemberID);
            //currentWindow.NoOfMics(currentWindow.NoOfMics() - 1);
            var micMember = currentWindow.MicMember();//remove from mic member to room members
            if (micMember != null) {
                currentWindow.addMember(micMember.MemberID(), micMember.MemberName());
                currentWindow.MicMember(null);
            }
            currentWindow.IsMicOpened(false);
        }
    }
    self.startMic = function (window, memberID) {
        getFlashMovie('chat2connect_' + window.uniqueID()).startMic(memberID);
        if (self.CurrentMemberID == memberID) {
            rHub.server.userStartMic(window.ID(), memberID);
        }
        if (window.Type() == "Room") {

            //$('#room_5 #roomMembersDiv #m_' + userId + ' .controls .hand').css('display', 'none');
            //$('#room_5 #roomMembersDiv #m_' + userId + ' .controls .mic').css('display', 'inline-block');
        }
    }
    self.stopMic = function (window, memberID) {
        getFlashMovie5('chat2connect_' + window.uniqueID()).stopMic(memberID);
        if (self.CurrentMemberID == memberID)
            rHub.server.userStopMic(window.ID(), memberID);
        //$('#room_5 #roomMembersDiv #m_6 .controls .mic').css('display', 'none');
    }

    self.cam=function()
    {
        var currentWindow = this;
        if (currentWindow.IsCamOpened() == false) {
            self.startCam(currentWindow,self.CurrentMemberID);
            currentWindow.IsCamOpened(true);
        }
        else {
            self.stopCam(currentWindow, self.CurrentMemberID);
            currentWindow.IsCamOpened(false);
        }
    }
    self.startCam=function(window, memberID)
    {
        getFlashMovie('chat2connect_' + window.uniqueID()).startCam(memberID);
        if (self.CurrentMemberID == memberID) {
            rHub.server.userStartCam(window.ID(), self.CurrentMemberID);
           // $('#room_5 #roomMembersDiv #m_6 .controls .camera').css('display', 'inline-block');
        }
    }
    self.stopCam=function(window,memberID)
    {
        getFlashMovie('chat2connect_' + window.uniqueID()).stopCam(memberID);
        if (self.CurrentMemberID == memberID) {
            rHub.server.userStopCam(window.ID(), self.CurrentMemberID);
            //$('#room_5 #roomMembersDiv #m_6 .controls .camera').css('display', 'none');
        }
    }
}

function addChatRoom(id, name) {
    if (chatVM == undefined)
        InitChat(100);
    chatVM.openWindow(id, name, 'Room');
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
        var window = chatVM.getWindow(rid, "Room");
        if (chatVM != null)
        {
            var member = window.getMember(memberid);
            if (member != null)
            {
                window.removeMember(memberid);
                window.addQueueMember(memberid, member.MemberName());
            }
        }
    };

    rHub.client.UserDownHand = function (rid, memberid) {
        var window = chatVM.getWindow(rid, "Room");
        if (chatVM != null) {
            var member = window.getMember(memberid);
            if (member != null) {
                window.removeQueueMember(memberid);
                window.addMember(memberid, member.MemberName());
            }
        }
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
