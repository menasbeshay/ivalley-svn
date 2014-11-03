function member(roomHub, id, name, pic, points) {
    this.rHub = roomHub;
    this.memberID = mid;
    this.memberName = name;
    this.profilePic = ko.observable(pic);
    this.creditPoints = ko.observable(points);
    this.roomHub = roomHub;
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
    this.openChatRoom = function (room) {
        var tabType = 'RoomChat';
        var w = self.getTab(room.ID(), tabType);
        if (w == undefined) {
            w = new tab(room.ID(), room.Name(), room.TypeSpecID(), tabType, self);
            
            self.tabs.push(w);
        }
        self.selectedTab(w);
    }
    this.openPrivateRoom = function (data)
    {
        var tabType='PrivateChat';
        var w = self.getTab(data.MemberID(), tabType);
        if (w == undefined)
        {
            w = new tab(data.MemberID(), data.Name(), data.TypeSpecID(), tabType);
            self.tabs.push(w);
        }
        self.selectedTab(w);
    };
    this.removeWindow = function () {
        var win = this;
        self.chatWindows.remove(this);
    };
};
