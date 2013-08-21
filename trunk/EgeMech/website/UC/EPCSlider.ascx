<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EPCSlider.ascx.cs" Inherits="website.UC.EPCSlider" %>
<asp:Repeater ID="uiRepeaterEPC" runat="server">
    <HeaderTemplate>
        <div style="font-weight: bold; font-size: 16px; margin: 5px;">
            EPC
        </div>
        <div class="catHome">
            <div id="slider3">
                <ul>
    </HeaderTemplate>
    <FooterTemplate>
        </ul> </div> </div>
    </FooterTemplate>
    <ItemTemplate>
        <li><a href='../Projects.aspx?pid=<%# Eval("ProjectID") %>'>
            <img src="../Images.aspx?Inner=News&Image=<%# Eval("PicPath") %>" alt='' /><br />
            <br />
            <br />
            <p>
                <%# Eval("Name") %></p>
        </a></li>
    </ItemTemplate>
</asp:Repeater>
<div class="clearfix">
</div>
