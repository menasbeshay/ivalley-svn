<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsSlider.ascx.cs" Inherits="Website.Controls.NewsSlider" %>

<div id="jslidernews2" class="lof-slidecontent" style="height: 300px;">
    <div class="preload">
        <div>
        </div>
    </div>
    <asp:Repeater ID="uiRepeaterContent" runat="server">
    <HeaderTemplate>
        <div class="main-slider-content" style="width: 640px; height: 300px;">
            <ul class="sliders-wrap-inner">
    </HeaderTemplate>
    <ItemTemplate>
        <li>
            <img src="Images.aspx?Image=<%# Eval("MainImagePath") %>" title="Newsflash 1">
            <div class="slider-description">
                <div class="slider-meta">
                    <%# Eval("Description") %>
                </div>
                <a class="readmore" href='ViewNews.aspx?NID=<%# Eval("NewsID") %>'>اقرأ المزيد </a>
                </p>
            </div>
            </li>
    </ItemTemplate>
    <FooterTemplate>
    </ul> </div>
    </FooterTemplate>
    </asp:Repeater>
    
            
                
                       
    
    <!-- END MAIN CONTENT -->
    <!-- NAVIGATOR -->
    <asp:Repeater ID="uiRepeaterNav" runat="server">
        <HeaderTemplate>
            <div class="navigator-content">
                <div class="navigator-wrapper">
                    <ul class="navigator-wrap-inner">
        </HeaderTemplate>
        <ItemTemplate>
            <li>
                <div>
                    <img src="<%# Eval("MainImagePath") %>" />
                    <h3>
                        <%# Eval("ArTitle") %>
                    </h3>
                </div>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul> </div>
            <div class="button-control" style="display: none;">
                <span></span>
            </div>
            </div>
        </FooterTemplate>
    </asp:Repeater>
    
                
            
</div>
