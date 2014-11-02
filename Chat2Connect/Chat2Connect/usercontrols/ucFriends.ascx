<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucFriends.ascx.cs" Inherits="Chat2Connect.usercontrols.ucFriends" %>
<div class="SScroll" data-height="380px">
    <div class="panel-group" id="accordion1">
        <div>

            <div class="pull-right"><a data-toggle="collapse" data-parent="#accordion1" href="#helpcontact">المساعدة</a></div>
            <div class="clearfix"></div>
            <div id="helpcontact" class="panel-collapse collapse in" style="font-weight: bold;">
                <!-- ko foreach: OnlineHelpMembers -->
                <div class="Altodd">
                    <img data-bind="attr: { 'src': (ProfilePic != '') ? ProfilePic : 'images/defaultavatar.png' }, css:IsOnline == true?'online' : 'offline'" class='friendpic ' style="display:block" />
                    <a href="#" data-bind="click: $root.openWindow.bind($data, $data.ID(), $data.Name(), 'Private', false, false, 1, false, $data.TypeSpecID(), true, $data.ProfilePic())" style="margin:5px;display:block">
                        <span data-bind="text:Name"></span> 
                    </a>
                    <div class="clearfix" style="height: 5px;"></div>
                </div>
                <!-- /ko -->
                <!-- ko foreach: OfflineHelpMembers -->
                <div class="Altodd">
                    <a href="#" data-bind="text: Name"> 
                    </a>
                    <div class="clearfix" style="height: 5px;"></div>
                </div>
                <!-- /ko -->
            </div>
            <div class="clearfix"></div>
        </div>

        <div style="height: 5px;" class="clearfix"></div>

        <div>
            <div class="pull-right"><a data-toggle="collapse" data-parent="#accordion1" href="#onlinepeople">الأصدقاء المتواجدين (<span id="OnlineFriendsCount"></span>)</a></div>
            <div class="clearfix"></div>
            <asp:Repeater ID="uiRepeaterOnline" runat="server">
                <HeaderTemplate>
                    <div id="onlinepeople" class="panel-collapse collapse in ">
                </HeaderTemplate>
                <FooterTemplate></div></FooterTemplate>
                <ItemTemplate>
                    <div class="Altodd friend-link" id='usernode-<%# Eval("MemberID") %>' data-name='<%# Eval("UserName") %>'>
                        <img src='<%# string.IsNullOrEmpty(Eval("ProfilePic").ToString()) ? "images/defaultavatar.png" : Eval("ProfilePic").ToString() %>' id='user-<%# Eval("MemberID") %>' class='friendpic online' />
                        <a href="#" class='type_<%# Eval("MemberTypeID") %>'><%# Eval("UserName") %>
                        </a>
                        <div class="clearfix" style="height: 1px;"></div>
                        <span id='user-status-<%# Eval("MemberID") %>'>
                            <%# string.IsNullOrEmpty(Eval("StatusMsg").ToString()) ? "&nbsp;" : Eval("StatusMsg")  %>
                        </span>
                        <div class="clearfix" style="height: 1px;"></div>
                        <div class="friendSubMenu">
                            <div class="popup-menu profileMenu" data-for='usernode-<%# Eval("MemberID") %>'>
                                <div class="col-lg-3 pull-right">
                                    <div class=" thumbnail">
                                        <img src='<%# string.IsNullOrEmpty(Eval("ProfilePic").ToString()) ? "images/defaultavatar.png" : Eval("ProfilePic").ToString() %>' style="max-height:70px;" />

                                    </div>
                                    <div class="clearfix" style="height: 1px;">
                                    </div>
                                    <div style="text-align: right;">
                                        <%# Eval("UserName") %>
                                    </div>
                                </div>
                                <div class="col-lg-9 pull-right">
                                    <div class="col-lg-6 pull-right">
                                        <ul>
                                            <li><a class="jslink" onclick='addChatRoom(<%# Eval("MemberID") %>, "<%# Eval("UserName") %>", "Private", false, false, 1, true,<%# Eval("MemberTypeID") %>, true,"<%# Eval("ProfilePic") %>");'><span class="awesome">&#xf0e6;</span> محادثة خاصة</a></li>
                                            <li><a class="jslink" onclick="OpenPopup('../userprofile.aspx?uid=<%# Eval("MemberID") %>','حساب صديق');" target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a></li>
                                            <li><a class="jslink" onclick="removeFriend(<%# BLL.Member.CurrentMemberID %>,<%# Eval("MemberID") %>);"><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-6 pull-right">
                                        <ul>
                                            <li><a class="jslink openGiftModal" data-mid='<%# Eval("MemberID") %>'><span class="awesome">&#xf06b;</span> أرسل هدية</a></li>
                                            <li><a onclick="OpenPopup('../popuppages/Messages_popup.aspx?t=createmsg&u=<%# Eval("MemberID") %>&un=<%# Eval("UserName") %>','الرسائل');" style="cursor:pointer;"><span class="awesome">&#xf003;</span> أرسل رسالة</a></li>

                                            <li><a class="jslink"><span class="awesome">&#xf05e;</span> حجب</a></li>

                                        </ul>
                                    </div>
                                </div>
                                <div class="clear" style="height: 1px;"></div>
                            </div>
                        </div>                       
                    </div>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <div class="Alteven friend-link" id='usernode-<%# Eval("MemberID") %>' data-name='<%# Eval("UserName") %>'>
                        <img src='<%# string.IsNullOrEmpty(Eval("ProfilePic").ToString()) ? "images/defaultavatar.png" : Eval("ProfilePic").ToString() %>' id='user-<%# Eval("MemberID") %>' class="friendpic online" />
                        <a href="#" class='type_<%# Eval("MemberTypeID") %>'><%# Eval("UserName") %>
                        </a>
                        <div class="clearfix" style="height: 1px;"></div>
                        <span id='user-status-<%# Eval("MemberID") %>'>
                            <%# string.IsNullOrEmpty(Eval("StatusMsg").ToString()) ? "&nbsp;" : Eval("StatusMsg")  %>
                        </span>
                        <div class="clearfix" style="height: 1px;"></div>
                        <div class="friendSubMenu">
                            <div class="popup-menu profileMenu" data-for='usernode-<%# Eval("MemberID") %>'>
                                <div class="col-lg-3 pull-right">
                                    <div class=" thumbnail">
                                        <img src='<%# string.IsNullOrEmpty(Eval("ProfilePic").ToString()) ? "images/defaultavatar.png" : Eval("ProfilePic").ToString() %>' style="max-height:70px;" />

                                    </div>
                                    <div class="clearfix" style="height: 1px;">
                                    </div>
                                    <div style="text-align: right;">
                                        <%# Eval("UserName") %>
                                    </div>
                                </div>
                                <div class="col-lg-9 pull-right">
                                    <div class="col-lg-6 pull-right">
                                        <ul>
                                            <li><a class="jslink" onclick='addChatRoom(<%# Eval("MemberID") %>, "<%# Eval("UserName") %>", "Private", false, false, 1, true,<%# Eval("MemberTypeID") %>, true,"<%# Eval("ProfilePic") %>");'><span class="awesome">&#xf0e6;</span> محادثة خاصة</a></li>
                                            <%--<li><a class="jslink"><span class="awesome">&#xf030;</span> عرض الكاميرا</a></li>--%>
                                            <li><a class="jslink" onclick="OpenPopup('../userprofile.aspx?uid=<%# Eval("MemberID") %>','حساب صديق');" target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a></li>
                                            <li><a class="jslink" onclick="removeFriend(<%# BLL.Member.CurrentMemberID %>,<%# Eval("MemberID") %>);"><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-6 pull-right">
                                        <ul>
                                            <li><a class="jslink openGiftModal" data-mid='<%# Eval("MemberID") %>'><span class="awesome">&#xf06b;</span> أرسل هدية</a></li>
                                            <li><a onclick="OpenPopup('../popuppages/Messages_popup.aspx?t=createmsg&u=<%# Eval("MemberID") %>&un=<%# Eval("UserName") %>','الرسائل');" target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a></li>

                                            <li><a class="jslink"><span class="awesome">&#xf05e;</span> حجب</a></li>

                                        </ul>
                                    </div>
                                </div>
                                <div class="clear" style="height: 1px;"></div>
                            </div>
                        </div>
                     
                    </div>
                </AlternatingItemTemplate>
            </asp:Repeater>
            <div class="clearfix"></div>
        </div>

        <div style="height: 5px;" class="clearfix"></div>

        <div>
            <div class="pull-right"><a data-toggle="collapse" data-parent="#accordion1" href="#offlinepeople">الأصدقاء غير المتواجدين (<span id="OfflineFriendsCount"></span>)</a></div>
            <div class="clearfix"></div>
            <asp:Repeater ID="uiRepeaterOffline" runat="server">
                <HeaderTemplate>
                    <div id="offlinepeople" class="panel-collapse collapse in ">
                </HeaderTemplate>
                <FooterTemplate></div></FooterTemplate>
                <ItemTemplate>
                    <div class="Altodd friend-link" id='usernode-<%# Eval("MemberID") %>' data-name='<%# Eval("UserName") %>'>
                        <img src='<%# string.IsNullOrEmpty(Eval("ProfilePic").ToString()) ? "images/defaultavatar.png" : Eval("ProfilePic").ToString() %>' id='user-<%# Eval("MemberID") %>' class="friendpic offline" />
                        <a href="#" class='type_<%# Eval("MemberTypeID") %>'><%# Eval("UserName") %>
                        </a>
                        <div class="clearfix" style="height: 1px;"></div>
                        <span id='user-status-<%# Eval("MemberID") %>'>
                            <%# string.IsNullOrEmpty(Eval("StatusMsg").ToString()) ? "&nbsp;" : Eval("StatusMsg")  %>
                        </span>
                        <div class="clearfix" style="height: 1px;"></div>
                        <div class="friendSubMenu">
                            <div class="popup-menu profileMenu" data-for='usernode-<%# Eval("MemberID") %>'>
                                <div class="col-lg-3 pull-right">
                                    <div class=" thumbnail">
                                        <img src='<%# string.IsNullOrEmpty(Eval("ProfilePic").ToString()) ? "images/defaultavatar.png" : Eval("ProfilePic").ToString() %>' style="max-height:70px;" />

                                    </div>
                                    <div class="clearfix" style="height: 1px;">
                                    </div>
                                    <div style="text-align: right;">
                                        <%# Eval("UserName") %>
                                    </div>
                                </div>
                                <div class="col-lg-9 pull-right">
                                    <div class="col-lg-6 pull-right">
                                        <ul>
                                            <li><a class="jslink" onclick="OpenPopup('../userprofile.aspx?uid=<%# Eval("MemberID") %>','حساب صديق');" target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a></li>
                                            <li><a class="jslink" onclick="removeFriend(<%# BLL.Member.CurrentMemberID %>,<%# Eval("MemberID") %>);"><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-6 pull-right">
                                        <ul>
                                            <li><a class="jslink openGiftModal" data-mid='<%# Eval("MemberID") %>'><span class="awesome">&#xf06b;</span> أرسل هدية</a></li>
                                            <li><a onclick="OpenPopup('../popuppages/Messages_popup.aspx?t=createmsg&u=<%# Eval("MemberID") %>&un=<%# Eval("UserName") %>','الرسائل');" target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a></li>

                                            <li><a class="jslink"><span class="awesome">&#xf05e;</span> حجب</a></li>

                                        </ul>
                                    </div>
                                </div>
                                <div class="clear" style="height: 1px;"></div>
                            </div>
                        </div>
                     
                    </div>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <div class="Alteven friend-link" id='usernode-<%# Eval("MemberID") %>' data-name='<%# Eval("UserName") %>'>
                        <img src='<%# string.IsNullOrEmpty(Eval("ProfilePic").ToString()) ? "images/defaultavatar.png" : Eval("ProfilePic").ToString() %>' id='user-<%# Eval("MemberID") %>' class="friendpic offline" />
                        <a href="#" class='type_<%# Eval("MemberTypeID") %>'><%# Eval("UserName") %>
                        </a>
                        <div class="clearfix" style="height: 1px;"></div>
                        <span id='user-status-<%# Eval("MemberID") %>'>
                            <%# string.IsNullOrEmpty(Eval("StatusMsg").ToString()) ? "&nbsp;" : Eval("StatusMsg")  %>
                        </span>
                        <div class="clearfix" style="height: 1px;"></div>
                        <div class="friendSubMenu">
                            <div class="popup-menu profileMenu" data-for='usernode-<%# Eval("MemberID") %>'>
                                <div class="col-lg-3 pull-right">
                                    <div class=" thumbnail">
                                        <img src='<%# string.IsNullOrEmpty(Eval("ProfilePic").ToString()) ? "images/defaultavatar.png" : Eval("ProfilePic").ToString() %>' style="max-height:70px;" />

                                    </div>
                                    <div class="clearfix" style="height: 1px;">
                                    </div>
                                    <div style="text-align: right;">
                                        <%# Eval("UserName") %>
                                    </div>
                                </div>
                                <div class="col-lg-9 pull-right">
                                    <div class="col-lg-6 pull-right">
                                        <ul>
                                            <li><a class="jslink" onclick="OpenPopup('../userprofile.aspx?uid=<%# Eval("MemberID") %>','حساب صديق');" target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a></li>
                                            <li><a class="jslink" onclick="removeFriend(<%# BLL.Member.CurrentMemberID %>,<%# Eval("MemberID") %>);" ><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-6 pull-right">
                                        <ul>
                                            <li><a class="jslink openGiftModal" data-mid='<%# Eval("MemberID") %>'><span class="awesome">&#xf06b;</span> أرسل هدية</a></li>
                                            <li><a onclick="OpenPopup('../popuppages/Messages_popup.aspx?t=createmsg&u=<%# Eval("MemberID") %>&un=<%# Eval("UserName") %>','الرسائل');" target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a></li>

                                            <li><a class="jslink"><span class="awesome">&#xf05e;</span> حجب</a></li>

                                        </ul>
                                    </div>
                                </div>
                                <div class="clear" style="height: 1px;"></div>
                            </div>
                        </div>
                        
                    </div>
                </AlternatingItemTemplate>
            </asp:Repeater>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="clearfix"></div>
</div>

