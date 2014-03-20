using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Chat2Connect
{
    public partial class LoadRoom : System.Web.UI.Page
    {
        public string localParams
        {
            get
            {
                if (Request.Form["data_related"] != null)
                    return Request.Form["data_related"].ToString();
                return string.Empty;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            BindMembers();
            BindRoom();
        }

        private void BindMembers()
        {
            if (!string.IsNullOrEmpty(localParams))
            {
                int rid = Convert.ToInt32(localParams);
                Member member = new Member();
                member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
                RoomMember roomMember = new RoomMember();
                roomMember.LoadByPrimaryKey(member.MemberID, rid);
                if (roomMember.RowCount == 0)
                {
                    roomMember.AddNew();
                    roomMember.MemberID = member.MemberID;
                    roomMember.RoomID = rid;
                    roomMember.Save();
                }

                RoomMember Allmembers = new RoomMember();
                Allmembers.GetAllMembersByRoomID(rid);

                RoomMember members = new RoomMember();
                members.GetAllMembersByRoomIDNoQueue(rid);
                RoomMember InQueueMembers = new RoomMember();
                InQueueMembers.GetAllMembersByRoomIDInQueue(rid);
                uiRepeaterRoomMembers.DataSource = members.DefaultView;
                uiRepeaterRoomMembers.DataBind();

                uiRepeaterQueue.DataSource = InQueueMembers.DefaultView;
                uiRepeaterQueue.DataBind();
                if (Allmembers.RowCount > 0)
                    uiLabelMemberCount.Text = Allmembers.RowCount.ToString();
                else
                    uiLabelMemberCount.Text = GetLocalResourceObject("NoMembers").ToString();
            }
        }

        private void BindRoom()
        {            
            if (!string.IsNullOrEmpty(localParams))
            {
                int rid = Convert.ToInt32(localParams);
                Room rooms = new Room();
                rooms.LoadByPrimaryKey(rid);
                
                uiLabelRoomName.Text = rooms.Name;
                Member member = new Member();
                member.LoadByPrimaryKey(rooms.CreatedBy);
                uiLabelAdmin.Text = member.Name;

                Member CurrentMember = new Member();
                CurrentMember.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));


                // hide/display admin menu 
                if (CurrentMember.MemberID != member.MemberID)
                {
                    uiLiteralAdminMenuHeader.Text = "<div class='btn-group' id='admin-menu' style='display:none;'>";
                }
                else
                {
                    uiLiteralAdminMenuHeader.Text = "<div class='btn-group' id='admin-menu'>";
                }


                // add to favourite link
                FavRoom fav = new FavRoom();
                fav.LoadByPrimaryKey(CurrentMember.MemberID, rid);
                if (fav.RowCount > 0 || Request.QueryString["temp"] != null)
                    uiLiteralAddToFav.Visible = false;
                else
                {
                    uiLiteralAddToFav.Visible = true;
                    uiLiteralAddToFav.Text = "<a id='favlink_" + rid.ToString() + "' onclick='addtoFav(" + rid.ToString() + ");' style='cursor:pointer;'><i class='icon-star' style='color:#FEC200;'></i>&nbsp; أضف إلى المفضلة</a>";
                }

                // send link
                uiLiteralLink.Text = "<a id='a_Send_" + rid.ToString() + "' class='btn btn-main' style='width:8%;height:70px;padding-top:25px;'>إرسال</a>" + "<input id='uiHidden_" + rid.ToString() + "' type='hidden' value='" + rid.ToString() + "'/>";
                // cam /mic links
                uiLiteralCamMicLink.Text = "<a href='#' id='initCam_" + rid.ToString() + "' class='btn btn-default' ><i class='icon-camera'></i>&nbsp;تفعيل الكاميرا</a>&nbsp;";
                uiLiteralCamMicLink.Text += "<a href='#' id='closeCam_" + rid.ToString() + "' class='btn btn-default' style='display:none;'><i class='icon-camera'></i>&nbsp;إغلاق الكاميرا</a>&nbsp;";
                uiLiteralCamMicLink.Text += "<a href='#' id='requestMic_" + rid.ToString() + "' class='btn btn-default' ><i class='icon-microphone'></i>&nbsp;طلب مايك</a>";
                uiLiteralCamMicLink.Text += "<a href='#' id='talk_" + rid.ToString() + "' style='display:none;' class='btn btn-default' ><i class='icon-microphone'></i>&nbsp;تحدث</a>";
                uiLiteralCamMicLink.Text += "<a href='#' id='closemic_" + rid.ToString() + "' style='display:none;' class='btn btn-default' ><i class='icon-microphone'></i>&nbsp;إغلاق المايك</a>&nbsp;";

                // msg history panel 
                uiLiteralMsg.Text = "<textarea id='uiTextMsg_" + rid.ToString() + "' type='text' style='width:91.5%;background-color:#D9D9D9;height:70px;border:0px;' ></textarea>";

                // toolbars 
                uiLiteralToolbar.Text = "<div id='toolbar" + rid.ToString() + "'>";

                // javascript functions 
                uiLiteralScript.Text = "<script type='text/javascript'>" +
                    "$('#initCam_" + rid.ToString() + "').click(function () { " + "startCam" + rid.ToString() + @"(" + CurrentMember.MemberID.ToString() + "); });" +
                    "$('#closeCam_" + rid.ToString() + "').click(function () { " + "stopCam" + rid.ToString() + @"(" + CurrentMember.MemberID.ToString() + "); });" +
                    "var editor_" + rid.ToString() + " = new wysihtml5.Editor('uiTextMsg_" + rid.ToString() + "',{toolbar: 'toolbar" + rid.ToString() + "', parserRules: wysihtml5ParserRules, useLineBreaks:  false, stylesheets: 'css/main.css'});" +
                    @"editor_" + rid.ToString() + @".observe('load', function() {
                                                editor_" + rid.ToString() + @".composer.element.addEventListener('keyup', function(e) {                                                        
                                                        if (e.which == 13) {  e.preventDefault(); $('#a_Send_" + rid.ToString() + "').trigger('click');} });" + @"                                                
                                                });" +
                    "$('#a_Send_" + rid.ToString() + "').click(function () { rHub.server.sendToRoom($('#uiHidden_" + rid.ToString() + "').val(), $('#uiHiddenFieldCurrentName').val(), editor_" + rid.ToString() + ".getValue()); editor_" + rid.ToString() + ".setValue(''); $('#toolbar" + rid.ToString() + "').find('button').each(function(){ $(this).removeClass('active wysihtml5-command-active'); });});" +
                    "$('#uiTextMsg_" + rid.ToString() + "').keypress(function (e) { if (e.which == 13) { $('#a_Send_" + rid.ToString() + "').trigger('click'); e.preventDefault(); } });" +
                    "$('#requestMic_" + rid.ToString() + "').click(function () { " +
                    @"$.ajax({
                            url: '../Services/Services.asmx/GetQueueOrder',
                            dataType: 'json',
                            type: 'post',
                            data: ""{'memberID':'" + CurrentMember.MemberID.ToString() + "', 'roomID' : '" + rid.ToString() + @"' }"",
                                contentType: 'application/json; charset=utf-8',
                                success: function (data) {
                                    if (data.d == true) {                            
                                      //  if($('#NoOfMics_room_" + rid.ToString() + @"').val() < $('#MaxNoOfMic_room_'" + rid.ToString() + @"').val())
                                      //  {
                                            $('#requestMic_" + rid.ToString() + @"').css('display','none');
                                            $('#talk_" + rid.ToString() + @"').css('display','inline-block');
                                            $('#closemic_" + rid.ToString() + @"').css('display','none');
                                            $('#room_" + rid.ToString() + " #roomMembersDiv #m_" + CurrentMember.MemberID.ToString() + @" .controls .hand').css('display', 'inline-block');                                                                                                

                                            $('#room_" + rid.ToString() + " #roomMembersDiv #regular #m_" + CurrentMember.MemberID.ToString() + "').appendTo('#room_" + rid.ToString() + @" #roomMembersDiv #queueDiv');

                                            rHub.server.userRaisHand(" + rid.ToString() + @"," + CurrentMember.MemberID.ToString() + @");
                                      //  }
                                    }
                                },
                                error: function (XMLHttpRequest, textStatus, errorThrown) {                        
                                    $.pnotify({
                                        text: 'حدث خطأ . من فضلك أعد المحاولة.',
                                        type: 'error',
                                        history: false,
                                        closer_hover: false,
                                        delay: 5000,
                                        sticker: false
                                    });
                                }
                            });"
                    + " });" +
                    "$('#talk_" + rid.ToString() + "').click(function () { startMic" + rid.ToString() + @"(" + CurrentMember.MemberID.ToString() + "); " + @"$('NoOfMics_room_" + rid.ToString() + "').val($('NoOfMics_room_" + rid.ToString() + @"').val() + 1); 
                        $('#requestMic_" + rid.ToString() + @"').css('display','none'); 
                        $('#talk_" + rid.ToString() + @"').css('display','none'); 
                        $('#closemic_" + rid.ToString() + @"').css('display','inline-block');  
                        $('#room_" + rid.ToString() + " #roomMembersDiv #queueDiv #m_" + CurrentMember.MemberID.ToString() + "').appendTo('#room_" + rid.ToString() + @" #roomMembersDiv #MicDiv');                        
                    }); " +
                    "$('#closemic_" + rid.ToString() + "').click(function () { stopMic" + rid.ToString() + @"(" + CurrentMember.MemberID.ToString() + "); " + @"$('NoOfMics_room_" + rid.ToString() + "').val($('NoOfMics_room_" + rid.ToString() + @"').val() - 1); 
                        $('#requestMic_" + rid.ToString() + @"').css('display','inline-block'); 
                        $('#talk_" + rid.ToString() + @"').css('display','none'); 
                        $('#closemic_" + rid.ToString() + @"').css('display','none');    
                        $('#room_" + rid.ToString() + " #roomMembersDiv #MicDiv #m_" + CurrentMember.MemberID.ToString() + "').appendTo('#room_" + rid.ToString() + @" #roomMembersDiv #regular');                                            
                    }); " +

                    @"function startCam" + rid.ToString() + @"(userId)
			        {
				        getFlashMovie" + rid.ToString() + @"('chat2connect_" + rid.ToString() + @"').startCam(userId);
                        if(" + CurrentMember.MemberID.ToString() + @"==userId)
                        {
                            rHub.server.userStartCam(" + rid.ToString() + @", " + CurrentMember.MemberID.ToString() + @");
                            $('#room_" + rid.ToString() + " #roomMembersDiv #m_" + CurrentMember.MemberID.ToString() + @" .controls .camera').css('display', 'inline-block');                            
                        }                        
			        }
			
			        function stopCam" + rid.ToString() + @"(userId)
			        {
				        getFlashMovie" + rid.ToString() + @"('chat2connect_" + rid.ToString() + @"').stopCam(userId);
			        }
			
			        function startMic" + rid.ToString() + @"(userId)
			        {
				        getFlashMovie" + rid.ToString() + @"('chat2connect_" + rid.ToString() + @"').startMic(userId);
                        if("+CurrentMember.MemberID.ToString()+ @"==userId)
                        {
                            rHub.server.userStartMic(" + rid.ToString() + @", " + CurrentMember.MemberID.ToString() + @");
                            $('#room_" + rid.ToString() + " #roomMembersDiv #m_" + CurrentMember.MemberID.ToString() + @" .controls .hand').css('display', 'none');
                            $('#room_" + rid.ToString() + " #roomMembersDiv #m_" + CurrentMember.MemberID.ToString() + @" .controls .mic').css('display', 'inline-block');
                        }
                        else
                        {
                            $('#room_" + rid.ToString() + @" #roomMembersDiv #m_' + userId + ' .controls .hand').css('display', 'none');
                            $('#room_" + rid.ToString() + @" #roomMembersDiv #m_' + userId + ' .controls .mic').css('display', 'inline-block');
                        }

			        }
			
			        function stopMic" + rid.ToString() + @"(userId)
			        {
				        getFlashMovie" + rid.ToString() + @"('chat2connect_" + rid.ToString() + @"').stopMic(userId);
                        if(" + CurrentMember.MemberID.ToString() + @"==userId)
                            rHub.server.userStopMic(" + rid.ToString() + @", " + CurrentMember.MemberID.ToString() + @");                        
                        $('#room_" + rid.ToString() + " #roomMembersDiv #m_" + CurrentMember.MemberID.ToString() + @" .controls .mic').css('display', 'none');
			        }
			
			        function getFlashMovie" + rid.ToString() + @"(movieName)
			        {
				        return document[movieName] || window[movieName];
			        }" + 
                    "</script>";

                
                // admin menu
                uiLiteralClearQueue.Text = "<a onclick='ClearQueue(" + rid.ToString() + ");' style='cursor:pointer;'><i class='icon-remove'></i>&nbsp;إزالة الأيدى&nbsp;</a>";
                uiLiteralMarkWithWrite.Text = "<a onclick='MarkMember(" + rid.ToString() + ", true);' style='cursor:pointer;'><i class='icon-edit'></i>&nbsp;تنقيط الجميع ومسموح الكتابة&nbsp;</a>";
                uiLiteralMarkWithoutWrite.Text = "<a onclick='MarkMember(" + rid.ToString() + ",false);' style='cursor:pointer;'><i class='icon-ban-circle'></i>&nbsp;تنقيط الجميع بدون كتابة&nbsp;</a>";
                uiLiteralMarkWithWriteLogin.Text = "<a onclick='MarkMemberOnLogin(" + rid.ToString() + ", true);' style='cursor:pointer;'><i class='icon-edit'></i>&nbsp;تنقيط عند الدخول ومسموح الكتابة&nbsp;</a>";
                uiLiteralMarkWithoutWriteLogin.Text = "<a onclick='MarkMemberOnLogin(" + rid.ToString() + ", false);' style='cursor:pointer;'><i class='icon-ban-circle'></i>&nbsp;تنقيط عند الدخول وبدون كتابة&nbsp;</a>";
                uiLiteralDisableCam.Text = "<a onclick='DisableCams(" + rid.ToString() + ")' style='cursor:pointer;'><i class='icon-eye-close'></i>&nbsp;ممنوع الكمراء&nbsp;</a>";
                uiLiteralDisableMic.Text = "<a onclick='DisableMic(" + rid.ToString() + ")' style='cursor:pointer;'><i class='icon-microphone'></i>&nbsp;مسموح المكرفون للجميع&nbsp;</a>";
                uiLiteralEnableMicAdminOnly.Text = "<a onclick='EnableMicAdmin(" + rid.ToString() + ")' style='cursor:pointer;'><i class='icon-key'></i>&nbsp;مسموح المكرفون للأدمنية فقط&nbsp;</a>";
                uiLiteralCpanel.Text = "<a href='#' style='cursor:pointer;'><i class=' icon-dashboard'></i>&nbsp;لوحة تحكم المشرف </a>";
                

                // user menu 


                // room type - cam/mic
                int roomtype = 0;
                int camCount = 0;
                int maxmic = 0;
                if (!rooms.IsColumnNull("RoomTypeID"))
                    roomtype = rooms.RoomTypeID;
                switch (roomtype)
                {
                    case 1: // black
                        camCount = 1;
                        maxmic = 1;
                        break;
                    case 2: // zety 
                        camCount = 4;
                        maxmic = 2;
                        break;
                    case 3: // purple
                        camCount = 100;
                        maxmic = 3;
                        break;
                    case 4: // premium 
                        camCount = 100;
                        maxmic = 4;
                        break;
                    default:
                        camCount = 1;
                        maxmic = 1;
                        break;
                }


                // flash object & flashvars 

                uiLiteralFO.Text = @"<object type='application/x-shockwave-flash' id='chat2connect_" + rid.ToString() + @"' name='chat2connect' class='flashmovie' data='testswf/chat2connect.swf' width='690' height='200'>
			        <param name='allowScriptAccess' value='always' />
			        <param name='flashvars' value='roomId=" + rid.ToString() + "&userId=" + CurrentMember.MemberID.ToString() + @"&allowedCams=" + camCount.ToString() + "&conn=" + ConfigurationManager.AppSettings["amsCoonection"].ToString() + @"' />
		        </object>";

                // hidden vars 
                uiLiteralNoOfMics.Text = "<input type='hidden' id='MaxNoOfMics_room_" + rid.ToString() + "' value='" + maxmic.ToString() + "' />";
                uiLiteralNoOfMics.Text += "<input type='hidden' id='NoOfMics_room_" + rid.ToString() + "' value='0' />";
            }

            
        }

        protected void uiRepeaterRoomMembers_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int rid = Convert.ToInt32(localParams);

                DataRowView row = (DataRowView)e.Item.DataItem;
                
                Literal camlink = (Literal)e.Item.FindControl("uiLiteralCamLink");
                camlink.Text = "<a href='#' class='camera' data-related='" + rid.ToString() + "$" + row["MemberID"].ToString() + "'><img src='images/video_camera.png' style='width:16px;'/></a>";
            }
        }

        protected void uiRepeaterQueue_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int rid = Convert.ToInt32(localParams);

                DataRowView row = (DataRowView)e.Item.DataItem;

                Literal camlink = (Literal)e.Item.FindControl("uiLiteralCamLink");
                camlink.Text = "<a href='#' class='camera' data-related='" + rid.ToString() + "$" + row["MemberID"].ToString() + "'><img src='images/video_camera.png' style='width:16px;'/></a>";
            }
        }
    }
}