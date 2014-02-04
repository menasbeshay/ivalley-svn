
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


    /* rooms hub */
    rHub.client.getMessage = function (rid, sname, msg) {        
        $(".MsgHistroy", "#room_" + rid).append("<b>" + sname + "</b>: " + msg + "<div style='clear:both;height:1px;'></div>");
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
        var c = $("#room_" + rid + " #roomMembersDiv div.rm:last-child").attr('class');
        if (c == "Alteven rm") {
            c = "Altodd rm";
        } else {
            c = "Alteven rm";
        }
        if (document.getElementById("m_" + mid)) {
            return;
        }
        $("#room_" + rid + " #roomMembersDiv").append("<div class='" + c + "' id='m_" + mid + "'><a href='#'>" + name + "</a><div class='pull-left'><img src='images/video_camera.png' style='width:16px;' /><img src='images/hand.png' style='width:16px;'/><img src='images/microphone_1.png' style='width:16px;'/></div><div class='clearfix' style='height: 1px;'></div></div>");
    };

    rHub.client.removeMember = function (mid) {
        $("#m_" + mid).remove();        
    };


    $.connection.hub.start().done(function () {
    });

});
/*****************************************/
