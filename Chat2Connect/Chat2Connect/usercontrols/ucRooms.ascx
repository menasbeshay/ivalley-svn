<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucRooms.ascx.cs" Inherits="Chat2Connect.usercontrols.ucRooms" %>
<div class="SScroll" data-height="500px">
    <div class="panel-group rooms" id="accordion">
        <div class="panel" style="border-bottom: 1px solid #FEC200">
            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">غرفى الخاصة
            </a>
            <div class="clearfix" style="height: 5px;"></div>

        </div>
        <div class="panel" style="border-bottom: 1px solid #FEC200">
            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">غرفى المفضلة
            </a>
            <div class="clearfix" style="height: 5px;"></div>

        </div>
        <div class="panel" style="border-bottom: 1px solid #FEC200">
            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">الغرف المميزة VIP
            </a>
            <div class="clearfix" style="height: 5px;"></div>

        </div>
        <div class="panel" style="border-bottom: 1px solid #FEC200">
            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">الغرف المخفية
		                	 
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
        <a class="catLink" data-toggle="collapse" data-parent="#accordion" href="#collapse_<%# Container.ItemIndex.ToString()  %>"  data-related="cat=1&c=<%# Eval("CategoryID").ToString() %>"> <%# Eval("Name") %>		                	 
            </a>        
        <asp:Repeater ID="uiRepeaterSubcats" runat="server">
            <HeaderTemplate>
                 <div id="collapse_<%# ((RepeaterItem)Container.Parent.Parent).ItemIndex %>" class="panel-collapse collapse in">
                <div class="panel-body">                    
            </HeaderTemplate>
            <ItemTemplate>
                <a class="subcatLink room" href="#" data-related="subcat=1&s=<%# Eval("SubCategoryID").ToString() %>"><i class="icon icon-sitemap"></i> <%# Eval("Name") %>	</a>
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



