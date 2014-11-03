<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PrivateChat.ascx.cs" Inherits="Chat2Connect.templates.PrivateChat" %>
<div id="roomContents">
    <div class="col-lg-12" style="padding: 5px;">
        <div>
            <div class="pull-right ">
                <i class="icon-2x modernicon iconmodern-mainlist"></i>
                <a style="font-weight: bold; text-decoration: none; cursor: pointer;">
                    <span data-bind="text:name,css:'type_'+typeSpecID()"></span>
                </a>
            </div>
            <div class="pull-left">
                <div class="form-group">
                    <div id="admin-menu" class="btn-group adminSettingsMenu">
                        <button style="position: relative;" data-toggle="dropdown" class="btn btn-main dropdown-toggle" type="button">
                            إجراءات  <span class="caret"></span>
                        </button>
                        <ul role="menu" class="dropdown-menu RoomAdminMenu">
                            <li><a class="jslink" data-bind="attr:{href:'userprofile.aspx?uid='+id}" target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a></li>
                            <li><a class="jslink MemberSendGift" data-bind="attr:{'data-mid':id}"><span class="awesome">&#xf06b;</span> أرسل هدية</a></li>
                            <li><a data-bind="attr:{href:'Messages.aspx?t=createmsg&u='+id+'&un='+name}" target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a></li>
                            <li><a href="#"><span class="awesome">&#xf05e;</span> حجب</a></li>
                        </ul>
                    </div>
                    <div class="btn-group adminSettingsMenu">
                        <button style="position: relative;" data-toggle="dropdown" class="btn btn-main dropdown-toggle" type="button">
                            إعدادت  <span class="caret"></span>
                        </button>
                        <ul role="menu" class="dropdown-menu">
                            <li><a href="#"><i class="icon-time"></i>
                                <label style="font-weight: normal;">
                                    <input type="checkbox" data-bind="click:privateRoom.updateSetting.bind($data,'showMessageTime'),checked:privateRoom.showMessageTime" />&nbsp;طابع زمنى&nbsp;</label></a></li>
                            <li><a href="#"><i class="icon-eye-open"></i>
                                <label style="font-weight: normal;">
                                    <input type="checkbox" data-bind="click:privateRoom.updateSetting.bind($data,'notifyOnOpenCam'),checked:privateRoom.notifyOnOpenCam" />&nbsp;تنبيه عند فتح كمراء&nbsp;</label></a></li>
                            <li><a href="#"><i class="icon-eye-close"></i>
                                <label style="font-weight: normal;">
                                    <input type="checkbox" data-bind="click:privateRoom.updateSetting.bind($data,'notifyOnCloseCam'),checked:privateRoom.notifyOnCloseCam" />&nbsp;تنبيه عند قفل كمراء&nbsp;</label></a></li>
                            <li><a href="#"><i class="icon-microphone"></i>
                                <label style="font-weight: normal;">
                                    <input type="checkbox" data-bind="click:privateRoom.updateSetting.bind($data,'notifyOnMicOn'),checked:privateRoom.notifyOnMicOn" />&nbsp;تنبيه عند أخذ المكرفون&nbsp;</label></a></li>
                            <li><a href="#"><i class="icon-microphone-off"></i>
                                <label style="font-weight: normal;">
                                    <input type="checkbox" data-bind="click:privateRoom.updateSetting.bind($data,'notifyOnMicOff'),checked:privateRoom.notifyOnMicOff" />&nbsp;تنبيه عند ترك المكرفون&nbsp;</label></a></li>
                        </ul>

                    </div>
                    <a download="room.html" data-bind="attr:{id:'SaveConv_' + id}" class="btn btn-main" href="#">حفظ النقاش</a>
                    <a class="btn btn-main" href="#" data-bind="click: $parent.removeWindow">خروج</a>
                </div>
            </div>
            <div class="clear"></div>
        </div>

    </div>
    <!-- ko if: typeSpecID()!=5-->
    <span class="col-lg-12" style="height: 16px; cursor: pointer; border-bottom: 1px solid #FEC200; color: #000;" data-bind="click:toggleFlashObj"><i class="icon-arrow-down" data-bind="    css:{ 'icon-arrow-up' :showFlashObject, 'icon-arrow-down': showFlashObject()==false}"></i>&nbsp;&nbsp;الكاميرات</span>
    <div style="padding: 5px; border-bottom: 1px solid #FEC200; padding-top: 0px;" class="col-lg-12">

        <div style="padding: 2px;" class="pull-left col-lg-12" data-bind="attr:{id: 'flashWrapper_' +privateRoom.uniqueID()}">

            <object style="width: 100%; height: 180px;" data="testswf/chat2connect.swf" class="flashmovie" data-bind="attr:{id:'chat2connect_'+uniqueID(), name:'chat2connect_'+uniqueID()}, style:{height: showFlashObject() == true? '180px' : '0px'}" type="application/x-shockwave-flash">
                <param name="quality" value="high">
                <param value="always" name="allowScriptAccess">
                <param name="wmode" value="opaque" />
                <param data-bind="attr:{value:'roomId='+uniqueID()+ '&amp;userId='+$root.CurrentMemberID+'&amp;allowedCams=2&amp;conn=<%= System.Configuration.ConfigurationManager.AppSettings["amsCoonection"]%>    '}" name="flashvars">
            </object>

        </div>
    </div>
    <!-- /ko -->
    <div style="height: 5px;" class="clear"></div>
    <!-- ko -->

    <div style="padding: 5px;" class="col-lg-12">
        <div id="roomTextDiv" class='pull-left col-lg-12' style="padding: 5px; 0px;">
            <div style="width: 100%; background-color: #fff; padding: 5px; direction: rtl; border: 1px solid #ccc; border-radius: 5px; -moz-border-radius: 5px; -ms-border-radius: 5px; -webkit-border-radius: 5px;" class="MsgHistroy SScroll" data-bind="style:{minHeight:(showAdminPart()==true?'250px':'400px')},attr:{'data-height':(showAdminPart()==true?'250px':'400px'),id:'MsgHistroy_'+uniqueID()}">
            </div>
            <div style="height: 5px;" class="clearfix"></div>
            <a style="width: 8%; height: 35px; padding-top: 7px; float: right;" class="btn btn-main" data-bind="click:$parent.sendMessage,attr:{id:'a_Send_'+uniqueID()}">إرسال</a>
            <textarea data-bind="value:Message, attr:{id:'uiTextMsg_'+uniqueID()}" type='text' style='width: 91.5%; background-color: #D9D9D9; height: 35px; border: 0px; float: left; line-height: normal;'></textarea>
            <div style="height: 20px;" class="clear"></div>
            <div class="col-lg-12" style="padding: 0px;">
                <div class="pull-right">
                    <!-- ko if:($data.typeSpecID!=5) -->
                    <a data-placement="top" title="" class="btn btn-default roomMenuItem" data-bind="visible:(Type()=='Private' || Settings.EnableMic() ||  (Settings.EnableMicForAdminsOnly() && CurrentMember().MemberLevelID()>1)), click:toggleMic" data-original-title="تحدث">
                        <i class="icon-microphone" style="font-size: 17px;"></i>
                    </a>
                    <a data-placement="top" title="" class="btn btn-default roomMenuItem" data-bind="visible:(Type()=='Private' || Settings.EnableCam()), click:toggleCam" data-original-title="تشغيل/ إيقاف الكاميرا">
                        <i class="icon-camera" style="font-size: 17px;"></i>
                    </a>
                    <!-- /ko -->
                </div>
                <div class="pull-right" style="margin-right: 3px;" data-bind="visible:(Type()=='Private' || CurrentMember().CanWrite())">
                    <div data-bind="template:{ name: 'editorToolbarTemplate'},attr:{id: 'toolbar'+uniqueID()}">
                    </div>
                </div>
                <div class="pull-right" style="margin-right: 3px;">
                    <!-- ko if:(typeSpecID!=5) -->
                    <a data-placement="top" title="" class="btn btn-default roomMenuItem" data-binding="attr:{id:'gift_'+uniqueID()}" data-original-title="إرسال هدايا" data-bind="click:ShowSendGift">
                        <img src="images/gift-icon.png" style="width: 15px;" /></a>
                    <!-- /ko -->
                    <a data-placement="top" title="" class="btn btn-default roomMenuItem" data-binding="attr:{id:'attach_'+uniqueID()}" data-original-title="تحميل ملفات" data-bind="click:ShowAttachFiles"><i class="icon-paper-clip" style="font-size: 17px;"></i></a>
                </div>
                <!-- ko if:(typeSpecID!=5) -->
                <div class="pull-right btn-group" style="margin-right: 3px;" data-toggle="buttons-checkbox">
                    <button class="btn btn-default" data-bind="attr:{id:'mute_'+uniqueID()}, click:$parent.MuteRoom.bind($data)" data-mute='false'>×<i class="icon-volume-off" style="font-size: 17px;"></i></button>
                </div>

                <div class="pull-left col-lg-3" style="direction: ltr; padding-left: 0px; width: 22%;">
                    <div class="pull-left col-lg-3" style="direction: ltr;"><i class="icon-volume-up" style="font-size: 17px;"></i></div>
                    <div class="pull-left col-lg-9" style="direction: ltr;">
                        <input type="text" value="" data-bind="attr:{'data-slider-id':'uiListenVolume_'+uniqueID() + 'slider', id:'uiListenVolume_'+uniqueID()}" data-slider-value="5" data-slider-orientation="horizontal" data-slider-selection="after" data-slider-tooltip="hide" style="width: 70px;">
                    </div>
                    <div class="clear" style="height: 1px;"></div>
                    <div class="pull-left col-lg-3" style="direction: ltr;">
                        <i class="icon-microphone" style="font-size: 17px;"></i>
                    </div>
                    <div class="pull-left col-lg-9" style="direction: ltr;">
                        <input type="text" value="" data-bind="attr:{'data-slider-id':'uiMicVolume_'+uniqueID() + 'slider', id:'uiMicVolume_'+uniqueID()}" data-slider-value="5" data-slider-orientation="horizontal" data-slider-selection="after" data-slider-tooltip="hide" style="width: 70px;">
                    </div>
                </div>
                <!-- /ko -->


            </div>
        </div>
    </div>
</div>
