<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Ar.Master" AutoEventWireup="true" CodeBehind="browse.aspx.cs" Inherits="E3zemni_WebGUI.ar.browse" %>
<%@ MasterType VirtualPath="~/MasterPages/Ar.Master" %>
<%@ Register src="~/ar/controls/ucsearch.ascx" tagname="ucSearch" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="../js/purl.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
<div class="row clearfix mbs">
<div class="grid_9">
<div class="products shop clearfix mbf">
    <asp:Repeater ID="uiRepeaterCards" runat="server" onitemdatabound="uiRepeaterCards_ItemDataBound" onitemcommand="uiRepeaterCards_ItemCommand">
    <ItemTemplate>
        <div class="product grid_4">
			<img class="product_img" src='../<%# Eval("MainPhoto") %>' alt=""><!-- featured thumbnail -->
			<img class="product_img_hover" src='../<%# Eval("MainPhotoHover") %>' alt=""><!-- featured thumbnail hover -->			
			<div class="product_inner">
				<h3> <a href='viewCard.aspx?cid=<%# Eval("CardID") %>'> <%# Eval("CardNameAr")%> </a> </h3>
				<div class="clearfix" style="height:25px;text-align:right;">
					<p class="price" style="float:right;" ><%# Eval("PriceNow")%>  جنيه </p>					
				</div>
                <div class="clearfix" style="height:25px;">
                                    الألوان المتاحة :
                                        <asp:Repeater ID="uiRepeaterColor" runat="server" 
                                            onitemdatabound="uiRepeaterColor_ItemDataBound">
                                        <ItemTemplate>
                                            <asp:Literal ID="uiLiteralColor" runat="server"></asp:Literal>
                                        </ItemTemplate>
                                        </asp:Repeater>                                    
                                </div>
                                <div class="clearfix" style="height:25px;padding-top:5px;">
                                    <div class="Share" style="direction:rtl;float:right;">
                                        <!-- AddThis Button BEGIN -->
                                        <div class="addthis_toolbox addthis_default_style ">
                                            <a class="addthis_button_preferred_1"></a><a class="addthis_button_preferred_2">
                                            </a><a class="addthis_button_preferred_3"></a><a class="addthis_button_preferred_4">
                                            </a><a class="addthis_button_compact"></a><a class="addthis_counter addthis_bubble_style">
                                            </a>
                                        </div>
                                        <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-4ff5714055358f82"></script>
                                        <!-- AddThis Button END -->
                                    </div>
                                </div>
			</div>
			<div class="product_meta clearfix">	            
            <asp:LinkButton ID="uiLinkButtonAddToFav" CommandName="AddToFav" CommandArgument='<%# Eval("CardID") %>' CssClass="f_btn add_c" runat="server"><span><i class="icon_heart_alt"></i> إضافة إلى المفضلة</span></asp:LinkButton>                                	
				<a href='viewCard.aspx?cid=<%# Eval("CardID") %>' class="f_btn"><span><i class="icon_menu"></i> التفاصيل</span></a>

			</div>
		</div>
    </ItemTemplate>
    </asp:Repeater>
    <div class="clear" style="height:5px;"></div>
    <div class="pagination-tt clearfix">
	    <ul>
		    		    
		    <li>
            <asp:LinkButton ID="uiLinkButtonNext" runat="server" OnClick="uiLinkButtonNext_Click"
                                Font-Bold="True" Font-Size="Medium"><i class="arrow_right"></i> التالى </asp:LinkButton>
            </li>
            <li>
            <asp:LinkButton ID="uiLinkButtonPrev" runat="server" OnClick="uiLinkButtonPrev_Click"
                                Font-Bold="True" Font-Size="Medium"> السابق <i class="arrow_left"></i></asp:LinkButton>
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
