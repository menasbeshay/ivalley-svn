<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/All.Master" AutoEventWireup="true" CodeBehind="viewCard.aspx.cs" Inherits="E3zemni_WebGUI.viewCard" %>
<%@ MasterType VirtualPath="~/MasterPages/All.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <div class="row clearfix mbs">
					<div class="grid_8">
						<div class="products shop clearfix mbf">
                            <asp:Panel runat="server" ID="uipanelImages">
                                <asp:Repeater ID="uiRepeaterImages" runat="server">
                                    <HeaderTemplate>
                                        <div id="projectslider" class="projectslider flexslider clearfix">
								            <ul class="slides">
                                    </HeaderTemplate>
                                    <FooterTemplate>
                                            </ul>
							            </div>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <li><img src='<%# Eval("ImagePath") %>' alt="#"></li>
                                    </ItemTemplate>
                                </asp:Repeater>


                                <asp:Repeater ID="uiRepeaterthumbs" runat="server">
                                    <HeaderTemplate>
                                        <div id="thumbnails" class="flexslider clearfix">
								            <ul class="slides">
                                    </HeaderTemplate>
                                    <FooterTemplate>
                                            </ul>
							            </div>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <li><img src='<%# Eval("ImagePath") %>' alt="#"></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                                                                								
							
                            </asp:Panel>
                            <asp:Image ID="uiImagemain" runat="server" />
                        </div>
                        </div>


                        <div class="grid_4">
						<h3> 
                            <asp:Label ID="uiLabelName" runat="server" ></asp:Label> </h3>
						<p class="item_price"><span class="from">From: </span><del>EGP 
                            <asp:Label ID="uiLabelPriceFrom" runat="server" ></asp:Label></del> <span class="amount">EGP 
                                <asp:Label ID="uiLabelPriceTo" runat="server" ></asp:Label></span></p>
                                <p>
                                Uploaded from : 
                                    <asp:Label ID="uiLabelDate" runat="server" ></asp:Label>
                                </p>
						<%--<p class="review">
							<span class="mid">2 Reviews</span> 
							<i class="icon_star" title="Rated 4.40 out of 5"></i>
							<i class="icon_star" title="Rated 4.40 out of 5"></i>
							<i class="icon_star" title="Rated 4.40 out of 5"></i>
							<i class="icon_star" title="Rated 4.40 out of 5"></i>
							<i class="icon_star_alt" title="Rated 4.40 out of 5"></i>
						</p>--%>
                        <asp:Panel ID="uipanelIsCard" runat="server">
                        <p>
                            Available background colors :
                            <asp:Repeater ID="uiRepeaterColor" runat="server" 
                                onitemdatabound="uiRepeaterColor_ItemDataBound">
                            <ItemTemplate>
                                <asp:Literal ID="uiLiteralColor" runat="server"></asp:Literal>
                            </ItemTemplate>
                            </asp:Repeater>
                        </p>
                        </asp:panel>
						<p>
                            <asp:Literal ID="uiLiteralDesc" runat="server"></asp:Literal>
                        </p>

						
							<div class="single_variation_wrap">
								
								<div class="variations_button">									
                                    <asp:LinkButton ID="uiLinkButtonAddToCart" runat="server" 
                                        class="tbutton medium" onclick="uiLinkButtonAddToCart_Click"><span>Add to shopping bag</span></asp:LinkButton>
                                    <asp:LinkButton ID="uiLinkButtonCustomize" runat="server" class="tbutton medium"><span>Edit</span></asp:LinkButton>                                    
								</div>
							</div>
							<div><input type="hidden" name="product_id" value=""></div>						
					</div><!-- grid4 -->
                        </div>


                        <div class="row clearfix mbs">
					<div class="grid_2">
						<ul class="tabs v_tab">							
							<li><a href="#Review" class="active">User's Review</a></li>
						</ul><!-- tabs -->
					</div><!-- grid2 -->

					<div class="grid_10">
						<ul class="tabs-content v_content">
							
							<li id="Review" class="active">
								<ul class="showcomments clearfix">	
                                    <asp:Repeater ID="uiRepeaterReviews" runat="server">
                                    <ItemTemplate>
                                        <li class="clearfix">										
										<h5 class="entry-title"><a href="#" class="title"><%# Eval("FullName") %></a>
											</h5>
										<p>
                                        <%# Eval("RevDescription")%>
                                        </p>
									</li>	
                                    </ItemTemplate>
                                    </asp:Repeater>														
								</ul>

                                <div class="write-reivew" id="#write-review">
            <h3>Write a reivew</h3>
            <div class="fr-border"></div>
            
            <!-- Form -->
            
              <div class="row">
                <div class="grid_8">
                    <asp:Label Text="An error occured. you have to login to review a card." runat="server" Visible="false" ID="uiLabelError" ForeColor="Red" Font-Bold="true"/>                   
                </div>
                <div class="grid_8">
                  
                    <asp:TextBox ID="uiTextBoxTitle" placeholder="Title" runat="server" CssClass="form-control"></asp:TextBox>                    
                  
                </div>
                <div class="clear" style="height:5px;"></div>
                <div class="grid_8">
                    <asp:TextBox ID="uiTextBoxReview" placeholder="Review" runat="server" TextMode="MultiLine" Rows="8" CssClass="form-control"></asp:TextBox>                  
                </div>
                <div class="clear" style="height:5px;"></div>
                <div class="grid_8">
                <asp:LinkButton ID="uiLinkButtonSave" runat="server" 
                  CssClass="btn btn-success pull-right" onclick="uiLinkButtonSave_Click" >Submit</asp:LinkButton>
              
                </div>
              </div>
            
            
            <!-- end: Form --> 
          </div>
							</li><!-- tab content -->
						</ul><!-- end tabs -->
					</div><!-- grid10 -->
				</div>
</asp:Content>
