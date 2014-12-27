function toggleBlockMember(data, event, block) {
    var mid = data.MemberID();
    if (block) {
        $('#usernode-' + mid).popover('hide');
    }
    $.ajax({
        url: '../Services/chat2connect.asmx/toggleBlockMember',
        type: 'GET',
        data: { mid: mid, block: block },
        success: function (result) {
            if (block) {
                notify('success', 'تم حظر الصديق بنجاح');
                var lst = chatVM.blockedMembers();
                var newItem = ko.mapping.fromJS(result);
                lst.push(newItem);
                chatVM.blockedMembers(lst);
            }
            else {
                notify('success', 'تم إلغاء حظر الصديق بنجاح');
                var newlst = ko.utils.arrayFilter(chatVM.blockedMembers(), function (f) {
                    return f.MemberID() != mid;
                });
                chatVM.blockedMembers(newlst);
            }

            $('.blocktip').tooltip();
        }
    });
}