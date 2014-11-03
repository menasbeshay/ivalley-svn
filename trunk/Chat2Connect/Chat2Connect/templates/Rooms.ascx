<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Rooms.ascx.cs" Inherits="Chat2Connect.templates.Rooms" %>

<div style="border-bottom: 1px solid #FEC200">
    <div class="pull-right ">
        <i class="icon-2x modernicon iconmodern-mainlist"></i>
        القائمة الرئيسية
    </div>
    <div class="pull-left col-lg-4" style="padding-left: 0px;">

        <div class="form-group">
            <input type="text" id="uiTextBoxRoomSearch" placeholder="ابحث عن غرفة" style="padding: 5px; padding-top: 7px;" class="col-lg-11 pull-right">
            <a href="#" class="col-lg-1" style="font-size: 20px; text-decoration: none; padding-left: 0px; padding-right: 5px; padding-top: 5px;" id="SearchRooms"><i class="icon icon-search"></i></a>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<div class="col-lg-3 pull-right" style="padding: 5px; border-left: 2px solid #FEC200; margin-top: 2px;">
    <div class="SScroll" data-height="500px">
        <div class="panel-group rooms" id="accordion">
            <div class="panel" style="border-bottom: 1px solid #FEC200">
                <a class="catLink" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" data-bind="click: function(data, event){$root.loadRooms('cb=1',data,event)}">غرفى الخاصة
                </a>
                <div class="clearfix" style="height: 5px;"></div>

            </div>
            <div class="panel" style="border-bottom: 1px solid #FEC200">
                <a class="catLink" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" data-bind="click: function(data, event){$root.loadRooms('fav=1',data,event)}">غرفى المفضلة
                </a>
                <div class="clearfix" style="height: 5px;"></div>

            </div>
            <div class="panel" style="border-bottom: 1px solid #FEC200">
                <a class="catLink" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" data-bind="click: function(data, event){$root.loadRooms('vip=1',data,event)}">الغرف المميزة VIP
                </a>
                <div class="clearfix" style="height: 5px;"></div>

            </div>
            <div class="panel" style="border-bottom: 1px solid #FEC200">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">نادى التواصل
		                	 
                </a>
                <div class="clearfix" style="height: 5px;"></div>

            </div>
            <asp:Repeater ID="uiRepeaterCats" runat="server" OnItemDataBound="uiRepeaterCats_ItemDataBound">
                <HeaderTemplate></HeaderTemplate>
                <ItemTemplate>
                    <div class="panel" style="border-bottom: 1px solid #FEC200">
                        <a class="catLink" data-toggle="collapse" data-parent="#accordion" href="#collapse_<%# Container.ItemIndex.ToString()  %>" data-bind="click: function(data, event){$root.loadRooms('cat=1&c=<%# Eval("CategoryID").ToString() %>',data,event)}"><%# Eval("Name") %>		                	 
                        </a>
                        <asp:Repeater ID="uiRepeaterSubcats" runat="server">
                            <HeaderTemplate>
                                <div id="collapse_<%# ((RepeaterItem)Container.Parent.Parent).ItemIndex %>" class="panel-collapse collapse in">
                                    <div class="panel-body">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <a class="subcatLink room" href="#" data-bind="click: function(data, event){$root.loadRooms('subcat=1&s=<%# Eval("SubCategoryID").ToString() %>',data,event)}" ><i class="icon icon-sitemap"></i><%# Eval("Name") %>	</a>
                                <div class="clearfix"></div>
                            </ItemTemplate>
                            <FooterTemplate>
                                </div>
            </div>
                            </FooterTemplate>
                        </asp:Repeater>

                        <div class="clearfix" style="height: 5px;"></div>
                    </div>
                </ItemTemplate>
                <FooterTemplate></FooterTemplate>
            </asp:Repeater>

        </div>
    </div>
</div>
<div class="col-lg-9 pull-left " style="padding: 5px;">
    <div class="SScroll" data-height="500px" id="roomsDiv">
        <div class="headerRow">
            <div class="col-lg-4 pull-right">إسم الغرفة</div>
            <div class="pull-right center" style="width: 21%; padding: 0 5px;">المتواجدين الأن</div>
            <div class="pull-right center" style="width: 15%; padding: 0 5px;">كاميرات</div>
            <div class="pull-right center" style="width: 15%; padding: 0 5px;">تقييم</div>
        </div>
        <!--ko foreach:$root.rooms-->
        <div class="ContentRow">
            <div class="col-lg-4 pull-right"><a href="#" data-bind="text: Name,click:$root.openChatRoom.bind($data,$data), css: 'type_' + TypeSpecID()"></a></div>
            <div class="pull-right center" style="width: 21%; padding: 0 5px;" data-bind="text: ExistingMembers">
            </div>
            <div class="pull-right center" style="width: 15%; padding: 0 5px;" data-bind="text: OpenCams"></div>
            <div class="pull-right center" style="width: 15%; padding: 0 5px;" data-bind="rate: Rate">
            </div>
        </div>
        <!--/ko-->
    </div>
</div>
