<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Ar.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="E3zemni_WebGUI.ar.checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
<div class="row clearfix mbs">
					<div class="grid_12">
						<h3 class="col-title"> تمم طلبك </h3>
						<div class="bag_table">
                            <asp:Repeater ID="uiRepeaterOrder" runat="server" 
                                onitemdatabound="uiRepeaterOrder_ItemDataBound">
                            <HeaderTemplate>
                                <table class="shop_table footable tablet footable-loaded" cellspacing="0">
									<thead>
										<tr>
											<th data-hide="phone" class="product-thumbnail">الكارت </th>											
											<th class="product-quantity">الكمية</th>
                                            <th data-hide="phone" class="product-thumbnail">الظرف</th>											
											<th class="product-quantity">الكمية</th>																				
										</tr>
									</thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                            <tr class="cart_table_item">
											<td class="product-thumbnail">
												<a href="#"><img src='../<%# Eval("CardDesign") %>' alt="#"></a>
											</td>
																	
											<td class="product-quantity">
												<div class="quantity buttons_added">
                                                    <asp:TextBox ID="uiTextBoxQty" runat="server" CssClass="qty" Text='<%# Eval("CardCount") %>'></asp:TextBox>                                                    
												</div>
											</td>

                                            <td class="product-thumbnail">
												<a href="#">
                                                    <asp:Image ID="uiImageEnvelop" runat="server" /></a>
											</td>
																	
											<td class="product-quantity">
												<div class="quantity buttons_added">
                                                    <asp:TextBox ID="uiTextBoxEQty" runat="server" CssClass="qty" Text='<%# Eval("EnvelopCount") %>'></asp:TextBox>                                                    
												</div>
											</td>
							
											
												
										</tr>
                            </ItemTemplate>
                            <FooterTemplate>
                            </tbody>
								</table>
                            </FooterTemplate>
                            </asp:Repeater>
						
							</div><!-- bag table -->	
                                                        
                            <asp:LinkButton ID="uiLinkButtonCheckout" runat="server"  
                            CssClass="tbutton mt medium color2" onclick="uiLinkButtonCheckout_Click">اشترى الأن</asp:LinkButton>					
					</div><!-- grid9 -->
						
				</div><!-- row -->
</asp:Content>
