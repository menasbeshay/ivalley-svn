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
                                    <a href="#" class='type_<%# Eval("MemberTypeID") %>'><%# Eval("Name") %>
                                    </a>
                            <div class="clearfix" style="height: 1px;"></div>
                            <span id='user-status-<%# Eval("MemberID") %>'>
                            <%# string.IsNullOrEmpty(Eval("StatusMsg").ToString()) ? "&nbsp;" : Eval("StatusMsg")  %>
                                </span>
                            <div class="clearfix" style="height: 1px;"></div>
                                <div class="popup-menu">
						            <a href="#" ><span class="awesome">&#xf0e6;</span> محادثة خاصة</a>
						            <a href="#" ><span class="awesome">&#xf030;</span> عرض الكاميرا</a>
						            <a href="#" ><span class="awesome">&#xf08e;</span> عرض البروفايل</a>
						            <a href="#" ><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a>
						            <a href="#" ><span class="awesome">&#xf06b;</span> أرسل هدية</a>
						            <a href='Messages.aspx?t=createmsg&u=<%# Eval("MemberID") %>' target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a>
						            <a href="#" ><span class="awesome">&#xf10b;</span> أرسل SMS</a>
						            <a href="#" ><span class="awesome">&#xf093;</span> أرسل ملف</a>
						            <a href="#" ><span class="awesome">&#xf05e;</span> حجب</a>
					            </div>
                                </div></ItemTemplate>
                        <AlternatingItemTemplate> <div class="Alteven friend-link" id='usernode-<%# Eval("MemberID") %>'>
                                    <img src="images/defaultavatar.png" class="friendpic online"/>
                                    <a href="#" class='type_<%# Eval("MemberTypeID") %>'><%# Eval("Name") %>
                                    </a>
                            <div class="clearfix" style="height: 1px;"></div>
                            <%# string.IsNullOrEmpty(Eval("StatusMsg").ToString()) ? "&nbsp;" : Eval("StatusMsg")  %>
                            <div class="clearfix" style="height: 1px;"></div>
                                <div class="popup-menu">
						            <a href="#" ><span class="awesome">&#xf0e6;</span> محادثة خاصة</a>
						            <a href="#" ><span class="awesome">&#xf030;</span> عرض الكاميرا</a>
						            <a href="#" ><span class="awesome">&#xf08e;</span> عرض البروفايل</a>
						            <a href="#" ><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a>
						            <a href="#" ><span class="awesome">&#xf06b;</span> أرسل هدية</a>
						            <a href='Messages.aspx?t=createmsg&u=<%# Eval("MemberID") %>' target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a>
						            <a href="#" ><span class="awesome">&#xf10b;</span> أرسل SMS</a>
						            <a href="#" ><span class="awesome">&#xf093;</span> أرسل ملف</a>
						            <a href="#" ><span class="awesome">&#xf05e;</span> حجب</a>
					            </div>
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
                        <ItemTemplate> <div class="Altodd friend-link" >
                                    <img src="images/defaultavatar.png" class="friendpic offline"/>
                                    <a href="#"><%# Eval("Name") %>
                                    </a>
                             <div class="clearfix" style="height: 1px;"></div>
                            <%# string.IsNullOrEmpty(Eval("StatusMsg").ToString()) ? "&nbsp;" : Eval("StatusMsg")  %>
                            <div class="clearfix" style="height: 1px;"></div>
                                 <div class="popup-menu">
						            <a href="#" ><span class="awesome">&#xf0e6;</span> محادثة خاصة</a>
						            <a href="#" ><span class="awesome">&#xf030;</span> عرض الكاميرا</a>
						            <a href="#" ><span class="awesome">&#xf08e;</span> عرض البروفايل</a>
						            <a href="#" ><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a>
						            <a href="#" ><span class="awesome">&#xf06b;</span> أرسل هدية</a>
						            <a href='Messages.aspx?t=createmsg&u=<%# Eval("MemberID") %>' target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a>
						            <a href="#" ><span class="awesome">&#xf10b;</span> أرسل SMS</a>
						            <a href="#" ><span class="awesome">&#xf093;</span> أرسل ملف</a>
						            <a href="#" ><span class="awesome">&#xf05e;</span> حجب</a>
					            </div>
                                </div></ItemTemplate>
                        <AlternatingItemTemplate> <div class="Alteven friend-link" >
                                    <img src="images/defaultavatar.png" class="friendpic offline"/>
                                    <a href="#"><%# Eval("Name") %>
                                    </a>
                             <div class="clearfix" style="height: 1px;"></div>
                            <%# string.IsNullOrEmpty(Eval("StatusMsg").ToString()) ? "&nbsp;" : Eval("StatusMsg")  %>
                            <div class="clearfix" style="height: 1px;"></div>
                                 <div class="popup-menu">
						            <a href="#" ><span class="awesome">&#xf0e6;</span> محادثة خاصة</a>
						            <a href="#" ><span class="awesome">&#xf030;</span> عرض الكاميرا</a>
						            <a href="#" ><span class="awesome">&#xf08e;</span> عرض البروفايل</a>
						            <a href="#" ><span class="awesome">&#xf00d;</span> حذف من الأصدقاء</a>
						            <a href="#" ><span class="awesome">&#xf06b;</span> أرسل هدية</a>
						            <a href='Messages.aspx?t=createmsg&u=<%# Eval("MemberID") %>' target="_blank"><span class="awesome">&#xf003;</span> أرسل رسالة</a>
						            <a href="#" ><span class="awesome">&#xf10b;</span> أرسل SMS</a>
						            <a href="#" ><span class="awesome">&#xf093;</span> أرسل ملف</a>
						            <a href="#" ><span class="awesome">&#xf05e;</span> حجب</a>
					            </div>
                                </div></AlternatingItemTemplate>
                    </asp:Repeater>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>