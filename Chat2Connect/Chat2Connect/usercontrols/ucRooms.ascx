<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucRooms.ascx.cs" Inherits="Chat2Connect.usercontrols.ucRooms" %>
<div class="SScroll" data-height="500px">
    <div class="panel-group rooms" id="accordion">
        <div class="panel" style="border-bottom: 1px solid #FEC200">
            <a class="catLink" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" data-related="cb=1">غرفى الخاصة&nbsp;(<asp:Label ID="catlink_minecount" ClientIDMode="Static" runat="server"></asp:Label>)
            </a>
            <div class="clearfix" style="height: 5px;"></div>

        </div>
        <div class="panel" style="border-bottom: 1px solid #FEC200">
            <a class="catLink" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" data-related="fav=1">غرفى المفضلة&nbsp;(<asp:Label id="catlink_favcount" runat="server" ClientIDMode="Static"> </asp:Label>)
            </a>
            <div class="clearfix" style="height: 5px;"></div>

        </div>
        <div class="panel" style="border-bottom: 1px solid #FEC200">
            <a class="catLink" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"  data-related="vip=1">الغرف المميزة VIP
            </a>
            <div class="clearfix" style="height: 5px;"></div>

        </div>
        <%--<div class="panel" style="border-bottom: 1px solid #FEC200">
            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">الغرف المخفية
		                	 
            </a>
            <div class="clearfix" style="height: 5px;"></div>

        </div>--%>
        <div class="panel" style="border-bottom: 1px solid #FEC200">
            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">نادى التواصل
		                	 
            </a>
            <div class="clearfix" style="height: 5px;"></div>

        </div>
        <asp:Repeater ID="uiRepeaterCats" runat="server" OnItemDataBound="uiRepeaterCats_ItemDataBound">
    <HeaderTemplate></HeaderTemplate>
    <ItemTemplate>
        <div class="panel" style="border-bottom: 1px solid #FEC200">
        <a class="catLink" data-toggle="collapse" data-parent="#accordion" href="#collapse_<%# Container.ItemIndex.ToString()  %>"  data-related="cat=1&c=<%# Eval("CategoryID").ToString() %>"> <%# Eval("Name") %>	&nbsp;(<span id='catLink_<%# Eval("CategoryID").ToString() %>'><%# Eval("RoomCount") %></span>)
            </a>        
        <asp:Repeater ID="uiRepeaterSubcats" runat="server">
            <HeaderTemplate>
                 <div id="collapse_<%# ((RepeaterItem)Container.Parent.Parent).ItemIndex %>" class="panel-collapse collapse in">
                <div class="panel-body">                    
            </HeaderTemplate>
            <ItemTemplate>
                <a class="subcatLink room" data-related="subcat=1&s=<%# Eval("SubCategoryID").ToString() %>"><i class="icon icon-sitemap"></i> <%# Eval("Name") %>	&nbsp; (<span id='subcatLink_<%# Eval("SubCategoryID").ToString() %>'><%# Eval("RoomCount") %></span>)</a>
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



