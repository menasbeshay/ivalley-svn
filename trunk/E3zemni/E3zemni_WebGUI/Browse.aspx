<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/All.Master" AutoEventWireup="true" CodeBehind="Browse.aspx.cs" Inherits="E3zemni_WebGUI.Browse" %>
<%@ MasterType VirtualPath="~/MasterPages/All.Master" %>
<%@ Register src="controls/ucSearch.ascx" tagname="ucSearch" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="js/purl.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
<div class="row clearfix mbs">
<div class="grid_9">
<div class="products shop clearfix mbf">
    <asp:Repeater ID="uiRepeaterCards" runat="server">
    <ItemTemplate>
        <div class="product grid_4">
			<img class="product_img" src='<%# Eval("MainPhoto") %>' alt=""><!-- featured thumbnail -->
			<img class="product_img_hover" src='<%# Eval("MainPhotoHover") %>' alt=""><!-- featured thumbnail hover -->			
			<div class="product_inner">
				<h3> <a href='viewCard.aspx?cid=<%# Eval("CardID") %>'> <%# Eval("CardNameEng")%> </a> </h3>
				<div class="clearfix">
					<p class="price"> EGP <%# Eval("PriceNow")%> </p>					
				</div>
			</div>
			<div class="product_meta clearfix">
				<%--<a href="#" class="f_btn add_c"><span><i class="icon_cart_alt"></i> Add to Cart</span></a>--%>
				<a href='viewCard.aspx?cid=<%# Eval("CardID") %>' class="f_btn"><span><i class="icon_menu"></i> Details</span></a>
			</div>
		</div>
    </ItemTemplate>
    </asp:Repeater>
    <div class="clear" style="height:5px;"></div>
    <div class="pagination-tt clearfix">
	    <ul>
		    <li>
            <asp:LinkButton ID="uiLinkButtonPrev" runat="server" OnClick="uiLinkButtonPrev_Click"
                                Font-Bold="True" Font-Size="Medium"><i class="arrow_left"></i> Prev</asp:LinkButton>
            </li>		    
		    <li>
            <asp:LinkButton ID="uiLinkButtonNext" runat="server" OnClick="uiLinkButtonNext_Click"
                                Font-Bold="True" Font-Size="Medium"> Next <i class="arrow_right"></i></asp:LinkButton>
            </li>
	    </ul>
    </div><!-- pagination -->

</div>
</div>

<div class="grid_3 sidebar">
    
    <uc1:ucSearch ID="ucSearch1" runat="server" />
    
</div>
</div>

</asp:Content>
