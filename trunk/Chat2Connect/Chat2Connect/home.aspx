<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Chat2Connect.home" %>
<%@ Register src="usercontrols/ucRooms.ascx" tagname="ucRooms" tagprefix="uc1" %>
<%@ Register src="usercontrols/ucFriends.ascx" tagname="ucFriends" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $('.iconentypo-addfriend').tooltip();
            $('#cpmain').addClass('selected');

            $(".catLink").click(function () {
                $("#roomsDiv").load("getRooms.aspx",
                    { data_related: "" + $(this).attr("data-related") + "" },
                    function (content) {
                        $(this).hide().fadeIn("slow");
                        return false;
                    });
            });
            $(".subcatLink").click(function () {
                $("#roomsDiv").load("getRooms.aspx",
                    { data_related: "" + $(this).attr("data-related") + "" },
                    function (content) {
                        $(this).hide().fadeIn("slow");
                        return false;
                    });
            });


            $("#<%= uiTextBoxFriendSearch.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "../Services/Services.asmx/SearchMembersExceptFriends",
                        dataType: "json",
                        type: "post",
                        data: "{'query':'" + request.term.toString() + "','MemberID' : '" + $("#<%=uiHiddenFieldCurrent.ClientID %>").val() + "'}",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            response(jQuery.map(data.d, function (item) {
                                return {
                                    val: item.split('##')[0],
                                    label: item.split('##')[1]
                                }
                            }))
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(textStatus);
                        }
                    });

                },
                select: function (e, i) {
                    $("#<%=uiHiddenFieldFriendID.ClientID %>").val(i.item.val);
                },
                minLength: 1
            });

        });

        function removeCurrentTab() {
            var tabContentId = $(this).parent().attr("href");
            $(this).parent().remove(); 
            $('#MainTabs a:last').tab('show'); 
            $(tabContentId).remove(); 
        }

        function addTab(sel, id, label, show, r) {
            var tabs = $(sel);
            if (document.getElementById(id)) {
                $('#MainTabs a[href="#'+id+'"]').tab('show');
                return;
            }
            
            $('div.active', tabs).removeClass('in').add($('li.active', tabs)).removeClass('active');
            $('.tab-content', tabs).append('<div class="tab-pane fade in active" id="' + id + '"></div>');
            $('.nav-tabs', tabs).append('<li class="pull-right"><a href="#' + id + '" data-toggle="tab" data-r="' + r + '">' + label + '<button class="close closeTab" type="button" >×</button></a></li>');
            if (show == true) $('.nav-tabs a:last').tab('show');
            setTimeout(function () { rHub.server.addToRoom(r); }, 2000);
            

            $(".closeTab").click(function () {
                var tabContentId = $(this).parent().attr("href");
                rHub.server.removeFromRoom($(this).parent().attr("data-r"));
                $(this).parent().parent().remove();
                if ($(this).parent().parent().hasClass('active')) {
                    $('#MainTabs a[href="#home"]').tab('show');
                    $('#MainTabs #home').addClass('active in');
                }
                $(tabContentId).remove(); 
            });
        }

        
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="blockBoxshadow pull-right col-lg-2 margin20 " style="width:21% !important;">
            <div style="border-bottom:1px solid #FEC200">
                <div class="pull-right">
                    <i class="icon-2x modernicon iconmodern-friends"></i>
                    أصدقائى</div>
                <div class="pull-left">
                    <a href="#addfriends" data-toggle="modal" style="text-decoration:none;"><i class="icon-3x entypoicon iconentypo-addfriend" data-toggle="tooltip" title="إضافة صديق"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            
            <div style="height:5px;" class="clearfix"></div>
            
            <uc2:ucFriends ID="ucFriends1" runat="server" />
            
        </div>
    <div id="MainTabs">
    <div style="padding:5px;padding-right:0px; margin-left:10px;" class="pull-left col-lg-9" id="homeNav">
        <ul class="nav nav-tabs">
          <li class="pull-right active"><a href="#home" data-toggle="tab">الرئيسية</a></li>
          
        </ul>
    </div>
    <div style="height:1px;" class="clearfix"></div>

     <div class="blockBoxshadow pull-left col-lg-9 margin20" style="margin-top:2px;">
         <div class="tab-content">
          <div class="tab-pane fade in active" id="home">
              <div style="border-bottom:1px solid #FEC200">
                <div class="pull-right " >
                    <i class="icon-2x modernicon iconmodern-mainlist"></i>
                    القائمة الرئيسية</div>
                <div class="pull-left">
                    
                    <div class="form-group">
                    <asp:TextBox ID="uiTextBoxRoomSearch" runat="server" placeholder="ابحث عن غرفة" style="padding:5px;padding-top:7px;"></asp:TextBox>
                    <a href="#" style="font-size:20px;text-decoration:none;"><i class="icon icon-search"></i></a>
                        </div>
                </div>                
                <div class="clearfix"></div>
            </div>
            
                <div class="col-lg-3 pull-right" style="padding:5px;border-left:2px solid #FEC200;margin-top:2px;">                    
                    <uc1:ucRooms ID="ucRooms1" runat="server" />                        
                </div>                                                        
                <div class="col-lg-9 pull-left" style="padding:5px;" id="roomsDiv">
                    
                </div>
          </div>
         
        </div>
            
                
         </div>
    </div>
    <div id="addfriends" class="modal fade" role="modal" aria-hidden="true">
        <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration:none;" >
                            ×</a>
                        <i class="icon-3x entypoicon iconentypo-addfriend" style="float:left;margin-left:10px;"></i>
                        <h3 >
                            أضف صديق</h3>
                    </div>
                    <div class="modal-body">
                            <div class="form-horizontal blockBox">
                                
                                <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label>بحث</label>
                                    </div>
                                    <div class="col-sm-7 pull-right">
                                        <asp:TextBox ID="uiTextBoxFriendSearch" runat="server" CssClass="form-control" ></asp:TextBox>                                        
                                    </div>                                    
                                </div>                                
                            </div>
                   </div>
                    <div class="modal-footer">
                        <a href="#" class="btn btn-default" data-dismiss="modal" style="text-decoration:none;">إغلاق</a>
                        <asp:LinkButton CssClass="btn btn-warning" runat="server" ID="uiLinkButtonAddFriend" style="text-decoration:none;" OnClick="uiLinkButtonAddFriend_Click">حفظ</asp:LinkButton>
                    </div>
                    </div>
            </div>
    </div>
    <asp:HiddenField ID="uiHiddenFieldFriendID" runat="server" />
    <asp:HiddenField ID="uiHiddenFieldCurrent" runat="server" />
    <asp:HiddenField ID="uiHiddenFieldCurrentName" ClientIDMode="Static" runat="server" />
</asp:Content>
