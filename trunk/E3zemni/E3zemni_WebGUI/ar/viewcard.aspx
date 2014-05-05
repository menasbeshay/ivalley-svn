<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Ar.Master" AutoEventWireup="true" CodeBehind="viewcard.aspx.cs" Inherits="E3zemni_WebGUI.ar.viewcard" %>
<%@ MasterType VirtualPath="~/MasterPages/Ar.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
<div class="row clearfix mbs">
					<div class="grid_8">
						<div class="products shop clearfix mbf">
                            <asp:Image ID="uiImagemain" runat="server" />
                        </div>
                        </div>


                        <div class="grid_4">
						<h3> 
                            <asp:Label ID="uiLabelName" runat="server" ></asp:Label> </h3>
						<p class="item_price"><span class="from">السعر: </span><del> <asp:Label ID="uiLabelPriceFrom" runat="server" ></asp:Label> جنيه 
                            </del> <span class="amount"> 
                                <asp:Label ID="uiLabelPriceTo" runat="server" ></asp:Label> جنيه</span></p>
                                <p>
                                تاريخ التصميم : 
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
                        <p>
                            ألوان الخلفية المقترحة :
                            <asp:Repeater ID="uiRepeaterColor" runat="server" 
                                onitemdatabound="uiRepeaterColor_ItemDataBound">
                            <ItemTemplate>
                                <asp:Literal ID="uiLiteralColor" runat="server"></asp:Literal>
                            </ItemTemplate>
                            </asp:Repeater>
                        </p>
						<p>
                            <asp:Literal ID="uiLiteralDesc" runat="server"></asp:Literal>
                        </p>

						
							<div class="single_variation_wrap">
								
								<div class="variations_button">									
                                    
                                    <asp:LinkButton ID="uiLinkButtonCustomize" runat="server" class="tbutton medium"><span>صمم بنفسك</span></asp:LinkButton>                                    
								</div>
							</div>
							<div><input type="hidden" name="product_id" value=""></div>						
					</div><!-- grid4 -->
                        </div>


                        <div class="row clearfix mbs">
					<div class="grid_2">
						<ul class="tabs v_tab">							
							<li><a href="#Review" class="active">تعليقات الزوار</a></li>
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
            <h3>أكتب تعليق</h3>
            <div class="fr-border"></div>
            
            <!-- Form -->
            
              <div class="row">
                <div class="grid_8">
                    <asp:Label Text="حدث خطأ . يجب الدخول أولاً." runat="server" Visible="false" ID="uiLabelError" ForeColor="Red" Font-Bold="true"/>                   
                </div>
                <div class="grid_8">
                  
                    <asp:TextBox ID="uiTextBoxTitle" placeholder="العنوان" runat="server" CssClass="form-control"></asp:TextBox>                    
                  
                </div>
                <div class="clear" style="height:5px;"></div>
                <div class="grid_8">
                    <asp:TextBox ID="uiTextBoxReview" placeholder="التعليق" runat="server" TextMode="MultiLine" Rows="8" CssClass="form-control"></asp:TextBox>                  
                </div>
                <div class="clear" style="height:5px;"></div>
                <div class="grid_8">
                <asp:LinkButton ID="uiLinkButtonSave" runat="server" 
                  CssClass="btn btn-success pull-right" onclick="uiLinkButtonSave_Click" >إرسال</asp:LinkButton>
              
                </div>
              </div>
            
            
            <!-- end: Form --> 
          </div>
							</li><!-- tab content -->
						</ul><!-- end tabs -->
					</div><!-- grid10 -->
				</div>
</asp:Content>
