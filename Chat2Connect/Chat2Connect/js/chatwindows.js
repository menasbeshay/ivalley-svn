
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

function Chat(maxWin, memberID, memberName) {
    var self = this;
    self.CurrentMemberID = memberID;
    self.CurrentMemberName = memberName;
    self.CreditPoints = ko.observable($("#uiHiddenFieldCreditPoints").val());
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
        var self = this;

        this.uniqueID = ko.computed(function () {
            return this.Type() + '_' + this.ID();
        }, this);

        this.Editor = null;
        this.AdminsEditor = null;
        this.selectedGift = null;

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
                url: '../Services/Services.asmx/UpdateRoomSetting',
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
            $.ajax({
                url: '../Services/Services.asmx/InviteFriends',
                dataType: 'json',
                type: 'post',
                data: "{'memberName':'" + self.CurrentMember().MemberName() + "', 'roomID' : " + window.ID() + ", 'roomName' :'" + window.Name() + "','friendsIDs':'" + $('#invite_' + window.uniqueID()).val() + "'}",
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
            if (chatVM.CreditPoints() >= window.selectedGift.price()) {
                $.ajax({
                    url: '../Services/Services.asmx/SendGift',
                    dataType: 'json',
                    type: 'post',
                    data: "{'memberName':'" + self.CurrentMember().MemberName() + "', 'roomID' : " + window.ID() + ", 'roomName' :'" + window.Name() + "','friendID':'" + $('#gift_' + window.uniqueID()).val() + "', 'friendName':'" + $("#gift_" + window.uniqueID()).tokenInput("get")[0].name + "', 'giftid':" + window.selectedGift.giftid() + "}",
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        $("#giftModal_" + window.uniqueID()).modal('hide');
                        notify('success', 'تم إرسال الهدية بنجاح');
                        $('#uiHiddenFieldCreditPoints').val(chatVM.CreditPoints() - window.selectedGift.price());
                        return;
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $("#giftModal_" + window.uniqueID()).modal('hide');
                        notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
                    }
                });
            }
            else {
                notify('error', 'حدث خطأ . ليس لديك رصيد كافى.');
                $("#giftModal_" + window.uniqueID()).modal('hide');

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
        //admin part
        this.showAdminPart = ko.observable(false);
        if (this.Type() == "Room" && this.CurrentMember().MemberLevelID()>1)
        {
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
        this.MessageHistory = ko.observableArray();
        this.AdminMessageHistory = ko.observableArray();
        this.toggleMessageTime = function () { };
        function chatMessage(msg)
        {
            var msgVM= { Message: msg, Time: new Date().toLocaleTimeString() };
            return msgVM;
        }
        this.addMessage = function (msg) {
            this.MessageHistory.push(chatMessage(msg));
            $(".MsgHistroy").slimScroll({
                railVisible: true,
                height: $(".MsgHistroy", "#" + this.uniqueID()).attr('data-height'),
                color: '#FEC401',
                railColor: '#C7C5C0',
                position: 'left',
                scrollTo: $(".MsgHistroy", "#" + this.uniqueID()).height()
            });
        };
        this.addAdminMessage = function (msg) {
            this.AdminMessageHistory.push(chatMessage(msg));
            $(".AdminMsgHistroy").slimScroll({
                railVisible: true,
                height: $(".AdminMsgHistroy", "#" + this.uniqueID()).attr('data-height'),
                color: '#FEC401',
                railColor: '#C7C5C0',
                position: 'left',
                scrollTo: $(".AdminMsgHistroy", "#" + this.uniqueID()).height()
            });
        };

        this.SaveConversation = function () {
            var str = '';
            ko.utils.arrayForEach(self.MessageHistory(), function (msg) {
                str += msg.Message;
            });
            $('#SaveConv_' + self.ID()).attr("href", "data:text/plain;charset=UTF-8," + str);
        };
       
    }

    self.changeCurrent = function (selctor) {
        if (document.getElementById(selctor)) {
            $('#MainTabs a[href="#' + selctor + '"]').tab('show');
            return;
        }
    };
    self.openWindow = function (id, name, type, istemp) {
        var window = self.getWindow(id, type, name);
        if (window == undefined) {
            self.addWindow(id, name, type, istemp);
        }
    };
    self.addWindow = function (id, name, type, istemp) {
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

            var room = { ID: id, Name: name, Type: type, IsTemp: true, Message: "", MessageHistory: "", Members: [{ MemberID: self.CurrentMemberID, MemberName: self.CurrentMemberName, IsMicOpened: false, IsCamOpened: false, IsCamViewed: false }], CurrentMemberID: self.CurrentMemberID, Gifts: gifts };
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
        room.CurrentMember().UserRate(val);
        return true;
    }
    self.sendMessage = function (window) {
        if (window == null)
            window = this;
        if (window.Type() == "Room") {
            rHub.server.sendToRoom(window.ID(), window.CurrentMember().MemberName(), window.Editor.getValue());
        }
        else {
            rHub.server.sendPrivateMessage(window.ID(), window.Editor.getValue());
        }
        //window.Message("");
        window.Editor.setValue("");
    }
    self.sendAdminMessage = function (window) {
        if (window == null)
            window = this;
        if (window.Type() == "Room" && window.CurrentMember().MemberLevelID() > 1) {
            rHub.server.sendToRoomAdmins(window.ID(), window.CurrentMember().MemberName(), window.AdminsEditor.getValue());
            window.AdminsEditor.setValue("");
        }
    };
   

    // init html Editor 
    // tooltips for toolbar
    // scroll bars
    self.Init = function (window) {
        window.Editor = new wysihtml5.Editor('uiTextMsg_' + window.uniqueID(), { toolbar: 'toolbar' + window.uniqueID(), parserRules: wysihtml5ParserRules, useLineBreaks: false, stylesheets: 'css/main.css' });
        if (window.Type() == 'Room' && $('#uiTextAdminMsg_' + window.uniqueID()).length > 0) {
            window.AdminsEditor = new wysihtml5.Editor('uiTextAdminMsg_' + window.uniqueID(), { toolbar: 'admintoolbar' + window.uniqueID(), parserRules: wysihtml5ParserRules, useLineBreaks: false, stylesheets: 'css/main.css' });
            window.AdminsEditor.observe('load', function () {
                window.AdminsEditor.composer.element.addEventListener('keyup', function (e) {
                    if (e.which == 13) {
                        e.preventDefault();
                        self.sendAdminMessage(window);
                    }
                });
            });
        }
        if (window.Type() == 'Room' && !window.CurrentMember().CanWrite())
            window.Editor.disable();
        // apply enter key listener
        window.Editor.observe('load', function () {
            window.Editor.composer.element.addEventListener('keyup', function (e) {
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
        // token input for invite members
        $("#invite_" + window.uniqueID()).tokenInput("Services/Services.asmx/SearchMembersFriends?memberID=" + self.CurrentMemberID, {
            theme: "facebook",
            preventDuplicates: true,
            hintText: "",
            noResultsText: "لا يوجد",
            searchingText: "بحث فى الأصدقاء..."
        });
        // token input for send gifts
        $("#gift_" + window.uniqueID()).tokenInput("Services/Services.asmx/SearchMembersFriends?memberID=" + self.CurrentMemberID, {
            theme: "facebook",
            preventDuplicates: true,
            hintText: "",
            noResultsText: "لا يوجد",
            searchingText: "بحث فى الأصدقاء...",
            tokenLimit: 1
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
                    member.QueueOrder(null);
                }
            }
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
                    member.QueueOrder(data.d);
                    rHub.server.userRaisHand(currentWindow.ID(), self.CurrentMemberID, member.QueueOrder());
                }
                else {
                    //move from queueMembers to roomMembers
                    var member = currentWindow.getMember(self.CurrentMemberID);
                    member.QueueOrder(null);
                    rHub.server.userDownHand(currentWindow.ID(), self.CurrentMemberID);
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                notify('error', 'حدث خطأ . من فضلك أعد المحاولة')
            }
        });
    }
    self.mic = function () {
        var currentWindow = this;
        if (currentWindow.CurrentMember().IsMicOpened() == false) {
            self.startMic(currentWindow, self.CurrentMemberID);
            currentWindow.CurrentMember().IsMicOpened(true);
        }
        else {
            self.stopMic(currentWindow, self.CurrentMemberID);
            currentWindow.CurrentMember().IsMicOpened(false);
        }
    }
    self.startMic = function (window, memberid) {
        var member = window.getMember(memberid);
        if (member != null) {
            getFlashMovie('chat2connect_' + window.uniqueID()).startMic(memberid);
            if (window.Type() == 'Private') {
                member.IsMicOpened(true);
                return;
            }
            // remove current mic member from mic if exists
            if (window.MicMember() != null) {
                self.stopMic(window, window.MicMember().MemberID());
            }
            member.IsMicOpened(true);
            // remove member from list and add it to mic
            member.QueueOrder(null);
            window.MicMember(member);
            if (self.CurrentMemberID == memberid) {
                rHub.server.userStartMic(window.ID(), memberid);
            }
            else {
                if (window.CurrentMember().NotifyOnMicOn()) {
                    notify('info', 'العضو ' + member.MemberName() + ' أخذ المايك');
                }
            }
        }
    }
    self.stopMic = function (window, memberid) {
        var member = window.getMember(memberid);

        if (member != null) {
            getFlashMovie('chat2connect_' + window.uniqueID()).stopMic(memberid);
            member.IsMicOpened(false);
            if (window.Type() == 'Private')
                return;

            member.QueueOrder(null);
            window.MicMember(null);
            if (self.CurrentMemberID == memberid)
                rHub.server.userStopMic(window.ID(), memberid)
            else {
                if (window.CurrentMember().NotifyOnMicOff()) {
                    notify('info', 'العضو ' + micMember.MemberName() + ' ترك المايك');
                }
            }
        }
    }

    self.cam = function () {
        var currentWindow = this;
        if (currentWindow.CurrentMember().IsCamOpened() == false) {
            self.startCam(currentWindow, currentWindow.CurrentMember().MemberID(), currentWindow.CurrentMember().MemberName());
            currentWindow.CurrentMember().IsCamOpened(true);
        }
        else {
            self.stopCam(currentWindow, currentWindow.CurrentMember().MemberID());
            currentWindow.CurrentMember().IsCamOpened(false);
        }
    }
    self.startCam = function (window, memberID, memberName) {
        getFlashMovie('chat2connect_' + window.uniqueID()).startCam(memberID, memberName);
        if (window.Type() == 'Private')
            return;
        if (self.CurrentMemberID == memberID) {
            rHub.server.userStartCam(window.ID(), self.CurrentMemberID);
        }
        else {
            var member = window.getMember(memberID);
            if (member != null)
                member.IsCamViewed(true);
        }
    }
    self.stopCam = function (window, memberID) {
        getFlashMovie('chat2connect_' + window.uniqueID()).stopCam(memberID);
        if (window.Type() == 'Private')
            return;
        if (self.CurrentMemberID == memberID) {
            rHub.server.userStopCam(window.ID(), self.CurrentMemberID);
        }
        else {
            var member = window.getMember(memberID);
            if (member != null)
                member.IsCamViewed(false);
        }
    }

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
            var imageDiv = "<img src='files/rooms/attachedimages/" + hiddenfield.val() + "' style='max-width:150px;'/>";

            rHub.server.sendToRoom(window.ID(), window.CurrentMember().MemberName(), imageDiv);
        }
        hiddenfield.val('');
        $('#UploadFileName_' + window.uniqueID()).val('');
        $('#UploadStatus_' + window.uniqueID()).html('');
        $('#UploadButton_' + window.uniqueID()).show();
        $('#uploadSendbtn_' + window.uniqueID()).hide();
        $('#UploadedFile_' + window.uniqueID()).html('');
        $("#attachModal_" + window.uniqueID()).modal('hide');
    }

}

function onCamClose(userId, roomId) {
    var window = chatVM.getWindow(roomId.substr(roomId.indexOf("_") + 1), 'Room');
    if (window == null)
        return;
    chatVM.stopCam(window, userId);
}

function onMicRecordSaveSuccess(fileName) {
    // returned file name & roomid in this format [roomId,filename]
    var window = chatVM.getWindow(fileName.substr(0, fileName.indexOf(",")), 'Room');

    var audioDiv = "<audio controls><source src='files/rooms/attacheaudio/" + fileName.substr(fileName.indexOf(",") + 1) + "' type='audio/mpeg'>Your browser does not support this audio format.</audio>";
    if (window == null)
        return;
    rHub.server.sendToRoom(window.ID(), window.CurrentMember().MemberName(), audioDiv);
    $("#attachModal_" + window.uniqueID()).modal('hide');

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

function addChatRoom(id, name, type, istemp) {
    if (chatVM == undefined)
        InitChat(100);
    chatVM.openWindow(id, name, type, istemp);
}

function getFlashMovie(movieName) {
    return document[movieName] || window[movieName];
}
var chatVM;
function InitChat(maxWinRooms, memberID, memberName) {
    chatVM = new Chat(maxWinRooms, memberID, memberName);
    ko.applyBindings(chatVM);

    /****** signalR ********/
    function addMsgToWindow(window, msg, css) {
        msg = "<div class='pull-left msgHolder " + css + "' style='width:auto;margin-right:5px;'>" + msg + "</div><div style='clear:both;height:3px;'></div>";
        window.addMessage(msg);
    }
    rHub = $.connection.chatRoomHub;
    rHub.client.getPrivateMessage = function (fromId, fromUserName, message) {
        var window = chatVM.getWindow(fromId, "Private", fromUserName);

        var newMsg = "<div class='pull-left msgHolder' style='width:auto;margin-right:5px;font-size:9px;font-family:tahoma;'><b>" + fromUserName + "</b></div><div class='pull-left msgHolder'><b>:</b></div><div class='pull-left msgHolder' style='width:auto;'> " + message + "</div><div style='clear:both;height:3px;'></div>";
        window.addMessage(newMsg);
    };
    rHub.client.getAdminMessage = function (rid, sname, msg) {
        var type = "Room";
        var window = chatVM.getWindow(rid, type, sname);
        if (window == null)
            return;
        var newMsg = "<div class='pull-left msgHolder' style='width:auto;margin-right:5px;font-size:9px;font-family:tahoma;'><b>" + sname + "</b></div><div class='pull-left msgHolder'><b>:</b></div><div class='pull-left msgHolder' style='width:auto;'> " + msg + "</div><div style='clear:both;height:3px;'></div>";
        window.addAdminMessage(newMsg);
    };
    rHub.client.getMessage = function (rid, sname, msg) {
        var type = "Room";
        var window = chatVM.getWindow(rid, type, sname);
        if (window == null)
            return;
        var newMsg = "<div class='pull-left msgHolder' style='width:auto;margin-right:5px;font-size:9px;font-family:tahoma;'><b>" + sname + "</b></div><div class='pull-left msgHolder'><b>:</b></div><div class='pull-left msgHolder' style='width:auto;'> " + msg + "</div><div style='clear:both;height:3px;'></div>";
        window.addMessage(newMsg);
    };
    rHub.client.getVideoMessage = function (rid, sname, url) {
        var arr = url.split('v='); // remove "youtube.com/watch?v="
        var id = arr[1].split('&'); // extract vedio id from query string - first element in the array

        var type = "Room";
        var window = chatVM.getWindow(rid, type, sname);
        if (window == null)
            return;
        var newMsg = "<div class='pull-left msgHolder' style='width:auto;margin-right:5px;font-size:9px;font-family:tahoma;'><b>" + sname + "</b></div><div class='pull-left msgHolder'><b>:</b></div><div class='pull-left msgHolder' style='width:auto;'><a href='" + url + "' target='_blank'><img src='http://img.youtube.com/vi/" + id[0] + "/0.jpg' style='max-width:120px;' /></div><div style='clear:both;height:1px;'></div>";
        window.addMessage(newMsg);
    };
    rHub.client.addNewMember = function (rid, memberData) {
        var newMember = ko.mapping.fromJS(memberData);
        var type = "Room";
        var window = chatVM.getWindow(rid, type);
        if (window == null)
            return;
        var existingMember = window.getMember(newMember.MemberID());
        if (existingMember != null && existingMember.InRoom())//already exists in the room
            return;

        if (existingMember == null) {
            window.Members().push(newMember);
        }
        else {
            newMember = existingMember;
        }
        newMember.InRoom(true);
        if (window.CurrentMember().NotifyOnFriendsLogOn()) {
            var msg = newMember.MemberName() + ' قد إنضم للغرفة ';
            addMsgToWindow(window, msg, "joinalert");
        }
        // init popover menu for new members
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

        chatVM.startMic(window, memberid);
    };
    rHub.client.StopListenMic = function (memberid, rid) {
        var type = "Room";
        var window = chatVM.getWindow(rid, type);
        if (window == null)
            return;

        chatVM.stopMic(window, memberid);
    };
    rHub.client.UserRaisHand = function (rid, memberid, queueOrder) {
        var window = chatVM.getWindow(rid, "Room");
        if (window != null) {
            var member = window.getMember(memberid);
            if (member != null) {
                member.QueueOrder(queueOrder);
            }
        }
    };
    rHub.client.UserDownHand = function (rid, memberid) {
        var window = chatVM.getWindow(rid, "Room");
        if (window != null) {
            var member = window.getMember(memberid);
            if (member != null) {
                member.QueueOrder(null);
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
                if (window.CurrentMember().NotifyOnOpenCam()) {
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
                if (window.CurrentMember().NotifyOnCloseCam()) {
                    var msg = member.MemberName() + ' أغلق الكمراء';
                    addMsgToWindow(window, msg, "leftalert");
                }
            }
        }
        //  $('#Room_' + rid + ' #roomMembersDiv #m_' + mid + ' .controls .camera').css('display', 'none');
    };
    rHub.client.UserDownHandAll = function (rid) {
        var window = chatVM.getWindow(rid, "Room");
        if (window != null) {
            ko.utils.arrayForEach(window.QueueMembers(), function (member) {
                member.QueueOrder(null);
            });

        }
    };
    rHub.client.GiftSentInRoom = function (roomID, memberName, friendName, giftName) {
        var window = chatVM.getWindow(roomID, "Room");
        message = "<div class='pull-left giftmsg'>" + memberName + " أرسل هدية (" + giftName + ") إلى " + friendName + "</div><div style='clear:both;height:1px;'></div>";
        var history = window.MessageHistory();
        window.MessageHistory(history + message);
        $(".MsgHistroy").slimScroll({
            railVisible: true,
            height: $(".MsgHistroy", "#" + window.uniqueID()).attr('data-height'),
            color: '#FEC401',
            railColor: '#C7C5C0',
            position: 'left',
            scrollTo: $(".MsgHistroy", "#" + window.uniqueID()).height()
        });
    };

    /*****************************************/
}
