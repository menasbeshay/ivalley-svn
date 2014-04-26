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
            z-index: 1;
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
    <div id="divLogin" runat="server" class="divLoginPopup" visible="true">
        <asp:Panel ID="pnllogin" runat="server">
            <div class="divLoginStyle">
                <div style="margin-left: 670px; padding-top: 5px;">
                    <asp:ImageButton ID="btnCloselogin" runat="server" ImageUrl="/images/close.png" OnClick="btnCloselogin_Click" />
                </div>
                <div class="contactform" style="margin-left: 50px; margin-top: 30px;">
                    <h2 class="title">
                        Login
                    </h2>
                    <div class="row" style="width: 700px;">
                        <div class="col-md-8">
                            <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" Text="Error. please try again"
                                Visible="False"></asp:Label>
                        </div>
                        <div class="col-md-5">
                            <div class="form-group">
                                <asp:TextBox ID="uiTextBoxUserName" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required"
                                    ControlToValidate="uiTextBoxUserName" Font-Bold="true" Display="Dynamic" ForeColor="Red"
                                    ValidationGroup="MainUserLogin"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="uiTextBoxPassword" runat="server" CssClass="form-control" placeholder="Password"
                                    TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required"
                                    ControlToValidate="uiTextBoxPassword" Font-Bold="true" Display="Dynamic" ForeColor="Red"
                                    ValidationGroup="MainUserLogin"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="width: 600px;">
                        <div class="col-md-5">
                            <asp:LinkButton ID="uiLinkButtonMainLogin" runat="server" CssClass="btn btn-success"
                                ValidationGroup="MainUserLogin" OnClick="uiLinkButtonMainLogin_Click">Login</asp:LinkButton>
                            &nbsp;&nbsp; <a href="register.aspx" class="btn btn-default">Register new account</a>
                        </div>
                    </div>
                </div>
                <div class="">
                </div>
            </div>
        </asp:Panel>
    </div>
    <!--end popup login-->
    <%--	<div class="row clearfix mbs">
					<div class="services">
						<div class="grid_3">
							<div class="s_icon"><i class="icon_wallet"></i><span class="fa-check"></span></div>
							<div class="s_info">
								<h3>Well Documented</h3>
								<p>Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repella.</p>
								<a href="#" class="tbutton small"><span>More Details</span></a>
							</div><!-- end info -->
						</div><!-- end grid3 -->
	
						<div class="grid_6">
							<div class="s_icon"><i class="icon_id-2"></i><span class="fa-check"></span></div>
							<div class="s_info">
								<h3>Unlimited Colors</h3>
								<p>Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repella ut aut reiciendis voluptatibus maiores alias consequatur. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis.</p>
								<a href="#" class="tbutton small"><span>More Details</span></a>
							</div><!-- end info -->
						</div><!-- end grid6 -->
	
						<div class="grid_3">
							<div class="s_icon"><i class="icon_search-2"></i><span class="fa-check"></span></div>
							<div class="s_info">
								<h3>Seo Optimized</h3>
								<p>Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repella.</p>
								<a href="#" class="tbutton small"><span>More Details</span></a>
							</div><!-- end info -->
						</div><!-- end grid3 -->
					</div>
				</div>

				<div class="parallax portfolio_parallax mbs" data-stellar-background-ratio="0.2">
					<div class="row clearfix">
						<div class="f_portfolio">
							<div class="intro_content">
								<div class="inner">
									<h3> LATEST PROJECTS </h3>
									<p> Print this page to PDF for the complete set of vectors. Or to use on the desktop, install FontAwesome.otf and copy and paste .. <a href="portfolio4.html">View All</a></p>
								</div>
							</div>
							<div class="f_items">
								<div class="portfolio_carousel">
									<div class="anyClass">
										<ul>
											<li>
												<img src="images/assets/portfolio1.jpg" alt="#">
												<div class="f_hover">
													<div class="f_links">
														<a class="tbutton small" href="images/assets/portfolio1.jpg" data-gal="lightbox[folio]"><span><i class="arrow_expand"></i></span></a>
														<a class="tbutton small" href="portfolio_single.html"><span>More Details</span></a>
													</div>
													<h5> <a href="portfolio_single.html">Portfolio Project Title Here</a> </h5>
												</div>
											</li><!-- portfolio item -->
											<li>
												<img src="images/assets/portfolio2.jpg" alt="#">
												<div class="f_hover">
													<div class="f_links">
														<a class="tbutton small" href="images/assets/portfolio2.jpg" data-gal="lightbox[folio]"><span><i class="arrow_expand"></i></span></a>
														<a class="tbutton small" href="portfolio_single.html"><span>More Details</span></a>
													</div>
													<h5> <a href="portfolio_single.html">Portfolio Project Title Here</a> </h5>
												</div>
											</li><!-- portfolio item -->
											<li>
												<img src="images/assets/portfolio3.jpg" alt="#">
												<div class="f_hover">
													<div class="f_links">
														<a class="tbutton small" href="images/assets/portfolio3.jpg" data-gal="lightbox[folio]"><span><i class="arrow_expand"></i></span></a>
														<a class="tbutton small" href="portfolio_single.html"><span>More Details</span></a>
													</div>
													<h5> <a href="portfolio_single.html">Portfolio Project Title Here</a> </h5>
												</div>
											</li><!-- portfolio item -->
											<li>
												<img src="images/assets/portfolio4.jpg" alt="#">
												<div class="f_hover">
													<h5> <a href="#">Sed ut perspiciatis unde</a> </h5>
												<div class="f_hover">
													<div class="f_links">
														<a class="tbutton small" href="images/assets/portfolio4.jpg" data-gal="lightbox[folio]"><span><i class="arrow_expand"></i></span></a>
														<a class="tbutton small" href="portfolio_single.html"><span>More Details</span></a>
													</div>
													<h5> <a href="portfolio_single.html">Portfolio Project Title Here</a> </h5>
												</div>
												</div>
											</li><!-- portfolio item -->
											<li>
												<img src="images/assets/portfolio5.jpg" alt="#">
												<div class="f_hover">
													<div class="f_links">
														<a class="tbutton small" href="images/assets/portfolio5.jpg" data-gal="lightbox[folio]"><span><i class="arrow_expand"></i></span></a>
														<a class="tbutton small" href="portfolio_single.html"><span>More Details</span></a>
													</div>
													<h5> <a href="portfolio_single.html">Portfolio Project Title Here</a> </h5>
												</div>
											</li><!-- portfolio item -->
											<li>
												<img src="images/assets/portfolio6.jpg" alt="#">
												<div class="f_hover">
													<div class="f_links">
														<a class="tbutton small" href="images/assets/portfolio6.jpg" data-gal="lightbox[folio]"><span><i class="arrow_expand"></i></span></a>
														<a class="tbutton small" href="portfolio_single.html"><span>More Details</span></a>
													</div>
													<h5> <a href="portfolio_single.html">Portfolio Project Title Here</a> </h5>
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
				</div>--%><!-- end parallax -->
    <div class="row clearfix mbs">
        <h3 class="col-title mb">
            Card Categories</h3>
        <asp:Repeater ID="uiRepeaterCats" runat="server">
            <HeaderTemplate>
                <div class="products shop clearfix">
            </HeaderTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
            <ItemTemplate>
                <div class="product grid_3">
                    <img class="product_img" src='<%# Eval("CatImage") %>' alt=""><!-- featured thumbnail -->
                    <img class="product_img_hover" src='<%# Eval("HoverImage") %>' alt=""><!-- featured thumbnail hover -->
                    <div class="product_inner">
                        <h3>
                            <a href='Browse.aspx?catid=<%# Eval("CategoryID") %>'>
                                <%# Eval("CatNameEng")%>
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
    <%--<div class="grey-line mbs">
					<div class="row clearfix">
						<div class="grid_6 custom_block1_img" data-gen="bigEntrance">
							<div class="h_slider"><img class="custom_1" src="images/assets/t5.png" alt="tablet"></div>
							<div class="h_slider"><img class="custom_2" src="images/assets/t2.png" alt="tablet"></div>
							<div class="h_slider"><img class="custom_3" src="images/assets/t3.png" alt="tablet"></div>
							<div class="h_slider"><img class="custom_4" src="images/assets/t4.png" alt="tablet"></div>
							<div class="h_slider"><img class="custom_5" src="images/assets/t1.png" alt="tablet"></div>
						</div><!-- end grid6 -->

						<div class="grid_6 custom_block1" data-gen="bigEntrance">
							<div class="inner_list">
								<h3>- More Top Features from inCreate Template</h3>
								<ul>
									<li><a href="#custom_1"><i class="icon_check_alt2"></i> Phasellus vehicula justo eget diam posuer</a></li>
									<li><a href="#custom_2"><i class="icon_check_alt2"></i> Eget diam posuere sollicitudin eu tincidunt nulla vehicula justo</a></li>
									<li><a href="#custom_3"><i class="icon_check_alt2"></i> Sollicitudin eu tincidunt nulla</a></li>
									<li><a href="#custom_4"><i class="icon_check_alt2"></i> Posuere sollicitudin eu tincidunt nulla loremo ipsum</a></li>
									<li><a href="#custom_5"><i class="icon_check_alt2"></i> Eget diam posuere sollicitudin eu tincidunt nulla</a></li>
								</ul>
							</div><!-- end inner -->
						</div><!-- end grid6 -->
					</div><!-- end row -->
				</div>--%><!-- end grey line -->
    <%--<div class="row clearfix mbs">
						<div class="custom_block2" data-gen="bigEntrance">
							<div class="inner_list">
								<ul>
									<li><a href="#t_1"><img src="images/assets/avatar1.jpg" alt=""></a></li>
									<li><a href="#t_2"><img src="images/assets/avatar2.jpg" alt=""></a></li>
									<li><a href="#t_3"><img src="images/assets/avatar3.jpg" alt=""></a></li>
									<li><a href="#t_4"><img src="images/assets/avatar4.jpg" alt=""></a></li>
									<li><a href="#t_5"><img src="images/assets/avatar5.jpg" alt=""></a></li>
									<li><a href="#t_6"><img src="images/assets/avatar6.jpg" alt=""></a></li>
									<li><a href="#t_7"><img src="images/assets/avatar7.jpg" alt=""></a></li>
								</ul>
							</div><!-- end inner -->
						</div><!-- end -->
						
						<div class="rev_testimonials custom_block2_testimonial" data-gen="bigEntrance">
							<div class="h_slider"><span class="t_1"><i class="icon_quotations"></i> Dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt <i class="icon_quotations"></i> <small> - Anna Rabinson </small></span></div>
							<div class="h_slider"><span class="t_2"><i class="icon_quotations"></i> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley. <i class="icon_quotations"></i> <small> - Jennifer Raya </small></span></div>
							<div class="h_slider"><span class="t_3"><i class="icon_quotations"></i> Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum maker including versions of Lorem Ipsum. <i class="icon_quotations"></i> <small> - Nicolas Cool </small></span></div>
							<div class="h_slider"><span class="t_4"><i class="icon_quotations"></i> It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letter. <i class="icon_quotations"></i> <small> - Ryan Giggs </small></span></div>
							<div class="h_slider"><span class="t_5"><i class="icon_quotations"></i> There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. <i class="icon_quotations"></i> <small> - Victoria Hins </small></span></div>
							<div class="h_slider"><span class="t_6"><i class="icon_quotations"></i> Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden. <i class="icon_quotations"></i> <small> - Annie Maria </small></span></div>
							<div class="h_slider"><span class="t_7"><i class="icon_quotations"></i> Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable. <i class="icon_quotations"></i> <small> - Victor Zack </small></span></div>
						</div><!-- end -->
				</div>--%><!-- clearfix -->
    <div class="row clearfix mbs" data-gen="bigEntrance">
        <div class="tac">
            <h3 class="block_title">
                Best Seller</h3>
            <span class="after_line"></span>
        </div>
        <ul>
            <li class="grid_2"><a href="#">
                <img src="images/assets/logo1.jpg" alt="#" class="toptip" title="Logo name here"></a></li><!-- logo -->
            <li class="grid_2"><a href="#">
                <img src="images/assets/logo2.jpg" alt="#" class="toptip" title="Logo name here"></a></li><!-- logo -->
            <li class="grid_2"><a href="#">
                <img src="images/assets/logo3.jpg" alt="#" class="toptip" title="Logo name here"></a></li><!-- logo -->
            <li class="grid_2"><a href="#">
                <img src="images/assets/logo4.jpg" alt="#" class="toptip" title="Logo name here"></a></li><!-- logo -->
            <li class="grid_2"><a href="#">
                <img src="images/assets/logo5.jpg" alt="#" class="toptip" title="Logo name here"></a></li><!-- logo -->
            <li class="grid_2"><a href="#">
                <img src="images/assets/logo6.jpg" alt="#" class="toptip" title="Logo name here"></a></li><!-- logo -->
        </ul>
    </div>
    <!-- end row -->
    <!--facebook script-->
    <!-- end facebook script-->
</asp:Content>
