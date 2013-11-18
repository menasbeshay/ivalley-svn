<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucArHomeSlider.ascx.cs" Inherits="WebApplication.controls.ucArHomeSlider" %>
<asp:Repeater ID="uiRepeaterSlider" runat="server">
<HeaderTemplate><ul class="bxslider">
</HeaderTemplate>
<FooterTemplate>
</ul>
<script type="text/javascript">
    $(document).ready(function () {
        $('.bxslider').bxSlider({
            mode: 'fade',
            captions: true,
            pager: false
        });
    });
    </script>
</FooterTemplate>
<ItemTemplate>
                <li><img src='../HomeGallery/<%# Eval("Name") %>' title='<%# Eval("Name").ToString().Substring(0,  Eval("Name").ToString().LastIndexOf(".")) %>'/></li>                
</ItemTemplate>
</asp:Repeater>