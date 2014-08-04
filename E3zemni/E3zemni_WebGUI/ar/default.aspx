<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Ar.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="E3zemni_WebGUI.ar._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSlider" runat="server">
<!-- Start Modern Slider -->
				<div class="iview clearfix">
					<div id="iview">
						<div data-iview:image="../images/slides/iview1.jpg" data-iview:transition="slice-top-fade,slice-right-fade">
							<div class="iview-caption" data-x="80" data-y="200">نسعد بمشاركتكم </div>
							<div class="iview-caption" data-x="80" data-y="245" data-transition="wipeRight">مستعدون لتصميم كل أحلامك</div>
							<div class="iview-caption" data-x="254" data-y="290" data-transition="wipeLeft"><i>فقط على موقع إعزمنى</i></div>
						</div>
			
						<div data-iview:image="../images/slides/iview2.jpg" data-iview:transition="zigzag-top,strip-left-fade">
							<div class="iview-caption caption5" data-x="60" data-y="230" data-transition="wipeDown">يمكنك إختيار تصميمك بنفسك</div>
							<div class="iview-caption caption5" data-x="300" data-y="285" data-transition="wipeUp"><a href="#">أضف صورك الخاصة</a></div>
						</div>
			
						<div data-iview:image="../images/slides/iview3.jpg">
							<div class="iview-caption caption4" data-x="50" data-y="60" data-width="400" data-transition="fade">يمكنك تحديد الآتى فى تصميمك : </div>
							<div class="iview-caption blackcaption" data-x="50" data-y="115" data-transition="wipeLeft" data-easing="easeInOutElastic">الكلام على التصميم</div>
							<div class="iview-caption blackcaption" data-x="50" data-y="155" data-transition="wipeLeft" data-easing="easeInOutElastic">ألوان الكلام</div>
							<div class="iview-caption blackcaption" data-x="50" data-y="195" data-transition="wipeLeft" data-easing="easeInOutElastic">ألوان الخلفية</div>
							<div class="iview-caption blackcaption" data-x="50" data-y="235" data-transition="wipeLeft" data-easing="easeInOutElastic">إضافة صور على التصميم</div>
							<div class="iview-caption blackcaption" data-x="50" data-y="275" data-transition="wipeLeft" data-easing="easeInOutElastic">إضافة تأثيرات على الصور</div>
						</div>
					</div><!-- End iview id -->
				</div><!-- End iview class -->
			<!-- End Modern Slider -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
				

                <div class="row clearfix mbs">
        <h3 class="col-title mb " style="text-align:center;">
            لوازم الحفلات</h3>
            <a href="Browsec.aspx?tcid=1&ps=true" class="pull-right btn btn-default" style="position:absolute;margin-top:-60px;left:15px;">المزيد</a>
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
                            <a href='Browse.aspx?tcid=<%# Eval("TopLevelCatID") %>&mcid=<%# Eval("MainCatID") %>&ps=true'>
                                <%# Eval("NameAr")%>
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
            دعوات</h3>
            <a href="Browsec.aspx?tcid=2" class="pull-right btn btn-default" style="position:absolute;margin-top:-60px;left:15px;">المزيد</a>
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
                            <a href='Browse.aspx?tcid=<%# Eval("TopLevelCatID") %>&mcid=<%# Eval("MainCatID") %>'>
                                <%# Eval("NameAr")%>
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

				<div class="parallax  mbs" data-stellar-background-ratio="0.2">
					<div class="row clearfix">
						<div class="f_portfolio">
							<div class="intro_content">
								<div class="inner">
									<h3> أخر المشروعات </h3>
									<p> إطبع هذه الصفحة ... <a href="#">عرض الكل</a></p>
								</div>
							</div>
							<div class="f_items">
								<div class="portfolio_carousel">
									<div class="anyClass">
										<ul>
											<li>
												<img src="../images/assets/LP1.jpg" alt="#">
												<div class="f_hover">
													<div class="f_links">
														<a class="tbutton small" href="../images/assets/LP1.jpg" data-gal="lightbox[folio]"><span><i class="arrow_expand"></i></span></a>
														<a class="tbutton small" href="#"><span>التفاصيل</span></a>
													</div>
													<h5> <a href="#">العنوان</a> </h5>
												</div>
											</li><!-- portfolio item -->
											<li>
												<img src="../images/assets/LP2.jpg" alt="#">
												<div class="f_hover">
													<div class="f_links">
														<a class="tbutton small" href="../images/assets/LP2.jpg" data-gal="lightbox[folio]"><span><i class="arrow_expand"></i></span></a>
														<a class="tbutton small" href="#"><span>التفاصيل</span></a>
													</div>
													<h5> <a href="#">العنوان</a> </h5>
												</div>
											</li><!-- portfolio item -->
											<li>
												<img src="../images/assets/LP3.jpg" alt="#">
												<div class="f_hover">
													<div class="f_links">
														<a class="tbutton small" href="../images/assets/LP3.jpg" data-gal="lightbox[folio]"><span><i class="arrow_expand"></i></span></a>
														<a class="tbutton small" href="#"><span>التفاصيل</span></a>
													</div>
													<h5> <a href="#">العنوان</a> </h5>
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
							<div class="s_icon"><img src="../images/FullOptimized.png" /><span class="fa-check"></span></div>
							<div class="s_info">
								<h3>أضف تعديلاتك الخاصة</h3>
								<p>Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repella.</p>
								<a href="#" class="tbutton small"><span>التفاصيل</span></a>
							</div><!-- end info -->
						</div><!-- end grid3 -->
	
						<div class="grid_6">
							<div class="s_icon">
                                <img src="../images/OrderSample.png" /><span class="fa-check"></span></div>
							<div class="s_info">
								<h3>أطلب نماذج</h3>
								<p>Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repella ut aut reiciendis voluptatibus maiores alias consequatur. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis.</p>
								<a href="#" class="tbutton small"><span>التفاصيل</span></a>
							</div><!-- end info -->
						</div><!-- end grid6 -->
	
						<div class="grid_3">
							<div class="s_icon"><img src="../images/BestQuality.png" /><span class="fa-check"></span></div>
							<div class="s_info">
								<h3>جودة عالية</h3>
								<p>Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repella.</p>
								<a href="#" class="tbutton small"><span>التفاصيل</span></a>
							</div><!-- end info -->
						</div><!-- end grid3 -->
					</div>
				</div>

    <div class="parallax mbs" data-stellar-background-ratio="0.2">
					<div class="row clearfix">
						<h3>
                        نقوم بالطباعة ونرسل إليك حفلتك ....
                        </h3>
                        <div class="grid_4">
                            <img src="../images/icon-gif.gif" />
                        </div>
                        <div class="grid_8">
                        <ul style="list-style-type:circle;margin-left:20px;">
                        <li>الطباعة تستغرق 2-3 أيام عمل والشحن من 1 إلى 7 أيام.</li>
                        <li>نقوم بالشحن الدولى . الشحن خارج مصر قد يستلزم دفع رسوم إضافية</li>
                        <li>هناك العديد من طرق الدفع إختر ما يناسبك</li>
                        </ul>
                        </div>
					</div><!-- end row -->
				</div>

                <div class="parallax mbs" style="background:url('../images/SMBanner.jpg');height:380px;padding-top:250px;">
					<div class="row clearfix">
						
                        <div class="social" style="margin-left:100px;">
								<a href="#" class="toptip" title="Twitter"><i class="fa-twitter"></i></a>
								<a href="#" class="toptip" title="Facebook"><i class="fa-facebook"></i></a>								
								<a href="#" class="toptip" title="Pinterest"><i class="fa-pinterest"></i></a>
								<a href="#" class="bottomtip" title="Instagram"><i class="fa-instagram"></i></a>
								<a href="#" class="toptip" title="Flickr"><i class="fa-flickr"></i></a>
							</div>
                        </div>
					</div>

                <div id="loginModal" class="modal fade" role="modal" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
         <button type="button" class="close pull-left" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">الدخول</h4>
      </div>
      <div class="modal-body">      
                    <div class="col-lg-4" >
                         <h4 class="title">
                            دخول عن طريق حساب الفيس بوك
                        </h4>
                        <a href="#" onclick="return fblogin();" id="fbloginlink" class="fb_button_ps"><img src="../images/facebook.gif" alt="Connect with Facebook" /></a>    
                    </div>                                       
                    <div class="col-lg-8" style="border-left:2px solid #ccc;">                         
                    <div class="col-lg-12">
                        <div class="col-md-8">
                            <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" Text="Error. please try again"
                                Visible="False"></asp:Label>
                        </div>
                         <div class="clear"></div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <asp:TextBox ID="uiTextBoxUserName" runat="server" CssClass="form-control" placeholder="إسم المستخدم"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="أدخل إسم المستخدم"
                                    ControlToValidate="uiTextBoxUserName" Font-Bold="true" Display="Dynamic" ForeColor="Red"
                                    ValidationGroup="MainUserLogin"></asp:RequiredFieldValidator>
                            <div class="clear" style="height:15px;"></div>
                                <asp:TextBox ID="uiTextBoxPassword" runat="server" CssClass="form-control" placeholder="كلمة المرور"
                                    TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="أدخل كلمة المرور"
                                    ControlToValidate="uiTextBoxPassword" Font-Bold="true" Display="Dynamic" ForeColor="Red"
                                    ValidationGroup="MainUserLogin"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="col-lg-12">
                        <div class="col-md-12">
                            <asp:LinkButton ID="uiLinkButtonMainLogin" runat="server" CssClass="btn btn-success"
                                ValidationGroup="MainUserLogin" OnClick="uiLinkButtonMainLogin_Click">الدخول</asp:LinkButton>
                            &nbsp;&nbsp; <a href="register.aspx" class="btn" style="background:#efefef;border:1px solid #ccc;border-radius:5px;-moz-border-radius:5px;-webkit-border-radius:5px;-ms-border-radius:5px;">إنشاء حساب جديد</a>
                        </div>
                        <div class="clear"></div>
                    </div>
                    </div>
                                        
                         <div class="clear"></div>          
      </div>      
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>
</asp:Content>
