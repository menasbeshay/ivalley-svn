<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Services.ascx.cs" Inherits="Obtravel.Arabic.UserContorls.Services" %>
<div class="services">
    <h1>
        خدماتنا</h1>
    <asp:Repeater ID="uiRepeaterCurrentServices" runat="server">
        <HeaderTemplate>
            <div class="services">
                <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <li>
                <div class="img">
                <a href='Services.aspx?SID=<%# Eval("ID") %>'>
                    <asp:Image ID="uiImageService" runat="server" ImageUrl='<%# Eval("arImagePath") %>' />
                    </a>
                    </div>
                <div class="serv_data">
                    <h4><a class="title" href='Services.aspx?SID=<%# Eval("ID") %>'>
                        <%# Eval("arTitle") %></a></h4>
                    <%# Eval("arBrief") %>
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
        <asp:HyperLink ID="uiHyperLinkServices" runat="server" NavigateUrl="~/Arabic/Services.aspx">قراءة المزيد </asp:HyperLink></div>
    <div class="clear">
    </div>
</div>
