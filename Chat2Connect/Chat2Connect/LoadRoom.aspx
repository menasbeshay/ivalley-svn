<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoadRoom.aspx.cs" Inherits="Chat2Connect.LoadRoom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="roomContents">
        <div class="col-lg-12" style="padding: 5px;">
             <div >
                <div class="pull-right " >
                    <i class="icon-2x modernicon iconmodern-mainlist"></i>
                    <asp:Label ID="uiLabelRoomName" runat="server" ></asp:Label></div>
                <div class="pull-left">
                    
                    <div class="form-group">
                        <asp:Literal ID="uiLiteralAdminMenuHeader" runat="server"></asp:Literal>
                         <button type="button" class="btn btn-main dropdown-toggle" data-toggle="dropdown" style="position:relative;">
                            المشرف  <span class="caret"></span> 
                          </button>
                          <ul class="dropdown-menu" role="menu" >                                            
		                    	<li>
                                    <asp:Literal ID="uiLiteralClearQueue" runat="server"></asp:Literal>
		                    	</li>
		                    	<li>
                                    <asp:Literal ID="uiLiteralMarkWithWrite" runat="server"></asp:Literal>
		                    	</li>
		                    	<li>
                                    <asp:Literal ID="uiLiteralMarkWithoutWrite" runat="server"></asp:Literal>
		                    	</li>
		                    	<li>
                                    <asp:Literal ID="uiLiteralMarkWithWriteLogin" runat="server"></asp:Literal>
		                    	</li>
		                    	<li>
                                    <asp:Literal ID="uiLiteralMarkWithoutWriteLogin" runat="server"></asp:Literal>
		                    	</li>
		                    	<li>
                                    <asp:Literal ID="uiLiteralDisableCam" runat="server"></asp:Literal>
		                    	</li>
		                    	<li>
                                    <asp:Literal ID="uiLiteralDisableMic" runat="server"></asp:Literal>
		                    	</li>
		                    	<li>
                                    <asp:Literal ID="uiLiteralEnableMicAdminOnly" runat="server"></asp:Literal>
		                    	</li>
                                <li>
                                    <asp:Literal ID="uiLiteralCpanel" runat="server"></asp:Literal>
                                </li>		                    	
							</ul>
                        </div>
                        <div class="btn-group">
                          <button type="button" class="btn btn-main dropdown-toggle" data-toggle="dropdown" style="position:relative;">
                            إعدادت  <span class="caret"></span> 
                          </button>
                          <ul class="dropdown-menu" role="menu" >                           
		                    	<li><a href="#"><i class="icon-time"></i>&nbsp;طابع زمنى&nbsp;</a></li>
		                    	<li><a href="#"><i class="icon-reply"></i>&nbsp;تنبيه عند دخول أشخاص&nbsp;</a></li>
		                    	<li><a href="#"><i class="icon-share-alt"></i>&nbsp;تنبيه عند خروح أشخاص&nbsp;</a></li>
		                    	<li><a href="#"><i class="icon-eye-open"></i>&nbsp;تنبيه عند فتح كمراء&nbsp;</a></li>
		                    	<li><a href="#"><i class="icon-eye-close"></i>&nbsp;تنبيه عند قفل كمراء&nbsp;</a></li>
		                    	<li><a href="#"><i class="icon-microphone"></i>&nbsp;تنبيه عند أخذ المكرفون&nbsp;</a></li>
		                    	<li><a href="#"><i class="icon-microphone-off"></i>&nbsp;تنبيه عند ترك المكروفن&nbsp;</a></li>
		                    	<li><a href="#"><i class="icon-save"></i>&nbsp;حفظ الإعدادات&nbsp;</a></li>
                              <li><a href="#"><i class=" icon-remove"></i>&nbsp;حذف </a></li>
		                    	<li><a href="#"><i class="icon-power-off"></i>&nbsp;خروج&nbsp;</a></li>
							</ul>

                           </div>
                    
                        
                        
                        <a href="#" class="btn btn-main">حفظ النقاش</a>
                        <a href="#" class="btn btn-main">خروج</a>
                    </div>
                </div>                
                <div class="clearfix"></div>
            </div>            

        </div>
        <div class="clearfix" style="height:1px;"></div>
        <div class="col-lg-12" style="padding: 5px;border-bottom:1px solid #FEC200;">
            <div class="pull-right col-lg-3" style="padding: 5px;">
                <label><asp:Label ID="Label1" runat="server" Text="مدير الغرفة:"></asp:Label></label> <asp:Label ID="uiLabelAdmin" runat="server" ></asp:Label>
                <div class="clearfix" style="height:1px;"></div>
                <label><asp:Label ID="Label2" runat="server" Text="كاميرات:"></asp:Label></label> <asp:Label ID="Label4" runat="server" ></asp:Label>
                <div class="clearfix" style="height:1px;"></div>
                <label><asp:Label ID="Label3" runat="server" Text="متواجدين:"></asp:Label></label> <asp:Label ID="uiLabelMemberCount" runat="server" ></asp:Label>
                <div class="clearfix" style="height:10px;"></div>
                <asp:Literal ID="uiLiteralAddToFav" runat="server"></asp:Literal>
                <div class="clearfix" style="height:10px;"></div>
                <div >
                    <asp:HyperLink ID="uiHyperLinkFb" runat="server" Target="_blank"><img src="images/facebook.png" /></asp:HyperLink>
                    &nbsp;&nbsp;
                    <asp:HyperLink ID="uiHyperLinktwitter" runat="server" Target="_blank"><img src="images/twitter.png" /></asp:HyperLink>
                        &nbsp;&nbsp;
                    <asp:HyperLink ID="uiHyperLinkyt" runat="server" Target="_blank"><img src="images/youtube.png" /></asp:HyperLink>
                </div>
            </div>
            <div class="pull-left col-lg-9" style="padding: 2px;">
                <asp:Literal ID="uiLiteralFO" runat="server"></asp:Literal>
            </div>
        </div>

        <div class="clearfix" style="height: 5px;"></div>
        <div class="col-lg-12" style="padding: 5px;">
            <div class="col-lg-3 pull-right" style="padding: 5px; margin-top: 2px;">
                <div class="SScroll" data-height="400px" id="roomMembersDiv">
                    <div id="MicDiv">

                    </div>
                    <div id="queueDiv">
                        <asp:Repeater ID="uiRepeaterQueue" runat="server" OnItemDataBound="uiRepeaterQueue_ItemDataBound">
                        <ItemTemplate> <div class="Altodd friend-link rm" id="m_<%# Eval("MemberID") %>">
                                        <a class='jslink type_<%# Eval("MemberTypeID") %>'><%# Eval("Name") %>
                                    </a>
                                    <div class="pull-left controls">
                                        <asp:Literal ID="uiLiteralCamLink" runat="server"></asp:Literal>
                                        <img src="images/hand.png" style="width:16px;display:block;" class="hand"/><img src="images/microphone_1.png" style="width:16px;" class="mic"/><i class="icon-ban-circle mark" ></i></div>
                                    <div class="clearfix" style="height: 1px;"></div> 
                                     <div class="popup-menu">
						            <a class="jslink" ><span class="awesome">&#xf0e6;</span> محادثة خاصة</a>
						            <a class="jslink" ><span class="awesome">&#xf030;</span> عرض الكاميرا</a>
						            <a class="jslink" href='userprofile.aspx?uid=<%# Eval("MemberID") %>' target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a>
						            <a class="jslink" ><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a>
						            <a class="jslink" ><span class="awesome">&#xf06b;</span> أرسل هدية</a>
						            <a href='Messages.aspx?t=createmsg&u=<%# Eval("MemberID") %>' target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a>
						            <a class="jslink" ><span class="awesome">&#xf10b;</span> أرسل SMS</a>
						            <a class="jslink" ><span class="awesome">&#xf093;</span> أرسل ملف</a>
						            <a class="jslink" ><span class="awesome">&#xf05e;</span> حجب</a>
					            </div>                              
                                </div></ItemTemplate>
                        <AlternatingItemTemplate> 
                            <div class="Alteven friend-link rm" id="m_<%# Eval("MemberID") %>">
                                    <a href="#" class='type_<%# Eval("MemberTypeID") %>'><%# Eval("Name") %>
                                    </a>
                                    <div class="pull-left controls">
                                        <asp:Literal ID="uiLiteralCamLink" runat="server"></asp:Literal>
                                        <img src="images/hand.png" style="width:16px;display:block;" class="hand"/><img src="images/microphone_1.png" style="width:16px;" class="mic"/><i class="icon-ban-circle mark" ></i></div>
                                    <div class="clearfix" style="height: 1px;"></div>         
                                 <div class="popup-menu">
						            <a class="jslink" ><span class="awesome">&#xf0e6;</span> محادثة خاصة</a>
						            <a class="jslink" ><span class="awesome">&#xf030;</span> عرض الكاميرا</a>
						            <a class="jslink" href='userprofile.aspx?uid=<%# Eval("MemberID") %>' target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a>
						            <a class="jslink" ><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a>
						            <a class="jslink" ><span class="awesome">&#xf06b;</span> أرسل هدية</a>
						            <a href='Messages.aspx?t=createmsg&u=<%# Eval("MemberID") %>' target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a>
						            <a class="jslink" ><span class="awesome">&#xf10b;</span> أرسل SMS</a>
						            <a class="jslink" ><span class="awesome">&#xf093;</span> أرسل ملف</a>
						            <a class="jslink" ><span class="awesome">&#xf05e;</span> حجب</a>
					            </div>                      
                                </div>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                    </div>
                    <div id="regular">
                      <asp:Repeater ID="uiRepeaterRoomMembers" runat="server" OnItemDataBound="uiRepeaterRoomMembers_ItemDataBound">
                        <ItemTemplate> <div class="Altodd friend-link rm" id="m_<%# Eval("MemberID") %>">
                                        <a href="#" class='type_<%# Eval("MemberTypeID") %>'><%# Eval("Name") %>
                                    </a>
                                    <div class="pull-left controls">
                                        <asp:Literal ID="uiLiteralCamLink" runat="server"></asp:Literal>
                                        <img src="images/hand.png" style="width:16px;" class="hand"/><img src="images/microphone_1.png" style="width:16px;" class="mic"/><i class="icon-ban-circle mark" ></i></div>
                                    <div class="clearfix" style="height: 1px;"></div> 
                                   
                                <ul class="popup-menu profileMenu g-dark g-dark-list">
                                    <li><a class="jslink" ><span class="awesome">&#xf0e6;</span> محادثة خاصة</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf030;</span> عرض الكاميرا</a ></li>
						            <li><a class="jslink" href='userprofile.aspx?uid=<%# Eval("MemberID") %>' target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf06b;</span> أرسل هدية</a ></li>
						            <li><a href='Messages.aspx?t=createmsg&u=<%# Eval("MemberID") %>' target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf10b;</span> أرسل SMS</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf093;</span> أرسل ملف</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf05e;</span> حجب</a ></li>
                                   
                                </ul>                           
                                </div></ItemTemplate>
                        <AlternatingItemTemplate> 
                            <div class="Alteven friend-link rm" id="m_<%# Eval("MemberID") %>">
                                    <a href="#" class='type_<%# Eval("MemberTypeID") %>'><%# Eval("Name") %>
                                    </a>
                                    <div class="pull-left controls">
                                        <asp:Literal ID="uiLiteralCamLink" runat="server"></asp:Literal>
                                        <img src="images/hand.png" style="width:16px;" class="hand"/><img src="images/microphone_1.png" style="width:16px;" class="mic"/><i class="icon-ban-circle mark" ></i></div>
                                    <div class="clearfix" style="height: 1px;"></div>  
                                
                                
                                <ul class="popup-menu profileMenu g-dark g-dark-list">
                                    <li><a class="jslink" ><span class="awesome">&#xf0e6;</span> محادثة خاصة</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf030;</span> عرض الكاميرا</a ></li>
						            <li><a class="jslink" href='userprofile.aspx?uid=<%# Eval("MemberID") %>' target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf06b;</span> أرسل هدية</a ></li>
						            <li><a href='Messages.aspx?t=createmsg&u=<%# Eval("MemberID") %>' target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf10b;</span> أرسل SMS</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf093;</span> أرسل ملف</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf05e;</span> حجب</a ></li>
                                   
                                </ul>
                                                    
                                </div>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                   </div>
                </div>
            </div>
            <div class="col-lg-9 pull-left" style="padding: 5px;border-right: 2px solid #FEC200; " id="roomTextDiv">
                <div class="MsgHistroy" style="width:98%;background-color:#D9D9D9;min-height:400px;padding:5px;direction:rtl;" data-height="400px;" ></div>                
                <div class="clearfix" style="height: 5px;"></div>
                <asp:Literal ID="uiLiteralLink" runat="server"></asp:Literal>
                <asp:Literal ID="uiLiteralMsg" runat="server"></asp:Literal>

                <div class="clearfix" style="height:20px;"></div>
                
                <div class="col-lg-12">
                    <div class="pull-right">
                        <asp:Literal ID="uiLiteralCamMicLink" runat="server"></asp:Literal>                        
                        <asp:Literal ID="uiLiteralCamMicHand" runat="server"></asp:Literal>                        
                    </div>
                    <div class="pull-right">    
                        <!-- literal here to just start div for toolbar -->                     
                        <asp:Literal ID="uiLiteralToolbar" runat="server"></asp:Literal>
                         <div class="btn-group" data-toggle="buttons">
                              
                                <button class="btn btn-default" data-wysihtml5-command='bold' title='CTRL+B'><span class="icon-bold"></span></button>
                              
                                <button class="btn btn-default" data-wysihtml5-command='italic' title='CTRL+I'><span class="icon-italic"></span></button>
                              
                            </div>
                            
                         <div class="btn-group">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                <span class="icon-text-height"></span>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                <li><a data-wysihtml5-command='fontSize' data-wysihtml5-command-value='xsmall'>صغير جداً</a></li>
                                <li><a data-wysihtml5-command='fontSize' data-wysihtml5-command-value='small'>صغير</a></li>
                                <li><a data-wysihtml5-command='fontSize' data-wysihtml5-command-value='medium'>متوسط</a></li>                                
                                <li><a data-wysihtml5-command='fontSize' data-wysihtml5-command-value='large'>كبير</a></li>
                                    <li><a data-wysihtml5-command='fontSize' data-wysihtml5-command-value='xlarge'>كبير جداً</a></li>
                                </ul>
                            </div>                    
                        
                         <div class="btn-group">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                <span class="icon-dashboard"></span>
                                </button>
                                <ul class="dropdown-menu" role="menu" id="colorsMenu">
                                   
                                <li class='itemColor'><a data-wysihtml5-command='foreColor' data-wysihtml5-command-value='yellow'><div class="colorDiv" style="background-color:#fff200;"></div></a></li>
                                <li class='itemColor'><a data-wysihtml5-command='foreColor' data-wysihtml5-command-value='green'><div class="colorDiv" style="background-color:#0f0;"></div></a></li>
                                <li class='itemColor'><a data-wysihtml5-command='foreColor' data-wysihtml5-command-value='blue'><div class="colorDiv" style="background-color:#00f;"></div></a></li>                                
                                </ul>
                            </div>                                                                                            
                        
                         <div class="btn-group">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                <span class="icon-smile"></span>
                                </button> 
                                <ul class="dropdown-menu " role="menu" style="width:300px !important">
                                     <li><ul id="smilesMenu" class="SScroll" data-height="120px">
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (1).png'><img src="images/emotions/icon (1).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (2).png'><img src="images/emotions/icon (2).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (3).png'><img src="images/emotions/icon (3).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (4).png'><img src="images/emotions/icon (4).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (5).png'><img src="images/emotions/icon (5).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (6).png'><img src="images/emotions/icon (6).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (7).png'><img src="images/emotions/icon (7).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (8).png'><img src="images/emotions/icon (8).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (9).png'><img src="images/emotions/icon (9).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (10).png'><img src="images/emotions/icon (10).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (11).png'><img src="images/emotions/icon (11).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (12).png'><img src="images/emotions/icon (12).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (13).png'><img src="images/emotions/icon (13).png" /></a></li>                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (14).png'><img src="images/emotions/icon (14).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (15).png'><img src="images/emotions/icon (15).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (16).png'><img src="images/emotions/icon (16).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (17).png'><img src="images/emotions/icon (17).png" /></a></li> 
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (18).png'><img src="images/emotions/icon (18).png" /></a></li>                               
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (19).png'><img src="images/emotions/icon (19).png" /></a></li>  
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (20).png'><img src="images/emotions/icon (20).png" /></a></li>                                  
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (21).png'><img src="images/emotions/icon (21).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (22).png'><img src="images/emotions/icon (22).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (23).png'><img src="images/emotions/icon (23).png" /></a></li>                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (24).png'><img src="images/emotions/icon (24).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (25).png'><img src="images/emotions/icon (25).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (26).png'><img src="images/emotions/icon (26).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (27).png'><img src="images/emotions/icon (27).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (28).png'><img src="images/emotions/icon (28).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (29).png'><img src="images/emotions/icon (29).png" /></a></li>                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (30).png'><img src="images/emotions/icon (30).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (31).png'><img src="images/emotions/icon (31).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (32).png'><img src="images/emotions/icon (32).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (33).png'><img src="images/emotions/icon (33).png" /></a></li> 
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (34).png'><img src="images/emotions/icon (34).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (35).png'><img src="images/emotions/icon (35).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (36).png'><img src="images/emotions/icon (36).png" /></a></li>                                                                                                   
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (37).png'><img src="images/emotions/icon (37).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (38).png'><img src="images/emotions/icon (38).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (39).png'><img src="images/emotions/icon (39).png" /></a></li>                                    
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (40).png'><img src="images/emotions/icon (40).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (41).png'><img src="images/emotions/icon (41).png" /></a></li>  
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (42).png'><img src="images/emotions/icon (42).png" /></a></li>                              
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (43).png'><img src="images/emotions/icon (43).png" /></a></li>                                                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (44).png'><img src="images/emotions/icon (44).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (45).png'><img src="images/emotions/icon (45).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (46).png'><img src="images/emotions/icon (46).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (47).png'><img src="images/emotions/icon (47).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (48).png'><img src="images/emotions/icon (48).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (49).png'><img src="images/emotions/icon (49).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (50).png'><img src="images/emotions/icon (50).png" /></a></li>
                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (51).png'><img src="images/emotions/icon (51).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (52).png'><img src="images/emotions/icon (52).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (53).png'><img src="images/emotions/icon (53).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (54).png'><img src="images/emotions/icon (54).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (55).png'><img src="images/emotions/icon (55).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (56).png'><img src="images/emotions/icon (56).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (57).png'><img src="images/emotions/icon (57).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (58).png'><img src="images/emotions/icon (58).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (59).png'><img src="images/emotions/icon (59).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (60).png'><img src="images/emotions/icon (60).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (61).png'><img src="images/emotions/icon (61).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (62).png'><img src="images/emotions/icon (62).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (63).png'><img src="images/emotions/icon (63).png" /></a></li>  
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (64).png'><img src="images/emotions/icon (64).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (65).png'><img src="images/emotions/icon (65).png" /></a></li>  
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (66).png'><img src="images/emotions/icon (66).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (67).png'><img src="images/emotions/icon (67).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (68).png'><img src="images/emotions/icon (68).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (69).png'><img src="images/emotions/icon (69).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (70).png'><img src="images/emotions/icon (70).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (71).png'><img src="images/emotions/icon (71).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (72).png'><img src="images/emotions/icon (72).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (73).png'><img src="images/emotions/icon (73).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (74).png'><img src="images/emotions/icon (74).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (75).png'><img src="images/emotions/icon (75).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (76).png'><img src="images/emotions/icon (76).png" /></a></li>                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (77).png'><img src="images/emotions/icon (77).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (78).png'><img src="images/emotions/icon (78).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (79).png'><img src="images/emotions/icon (79).png" /></a></li>                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (80).png'><img src="images/emotions/icon (80).png" /></a></li>                                    
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (81).png'><img src="images/emotions/icon (81).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (82).png'><img src="images/emotions/icon (82).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (83).png'><img src="images/emotions/icon (83).png" /></a></li>                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (84).png'><img src="images/emotions/icon (84).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (85).png'><img src="images/emotions/icon (85).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (86).png'><img src="images/emotions/icon (86).png" /></a></li>                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (87).png'><img src="images/emotions/icon (87).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (88).png'><img src="images/emotions/icon (88).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (89).png'><img src="images/emotions/icon (89).png" /></a></li>                                                                                                    
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (90).png'><img src="images/emotions/icon (90).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (91).png'><img src="images/emotions/icon (91).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (92).png'><img src="images/emotions/icon (92).png" /></a></li>                                    
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (93).png'><img src="images/emotions/icon (93).png" /></a></li>                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (94).png'><img src="images/emotions/icon (94).png" /></a></li>                                                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (95).png'><img src="images/emotions/icon (95).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (96).png'><img src="images/emotions/icon (96).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (97).png'><img src="images/emotions/icon (97).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (98).png'><img src="images/emotions/icon (98).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (99).png'><img src="images/emotions/icon (99).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (100).png'><img src="images/emotions/icon (100).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (101).png'><img src="images/emotions/icon (101).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (102).png'><img src="images/emotions/icon (102).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (103).png'><img src="images/emotions/icon (103).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (104).png'><img src="images/emotions/icon (104).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (105).png'><img src="images/emotions/icon (105).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (106).png'><img src="images/emotions/icon (106).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (107).png'><img src="images/emotions/icon (107).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (108).png'><img src="images/emotions/icon (108).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (109).png'><img src="images/emotions/icon (109).png" /></a></li>
                                 <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (110).png'><img src="images/emotions/icon (110).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (111).png'><img src="images/emotions/icon (111).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (112).png'><img src="images/emotions/icon (112).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (113).png'><img src="images/emotions/icon (113).png" /></a></li>                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (114).png'><img src="images/emotions/icon (114).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (115).png'><img src="images/emotions/icon (115).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (116).png'><img src="images/emotions/icon (116).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (117).png'><img src="images/emotions/icon (117).png" /></a></li> 
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (118).png'><img src="images/emotions/icon (118).png" /></a></li>                               
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (119).png'><img src="images/emotions/icon (119).png" /></a></li>  
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (120).png'><img src="images/emotions/icon (120).png" /></a></li>                                  
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (121).png'><img src="images/emotions/icon (121).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (122).png'><img src="images/emotions/icon (122).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (123).png'><img src="images/emotions/icon (123).png" /></a></li>                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (124).png'><img src="images/emotions/icon (124).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (125).png'><img src="images/emotions/icon (125).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (126).png'><img src="images/emotions/icon (126).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (127).png'><img src="images/emotions/icon (127).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (128).png'><img src="images/emotions/icon (128).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (129).png'><img src="images/emotions/icon (129).png" /></a></li>                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (130).png'><img src="images/emotions/icon (130).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (131).png'><img src="images/emotions/icon (131).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (132).png'><img src="images/emotions/icon (132).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (133).png'><img src="images/emotions/icon (133).png" /></a></li> 
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (134).png'><img src="images/emotions/icon (134).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (135).png'><img src="images/emotions/icon (135).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (136).png'><img src="images/emotions/icon (136).png" /></a></li>                                                                                                   
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (137).png'><img src="images/emotions/icon (137).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (138).png'><img src="images/emotions/icon (138).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (139).png'><img src="images/emotions/icon (139).png" /></a></li>                                    
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (140).png'><img src="images/emotions/icon (140).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (141).png'><img src="images/emotions/icon (141).png" /></a></li>  
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (142).png'><img src="images/emotions/icon (142).png" /></a></li>                              
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (143).png'><img src="images/emotions/icon (143).png" /></a></li>                                                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (144).png'><img src="images/emotions/icon (144).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (145).png'><img src="images/emotions/icon (145).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (146).png'><img src="images/emotions/icon (146).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (147).png'><img src="images/emotions/icon (147).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (148).png'><img src="images/emotions/icon (148).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (149).png'><img src="images/emotions/icon (149).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (150).png'><img src="images/emotions/icon (150).png" /></a></li>
                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (151).png'><img src="images/emotions/icon (151).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (152).png'><img src="images/emotions/icon (152).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (153).png'><img src="images/emotions/icon (153).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (154).png'><img src="images/emotions/icon (154).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (155).png'><img src="images/emotions/icon (155).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (156).png'><img src="images/emotions/icon (156).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (157).png'><img src="images/emotions/icon (157).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (158).png'><img src="images/emotions/icon (158).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (159).png'><img src="images/emotions/icon (159).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (160).png'><img src="images/emotions/icon (160).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (161).png'><img src="images/emotions/icon (161).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (162).png'><img src="images/emotions/icon (162).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (163).png'><img src="images/emotions/icon (163).png" /></a></li>  
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (164).png'><img src="images/emotions/icon (164).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (165).png'><img src="images/emotions/icon (165).png" /></a></li>  
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (166).png'><img src="images/emotions/icon (166).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (167).png'><img src="images/emotions/icon (167).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (168).png'><img src="images/emotions/icon (168).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (169).png'><img src="images/emotions/icon (169).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (170).png'><img src="images/emotions/icon (170).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (171).png'><img src="images/emotions/icon (171).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (172).png'><img src="images/emotions/icon (172).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (173).png'><img src="images/emotions/icon (173).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (174).png'><img src="images/emotions/icon (174).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (175).png'><img src="images/emotions/icon (175).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (176).png'><img src="images/emotions/icon (176).png" /></a></li>                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (177).png'><img src="images/emotions/icon (177).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (178).png'><img src="images/emotions/icon (178).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (179).png'><img src="images/emotions/icon (179).png" /></a></li>                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (180).png'><img src="images/emotions/icon (180).png" /></a></li>                                    
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (181).png'><img src="images/emotions/icon (181).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (182).png'><img src="images/emotions/icon (182).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (183).png'><img src="images/emotions/icon (183).png" /></a></li>                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (184).png'><img src="images/emotions/icon (184).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (185).png'><img src="images/emotions/icon (185).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (186).png'><img src="images/emotions/icon (186).png" /></a></li>                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (187).png'><img src="images/emotions/icon (187).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (188).png'><img src="images/emotions/icon (188).png" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/icon (189).png'><img src="images/emotions/icon (189).png" /></a></li>
                                </ul></li>
                                     </ul>
                            </div>                          
                    </div>
                     
                </div>
                <div class="pull-right">
                        <asp:Literal ID="uiLiteralAttach" runat="server"></asp:Literal>                        
                    </div>
                </div>
            </div>

        </div>            
<script type="text/javascript">
    
    $(".MsgHistroy").slimScroll({
            railVisible: true,
            height: '400px',
            start: 'bottom',
            color: '#FEC401',
            railColor: '#C7C5C0',
            position: 'left'
            
    });
    

    $(".camera").click(function () {
        var datarelated = $(this).attr('data-related');
        var arr = datarelated.split('$');
        var name = "startCam" + arr[0];
        var fn = window[name];
        var fnparams = [arr[1]];
        if (typeof fn === 'function') {
            fn.apply(null, fnparams);
        }
    });

    $('.SScroll').each(function () {
        $(this).slimScroll({
            railVisible: true,
            height: $(this).attr('data-height'),
            color: '#FEC401',
            railColor: '#C7C5C0',
            position: 'left'
        });
    });

    $(".roomMenuItem").tooltip();
</script>
     <asp:Literal ID="uiLiteralScript" runat="server"></asp:Literal>

        <asp:Literal ID="uiLiteralNoOfMics" runat="server"></asp:Literal>        
        <!-- this is the end of roomcontents div -->
    </div>
    </form>
</body>
</html>
