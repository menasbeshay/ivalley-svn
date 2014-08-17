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
						<p class="item_price"><span class="from">السعر: </span>
                          <asp:PlaceHolder runat="server" ID="uiPlaceholderPriceFrom" Visible="false">
                        <del> <asp:Label ID="uiLabelPriceFrom" runat="server" ></asp:Label> جنيه 
                            </del> 
                            </asp:PlaceHolder>
                            <span class="amount"> 
                                <asp:Label ID="uiLabelPriceTo" runat="server" ></asp:Label> جنيه</span></p>
                                <p style="display:none">
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
                        <asp:Panel ID="uipanelIsCard" runat="server">
                        <p>
                            ألوان الخلفية المقترحة :
                            <asp:Repeater ID="uiRepeaterColor" runat="server" 
                                onitemdatabound="uiRepeaterColor_ItemDataBound">
                            <ItemTemplate>
                                <asp:Literal ID="uiLiteralColor" runat="server"></asp:Literal>
                            </ItemTemplate>
                            </asp:Repeater>
                        </p>
                        </asp:Panel>
						<p>
                            <asp:Literal ID="uiLiteralDesc" runat="server"></asp:Literal>
                        </p>

						
							<div class="single_variation_wrap">
								
								<div class="variations_button">									
                                    <asp:LinkButton ID="uiLinkButtonAddToCart" runat="server" Visible="false"
                                        class="tbutton medium" onclick="uiLinkButtonAddToCart_Click"><span>أضف إلى سلة التسوق</span></asp:LinkButton>
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

                <div class="modal fade" id="ViewModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close pull-left" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">إغلاق</span></button>
        <h4 class="modal-title">تم إضافة صنف لسلة المشتريات</h4>
      </div>
      <div class="modal-body">
        <p> تم إضافة صنف جديد إلى سلة مشترياتك</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">إغلاق</button>        
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>
</asp:Content>
