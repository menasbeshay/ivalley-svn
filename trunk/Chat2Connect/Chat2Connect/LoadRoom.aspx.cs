using System;
using System.Collections.Generic;
using System.Configuration;
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

                RoomMember members = new RoomMember();
                members.GetAllMembersByRoomID(rid);
                uiRepeaterRoomMembers.DataSource = members.DefaultView;
                uiRepeaterRoomMembers.DataBind();
                if(members.RowCount > 0)
                    uiLabelMemberCount.Text = members.RowCount.ToString();
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

                FavRoom fav = new FavRoom();
                fav.LoadByPrimaryKey(CurrentMember.MemberID, rid);
                if (fav.RowCount > 0)
                    uiLinkButtonAddToFav.Visible = false;
                else
                    uiLinkButtonAddToFav.Visible = true;

                uiLiteralLink.Text = "<a id='a_Send_" + rid.ToString() + "' class='btn btn-main' style='width:8%;height:70px;padding-top:25px;'>إرسال</a>" + "<input id='uiHidden_" + rid.ToString() + "' type='hidden' value='" + rid.ToString() + "'/>";
                uiLiteralCamMicLink.Text = "<a href='#' id='initCam_" + rid.ToString() + "' class='btn btn-default' ><i class='icon-camera'></i>&nbsp;تفعيل الكاميرا</a>&nbsp;";
                uiLiteralCamMicLink.Text += "<a href='#' id='requestMic_" + rid.ToString() + "' class='btn btn-default' ><i class='icon-microphone'></i>&nbsp;طلب مايك</a>";
                uiLiteralCamMicLink.Text += "<a href='#' id='talk_" + rid.ToString() + "' style='display:none;' class='btn btn-default' ><i class='icon-microphone'></i>&nbsp;تحدث</a>";
                uiLiteralCamMicLink.Text += "<a href='#' id='closemic_" + rid.ToString() + "' style='display:none;' class='btn btn-default' ><i class='icon-microphone'></i>&nbsp;إغلاق المايك</a>&nbsp;";

                uiLiteralMsg.Text = "<textarea id='uiTextMsg_" + rid.ToString() + "' type='text' style='width:91.5%;background-color:#D9D9D9;height:70px;border:0px;' ></textarea>";
                uiLiteralToolbar.Text = "<div id='toolbar" + rid.ToString() + "'>";
                uiLiteralScript.Text = "<script type='text/javascript'>" +
                    "$('#initCam_" + rid.ToString() + "').click(function () { " + "startCam" + rid.ToString() + @"(" + CurrentMember.MemberID.ToString() + "); });" +
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
                                      //  }
                                    }
                                },
                                error: function (XMLHttpRequest, textStatus, errorThrown) {                        
                                    $.pnotify({
                                        text: 'حذث خطأ . من فضلك أعد المحاولة.',
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
                        $('#closemic_" + rid.ToString() + @"').css('display','inline-block');  }); " +
                    "$('#closemic_" + rid.ToString() + "').click(function () { stopMic" + rid.ToString() + @"(" + CurrentMember.MemberID.ToString() + "); " + @"$('NoOfMics_room_" + rid.ToString() + "').val($('NoOfMics_room_" + rid.ToString() + @"').val() - 1); 
                        $('#requestMic_" + rid.ToString() + @"').css('display','inline-block'); 
                        $('#talk_" + rid.ToString() + @"').css('display','none'); 
                        $('#closemic_" + rid.ToString() + @"').css('display','none');  }); " +

                    @"function startCam" + rid.ToString() + @"(userId)
			        {
				        getFlashMovie" + rid.ToString() + @"('chat2connect_" + rid.ToString() + @"').startCam(userId);
			        }
			
			        function stopCam" + rid.ToString() + @"(userId)
			        {
				        getFlashMovie" + rid.ToString() + @"('chat2connect_" + rid.ToString() + @"').stopCam(userId);
			        }
			
			        function startMic" + rid.ToString() + @"(userId)
			        {
				        getFlashMovie" + rid.ToString() + @"('chat2connect_" + rid.ToString() + @"').startMic(userId);
                        if("+CurrentMember.MemberID.ToString()+ @"==userId)
                            rHub.server.userStartMic(" + rid.ToString() + @", " + CurrentMember.MemberID.ToString() + @");
			        }
			
			        function stopMic" + rid.ToString() + @"(userId)
			        {
				        getFlashMovie" + rid.ToString() + @"('chat2connect_" + rid.ToString() + @"').stopMic(userId);
			        }
			
			        function getFlashMovie" + rid.ToString() + @"(movieName)
			        {
				        return document[movieName] || window[movieName];
			        }" + 
                    "</script>";

                int maxmic = 0;
                int roomid = 1;
                if(!rooms.IsColumnNull("RoomTypeID"))
                    roomid = rooms.RoomTypeID;
                switch (roomid)
                {
                    case 1: maxmic = 1; break;
                    case 2: maxmic = 2; break;
                    case 3: maxmic = 3; break;
                    case 4: maxmic = 4; break;
                    default: break;
                }
                uiLiteralNoOfMics.Text = "<input type='hidden' id='MaxNoOfMics_room_" + rid.ToString() + "' value='" + maxmic.ToString() + "' />";
                uiLiteralNoOfMics.Text += "<input type='hidden' id='NoOfMics_room_" + rid.ToString() + "' value='0' />";

                    //"$('#uiTextMsg_" + cid.ToString() + "').wysihtml5.Editor({toolbar: 'toolbar'});" + "</script>";


                uiLiteralFO.Text = @"<object type='application/x-shockwave-flash' id='chat2connect_" + rid.ToString() + @"' name='chat2connect' class='flashmovie' data='testswf/chat2connect.swf' width='690' height='200'>
			        <param name='allowScriptAccess' value='always' />
			        <param name='flashvars' value='roomId=" + rid.ToString() + "&userId=" + CurrentMember.MemberID.ToString() + @"&conn="+ConfigurationManager.AppSettings["amsCoonection"].ToString() +@"' />
		        </object>";
            }

            
        }
    }
}