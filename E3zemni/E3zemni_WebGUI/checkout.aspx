<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/All.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="E3zemni_WebGUI.checkout" %>
<%@ MasterType VirtualPath="~/MasterPages/All.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(document).ready(function () {
        updateGrandTotal();

        $(".qty").on('change keyup paste', function () {
            updateGrandTotal();
        });
    });

    function updateGrandTotal() {
        var sum = 0;
        $('.cart_table_item').each(function () {
            var itemqty = eval($(this).find('.qty').val());
            var itemprice = eval($(this).children('.prodPrice').html());
            sum += itemqty * itemprice;
        });
        $('#GrandTotal').html(sum);
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
<div class="row clearfix mbs">
					<div class="grid_12">
						<h3 class="col-title"> Complete your order </h3>
						<div class="bag_table">
                            <asp:Repeater ID="uiRepeaterOrder" runat="server" 
                                onitemdatabound="uiRepeaterOrder_ItemDataBound">
                            <HeaderTemplate>
                                <table class="shop_table footable tablet footable-loaded" cellspacing="0">
									<thead>
										<tr>
											<th data-hide="phone" class="product-thumbnail">Item </th>											
											<th class="product-quantity">Quantity</th>
                                            <th class="product-quantity">Price</th>
                                            <th data-hide="phone" class="product-thumbnail">Envelop</th>											
                                            
											<th class="product-quantity">Quantity</th>																				
										</tr>
									</thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                            <tr class="cart_table_item">
											<td class="product-thumbnail">
												<a href="#"><img src='<%# Eval("CardDesign") %>' alt="#"></a>
											</td>
																	
											<td class="product-quantity">
												<div class="quantity buttons_added">
                                                    <asp:TextBox ID="uiTextBoxQty" runat="server" CssClass="qty" Text='<%# Eval("CardCount") %>'></asp:TextBox>                                                    
                                                    <br />
                                                    <asp:Label ID="uiLabelMaxQty" runat="server" Text="Minimum quantity (30)" style="font-size:10px" ></asp:Label>
                                                    
												</div>
											</td>

                                            <td class="product-quantity prodPrice">
												
                                                    <%# Eval("ItemPrice") %>
												
											</td>                    	

                                            <td class="product-thumbnail">
												<a href="#">
                                                    <asp:Image ID="uiImageEnvelop" runat="server" /></a>
                                                    <asp:Label ID="uiLabelEnvDash" runat="server" Text="__" ></asp:Label>
											</td>
															
                                                            		
											<td class="product-quantity">
												<div class="quantity buttons_added">
                                                    <asp:TextBox ID="uiTextBoxEQty" runat="server" CssClass="qty" Text='<%# Eval("EnvelopCount") %>'></asp:TextBox>                                                    
												</div>
											</td>
							
											
												
										</tr>
                            </ItemTemplate>
                            <FooterTemplate>
                            	<tr>
											<td data-hide="phone" class="product-tdumbnail"> </td>											
											<td class="product-quantity">Grand Total</td>
                                            <td class="product-quantity" id='GrandTotal'></td>
                                            <td data-hide="phone" class="product-tdumbnail"></td>											
                                            
											<td class="product-quantity"></td>																				
										</tr>
                            </tbody>
								</table>
                            </FooterTemplate>
                            </asp:Repeater>
						
							</div><!-- bag table -->	
                                                        
                            <asp:LinkButton ID="uiLinkButtonCheckout" runat="server"  
                            CssClass="tbutton mt medium color2" onclick="uiLinkButtonCheckout_Click">Checkout</asp:LinkButton>					
					</div><!-- grid9 -->
						
				</div><!-- row -->
</asp:Content>
