<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Services.ascx.cs" Inherits="Obtravel.UserControls.Services" %>
<div class="services">
    <h1>
        Services</h1>
    <asp:Repeater ID="uiRepeaterCurrentServices" runat="server">
        <HeaderTemplate>
            <div class="services">
                <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <li>
                <div class="img">
                <a href='Services.aspx?SID=<%# Eval("ID") %>'>
                    <asp:Image ID="uiImageService" runat="server" ImageUrl='<%# Eval("ImagePath") %>' />
                    </a>
                    </div>
                <div class="serv_data">
                    <h4><a class="title" href='Services.aspx?SID=<%# Eval("ID") %>'>
                        <%# Eval("Title") %></a></h4>
                    <%# Eval("Brief") %>
                </div>
                <div class="clear">
                </div>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul> </div></FooterTemplate>
    </asp:Repeater>
    <div class="clear">
    </div>
    <div class="btn">
        <asp:HyperLink ID="uiHyperLinkServices" runat="server" NavigateUrl="~/Services.aspx">Read More</asp:HyperLink></div>
    <div class="clear">
    </div>
</div>
