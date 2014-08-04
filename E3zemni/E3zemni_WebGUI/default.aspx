<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/All.Master" AutoEventWireup="true"
    CodeBehind="default.aspx.cs" Inherits="E3zemni_WebGUI._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .divLoginStyle
        {
            background-color: rgb(255, 255, 255);
            color: black;
            margin-top: 235px;
            height: 300px;
            width: 700px;
            margin-left: 320px;
        }
        
        .divLoginPopup
        {
            top: 0;
            left: 0;
            z-index: 1000;
            position: fixed;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.7);
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSlider" runat="server">
    <!-- Start Modern Slider -->
    <div class="iview clearfix">
        <div id="iview">
            <div data-iview:image="images/slides/iview1.jpg" data-iview:transition="slice-top-fade,slice-right-fade">
                <div class="iview-caption" data-x="80" data-y="200">
                    iView Awesome Slider</div>
                <div class="iview-caption" data-x="80" data-y="245" data-transition="wipeRight">
                    The world's most awesome jQuery Image & Content Slider</div>
                <div class="iview-caption" data-x="254" data-y="290" data-transition="wipeLeft">
                    <i>Presented by <b>Hemn Chawroka</b></i></div>
            </div>
            <div data-iview:image="images/slides/iview2.jpg" data-iview:transition="zigzag-top,strip-left-fade">
                <div class="iview-caption caption5" data-x="60" data-y="230" data-transition="wipeDown">
                    Captions can be positioned and resized freely</div>
                <div class="iview-caption caption5" data-x="300" data-y="285" data-transition="wipeUp">
                    <a href="#">Example URL-link</a></div>
            </div>
            <div data-iview:image="images/slides/iview3.jpg">
                <div class="iview-caption caption4" data-x="50" data-y="60" data-width="312" data-transition="fade">
                    Some of iView's Options:</div>
                <div class="iview-caption blackcaption" data-x="50" data-y="115" data-transition="wipeLeft"
                    data-easing="easeInOutElastic">
                    Touch swipe for iOS and Android devices</div>
                <div class="iview-caption blackcaption" data-x="50" data-y="155" data-transition="wipeLeft"
                    data-easing="easeInOutElastic">
                    Image And Thumbs Fully Resizable</div>
                <div class="iview-caption blackcaption" data-x="50" data-y="195" data-transition="wipeLeft"
                    data-easing="easeInOutElastic">
                    Customizable Transition Effect</div>
                <div class="iview-caption blackcaption" data-x="50" data-y="235" data-transition="wipeLeft"
                    data-easing="easeInOutElastic">
                    Freely Positionable and Stylable Captions</div>
                <div class="iview-caption blackcaption" data-x="50" data-y="275" data-transition="wipeLeft"
                    data-easing="easeInOutElastic">
                    Cross Browser Compatibility!</div>
            </div>
        </div>
        <!-- End iview id -->
    </div>
    <!-- End iview class -->
    <!-- End Modern Slider -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <!--popup login -->
    <div id="divLogin" runat="server" class="divLoginPopup" visible="false">
        <asp:Panel ID="pnllogin" runat="server">
            <div class="divLoginStyle">
               
                <div class="">
                </div>
            </div>
        </asp:Panel>
    </div>

    <div id="loginModal" class="modal fade" role="modal" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Login</h4>
      </div>
      <div class="modal-body">                                             
                    <div class="col-lg-8" style="border-right:2px solid #ccc;">                         
                    <div class="col-lg-12">
                        <div class="col-md-8">
                            <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" Text="Error. please try again"
                                Visible="False"></asp:Label>
                        </div>

                         <div class="clear"></div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <asp:TextBox ID="uiTextBoxUserName" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required"
                                    ControlToValidate="uiTextBoxUserName" Font-Bold="true" Display="Dynamic" ForeColor="Red"
                                    ValidationGroup="MainUserLogin"></asp:RequiredFieldValidator>
                            <div class="clear" style="height:15px;"></div>
                                <asp:TextBox ID="uiTextBoxPassword" runat="server" CssClass="form-control" placeholder="Password"
                                    TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required"
                                    ControlToValidate="uiTextBoxPassword" Font-Bold="true" Display="Dynamic" ForeColor="Red"
                                    ValidationGroup="MainUserLogin"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="col-lg-12">
                        <div class="col-md-12">
                            <asp:LinkButton ID="uiLinkButtonMainLogin" runat="server" CssClass="btn btn-success"
                                ValidationGroup="MainUserLogin" OnClick="uiLinkButtonMainLogin_Click">Login</asp:LinkButton>
                            &nbsp;&nbsp; <a href="register.aspx" class="btn" style="background:#efefef;border:1px solid #ccc;border-radius:5px;-moz-border-radius:5px;-webkit-border-radius:5px;-ms-border-radius:5px;">Register new account</a>
                        </div>
                        <div class="clear"></div>
                    </div>
                    </div>
                    <div class="col-lg-4" >
                         <h4 class="title">
                            Login with facebook
                        </h4>
                        <a href="#" onclick="return fblogin();" id="fbloginlink" class="fb_button_ps"><img src="../images/facebook.gif" alt="Connect with Facebook" /></a>    
                    </div>                    
                         <div class="clear"></div>          
      </div>      
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

    <!--end popup login-->
    
                <!-- end parallax -->
    <div class="row clearfix mbs">
        <h3 class="col-title mb " style="text-align:center;">
            PARTY SUPPLIES</h3>
            <a href="Browsec.aspx?tcid=1&ps=true" class="pull-right btn btn-default" style="position:absolute;margin-top:-60px;right:15px;">View more</a>
        <asp:Repeater ID="uiRepeaterPS" runat="server">
            <HeaderTemplate>
                <div class="products shop clearfix">
            </HeaderTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
            <ItemTemplate>
                <div class="product grid_3">
                <a href='Browsec.aspx?tcid=<%# Eval("TopLevelCatID") %>&mcid=<%# Eval("MainCatID") %>&ps=true'>
                    <img class="product_img" src='<%# Eval("ImagePath") %>' alt=""><!-- featured thumbnail -->
                    <img class="product_img_hover" src='<%# Eval("HoverImage") %>' alt=""><!-- featured thumbnail hover -->
                    </a>
                    <div class="product_inner">
                        <h3>
                            <a href='Browsec.aspx?tcid=<%# Eval("TopLevelCatID") %>&mcid=<%# Eval("MainCatID") %>&ps=true'>
                                <%# Eval("NameEng")%>
                            </a>
                        </h3>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
                <!-- product -->
            </ItemTemplate>
        </asp:Repeater>
        <!-- products -->
    </div>

    <div class="row clearfix mbs">
        <h3 class="col-title mb " style="text-align:center;">
            INVITATIONS</h3>
             <a href="Browsec.aspx?tcid=2" class="pull-right btn btn-default" style="position:absolute;margin-top:-60px;right:15px;">View more</a>
        <asp:Repeater ID="uiRepeaterCats" runat="server">
            <HeaderTemplate>
                <div class="products shop clearfix">
            </HeaderTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
            <ItemTemplate>
                <div class="product grid_3">
                <a href='Browsec.aspx?tcid=<%# Eval("TopLevelCatID") %>&mcid=<%# Eval("MainCatID") %>'>
                    <img class="product_img" src='<%# Eval("ImagePath") %>' alt=""><!-- featured thumbnail -->
                    <img class="product_img_hover" src='<%# Eval("HoverImage") %>' alt=""><!-- featured thumbnail hover -->
                    </a>
                    <div class="product_inner">
                        <h3>
                            <a href='Browsec.aspx?tcid=<%# Eval("TopLevelCatID") %>&mcid=<%# Eval("MainCatID") %>'>
                                <%# Eval("NameEng")%>
                            </a>
                        </h3>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
                <!-- product -->
            </ItemTemplate>
        </asp:Repeater>
        <!-- products -->
    </div>
    <!-- row -->

    <div class="parallax  mbs" data-stellar-background-ratio="0.2">
					<div class="row clearfix">
						<div class="f_portfolio">
							<div class="intro_content">
								<div class="inner">
									<h3> LATEST PROJECTS </h3>
									<p> Print this page to PDF for the complete set of vectors... <a href="#">View All</a></p>
								</div>
							</div>
							<div class="f_items">
								<div class="portfolio_carousel">
									<div class="anyClass">
										<ul>
											<li>
												<img src="images/assets/LP1.jpg" alt="#">
												<div class="f_hover">
													<div class="f_links">
														<a class="tbutton small" href="images/assets/LP1.jpg" data-gal="lightbox[folio]"><span><i class="arrow_expand"></i></span></a>
														<a class="tbutton small" href="#"><span>More Details</span></a>
													</div>
													<h5> <a href="#">Portfolio Project Title Here</a> </h5>
												</div>
											</li><!-- portfolio item -->
											<li>
												<img src="images/assets/LP2.jpg" alt="#">
												<div class="f_hover">
													<div class="f_links">
														<a class="tbutton small" href="images/assets/LP2.jpg" data-gal="lightbox[folio]"><span><i class="arrow_expand"></i></span></a>
														<a class="tbutton small" href="#"><span>More Details</span></a>
													</div>
													<h5> <a href="#">Portfolio Project Title Here</a> </h5>
												</div>
											</li><!-- portfolio item -->
											<li>
												<img src="images/assets/LP3.jpg" alt="#">
												<div class="f_hover">
													<div class="f_links">
														<a class="tbutton small" href="images/assets/LP3.jpg" data-gal="lightbox[folio]"><span><i class="arrow_expand"></i></span></a>
														<a class="tbutton small" href="#"><span>More Details</span></a>
													</div>
													<h5> <a href="#">Portfolio Project Title Here</a> </h5>
												</div>
											</li><!-- portfolio item -->
											
										</ul>
									</div>
									<div class="preve"><i class="fa-angle-left"></i></div><!-- portfolio carousel left -->
									<div class="nexte"><i class="fa-angle-right"></i></div><!-- portfolio carousel right -->
								</div><!-- portfolio carousel -->
	
							</div>
						</div><!-- end f portfolio -->
					</div><!-- end row -->
				</div>

    <div class="row clearfix mbs">
					<div class="services">
						<div class="grid_3">
							<div class="s_icon"><img src="images/FullOptimized.png" /><span class="fa-check"></span></div>
							<div class="s_info">
								<h3>Full Customization</h3>
								<p>Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repella.</p>
								<a href="#" class="tbutton small"><span>More Details</span></a>
							</div><!-- end info -->
						</div><!-- end grid3 -->
	
						<div class="grid_6">
							<div class="s_icon">
                                <img src="images/OrderSample.png" /><span class="fa-check"></span></div>
							<div class="s_info">
								<h3>Order Samples</h3>
								<p>Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repella ut aut reiciendis voluptatibus maiores alias consequatur. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis.</p>
								<a href="#" class="tbutton small"><span>More Details</span></a>
							</div><!-- end info -->
						</div><!-- end grid6 -->
	
						<div class="grid_3">
							<div class="s_icon"><img src="images/BestQuality.png" /><span class="fa-check"></span></div>
							<div class="s_info">
								<h3>Best Quality</h3>
								<p>Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repella.</p>
								<a href="#" class="tbutton small"><span>More Details</span></a>
							</div><!-- end info -->
						</div><!-- end grid3 -->
					</div>
				</div>

    <div class="parallax mbs" data-stellar-background-ratio="0.2">
					<div class="row clearfix">
						<h3>
                        we print and ship your party to you ....
                        </h3>
                        <div class="grid_4">
                            <img src="images/icon-gif.gif" />
                        </div>
                        <div class="grid_8">
                        <ul style="list-style-type:circle;margin-left:20px;">
                        <li>Printing takes 2 to 3 bussiness days and shipping time is 1 to 7 days.</li>
                        <li>YES, we ship internationally !! Orders outside Egypt may incur customs fees or taxes</li>
                        <li>Payment comes in different forms , we have cash on delivery , paypal....</li>
                        </ul>
                        </div>
					</div><!-- end row -->
				</div>

                <div class="parallax mbs" style="background:url('images/SMBanner.jpg');height:380px;padding-top:250px;">
					<div class="row clearfix">
						
                        <div class="social" style="margin-left:100px;">
								<a href="#" class="toptip" title="Twitter"><i class="fa-twitter"></i></a>
								<a href="#" class="toptip" title="Facebook"><i class="fa-facebook"></i></a>								
								<a href="#" class="toptip" title="Pinterest"><i class="fa-pinterest"></i></a>
								<a href="#" class="bottomtip" title="Instagram"><i class="fa-instagram"></i></a>
								<a href="#" class="toptip" title="Flickr"><i class="fa-flickr"></i></a>
							</div>
                        </div>
					</div><!-- end row -->
				

    <!-- end row -->
    <!--facebook script-->
    <!-- end facebook script-->
</asp:Content>
