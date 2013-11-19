<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucHomeSlider.ascx.cs" Inherits="WebApplication.controls.ucHomeSlider" %>
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
            pager: false,
            auto: true,		
		    autoStart: true
        });
    });
    </script>
</FooterTemplate>
<ItemTemplate>
                <li><img src='../HomeGallery/<%# Eval("Name") %>' title='<%# Eval("Name").ToString().Substring(0,  Eval("Name").ToString().LastIndexOf(".")) %>'/></li>                
</ItemTemplate>
</asp:Repeater>
