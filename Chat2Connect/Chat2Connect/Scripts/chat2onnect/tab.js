function tab(id, name, typeSpecID, type, viewModel) {
    var self = this;
    this.id = id;
    this.name = ko.observable(name);
    this.typeSpecID = ko.observable(typeSpecID);
    this.type = type;
    this.viewModel = viewModel;
    //room details
    this.getRoom = function () {
        $.post("../services/chat2connect.asmx/GetChatRoom", { id: this.id, isTemp: false })
                .done(function (data) {
                    if (data.Status == 1) {
                        var room = new chatWindow(data.Data, self.viewModel);
                        self.room(room);
                        room.Init();
                        setTimeout(function () { room.initEditor(); }, 1500);

                        self.viewModel.rHub.server.addToRoom(room.ID(), room.CurrentMember().InRoom());
                    }
                    else {
                        self.error(data.Data);
                        self.room({});
                    };
                });
    };
    this.room = ko.onDemandObservable(this.getRoom, this);
    this.error = ko.observable("");
}
function initPopover(window) {
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
                title: '<a class="close pull-left closepopover" style="color:#fff;" onclick="$(&#39;#' + $this.attr('id') + '&#39;).popover(&#39;hide&#39;);">&times;</a>',
                container: '#' + window.uniqueID()
            }).on('hidden.bs.popover', function () {
                $this.append(popoverContent);
            });
        }
    });


    // init popover for bots 
    $('.botIcon').each(function () {
        var $this = $(this);
        var popoverContent = $this.find('.botInfo');
        // check if popover content exists
        if (popoverContent.length > 0) {
            $this.popover({
                trigger: 'hover',
                placement: 'top',
                html: true,
                content: popoverContent,
                template: '<div class="popover awesome-popover-class"><div class="arrow"></div><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"><p></p></div></div></div>',
                title: '<a class="close pull-left closepopover" style="color:#fff;" onclick="$(&#39;#' + $this.attr('id') + '&#39;).popover(&#39;hide&#39;);">&times;</a>',
                container: '#' + window.uniqueID()
            }).on('hidden.bs.popover', function () {
                $this.append(popoverContent);
            });
        }
    });

}
function createHamsaWindow(hamsa, sender) {

    var div = '<div class="ui-widget-content draggable hamsa" rel="0">' +
               '<div class="header">' +
                  '<button type="button" class="close pull-left" onclick="javascript:$(this).parent().closest(\'.hamsa\').remove();">×</button>' +
                  '<span class="selText" rel="0">همسة من ' + sender + '</span>' +
               '</div>' +
               '<div id="divMessage" class="messageArea">' + hamsa + '<div class="clear" style="height:1px;"></div></div>' + '</div>';

    var $div = $(div);
    $('#MainTabs').prepend($div);
    $div.draggable({
        handle: ".header",
        stop: function () {
        }
    });
}
function getFlashMovie(movieName) {
    return document[movieName] || window[movieName];
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