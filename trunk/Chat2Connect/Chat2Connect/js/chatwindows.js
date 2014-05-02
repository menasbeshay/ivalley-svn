function addChatRoom(id, name) {
    chatVM.addWindow(id, name, 'Room');
}
function Chat() {
    var self = this;
    self.windows = ko.observableArray();
    self.changeCurrent = function (selctor) {
        if (document.getElementById(selctor)) {
            $('#MainTabs a[href="#' + selctor + '"]').tab('show');
            return;
        }
    };
    self.addWindow = function (id, name, type) {
        if (document.getElementById(type+'_'+id)) {
            $('#MainTabs a[href="#' + type + '_' + id + '"]').tab('show');
            return;
        }
        
        if (type == 'Private') {
            var room = { ID: id, Name: name, Type: type };
            self.windows.push(ko.mapping.fromJS(room));
            self.changeCurrent(type + '_' + id);
        }
        else {
            $.post("../services/Services.asmx/GetChatRoom", { id: id, isTemp: false })
                .done(function (data) {
                    self.windows.push(ko.mapping.fromJS(data));
                    self.changeCurrent(type + '_' + id);
                    ApplyEditor();
                });
        }
    }
    self.removeWindow = function () {
        self.windows.remove(this);
        $('.nav-tabs a:last').tab('show');
    }
    self.rateRoom=function(val)
    {
        var room = this;
        RateRoom(room.ID(), val);
    }

}
var chatVM = new Chat();

ko.applyBindings(chatVM);

function ApplyEditor() {
    var editor_5 = new wysihtml5.Editor('uiTextMsg_5',{toolbar: 'toolbar5', parserRules: wysihtml5ParserRules, useLineBreaks: false, stylesheets: 'css/main.css'});
    editor_5.observe('load', function () {
        editor_5.composer.element.addEventListener('keyup', function (e) {
            if (e.which == 13) { e.preventDefault(); $('#a_Send_5').trigger('click'); }
        });
    });
}