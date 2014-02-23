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
                        <a href="#" class="btn btn-main">المشرف</a>
                        <a href="#" class="btn btn-main">إعدادت</a>
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
                <asp:LinkButton ID="uiLinkButtonAddToFav" runat="server"><i class="icon-star" style="color:#FEC200;"></i>&nbsp; أضف إلى المفضلة</asp:LinkButton>
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
                    <asp:Repeater ID="uiRepeaterRoomMembers" runat="server">
                        <ItemTemplate> <div class="Altodd rm" id="m_<%# Eval("MemberID") %>">
                                        <a href="#"><%# Eval("Name") %>
                                    </a>
                                    <div class="pull-left controls"><a href="#" class="camera"><img src="images/video_camera.png" style="width:16px;"  /></a><img src="images/hand.png" style="width:16px;" class="hand"/><img src="images/microphone_1.png" style="width:16px;" class="mic"/></div>
                                    <div class="clearfix" style="height: 1px;"></div>                               
                                </div></ItemTemplate>
                        <AlternatingItemTemplate> 
                            <div class="Alteven rm" id="m_<%# Eval("MemberID") %>">
                                    <a href="#"><%# Eval("Name") %>
                                    </a>
                                    <div class="pull-left controls"><a href="#" class="camera"><img src="images/video_camera.png" style="width:16px;"/></a><img src="images/hand.png" style="width:16px;" class="hand"/><img src="images/microphone_1.png" style="width:16px;" class="mic"/></div>
                                    <div class="clearfix" style="height: 1px;"></div>                               
                                </div>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                   
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
                                   
                                <li class='itemColor'><a data-wysihtml5-command='foreColor' data-wysihtml5-command-value='red'><div class="colorDiv" style="background-color:#f00;"></div></a></li>
                                <li class='itemColor'><a data-wysihtml5-command='foreColor' data-wysihtml5-command-value='green'><div class="colorDiv" style="background-color:#0f0;"></div></a></li>
                                <li class='itemColor'><a data-wysihtml5-command='foreColor' data-wysihtml5-command-value='blue'><div class="colorDiv" style="background-color:#00f;"></div></a></li>                                
                                </ul>
                            </div>                                                                    
                        
                        
                        <div class="btn-group">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                <span class="icon-smile"></span>
                                </button> 
                                <ul class="dropdown-menu" role="menu" id="smilesMenu">
                                     
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/1.gif'><img src="images/emotions/1.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/2.gif'><img src="images/emotions/2.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/3.gif'><img src="images/emotions/3.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/4.gif'><img src="images/emotions/4.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/5.gif'><img src="images/emotions/5.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/8.gif'><img src="images/emotions/8.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/9.gif'><img src="images/emotions/9.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/10.gif'><img src="images/emotions/10.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/11.gif'><img src="images/emotions/11.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/12.gif'><img src="images/emotions/12.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/13.gif'><img src="images/emotions/13.gif" /></a></li>                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/15.gif'><img src="images/emotions/15.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/16.gif'><img src="images/emotions/16.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/17.gif'><img src="images/emotions/17.gif" /></a></li>                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/19.gif'><img src="images/emotions/19.gif" /></a></li>                                    
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/21.gif'><img src="images/emotions/21.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/22.gif'><img src="images/emotions/22.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/23.gif'><img src="images/emotions/23.gif" /></a></li>                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/27.gif'><img src="images/emotions/27.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/28.gif'><img src="images/emotions/28.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/29.gif'><img src="images/emotions/29.gif" /></a></li>                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/31.gif'><img src="images/emotions/31.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/32.gif'><img src="images/emotions/32.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/33.gif'><img src="images/emotions/33.gif" /></a></li>                                                                                                    
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/37.gif'><img src="images/emotions/37.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/38.gif'><img src="images/emotions/38.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/39.gif'><img src="images/emotions/39.gif" /></a></li>                                    
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/41.gif'><img src="images/emotions/41.gif" /></a></li>                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/43.gif'><img src="images/emotions/43.gif" /></a></li>                                                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/47.gif'><img src="images/emotions/47.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/48.gif'><img src="images/emotions/48.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/49.gif'><img src="images/emotions/49.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/20.gif'><img src="images/emotions/20.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/44.gif'><img src="images/emotions/44.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/45.gif'><img src="images/emotions/45.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/46.gif'><img src="images/emotions/46.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/7.gif'><img src="images/emotions/7.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/14.gif'><img src="images/emotions/14.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/18.gif'><img src="images/emotions/18.gif" /></a></li>
                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/24.gif'><img src="images/emotions/24.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/25.gif'><img src="images/emotions/25.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/26.gif'><img src="images/emotions/26.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/30.gif'><img src="images/emotions/30.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/34.gif'><img src="images/emotions/34.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/35.gif'><img src="images/emotions/35.gif" /></a></li>
                                
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/40.gif'><img src="images/emotions/40.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/42.gif'><img src="images/emotions/42.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/36.gif'><img src="images/emotions/36.gif" /></a></li>
                                <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/6.gif'><img src="images/emotions/6.gif" /></a></li>  
                                </ul>
                            </div> 
                         
                    </div>

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

</script>
     <asp:Literal ID="uiLiteralScript" runat="server"></asp:Literal>
        <asp:Literal ID="uiLiteralNoOfMics" runat="server"></asp:Literal>        
        <!-- a literal for toolbar div has a start for a div , this is the end of roomcontents div -->
    </div>
    </form>
</body>
</html>
