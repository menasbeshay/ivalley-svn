function member(rHub, id, name, pic, points) {
    this.roomChatWindowType = 'RoomChat';
    this.privateChatWindowType = 'PrivateChat';
    this.rHub = rHub;
    this.memberID = mid;
    this.memberName = name;
    this.profilePic = ko.observable(pic);
    this.creditPoints = ko.observable(points);
    this.tabs = ko.observableArray([]);
    var w = new tab(0, 'الرئيسية', 1, 'RoomsList');
    this.tabs.push(w);
    this.selectedTab = ko.observable();
    if (this.tabs().length > 0) {
        this.selectedTab(this.tabs()[0]);
    }
    var self = this;
    //Help Members
    this.getHelpMembers = function () {
        $.post("../services/chat2connect.asmx/GetHelpMembers", { mid: this.memberID })
                .done(function (data) {
                    var lst=[];
                    ko.utils.arrayMap(data, function (item) {
                        lst.push(ko.mapping.fromJS(item));
                    });
                    self.helpMembers(lst);
                });
    };
    this.helpMembers = ko.onDemandObservable(this.getHelpMembers, this);
    this.onlineHelpMembers = ko.computed(function () {
        if (this.helpMembers() == undefined)
            return [];
        return ko.utils.arrayFilter(this.helpMembers(), function (help) {
            return help.IsOnline();
        });
    }, this);
    this.offlineHelpMembers = ko.computed(function () {
        if (this.helpMembers() == undefined)
            return [];
        return ko.utils.arrayFilter(this.helpMembers(), function (help) {
            return !help.IsOnline();
        });
    }, this);
    //Friends
    this.getFriends = function () {
        $.post("../services/chat2connect.asmx/GetFriends", { mid: this.memberID })
                .done(function (data) {
                    var lst=[];
                    ko.utils.arrayMap(data, function (item) {
                        lst.push(ko.mapping.fromJS(item));
                    });
                    self.friends(lst);
                });
    };
    this.friends = ko.onDemandObservable(this.getFriends, this);
    this.onlineFriends = ko.computed(function () {
        if (this.friends() == undefined)
            return [];
        return ko.utils.arrayFilter(this.friends(), function (f) {
            return f.IsOnline();
        });
    }, this);
    this.offlineFriends = ko.computed(function () {
        if (this.friends() == undefined)
            return [];
        return ko.utils.arrayFilter(this.friends(), function (f) {
            return !f.IsOnline();
        });
    }, this);

    this.rooms = ko.observableArray([]);
    this.loadRooms = function (param, data, event) {
        $('#accordion').find('.catLink').removeClass('selected');
        $('#accordion').find('.subcatLink').removeClass('selected');
        $(event.target).addClass('selected');
        $.post("../services/chat2connect.asmx/GetRooms", { localParams: param })
                .done(function (data) {
                    var lst = [];
                    ko.utils.arrayMap(data, function (item) {
                        lst.push(ko.mapping.fromJS(item));
                    });
                    self.rooms(lst);
                });
    };
    //open private chat window
    this.getTab = function (id, type) {
        return ko.utils.arrayFirst(self.tabs(), function (w) {
            return w.id == id && w.type==type;
        });
    };
    this.getRoomChatWindow = function (id) {
        var w = self.getTab(id, self.roomChatWindowType);
        if (w != undefined)
            return w.room();
        return null;
    }
    this.getPrivateChatWindow = function (id,name,typeSpecID) {
        var w = self.getTab(id, self.privateChatWindowType);
        if (w == undefined) {
            w = new tab(id, name, typeSpecID, self.privateChatWindowType);
            self.tabs.push(w);
        }
        return w.room();
    }
    this.openChatRoom = function (room) {
        var w = self.getRoomChatWindow(room.ID());
        if (w == undefined) {
            w = new tab(room.ID(), room.Name(), room.TypeSpecID(), self.roomChatWindowType, self);
            self.tabs.push(w);
        }
        self.selectedTab(w);
    }
    this.openPrivateRoom = function (data) {
        var w = self.getTab(data.MemberID(), self.privateChatWindowType);
        if (w == undefined) {
            w = new tab(data.MemberID(), data.Name(), data.TypeSpecID(), self.privateChatWindowType);
            self.tabs.push(w);
        }
        self.selectedTab(w);
    };
    this.removeWindow = function () {
        var tab = this;
        if (tab.type == self.roomChatWindowType) {
            if (tab.room().WelcomeBot.hasOwnProperty("LogoutMsgPart1")) {
                var msg = tab.room().WelcomeBot.LogoutMsgPart1() + ' ' + tab.room().CurrentMember().MemberName() + ' ' + tab.room().WelcomeBot.LogoutMsgPart2();
                var botImg = "<img src='/images/bots/EmailOwner_" + tab.room().Settings.TypeID() + ".png' width=25px;height=25px/>";
                msg = botImg + '<span class="botMsg" style="color:' + tab.room().Settings.Color() + '">' + msg + '</span>';
                notify('success', msg);
            }
            if (tab.room().CurrentMember().IsCamOpened())
                tab.room().stopCam(self.memberID);
            rHub.server.removeFromRoom(tab.id);
            $.post("../services/Services.asmx/closeChatRoom", { id: tab.id });
        }
        self.selectedTab(null);
        self.tabs.remove(tab);
        if (self.tabs().length > 0) {
            self.selectedTab(self.tabs()[0]);
        }
    };
};
