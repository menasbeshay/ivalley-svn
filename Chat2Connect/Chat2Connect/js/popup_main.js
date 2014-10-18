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