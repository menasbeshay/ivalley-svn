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


function notify(type, msg) {
    var myStack = { 'dir1': 'down', 'dir2': 'left', 'push': 'up', 'spacing1': 25, 'spacing2': 40 };

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


/* validate profile wall */
function validateLength(oSrc, args) {
    args.IsValid = (args.Value.length <= 300);
}


$(document).ready(function () { 
    ///////////////////////// profile functions ///////////////////////////////////

    $('#clearCurrentProfilePic').click(function () {
        $.ajax({
            url: "../Services/Services.asmx/ClearProfileImg",
            dataType: "json",
            type: "post",
            data: "{'mid':'" + $('#uiHiddenFieldCID_profile').val() + "'}",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                if (data.d == false) {
                    notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
                }
                else if (data.d == true) {
                    notify('success', 'تم حذف الصورة بنجاح.');
                    setTimeout(function () { window.location.replace(window.location.href); }, 2000);
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
            }
        });
    });


    $('.ProfilePics .profileselect').click(function () {
        $('.ProfilePics').find('label').removeClass('selected');
        $('.ProfilePics' + ' #profile_' + $(this).attr('data-Picid')).next('label').addClass('selected');
    });

    $('#LinkSelectProfilePhoto').click(function () {
        var pid = $('.ProfilePics').find('label.selected').attr('data-Picid');
        if (pid != undefined) {
            $.ajax({
                url: "../Services/Services.asmx/SelectProfileImg",
                dataType: "json",
                type: "post",
                data: "{'mid':'" + $('#uiHiddenFieldCID_profile').val() + "', 'pid':'" + pid + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    if (data.d == false) {
                        notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
                    }
                    else if (data.d == true) {
                        notify('success', 'تم تغيير الصورة بنجاح.');
                        setTimeout(function () { window.location.replace(window.location.href); }, 2000);
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
                }
            });
        }
        else {
            notify('error', ' خطأ . من فضلك اختر صورة.');
        }
    });
});