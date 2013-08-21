<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectSlider.ascx.cs" Inherits="website.UC.ProjectSlider" %>
<div id="template" style="width: 600px; height: 180px;">
    <asp:Repeater ID="uiRepeaterProjects" runat="server">
    <HeaderTemplate>
        <div id="template" style="width: 600px; height: 180px;">
            <div class="cycleImmagini">
    </HeaderTemplate>
    <FooterTemplate>
        </div></div>
    </FooterTemplate>
    <ItemTemplate>
    <a href='../Projects.aspx?pid=<%# Eval("ProjectID") %>' title='<%# Eval("Name") %>'><img src="../Images.aspx?Inner=Projects&Image=<%# Eval("Picpath") %>" style="height: 180px;
            width: 600px;" title='<%# Eval("Name") %>' /></a>
    </ItemTemplate>
    </asp:Repeater>
        
</div>
