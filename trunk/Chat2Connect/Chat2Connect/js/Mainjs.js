
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
    var arabicnospaces = new RegExp("^[\u0621-\u064A0-9-_]+$");
    var englishspaces = new RegExp("^[a-zA-z0-9-_\040]+$");
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


$(document).ready(function () {
    $('.datecontrol').datepicker({
        format: 'yyyy/mm/dd'
    });
    

    $('.SScroll').each(function () {
        $(this).slimScroll({
            railVisible: true,
            height: $(this).attr('data-height'),
            color: '#FEC401',
            railColor: '#C7C5C0',
            position: 'left'
        });
    });    
    
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

});


function notify(type, msg)
{
    $.pnotify({
        text: msg,
        type: type,
        history: false,
        closer_hover: false,
        delay: 5000,
        sticker: false
    });
}

/* room functions */

function addtoFav(rid) {
    //$('#pGeneral').css('display', 'block');
    $.ajax({
        url: "../Services/Services.asmx/AddRoomToFav",
        dataType: "json",
        type: "post",
        data: "{'rid':'" + rid + "'}",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            if (data.d == false) {
                //$('#pGeneral').css('display', 'none');
                $("#favlink_" + rid).css('display', 'block');
                notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
            }
            else if (data.d == true) {
                //$('#pGeneral').css('display', 'none');
                $("#favlink_" + rid).css('display', 'none');
                notify('success', 'تم إضافة الغرفة إلى المفضلة بنجاح.');                
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

function sendvideo(rid, url,sender, input)
{
    input.val('');
    if (url != '')
        rHub.server.sendVideoToRoom(rid, sender, url);
    else
        return false;
}

function SaveConversation(rid) {
    var str = $(".MsgHistroy", "#room_" + rid).html().replace('<div style="clear:both;height:1px;"></div>', "\r\n");
    $('#SaveConv_' + rid).attr("href", "data:text/plain;charset=UTF-8," + $('<span>' + str + '</span>').text());
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
        }
        else if ($("#usernode-" + id).parent("#offlinepeople") && status != "offline") {
            var node = $("#usernode-" + id);
            $("#usernode-" + id).remove();
            node.appendTo("#onlinepeople");
        }

    };
    
    sHub.client.inviteToTempRoom = function (rid, fname) {
        if (window.location.indexOf('homa.aspx') > -1)
            notify('info', fname + ' يدعوك لمحادثة فى غرفة مؤقتة' + '<br /><a onclick="addChatRoom(' + rid + ', \'غرفة مؤقتة\', \'Room\');" class="btn btn-main">إضغط هنا للدخول</a>');
        else
            notify('info', fname + ' يدعوك لمحادثة فى غرفة مؤقتة' + '<br /><a href="home.aspx?t=' + rid + '" target="_blank" class="btn btn-main">إضغط هنا للدخول</a>');

    };

    sHub.client.InviteToRoomByFriend = function (rid, roomname, MemberName) {
        notify('info', MemberName + ' يدعوك لدخول الغرفة "' + roomname + '"' + '<br /><a onclick="addChatRoom(' + rid + ', \'' + roomname + '\', \'Room\');" class="btn btn-main">إضغط هنا للدخول</a>');
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
