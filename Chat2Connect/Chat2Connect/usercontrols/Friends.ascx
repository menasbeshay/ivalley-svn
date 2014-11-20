<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Friends.ascx.cs" Inherits="Chat2Connect.usercontrols.Friends" %>
<div class="SScroll" data-height="380px">
    <div class="panel-group" id="accordion1">
        <div>
            <div class="pull-right"><a data-toggle="collapse" data-parent="#accordion1" href="#helpcontact">المساعدة</a></div>
            <div class="clearfix"></div>
            <div id="helpcontact" class="panel-collapse collapse in" style="font-weight: bold;" data-bind="if: helpMembers.loaded()">
                <!-- ko foreach: onlineHelpMembers -->
                <div data-bind="css: $index() % 2 == 0 ? 'Alteven' : 'Altodd'">
                    <img data-bind="attr: { 'src': (ProfilePic() != '') ? ProfilePic() : 'images/defaultavatar.png' }, css: Status().toLowerCase()" class='friendpic ' style="display: block" />
                    <a h    ref="#" data-bind="attr: { 'onclick': 'addChatRoom('+$data.MemberID()+',\''+$data.Name()+'\',\'Private\', false, false, 1, true,'+$data.TypeSpecID()+', true,\''+$data.ProfilePic()+'\');' }" style="margin: 5px; display: block">
                        <span data-bind="text: Name"></span>
                    </a>
                    <div class="clearfix" style="height: 1px;"></div>
                    <span data-bind="text: $data.StatusMsg() ? $data.StatusMsg() : '&nbsp;', attr: { id: 'user-status-' + $data.MemberID() }"></span>                    
                </div>
                <!-- /ko -->
                <div class="clearfix" style="border-bottom: 1px solid #FEC200"></div>
                <!-- ko foreach: offlineHelpMembers -->
                <div data-bind="css: $index() % 2 == 0 ? 'Alteven' : 'Altodd'">
                    <img data-bind="attr: { 'src': (ProfilePic() != '') ? ProfilePic() : 'images/defaultavatar.png' }" class='friendpic offline' style="display: block" />
                    <a href="#" data-bind="attr: { 'onclick': 'addChatRoom(' + $data.MemberID() + ',\'' + $data.Name() + '\',\'Private\', false, false, 1, true,' + $data.TypeSpecID() + ', true,\'' + $data.ProfilePic() + '\');' }" style="margin: 5px; display: block">
                        <span data-bind="text: Name"></span>
                    </a>
                    <div class="clearfix" style="height: 1px;"></div>
                    <span data-bind="text: $data.StatusMsg() ? $data.StatusMsg() : '&nbsp;', attr: { id: 'user-status-' + $data.MemberID() }"></span>
                </div>
                <!-- /ko -->
            </div>
            <!--ko ifnot:helpMembers.loaded()-->
            <div data-bind="with: helpMembers()" class="loading">
            </div>
            <!--/ko-->
            <div class="clearfix"></div>
        </div>
        <div style="height: 5px;" class="clearfix"></div>
        <div>
            <div class="pull-right"><a data-toggle="collapse" data-parent="#accordion1" href="#onlinepeople">الأصدقاء المتواجدين (<span data-bind="text: onlineFriends().length"></span>)</a></div>
            <div class="clearfix"></div>
            <div id="onlinepeople" class="panel-collapse collapse in " data-bind="if: friends.loaded()">
                <!--ko template: { name: 'friendTmpl',foreach: onlineFriends,afterRender:function(){initPopupMenu();} }-->

                <!--/ko-->
            </div>
            <!--ko ifnot:friends.loaded()-->
            <div data-bind="with: friends()" class="loading">
            </div>
            <!--/ko-->
            <div class="clearfix"></div>
        </div>
        <div style="height: 5px;" class="clearfix"></div>
        <div>
            <div class="pull-right"><a data-toggle="collapse" data-parent="#accordion1" href="#offlinepeople">الأصدقاء غير المتواجدين (<span data-bind="text: offlineFriends().length"></span>)</a></div>
            <div class="clearfix"></div>
            <div id="offlinepeople" class="panel-collapse collapse in " data-bind="if: friends.loaded()">
                <!--ko template: { name: 'friendTmpl',foreach: offlineFriends ,afterRender:function(){initPopupMenu();} }-->
                <!--/ko-->
            </div>
            <!--ko ifnot:friends.loaded()-->
            <div data-bind="with: friends()" class="loading">
            </div>
            <!--/ko-->
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<script id="friendTmpl" type="text/html">
    <div class="friend-link" data-bind="attr: { id: 'usernode-' + $data.MemberID(), 'data-name': $data.Name() }, css: $index() % 2 == 0 ? 'Alteven' : 'Altodd'">
        <img data-bind="attr: { src: $data.ProfilePic(), id: 'user-' + $data.MemberID() }, css: IsOnline() && !MeBlocked() == true ? Status() : 'offline'" class='friendpic' />
        <a href="#" data-bind="css: 'type_' + $data.TypeSpecID(), text: $data.Name"></a>
        <div class="clearfix" style="height: 1px;"></div>
        <span data-bind="text: $data.StatusMsg() ? $data.StatusMsg() : '&nbsp;', attr: { id: 'user-status-' + $data.MemberID() }"></span>
        <div class="clearfix" style="height: 1px;"></div>
        <!-- ko if: IsBlocked()-->
        <i class="icon-ban-circle" style="color: #f00;position:absolute;top:10px;left:20px;"></i>
        <!-- /ko -->
        <div class="friendSubMenu">
            <div class="popup-menu profileMenu" data-bind="attr: { 'data-for': 'usernode-' + $data.MemberID() }">
                <div class="col-lg-3 pull-right">
                    <div class=" thumbnail">
                        <img data-bind="attr: { src: $data.ProfilePic() }" style="max-height: 70px;" />
                    </div>
                    <div class="clearfix" style="height: 1px;">
                    </div>
                    <div data-bind="text: $data.Name" style="text-align: right;">
                    </div>
                </div>
                <div class="col-lg-9 pull-right">
                    <div class="col-lg-6 pull-right">
                        <ul>
                            <li><a class="jslink" data-bind="attr: { 'onclick': 'addChatRoom('+$data.MemberID()+',\''+$data.Name()+'\',\'Private\', false, false, 1, true,'+$data.TypeSpecID()+', true,\''+$data.ProfilePic()+'\');' }"><span class="awesome">&#xf0e6;</span> محادثة خاصة</a></li>
                            <li><a class="jslink" data-bind="attr: { 'onclick': 'OpenPopup(\'../userprofile.aspx?uid=' + $data.MemberID() + '\',\'حساب صديق\');' }" target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a></li>
                            <li><a class="jslink" data-bind="click: $root.removeFriend"><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-6 pull-right">
                        <ul>
                            <li><a class="jslink openGiftModal" data-bind="attr: { 'data-mid': $data.MemberID() }"><span class="awesome">&#xf06b;</span> أرسل هدية</a></li>
                            <li><a data-bind="attr: { 'onclick': 'OpenPopup(\'../popuppages/Messages_popup.aspx?t=createmsg&u=' + $data.MemberID() + '&un=' + $data.Name() + '\',\'الرسائل\');' }" style="cursor: pointer;"><span class="awesome">&#xf003;</span> أرسل رسالة</a></li>
                            <li><a class="jslink" data-bind="click: $root.toggleBlockFriend.bind($data, $root.CurrentMemberID, $data.MemberID(), !$data.IsBlocked())"><span class="icon" data-bind="    css: $data.IsBlocked() ? 'icon icon-remove' : 'icon icon-ban-circle'"></span> <span data-bind="    text: !$data.IsBlocked() ? ' حظر ' : ' إلغاء الحظر '"></span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="clear" style="height: 1px;"></div>
            </div>
        </div>
    </div>
</script>