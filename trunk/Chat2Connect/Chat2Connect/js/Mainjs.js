
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
        format: 'dd/mm/yyyy'
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
    $('#pGeneral').css('display', 'block');
    $.ajax({
        url: "../Services/Services.asmx/AddRoomToFav",
        dataType: "json",
        type: "post",
        data: "{'rid':'" + rid + "'}",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            if (data.d == false) {
                $('#pGeneral').css('display', 'none');
                $("#favlink_" + rid).css('display', 'block');
                notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
            }
            else if (data.d == true) {
                $('#pGeneral').css('display', 'none');
                $("#favlink_" + rid).css('display', 'none');
                notify('success', 'تم إضافة الغرفة إلى المفضلة بنجاح.');                
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            $('#pGeneral').css('display', 'none');
            $("#favlink_" + rid).css('display', 'block');
            notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
        }
    });
}

function ClearQueue(rid) {
    $('#pGeneral').css('display', 'block');
    $.ajax({
        url: "../Services/Services.asmx/ClearQueue",
        dataType: "json",
        type: "post",
        data: "{'rid':'" + rid + "'}",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            if (data.d == false) {
                $('#pGeneral').css('display', 'none');                
                notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
            }
            else if (data.d == true) {
                $('#pGeneral').css('display', 'none');                
                notify('success', 'تم إزالة الأيدى بنجاح.');

            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            $('#pGeneral').css('display', 'none');            
            notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
        }
    });
}

function MarkMember(rid, enableWrite) {
    $('#pGeneral').css('display', 'block');
    $.ajax({
        url: "../Services/Services.asmx/MarkMembers",
        dataType: "json",
        type: "post",
        data: "{'rid':'" + rid + "', 'CanWrite' : '"+ enableWrite +"'}",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            if (data.d == false) {
                $('#pGeneral').css('display', 'none');
                notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
            }
            else if (data.d == true) {
                $('#pGeneral').css('display', 'none');
                if(enableWrite)
                    notify('success', 'تم تنقيط الأعضاء بنجاح.');
                else
                    notify('success', 'تم تنقيط الأعضاء وإيقاف الكتابة بنجاح.');

            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            $('#pGeneral').css('display', 'none');
            notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
        }
    });
}


/************ signalr ********************/
$(document).ready(function () {
    
    sHub = $.connection.notificationHub;
    rHub = $.connection.chatRoomHub;

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
        notify('info', fname + ' يدعوك لمحادثة فى غرفة مؤقتة' + '<br /><a href="home.aspx?t=' + rid + '" target="_blank" class="btn btn-main">إضغط هنا للدخول</a>');

    };

    

    /* rooms hub */
    rHub.client.getMessage = function (rid, sname, msg) {        
        $(".MsgHistroy", "#room_" + rid).append("<div class='pull-right' style='width:auto;margin-left:5px;'><b>" + sname + "</b>:</div><div class='pull-right' style='width:auto;'> " + msg + "</div><div style='clear:both;height:1px;'></div>");
        $(".MsgHistroy").slimScroll({
            railVisible: true,
            height: '400px',
            color: '#FEC401',
            railColor: '#C7C5C0',
            position: 'left',
            scrollTo: $(".MsgHistroy", "#room_" + rid).height()
        });

    };

    rHub.client.addNewMember = function (mid, name, rid) {
        var c = $("#room_" + rid + " #roomMembersDiv #regular div.rm:last-child").attr('class');
        if (c == "Alteven rm") {
            c = "Altodd rm";
        } else {
            c = "Alteven rm";
        }
        if (document.getElementById("m_" + mid)) {
            return;
        }
        $("#room_" + rid + " #roomMembersDiv #regular").append("<div class='" + c + "' id='m_" + mid + "'><a href='#'>" + name + "</a><div class='pull-left'><a href='#' class='camera'><img src='images/video_camera.png' style='width:16px;' /></a><img src='images/hand.png' style='width:16px;' class='hand'/><img src='images/microphone_1.png' style='width:16px;'/></div><div class='clearfix' style='height: 1px;' class='mic'></div></div>");
    };

    rHub.client.removeMember = function (mid) {
        $("#m_" + mid).remove();        
    };

    rHub.client.ListenMic = function (listenmic, memberid, rid) {
        var fn = window[listenmic];
        var fnparams = [memberid];
        if (typeof fn === 'function') {
           fn.apply(null,fnparams);
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

    rHub.client.UserRaisHand = function (rid,memberid) {        
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
    

    rHub.client.ShowCamLink = function (mid, rid) {
        $('#room_' + rid + ' #roomMembersDiv #m_' + mid + ' .controls .camera').css('display', 'inline-block');
    };

    rHub.client.HideCamLink = function (mid, rid) {
        $('#room_' + rid + ' #roomMembersDiv #m_' + mid + ' .controls .camera').css('display', 'none');
    };

    $.connection.hub.start().done(function () {
    });

});
/*****************************************/
