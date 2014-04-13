<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/All.Master" AutoEventWireup="true" CodeBehind="ViewEnvelops.aspx.cs" Inherits="E3zemni_WebGUI.ViewEnvelops" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
<div class="row clearfix mbs">
<h3>
Envelops
</h3>
<a href="checkout.aspx" class="btn btn-success pull-right">Skip and complete your order</a>
<div class="clear" style="height:5px;"></div>
<div class="grid_12">
<div class="products shop clearfix mbf">
    <asp:Repeater ID="uiRepeaterEnvelops" runat="server">
    <ItemTemplate>
        <div class="product grid_3">
			<img class="product_img" src='<%# Eval("ImagePath") %>' alt=""><!-- featured thumbnail -->
			<img class="product_img_hover" src='<%# Eval("ImagePath") %>' alt=""><!-- featured thumbnail hover -->			
			<div class="product_inner">				
				<div class="clearfix">
					<p class="price"> EGP <%# Eval("Price")%> </p>					
				</div>
			</div>
			<div class="product_meta clearfix">
				<%--<a href="#" class="f_btn add_c"><span><i class="icon_cart_alt"></i> Add to Cart</span></a>--%>
				<a href='checkout.aspx?eid=<%# Eval("EnvelopID") %>' class="f_btn"><span><i class="icon_menu"></i> Order</span></a>
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

</div>
</asp:Content>
