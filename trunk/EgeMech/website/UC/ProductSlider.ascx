<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductSlider.ascx.cs" Inherits="website.UC.ProductSlider" %>




<asp:Repeater ID="uiRepeaterProducts" runat="server">
<HeaderTemplate>
    <div style="font-weight: bold; font-size: 16px; margin: 5px;">
        Products
    </div>
    <div class="catHome">
        <div id="slider">
            <ul>
</HeaderTemplate>
<FooterTemplate>
    </ul> </div> </div>
    
</FooterTemplate>
<ItemTemplate>
    <li><a href='../Products.aspx?pid=<%# Eval("ProductID") %>'>
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

        
