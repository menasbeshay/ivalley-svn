
$('.main_menu ul').hover(function () {
    /*$('.main_menu').addClass("open").animate({ width: '142' }, 400);*/
    $(".main_menu.open ul li a").animate({ 'opacity': '1' }, 150);
},
function () {
    $(".main_menu ul li a").animate({ 'opacity': '0' }, 150);
    /*$('.main_menu').removeClass("open").animate({ width: '52' }, 400);*/
}
);
/*
$('.inner_main').hover(function () {
    $(".main_menu ul li a").animate({ 'opacity': '0' }, 150);
    $('.main_menu').removeClass("open").animate({width: '52'}, 400);
});
*/

/* validate registeration form */
function validChars(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    var inp = String.fromCharCode(charCode);
    if (/[a-zA-Z0-9-_\u0621-\u064A\040]/.test(inp))
        return true;

    return false;
}

function isValid(source, arguments) {
    var username = arguments.Value;
    //var arabicnospaces = new RegExp("^[\u0621-\u064A0-9-_]+$");
    //var englishspaces = new RegExp("^[a-zA-z0-9-_\040]+$");
    var arabicnospaces = new RegExp("^[\u0621-\u064A0-9][^\u0640]+$");
    var englishspaces = new RegExp("^[a-zA-z0-9]+$");
    //var arabicenglish = new RegExp("[a-zA-Z0-9-_\u0621-\u064A]");
    //if (!arabicenglish.test(username) && ( englishspaces.test(username) || arabicnospaces.test(username)))
    if (englishspaces.test(username) || arabicnospaces.test(username))
        arguments.IsValid = true;
    else
        arguments.IsValid = false;
}

function CheckBoxRequired_ClientValidate(sender, e) {
    e.IsValid = jQuery(".AcceptedAgreement input:checkbox").is(':checked');
}

var inFormOrLink = false;
$(document).ready(function () {
    $('.datecontrol').datepicker({
        format: 'yyyy/mm/dd'
    });
    
    $('.AccountMenu a').tooltip();    

    $('.SScroll').each(function () {
        $(this).slimScroll({
            railVisible: true,
            height: $(this).attr('data-height'),
            color: '#FEC401',
            railColor: '#C7C5C0',
            position: 'left'
        });
    });    
    
    initPopupMenu();

    initGeneralGiftModal();

    CountFriends();
    // hide popover on click on body
    $('body').on('click', function (e) {
        $('.roomMemberlink').each(function () {
            if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
                $(this).popover('hide');
            }
        });

        $('.friend-link').each(function () {
            if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
                $(this).popover('hide');
            }
        });
    });


    //$(window).bind('keydown keyup', function (e) {
    //    if (e.which === 116) {
    //        inFormOrLink = true;
    //    }        
    //});

    /*function isF5(e) {
        return e.which == 116;
    }
    function isCtrlR(e) {
        return e.ctrlKey && e.which == 82;
    }

    function triggerReloadKeys(e) {
        if (isF5(e) || isCtrlR(e)) {
            inFormOrLink = true;
        }
    }
    $(document).bind("keydown", triggerReloadKeys);


    $('header a').bind('click', function () { inFormOrLink = true; });
    $('.adminmenu a').bind('click', function () { inFormOrLink = true; });
    $('.main_menu a').bind('click', function () { inFormOrLink = true; });
    $('form').bind('submit', function () { inFormOrLink = true; });
    $('body a').bind('click', function () { inFormOrLink = true; });
    $(".statustextbox").on('change keyup paste', function () {
        $('#StatusCount').html(70 - $(this).val().length);
    });

   

    $(window).bind("beforeunload", function () {
        if(!inFormOrLink)
            HandleClose();
    });*/

    



});

/* validate profile wall */
function validateLength(oSrc, args) {
    args.IsValid = (args.Value.length <= 300);
}

function scrollRooms()
{
    $('#roomsDiv').slimScroll({
                    railVisible: true,
                    height: $(this).attr('data-height'),
                    color: '#FEC401',
                    railColor: '#C7C5C0',
                    position: 'left'
                });
}

function HandleClose()
{
    if (!inFormOrLink)
    {
        $.ajax({
            url: '../Services/Services.asmx/HandleClose',
            dataType: 'json',
            type: 'post',
            async:false
        });
    }
}


function CountFriends()
{
    $('#OnlineFriendsCount').html($('#onlinepeople > div').length);
    $('#OfflineFriendsCount').html($('#offlinepeople > div').length);
}

function textboxMultilineMaxNumber(txt,evt, maxLen) {
    try {
        if (!checkSpecialKeys(evt)) {
            if (txt.value.length > (maxLen - 1)) {
                if (window.event)//IE
                    evt.returnValue = false;
                else//Firefox
                    evt.preventDefault();
            }
        }

    } catch (e) {
    }
    return true;
}

function checkSpecialKeys(e) {
    if (e.keyCode != 8 && e.keyCode != 46 && e.keyCode != 37 && e.keyCode != 38 && e.keyCode != 39 && e.keyCode != 40)
        return false;
    else
        return true;
}


function initPopupMenu() {
    /*
    $('.friend-link').each(function () {
        var $this = $(this);
        $this.popover({
            trigger: 'click',
            placement: 'left',
            html: true,
            content: $this.find('.friendSubMenu').html(),
            container: 'body'
        });
    });
    */
    $('.friend-link').each(function () {
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
}


function removeFriend(mid, fid)
{
    $.ajax({
        url: '../Services/Services.asmx/AddRemoveFriend',
        type: 'GET',
        data: { mid: mid, fid: fid, isFriend: true },
        success: function (result) {
            $('#usernode-' + fid).popover('hide');
            notify('success', 'تم حذف صديقك بنجاح.');
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
        }
    });
}


var generalSelectedGift;
function initGeneralGiftModal() {
    //view gifts 
    // get all prices loaded
    var items = {};
    $('#GeneralGiftUL ul li').each(function () {
        items[$(this).attr('data-cat')] = true;
    });

    // select distinct price values
    var result = new Array();
    for (var i in items) {
        result.push(i);
    }

    // group gifts by prices
    for (i = 0; i < result.length; i++) {
        var wrapper = $('#GeneralGiftUL li[data-cat="' + result[i] + '"]').wrapAll('<div id="GeneralGiftwrapper_' + i + '" class="collapse" />');
        $('<a class="btn btn-default" data-toggle="collapse" data-target="#GeneralGiftwrapper_' + i + '" style="width:100%">' + result[i] + ' نقطة' + '</a><div class="clear" style="height:2px;"></div>').insertBefore(wrapper.parent());
        $('<div class="clear" style="height:2px;"></div>').appendTo(wrapper.parent());
        // open 1st panel only
        if (i == 0)
            wrapper.parent().addClass('in');
    }

    // init link in friends menu 
    $('.openGiftModal').click(function () {
        $('#GeneralGiftModal').modal('show');
        $('#GeneralGiftModal input.checkboxes').each(function () {
            $(this).attr('checked', false);
        });
        $('#GeneralGiftModal input.checkboxes[value="' + $(this).attr('data-mid') + '"]').attr('checked', 'checked');        
    });

    // init send btn 
    $('#btnGeneralSendGift').unbind('click');
    $('#btnGeneralSendGift').bind('click',function () { sendGeneralGift(); });

    // init select gift
    $('#GeneralGiftUL .GiftLabel').click(function () {
        generalSelectedGift = $(this);
        $('#GeneralGiftUL').find('label').removeClass('selected');
        $('#GeneralGiftUL' + ' #gift_' + generalSelectedGift.attr('data-giftid')).next('label').addClass('selected');
    });
    
    
}

function OpenGeneralGiftModal()
{
    $('#GeneralGiftModal').modal('show');
    $('#GeneralGiftModal input.checkboxes').each(function () {
        $(this).attr('checked', false);
    });
    $('#GeneralGiftModal input.checkboxes[value="' + $(this).attr('data-mid') + '"]').attr('checked', 'checked');
}

function sendGeneralGift()
{
    var cbs = $('#GeneralGiftMembers input:checked');
    var ToMember = [];
    $.each(cbs, function () {
        var member = { ID: $(this).val(), Name: $(this).attr('data-member-name') };
        ToMember.push(member);
    });
    var total = generalSelectedGift.attr('data-giftprice') * ToMember.length;
    if (total > chatVM.CreditPoints()) {
        notify('error', 'حدث خطأ . ليس لديك رصيد كافى.');
        $("#GeneralGiftModal").modal('hide');
        return;
    }
    else {
        $.ajax({
            url: '../Services/Services.asmx/SendGift',
            dataType: 'json',
            type: 'post',
            data: "{'memberName':'', 'roomID' : 0, 'roomName' :'','friends':" + JSON.stringify(ToMember) + ", 'giftid':" + generalSelectedGift.attr('data-giftid') + ", 'uniqueID' : ''}",
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                $("#GeneralGiftModal").modal('hide');
                notify('success', 'تم إرسال الهدية بنجاح');
                chatVM.CreditPoints(chatVM.CreditPoints() - total);
                return;
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                $("#GeneralGiftModal").modal('hide');
                notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
            }
        });
    }
}

function notify(type, msg)
{
    var myStack = { 'dir1': 'down', 'dir2': 'left', 'push': 'up', 'spacing1':25, 'spacing2':40 };
    
   $.pnotify({
        text: msg,
        type: type,
        history: false,
        closer_hover: false,
        delay: 5000,
        sticker: false,
        stack: myStack
    });
}

/* room functions */

function ToggleFav(rid, isfav) {
    //$('#pGeneral').css('display', 'block');
    $.ajax({
        url: "../Services/Services.asmx/ToggleFav",
        dataType: "json",
        type: "post",
        data: "{'rid':'" + rid + "'}",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            if (data.d == false) {
                //$('#pGeneral').css('display', 'none');
                //$("#favlink_" + rid).css('display', 'block');
                notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
            }
            else if (data.d == true) {
                //$('#pGeneral').css('display', 'none');
                //$("#favlink_" + rid).css('display', 'none');
                var window = chatVM.getwindow(rid, "Room");
                window.CurrentMember().IsFavorite(!isfav);
                notify('success', 'تم التحديث بنجاح.');                
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            //$('#pGeneral').css('display', 'none');
            $("#favlink_" + rid).css('display', 'block');
            notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
        }
    });
}

function ClearQueue(rid) {
    //$('#pGeneral').css('display', 'block');
    $.ajax({
        url: "../Services/Services.asmx/ClearQueue",
        dataType: "json",
        type: "post",
        data: "{'rid':'" + rid + "'}",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            if (data.d == false) {
               // $('#pGeneral').css('display', 'none');                
                notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
            }
            else if (data.d == true) {
                $('#pGeneral').css('display', 'none');                
                notify('success', 'تم إزالة الأيدى بنجاح.');

            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            //$('#pGeneral').css('display', 'none');            
            notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
        }
    });
}

function MarkMember(cb, rid, enableWrite) {
   // $('#pGeneral').css('display', 'block');
    $.ajax({
        url: "../Services/Services.asmx/MarkMembers",
        dataType: "json",
        type: "post",
        data: "{'rid':'" + rid + "', 'CanWrite' : '" + enableWrite + "', 'mark':'" + $(cb).prop('checked') + "'}",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            if (data.d == false) {
               // $('#pGeneral').css('display', 'none');
                notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
            }
            else if (data.d == true) {
              //  $('#pGeneral').css('display', 'none');
                if(enableWrite)
                    notify('success', 'تم تنقيط الأعضاء بنجاح.');
                else
                    notify('success', 'تم تنقيط الأعضاء وإيقاف الكتابة بنجاح.');

            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
           // $('#pGeneral').css('display', 'none');
            notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
        }
    });
}



function MarkMemberOnLogin(cb, rid, enableWrite) {
    //$('#pGeneral').css('display', 'block');
    $.ajax({
        url: "../Services/Services.asmx/MarkMemberOnLogin",
        dataType: "json",
        type: "post",
        data: "{'rid':'" + rid + "', 'CanWrite' : '" + enableWrite + "', 'mark' : '" + $(cb).prop('checked') + "'}",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            if (data.d == false) {
               // $('#pGeneral').css('display', 'none');
                notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
            }
            else if (data.d == true) {
               // $('#pGeneral').css('display', 'none');
                if (enableWrite)
                    notify('success', 'تم تنقيط الأعضاء بنجاح.');
                else
                    notify('success', 'تم تنقيط الأعضاء وإيقاف الكتابة بنجاح.');

            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            //$('#pGeneral').css('display', 'none');
            notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
        }
    });
}


function DisableCams(cb, rid) {
    //$('#pGeneral').css('display', 'block');
    $.ajax({
        url: "../Services/Services.asmx/DisableCams",
        dataType: "json",
        type: "post",
        data: "{'mark':'" + $(cb).prop('checked') + "','rid':'" + rid + "'}",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            if (data.d == false) {
               // $('#pGeneral').css('display', 'none');
                notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
            }
            else if (data.d == true) {
                //$('#pGeneral').css('display', 'none');
                notify('success', 'تم إيقاف الكمراء بنجاح.');
                
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            //$('#pGeneral').css('display', 'none');
            notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
        }
    });
}


function EnableMic(cb, rid, adminsonly) {
    //$('#pGeneral').css('display', 'block');
    $.ajax({
        url: "../Services/Services.asmx/EnableMic",
        dataType: "json",
        type: "post",
        data: "{'mark':'" + $(cb).prop('checked') + "','rid':'" + rid + "', 'adminsonly':'" + adminsonly + "'}",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            if (data.d == false) {
               // $('#pGeneral').css('display', 'none');
                notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
            }
            else if (data.d == true) {
               // $('#pGeneral').css('display', 'none');
                notify('success', 'تم إيقاف الكمراء بنجاح.');

            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
           // $('#pGeneral').css('display', 'none');
            notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
        }
    });
}


function RateRoom(rid, rate) {
   // $('#pGeneral').css('display', 'block');
    $.ajax({
        url: "../Services/Services.asmx/RateRoom",
        dataType: "json",
        type: "post",
        data: "{'rid':'" + rid + "', 'rate':'" + rate+ "'}",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            if (data.d == false) {
               // $('#pGeneral').css('display', 'none');
                notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
            }
            else if (data.d == true) {
              //  $('#pGeneral').css('display', 'none');
                notify('success', 'تم التقييم بنجاح.');

            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
           // $('#pGeneral').css('display', 'none');
            notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
        }
    });
}
function animateMenu(obj)
{
    var ul = obj.next("ul");
    if (ul.is(":hidden")) {
        ul.slideDown();
    } else {
        ul.slideUp();
    }

}

function SaveConversation(rid) {
    var str = $(".MsgHistroy", "#room_" + rid).html().replace('<div style="clear:both;height:1px;"></div>', "\r\n");
    $('#SaveConv_' + rid).attr("href", "data:text/plain;charset=UTF-8," + $('<span>' + str + '</span>').text());
}

function ToggleProfileLike(mid, pid) {
    //$('#pGeneral').css('display', 'block');
    $.ajax({
        url: "../Services/Services.asmx/ToggleProfileLike",
        dataType: "json",
        type: "post",
        data: "{'mid':'" + mid + "', 'pid':'"+pid+"'}",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            if (data.d == 0) {
                notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
            }
            else if (data.d == 1) {
                var count = $('#uiLabelLikeCount').text();
                count++;
                $('#uiLabelLikeCount').text(count);
                $('#uiLinkButtonLike').css('display', 'none');
                $('#uiLinkButtonUnLike').css('display', 'inline');
            }
            else if (data.d == 2) {
                var count = $('#uiLabelLikeCount').text();
                count--;
                $('#uiLabelLikeCount').text(count);
                $('#uiLinkButtonLike').css('display', 'inline');
                $('#uiLinkButtonUnLike').css('display', 'none');
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            //$('#pGeneral').css('display', 'none');
            $("#favlink_" + rid).css('display', 'block');
            notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
        }
    });
    return false;
}

/************ signalr ********************/
$(document).ready(function () {
    
    sHub = $.connection.notificationHub;

    /* notifications hub */
    sHub.client.friendStatusChanged = function (id, msg, status) {
        $("#user-status-" + id).text(msg);
        $("#user-" + id).removeClass("online busy away offline");
        $("#user-" + id).addClass(status);
        if ($("#usernode-" + id).parent("#onlinepeople") && status == "offline") {
            var node = $("#usernode-" + id);
            $("#usernode-" + id).remove();
            node.appendTo("#offlinepeople");
            var member = { id: id, name: $("#usernode-" + id).attr('data-name') };
            chatVM.removeOnlineFriend(member);
            initPopupMenu();
            CountFriends();
        }
        else if ($("#usernode-" + id).parent("#offlinepeople") && status != "offline") {
            var node = $("#usernode-" + id);
            $("#usernode-" + id).remove();
            node.appendTo("#onlinepeople");
            var member = { id: id, name: $("#usernode-" + id).attr('data-name') };
            chatVM.addOnlineFriend(member);
            initPopupMenu();
            CountFriends();
        }

    };
    
    sHub.client.inviteToTempRoom = function (rid, fname) {
        var location = window.location.href;
        if (location.indexOf('home.aspx') > -1)
        {
            $('#TempRoomInvitationModalContent').html(fname + ' يدعوك لمحادثة فى غرفة مؤقتة' + '<br /><a onclick="addChatRoom(' + rid + ', \'غرفة مؤقتة\', \'Room\', true);$(\'#TempRoomInvitationModal\').modal(\'hide\');" class="btn btn-main">إضغط هنا للدخول</a><audio autoplay><source src="files/sounds/invite.wav"></audio>');
            $('#TempRoomInvitationModal').modal('show');
        }
        else
        {
            $('#TempRoomInvitationModalContent').html(fname + ' يدعوك لمحادثة فى غرفة مؤقتة' + '<br /><a href="home.aspx?t=' + rid + '" target="_blank" class="btn btn-main">إضغط هنا للدخول</a><audio autoplay><source src="files/sounds/invite.wav"></audio>');
            $('#TempRoomInvitationModal').modal('show');
        }
            
    };

    sHub.client.InviteToRoomByFriend = function (rid, roomname, MemberName) {
        //  notify('info', MemberName + ' يدعوك لدخول الغرفة "' + roomname + '"' + '<br /><a onclick="addChatRoom(' + rid + ', \'' + roomname + '\', \'Room\', true);" class="btn btn-main">إضغط هنا للدخول</a>');
        $('#RoomInvitationModalContent').html(MemberName + ' يدعوك لدخول الغرفة "' + roomname + '"' + '<br /><a onclick="addChatRoom(' + rid + ', \'' + roomname + '\', \'Room\', true);$(\'#RoomInvitationModal\').modal(\'hide\');" class="btn btn-main">إضغط هنا للدخول</a><audio autoplay><source src="files/sounds/invite.wav"></audio>');
        $('#RoomInvitationModal').modal('show');
    };

    sHub.client.recieveMailNotification = function (id, totalNewMessages) {
        // Add the message to the page.
        if (totalNewMessages > 0) {
            $('#msgCount_' + id).text(totalNewMessages);
        }
        else {
            $('#msgCount_' + id).text("");
        }
    };

    $.connection.hub.start().done(function () {
        sHub.server.sendMailNotifications();
    }).fail(function (e) {

        alert(e);

    });

});

/*****************************************/



