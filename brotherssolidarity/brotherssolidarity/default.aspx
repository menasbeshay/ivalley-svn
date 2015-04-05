<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ar.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="brotherssolidarity._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="uiContentPlaceHolderSlider" runat="server">
    
	<!-- Revolution slider start -->
    <asp:Repeater ID="uiRepeaterSlider" runat="server">
        <HeaderTemplate>
            <div class="tp-banner-container">
					<div class="tp-banner">
						<ul>
        </HeaderTemplate>
        <FooterTemplate>
            </ul>
            </div>
            </div>
        </FooterTemplate>
        <ItemTemplate>
            <li data-transition="fade" data-slotamount="7">
			    <img alt="" src="images/slider/dummy.png" data-lazyload='<%# Eval("ImagePath") %>' data-bgposition="left center" data-kenburns="on" data-duration="14000" data-ease="Linear.easeNone" data-bgfit="100" data-bgfitend="130" data-bgpositionend="right center">								
            </li>
        </ItemTemplate>
    </asp:Repeater>
						
    <!-- Revolution slider end -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="uiContentPlaceHolderContent" runat="server">
    <div class="sectionWrapper">
    <div class="container">
		<div class="row">
            <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
        </div>
    </div>
        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="uiContentPlaceHolderScript" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#mi_home').addClass("selected");
        });
    </script>
</asp:Content>