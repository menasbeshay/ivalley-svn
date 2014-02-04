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
                        <ItemTemplate> <div class="Altodd" id='usernode-<%# Eval("MemberID") %>'>
                                    <img src="images/defaultavatar.png" id='user-<%# Eval("MemberID") %>' class="friendpic online"/>
                                    <a href="#"><%# Eval("Name") %>
                                    </a>
                            <div class="clearfix" style="height: 1px;"></div>
                            <span id='user-status-<%# Eval("MemberID") %>'>
                            <%# string.IsNullOrEmpty(Eval("StatusMsg").ToString()) ? "&nbsp;" : Eval("StatusMsg")  %>
                                </span>
                            <div class="clearfix" style="height: 1px;"></div>
                                
                                </div></ItemTemplate>
                        <AlternatingItemTemplate> <div class="Alteven" id='usernode-<%# Eval("MemberID") %>'>
                                    <img src="images/defaultavatar.png" class="friendpic online"/>
                                    <a href="#"><%# Eval("Name") %>
                                    </a>
                            <div class="clearfix" style="height: 1px;"></div>
                            <%# string.IsNullOrEmpty(Eval("StatusMsg").ToString()) ? "&nbsp;" : Eval("StatusMsg")  %>
                            <div class="clearfix" style="height: 1px;"></div>
                                
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
                        <ItemTemplate> <div class="Altodd" >
                                    <img src="images/defaultavatar.png" class="friendpic offline"/>
                                    <a href="#"><%# Eval("Name") %>
                                    </a>
                             <div class="clearfix" style="height: 1px;"></div>
                            <%# string.IsNullOrEmpty(Eval("StatusMsg").ToString()) ? "&nbsp;" : Eval("StatusMsg")  %>
                            <div class="clearfix" style="height: 1px;"></div>
                                
                                </div></ItemTemplate>
                        <AlternatingItemTemplate> <div class="Alteven" >
                                    <img src="images/defaultavatar.png" class="friendpic offline"/>
                                    <a href="#"><%# Eval("Name") %>
                                    </a>
                             <div class="clearfix" style="height: 1px;"></div>
                            <%# string.IsNullOrEmpty(Eval("StatusMsg").ToString()) ? "&nbsp;" : Eval("StatusMsg")  %>
                            <div class="clearfix" style="height: 1px;"></div>
                                
                                </div></AlternatingItemTemplate>
                    </asp:Repeater>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>