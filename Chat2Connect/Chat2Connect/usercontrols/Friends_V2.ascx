<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Friends_V2.ascx.cs" Inherits="Chat2Connect.usercontrols.Friends_V2" %>
<div style="padding: 5px; padding-right: 0px; margin-left: 10px;" class="col-lg-12" id="friendsRightNav">
    <ul class="nav nav-tabs">
        <li class="pull-right active"><a href="#OnlineFriends" data-toggle="tab">المتواجدين (<span data-bind="text: onlineFriends().length"></span>)</a></li>
        <li class="pull-right"><a data-toggle="tab" href="#OfflineFriends">غير المتواجدين (<span data-bind="text: offlineFriends().length"></span>)</a></li>
        <li class="pull-right"><a data-toggle="tab" href="#BlockedMembers">المحظورين</a></li>
        <li class="pull-right"><a data-toggle="tab" href="#HelpMembers">المساعدة</a></li>
    </ul>
</div>
<div class="tab-content" style="min-height:300px;">
    <div class="tab-pane active" id="OnlineFriends">
        <div data-bind="if: friends.loaded()">
            <div style="height:320px;" data-bind="koGrid: {
    data: onlineFriends, showFilter: false, headerRowHeight: 0, footerVisible: false, canSelectRows: false,
    showColumnMenu: false, showFilter: false, displaySelectionCheckbox: false, autogenerateColumns: false,
    rowTemplate: $('#onlineFriendTmpl').html(), rowHeight: 50,
    columnDefs: [{ field: 'MemberID' }, { field: 'Name' }, { field: 'ProfilePic' }, { field: 'Status' }, { field: 'StatusMsg' }, { field: 'TypeSpecID' }, { field: 'Name' }]
}">
            </div>
        </div>
        <!--ko ifnot:friends.loaded()-->
        <div data-bind="with: friends()" class="loading">
        </div>
        <!--/ko-->
    </div>
    <div class="tab-pane active" id="OfflineFriends">
        <div data-bind="if: friends.loaded()">
            <div style="height: 250px;" data-bind="koGrid: {
    data: offlineFriends, showFilter: false, headerRowHeight: 0, footerVisible: false, canSelectRows: false,
    showColumnMenu: false, showFilter: false, displaySelectionCheckbox: false, autogenerateColumns: false,
    rowTemplate: $('#offlineFriendTmpl').html(), rowHeight: 50,
    columnDefs: [{ field: 'MemberID' }, { field: 'Name' }, { field: 'ProfilePic' }, { field: 'Status' }, { field: 'StatusMsg' }, { field: 'TypeSpecID' }, { field: 'Name' }]
}">
            </div>
        </div>
        <!--ko ifnot:friends.loaded()-->
        <div data-bind="with: friends()" class="loading">
        </div>
        <!--/ko-->
    </div>
    <div class="tab-pane" id="BlockedMembers">
        <div  data-bind="if: blockedMembers.loaded()">
            <!--ko template: { name: 'blockedTmpl',foreach: blockedMembers}-->
            <!--/ko-->
        </div>
        <!--ko ifnot:blockedMembers.loaded()-->
        <div data-bind="with: blockedMembers()" class="loading">
        </div>
        <!--/ko-->
    </div>
    <div class="tab-pane" id="HelpMembers">
        <div id="helpcontact" style="font-weight: bold;" data-bind="if: helpMembers.loaded()">
            <!-- ko foreach: onlineHelpMembers -->
            <div data-bind="css: $index() % 2 == 0 ? 'Alteven' : 'Altodd'">
                <img data-bind="attr: { 'src': 'Thumb.aspx?Image=' + ProfilePic() + '&w=32&h=32' }, css: Status().toLowerCase()" class='friendpic ' style="display: block" />
                <a h ref="#" data-bind="attr: { 'onclick': 'addChatRoom(' + $data.MemberID() + ',\'' + $data.Name() + '\',\'Private\', false, false, 1, true,' + $data.TypeSpecID() + ', true,\'' + $data.ProfilePic() + '\');' }" style="margin: 5px; display: block">
                    <span data-bind="text: Name"></span>
                </a>
                <div class="clearfix" style="height: 1px;"></div>
                <span data-bind="text: $data.StatusMsg() ? $data.StatusMsg() : '&nbsp;', attr: { id: 'user-status-' + $data.MemberID() }"></span>
            </div>
            <!-- /ko -->
            <div class="clearfix" style="border-bottom: 1px solid #FEC200"></div>
            <!-- ko foreach: offlineHelpMembers -->
            <div data-bind="css: $index() % 2 == 0 ? 'Alteven' : 'Altodd'">
                <img data-bind="attr: { 'src': 'Thumb.aspx?Image=' + ProfilePic() + '&w=32&h=32' }" class='friendpic offline' style="display: block" />
                <a href="#" data-bind="attr: { 'onclick': 'addChatRoom(' + $data.MemberID() + ',\'' + $data.Name() + '\',\'Private\', false, false, 1, true,' + $data.TypeSpecID() + ', true,\'' + $data.ProfilePic() + '\');' }" style="margin: 5px; display: block">
                    <span data-bind="text: Name"></span>
                </a>
                <div class="clearfix" style="height: 1px;"></div>
                <span data-bind="text: $data.StatusMsg() ? $data.StatusMsg() : '&nbsp;'"></span>
            </div>
            <!-- /ko -->
        </div>
        <!--ko ifnot:helpMembers.loaded()-->
        <div data-bind="with: helpMembers()" class="loading">
        </div>
        <!--/ko-->
    </div>
</div>

<script id="offlineFriendTmpl" type="text/html">
    <div class="friend-link" data-bind="attr: { id: 'usernode-' + $data.entity.MemberID(), 'data-name': $data.entity.Name() }">
        <img data-bind="attr: { src: 'Thumb.aspx?Image=' + $data.entity.ProfilePic() + '&w=32&h=32', id: 'user-' + $data.entity.MemberID() }, css: 'offline'" class='friendpic' />
        <a href="#" data-bind="css: 'type_' + $data.entity.TypeSpecID(), text: $data.entity.Name"></a>
        <div class="clearfix" style="height: 1px;"></div>
        <span data-bind="text: $data.entity.StatusMsg() ? $data.entity.StatusMsg() : '&nbsp;', attr: { id: 'user-status-' + $data.entity.MemberID() }"></span>
        <div class="clearfix" style="height: 1px;"></div>
        <div class="friendSubMenu">
            <div class="popup-menu profileMenu" data-bind="attr: { 'data-for': 'usernode-' + $data.entity.MemberID() }">
                <div class="col-lg-3 pull-right">
                    <div class=" thumbnail">
                        <img data-bind="attr: { src: 'Thumb.aspx?Image=' + $data.entity.ProfilePic() + '&w=80&h=80' }" />
                    </div>
                    <div class="clearfix" style="height: 1px;">
                    </div>
                    <div data-bind="text: $data.entity.Name" style="text-align: right;">
                    </div>
                </div>
                <%--<div class="col-lg-9 pull-right">
                    <!--ko if:!$root.isBlockingMe($data.entity.MemberID())-->
                    <div class="col-lg-6 pull-right">
                        <ul>
                            <li><a class="jslink" data-bind="attr: { 'onclick': 'OpenPopup(\'../userprofile.aspx?uid=' + $data.entity.MemberID() + '\',\'حساب صديق\');' }" target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a></li>
                            <li><a class="jslink" data-bind="click: $root.removeFriend"><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a></li>
                        </ul>
                    </div>
                    <!--/ko-->
                    <div class="col-lg-6 pull-right">
                        <ul>
                            <!--ko if:!$parent.isBlockingMe($data.entity.MemberID())-->
                            <li><a class="jslink openGiftModal" data-bind="attr: { 'data-mid': $data.entity.MemberID() }"><span class="awesome">&#xf06b;</span> أرسل هدية</a></li>
                            <li><a data-bind="attr: { 'onclick': 'OpenPopup(\'../popuppages/Messages_popup.aspx?t=createmsg&u=' + $data.entity.MemberID() + '&un=' + $data.entity.Name() + '\',\'الرسائل\');' }" style="cursor: pointer;"><span class="awesome">&#xf003;</span> أرسل رسالة</a></li>
                            <!--/ko-->
                            <li><a class="jslink" data-bind="click: function (data, event) { toggleBlockMember(data, event, true) }"><span class="icon icon-ban-circle"></span><span>حظر</span></a></li>
                        </ul>
                    </div>
                </div>--%>
                <div class="clear" style="height: 1px;"></div>
            </div>
        </div>
    </div>
</script>
<script id="blockedTmpl" type="text/html">
    <div class="block-link" data-bind="attr: { id: 'usernode-' + $data.entity.MemberID(), 'data-name': $data.entity.Name() }">
        <img data-bind="attr: { src: 'Thumb.aspx?Image=' + $data.entity.ProfilePic() + '&w=32&h=32', id: 'user-' + $data.entity.MemberID() }, css: $data.entity.IsOnline() ? $data.entity.Status() : 'offline'" class='friendpic' />
        <i class="icon-ban-circle blockcircle"></i>
        <a href="#" data-bind="css: 'type_' + $data.entity.TypeSpecID(), text: $data.entity.Name"></a>
        <div style="float: left; margin-left: 30px; cursor: pointer;" class="blocktip" title="إلغاء الحظر" data-placement="top"><i class="icon icon-remove" data-bind="click: function(data, event) { toggleBlockMember(data, event,false) }"></i></div>
        <div class="clearfix" style="height: 1px;"></div>
        <span data-bind="text: $data.entity.StatusMsg() ? $data.entity.StatusMsg() : '&nbsp;', attr: { id: 'user-status-' + $data.entity.MemberID() }"></span>
        <div class="clearfix" style="height: 1px;"></div>
    </div>
</script>

<script type="text/html" id="onlineFriendTmpl">

    <div class="friend-link" data-bind="attr: { id: 'usernode-' + $data.entity.MemberID(), 'data-name': $data.entity.Name() }">
        <img data-bind="attr: { src: 'Thumb.aspx?Image=' + $data.entity.ProfilePic() + '&w=32&h=32', id: 'user-' + $data.entity.MemberID() }, css: $data.entity.Status()" class='friendpic' />
        <a href="#" data-bind="css: 'type_' + $data.entity.TypeSpecID(), text: $data.entity.Name"></a>
        <div class="clearfix" style="height: 1px;"></div>
        <span data-bind="text: $data.entity.StatusMsg() ? $data.entity.StatusMsg() : '&nbsp;', attr: { id: 'user-status-' + $data.entity.MemberID() }"></span>
        <div class="clearfix" style="height: 1px;"></div>
        <div class='friendSubMenu'>
            <div class="popup-menu profileMenu" data-bind="attr: { 'data-for': 'usernode-' + $data.entity.MemberID() }">
                <div class="col-lg-3 pull-right">
                    <div class=" thumbnail">
                        <img data-bind="attr: { src: 'Thumb.aspx?Image=' + $data.entity.ProfilePic() + '&w=80&h=80' }" style="max-height: 70px;" />
                    </div>
                    <div class="clearfix" style="height: 1px;">
                    </div>
                    <div data-bind="text: $data.entity.Name" style="text-align: right;">
                    </div>
                </div>
                <div class="col-lg-9 pull-right">
                    <div class="col-lg-6 pull-right">
                        <ul>
                            <!-- ko if($data.entity.Status() != 'busy')-->
                            <li><a class="jslink" data-bind="attr: { 'onclick': 'addChatRoom(' + $data.entity.MemberID() + ',\'' + $data.entity.Name() + '\',\'Private\', false, false, 1, true,' + $data.entity.TypeSpecID() + ', true,\'' + $data.entity.ProfilePic() + '\');' }"><span class="awesome">&#xf0e6;</span> محادثة خاصة</a></li>
                            <!--/ko-->
                            <li><a class="jslink" data-bind="attr: { 'onclick': 'OpenPopup(\'../userprofile.aspx?uid=' + $data.entity.MemberID() + '\',\'حساب صديق\');' }" target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a></li>
                            <li><a class="jslink" data-bind="click: $root.removeFriend"><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-6 pull-right">
                        <ul>
                            <li><a class="jslink openGiftModal" data-bind="attr: { 'data-mid': $data.entity.MemberID() }"><span class="awesome">&#xf06b;</span> أرسل هدية</a></li>
                            <li><a data-bind="attr: { 'onclick': 'OpenPopup(\'../popuppages/Messages_popup.aspx?t=createmsg&u=' + $data.entity.MemberID() + '&un=' + $data.entity.Name() + '\',\'الرسائل\');' }" style="cursor: pointer;"><span class="awesome">&#xf003;</span> أرسل رسالة</a></li>
                            <li><a class="jslink" data-bind="click: function (data, event) { toggleBlockMember(data, event, true) }"><span class="icon icon-ban-circle"></span><span>حظر</span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="clear" style="height: 1px;"></div>
            </div>
        </div>
    </div>
</script>
<script>
    $(document).on('click', '.friend-link', function (e) {
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
</script>
