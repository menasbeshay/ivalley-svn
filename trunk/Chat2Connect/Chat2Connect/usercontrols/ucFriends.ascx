<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucFriends.ascx.cs" Inherits="Chat2Connect.usercontrols.ucFriends" %>
<div class="SScroll" data-height="500px">
            <div class="panel-group" id="accordion1">
                <div>
                
                    <div class="pull-right"><a data-toggle="collapse" data-parent="#accordion1" href="#helpcontact" >المساعدة</a></div>
                    <div class="clearfix"></div>
                    <div id="helpcontact" class="panel-collapse collapse in" style="font-weight:bold;" >
                    
                                <div class="Altodd" >
                                    <a href="#">(Help) خالد 
                                    </a><div class="clearfix" style="height: 5px;"></div>
                                
                                </div>
                                <div class="Alteven" >
                                    <a href="#">(Help) ماجد 
                                    </a><div class="clearfix" style="height: 5px;"></div>
                                
                                </div>
                                <div class="Altodd" >
                                    <a href="#">(Help) معاذ 
                                    </a><div class="clearfix" style="height: 5px;"></div>
                                
                                </div>
                                <div class="Alteven" style="font-family:Arial;" >
                                    <a href="#">2connect
                                    </a>                                                                
                                    <div class="clearfix" style="height: 5px;"></div>
                                </div>
                            
                        
                    </div>
                    <div class="clearfix"></div>
                </div>

                <div style="height:5px;" class="clearfix"></div>

                <div>
                    <div class="pull-right"><a data-toggle="collapse" data-parent="#accordion1" href="#onlinepeople" >الأصدقاء المتواجدين</a></div>
                    <div class="clearfix"></div>                    
                    <asp:Repeater ID="uiRepeaterOnline" runat="server">
                        <HeaderTemplate><div id="onlinepeople" class="panel-collapse collapse in " ></HeaderTemplate>
                        <FooterTemplate></div></FooterTemplate>
                        <ItemTemplate> 
                            <div class="Altodd friend-link" id='usernode-<%# Eval("MemberID") %>'>
                                    <img src="images/defaultavatar.png" id='user-<%# Eval("MemberID") %>' class='friendpic online'/>
                                    <a href="#" class='type_<%# Eval("MemberTypeID") %>'><%# Eval("UserName") %>
                                    </a>
                            <div class="clearfix" style="height: 1px;"></div>
                            <span id='user-status-<%# Eval("MemberID") %>'>
                            <%# string.IsNullOrEmpty(Eval("StatusMsg").ToString()) ? "&nbsp;" : Eval("StatusMsg")  %>
                                </span>
                            <div class="clearfix" style="height: 1px;"></div>
                                 <ul class="popup-menu profileMenu g-dark g-dark-list">
                                    <li><a class="jslink" onclick='addChatRoom(<%# Eval("MemberID") %>, "<%# Eval("UserName") %>", "Private");'><span class="awesome">&#xf0e6;</span> محادثة خاصة</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf030;</span> عرض الكاميرا</a ></li>
						            <li><a class="jslink" href='userprofile.aspx?uid=<%# Eval("MemberID") %>' target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf06b;</span> أرسل هدية</a ></li>
						            <li><a href='Messages.aspx?t=createmsg&u=<%# Eval("MemberID") %>&un=<%# Eval("UserName") %>' target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a ></li>						            
						            <li><a class="jslink" ><span class="awesome">&#xf093;</span> أرسل ملف</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf05e;</span> حجب</a ></li>
                                   
                                </ul> 
                                </div></ItemTemplate>
                        <AlternatingItemTemplate> <div class="Alteven friend-link" id='usernode-<%# Eval("MemberID") %>'>
                                    <img src="images/defaultavatar.png" id='user-<%# Eval("MemberID") %>' class="friendpic online"/>
                                    <a href="#" class='type_<%# Eval("MemberTypeID") %>'><%# Eval("UserName") %>
                                    </a>
                            <div class="clearfix" style="height: 1px;"></div>
                            <%# string.IsNullOrEmpty(Eval("StatusMsg").ToString()) ? "&nbsp;" : Eval("StatusMsg")  %>
                            <div class="clearfix" style="height: 1px;"></div>
                                 <ul class="popup-menu profileMenu g-dark g-dark-list">
                                    <li><a class="jslink" onclick='addChatRoom(<%# Eval("MemberID") %>, "<%# Eval("UserName") %>", "Private");' ><span class="awesome">&#xf0e6;</span> محادثة خاصة</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf030;</span> عرض الكاميرا</a ></li>
						            <li><a class="jslink" href='userprofile.aspx?uid=<%# Eval("MemberID") %>' target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf06b;</span> أرسل هدية</a ></li>
						            <li><a href='Messages.aspx?t=createmsg&u=<%# Eval("MemberID") %>&un=<%# Eval("UserName") %>' target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a ></li>						            
						            <li><a class="jslink" ><span class="awesome">&#xf093;</span> أرسل ملف</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf05e;</span> حجب</a ></li>
                                   
                                </ul> 
                                </div></AlternatingItemTemplate>
                    </asp:Repeater>
                    <div class="clearfix"></div>
                </div>

                <div style="height:5px;" class="clearfix"></div>

                <div>
                    <div class="pull-right"><a data-toggle="collapse" data-parent="#accordion1" href="#offlinepeople" >الأصدقاء غير المتواجدين</a></div>
                    <div class="clearfix"></div>                    
                    <asp:Repeater ID="uiRepeaterOffline" runat="server">
                        <HeaderTemplate><div id="offlinepeople" class="panel-collapse collapse in " ></HeaderTemplate>
                        <FooterTemplate></div></FooterTemplate>
                        <ItemTemplate> <div class="Altodd friend-link" id='usernode-<%# Eval("MemberID") %>'>
                                    <img src="images/defaultavatar.png" id='user-<%# Eval("MemberID") %>' class="friendpic offline"/>
                                    <a href="#"><%# Eval("UserName") %>
                                    </a>
                             <div class="clearfix" style="height: 1px;"></div>
                            <%# string.IsNullOrEmpty(Eval("StatusMsg").ToString()) ? "&nbsp;" : Eval("StatusMsg")  %>
                            <div class="clearfix" style="height: 1px;"></div>
                                 <ul class="popup-menu profileMenu g-dark g-dark-list">
                                    <li><a class="jslink" onclick='addChatRoom(<%# Eval("MemberID") %>, "<%# Eval("UserName") %>", "Private");'><span class="awesome">&#xf0e6;</span> محادثة خاصة</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf030;</span> عرض الكاميرا</a ></li>
						            <li><a class="jslink" href='userprofile.aspx?uid=<%# Eval("MemberID") %>' target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf06b;</span> أرسل هدية</a ></li>
						            <li><a href='Messages.aspx?t=createmsg&u=<%# Eval("MemberID") %>&un=<%# Eval("UserName") %>' target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a ></li>						            
						            <li><a class="jslink" ><span class="awesome">&#xf093;</span> أرسل ملف</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf05e;</span> حجب</a ></li>
                                   
                                </ul> 
                                </div></ItemTemplate>
                        <AlternatingItemTemplate> <div class="Alteven friend-link" id='usernode-<%# Eval("MemberID") %>'>
                                    <img src="images/defaultavatar.png"  id='user-<%# Eval("MemberID") %>' class="friendpic offline"/>
                                    <a href="#"><%# Eval("UserName") %>
                                    </a>
                             <div class="clearfix" style="height: 1px;"></div>
                            <%# string.IsNullOrEmpty(Eval("StatusMsg").ToString()) ? "&nbsp;" : Eval("StatusMsg")  %>
                            <div class="clearfix" style="height: 1px;"></div>
                                 <ul class="popup-menu profileMenu g-dark g-dark-list">
                                    <li><a class="jslink" onclick='addChatRoom(<%# Eval("MemberID") %>, "<%# Eval("UserName") %>", "Private");'><span class="awesome">&#xf0e6;</span> محادثة خاصة</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf030;</span> عرض الكاميرا</a ></li>
						            <li><a class="jslink" href='userprofile.aspx?uid=<%# Eval("MemberID") %>' target="_blank"><span class="awesome">&#xf08e;</span> عرض البروفايل</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf06b;</span> أرسل هدية</a ></li>
						            <li><a href='Messages.aspx?t=createmsg&u=<%# Eval("MemberID") %>&un=<%# Eval("UserName") %>' target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a ></li>						            
						            <li><a class="jslink" ><span class="awesome">&#xf093;</span> أرسل ملف</a ></li>
						            <li><a class="jslink" ><span class="awesome">&#xf05e;</span> حجب</a ></li>
                                   
                                </ul> 
                                </div></AlternatingItemTemplate>
                    </asp:Repeater>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>