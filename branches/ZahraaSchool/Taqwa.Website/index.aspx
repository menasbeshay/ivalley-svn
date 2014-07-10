<%@ Page Title="" Language="C#" MasterPageFile="~/ZahraaAr.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Taqwa.Website.index" %>
<%@ Register src="Controls/News.ascx" tagname="News" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(document).ready(function () {
        $("#menuItemHome").addClass("current");
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- Start Layer Slider -->
			<div class="sliderr">
				<div id="layerslider-container-fw-second">
					<div id="layerslider" style="width: 100%; height: 700px; margin: 0px auto">

			<div class="ls-layer" style="slidedirection: top; transition2d: all; slidedelay: 5000; durationin: 1000; durationout: 1500; easingin: easeInQuint; easingout: easeInOutQuint; delayin: 0; delayout: 0;">							
				<img class="ls-bg" src="images/slides/1.jpg" alt="">
				<img class="ls-s2"  src="images/slides/ip2.png" alt="" style="position: absolute; top: 100px; left: 60px; slidedirection : bottom; slideoutdirection : bottom;  durationin : 1000; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">
				<img class="ls-s2"  src="images/slides/cap_a1.png" alt="" style="position: absolute; top: 160px; left: 600px; slidedirection : top; slideoutdirection : top;  durationin : 2000; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">
				<img class="ls-s2"  src="images/slides/cap_a2.png" alt="" style="position: absolute; top: 290px; left: 600px; slidedirection : right; slideoutdirection : right;  durationin : 2500; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">
				<img class="ls-s2"  src="images/slides/cap_a3.png" alt="" style="position: absolute; top: 410px; left: 600px; slidedirection : bottom; slideoutdirection : bottom;  durationin : 3000; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">
				<img class="ls-s2"  src="images/slides/cap_a3.png" alt="" style="position: absolute; top: 410px; left: 750px; slidedirection : bottom; slideoutdirection : bottom;  durationin : 3500; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">
			</div>

			<div class="ls-layer" style="slidedirection: bottom; transition2d: all; slidedelay: 5500; durationin: 1000; durationout: 1500; easingin: easeInQuint; easingout: easeInOutQuint; delayin: 0; delayout: 0;">							
				<img class="ls-bg" src="images/slides/2.jpg" alt="">
				<img class="ls-s2"  src="images/slides/cap_b1.png" alt="" style="position: absolute; top: 200px; left: 520px; slidedirection : right; slideoutdirection : right;  durationin : 2000; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">
				<img class="ls-s2"  src="images/slides/cap_b2.png" alt="" style="position: absolute; top: 270px; left: 520px; slidedirection : right; slideoutdirection : right;  durationin : 2700; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">
				<img class="ls-s2"  src="images/slides/cap_b5.png" alt="" style="position: absolute; top: 336px; left: 481px; slidedirection : bottom; slideoutdirection : bottom;  durationin : 4500; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 100; delayout : 0; showuntil : 0; ">
				<img class="ls-s2"  src="images/slides/cap_b3.png" alt="" style="position: absolute; top: 340px; left: 520px; slidedirection : right; slideoutdirection : right;  durationin : 3400; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">
				<img class="ls-s2"  src="images/slides/cap_b4.png" alt="" style="position: absolute; top: 410px; left: 525px; slidedirection : right; slideoutdirection : right;  durationin : 4100; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">
				<img class="ls-s2"  src="images/slides/ip1.png" alt="" style="position: absolute; top: 82px; left: 60px; slidedirection : bottom; slideoutdirection : bottom;  durationin : 1000; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">
			</div>

			<div class="ls-layer" style="slidedirection: right; transition2d: all; slidedelay: 4500; durationin: 1000; durationout: 1500; easingin: easeInQuint; easingout: easeInOutQuint; delayin: 0; delayout: 0;">							
				<img class="ls-bg" src="images/slides/3.jpg" alt="">
				<img class="ls-s2"  src="images/slides/ip3.png" alt="" style="position: absolute; top: 53px; left: 500px; slidedirection : right; slideoutdirection : right;  durationin : 1000; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">
				<img class="ls-s2"  src="images/slides/cap_c1.png" alt="" style="position: absolute; top: 380px; left: 60px; slidedirection : bottom; slideoutdirection : bottom;  durationin : 1700; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">
			</div>

            <div class="ls-layer" style="slidedirection: right; transition2d: all; slidedelay: 4500; durationin: 1000; durationout: 1500; easingin: easeInQuint; easingout: easeInOutQuint; delayin: 0; delayout: 0;">							
				<img class="ls-bg" src="images/slides/4.jpg" alt="">		
                <img class="ls-s2"  src="images/slides/ip4.png" alt="" style="position: absolute; top: 110px; left: 460px; slidedirection : bottom; slideoutdirection : bottom;  durationin : 1000; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">		
			</div>
					</div>		
				</div>
			</div>
		<!-- End Layer Slider -->

			<div class="intro_p tac">
				<div class="row inner clearfix">
					<h2>مرحباً بكم فى موقع مدرسة الزهراء  الخاصة</h2>
					<a href="Pages.aspx?PID=12" class="tbutton large"><i class="icon_comment_alt"></i><span>شروط الإلتحاق بالمدرسة</span></a>
					<a href="Pages.aspx?PID=6" class="tbutton large m_left"><i class="icon_lightbulb_alt"></i><span>وظائف بالمدرسة</span></a>
				</div><!-- End row -->
			</div><!-- End intro p -->

			<div class="page-content">

                <div class="row mbs clearfix">                
                    <uc1:News ID="News1" runat="server" />
                </div>
				
				<div class="row mbs clearfix">
					<div class="f_portfolio">
						<div class="intro_content">
							<div class="inner">
								<h3> ألبوم الصور </h3>
								<p> إستمتع بمشاهدة ألبوم الصور .. <br /><a href="Gallery.aspx">مشاهدة الكل</a></p>
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
													
												</div>
												<h5></h5>
											</div>
										</li><!-- portfolio item -->
										<li>
											<img src="images/assets/portfolio2.jpg" alt="#">
											<div class="f_hover">
												<div class="f_links">
													<a class="tbutton small" href="images/assets/portfolio2.jpg" data-gal="lightbox[folio]"><span><i class="arrow_expand"></i></span></a>
													
												</div>
												<h5></h5>
											</div>
										</li><!-- portfolio item -->
										<li>
											<img src="images/assets/portfolio3.jpg" alt="#">
											<div class="f_hover">
												<div class="f_links">
													<a class="tbutton small" href="images/assets/portfolio3.jpg" data-gal="lightbox[folio]"><span><i class="arrow_expand"></i></span></a>
													
												</div>
												<h5></h5>
											</div>
										</li><!-- portfolio item -->
										<li>
											<img src="images/assets/portfolio4.jpg" alt="#">
											<div class="f_hover">
												<h5> <a href="#">Sed ut perspiciatis unde</a> </h5>
											<div class="f_hover">
												<div class="f_links">
													<a class="tbutton small" href="images/assets/portfolio4.jpg" data-gal="lightbox[folio]"><span><i class="arrow_expand"></i></span></a>
													
												</div>
												<h5></h5>
											</div>
											</div>
										</li><!-- portfolio item -->
										<li>
											<img src="images/assets/portfolio5.jpg" alt="#">
											<div class="f_hover">
												<div class="f_links">
													<a class="tbutton small" href="images/assets/portfolio5.jpg" data-gal="lightbox[folio]"><span><i class="arrow_expand"></i></span></a>
													
												</div>
												<h5></h5>
											</div>
										</li><!-- portfolio item -->
										<li>
											<img src="images/assets/portfolio6.jpg" alt="#">
											<div class="f_hover">
												<div class="f_links">
													<a class="tbutton small" href="images/assets/portfolio6.jpg" data-gal="lightbox[folio]"><span><i class="arrow_expand"></i></span></a>
													
												</div>
												<h5></h5>
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

				<div class="grey-line mbs">
					<div class="row clearfix">
						<div class="grid_6 custom_block1_img pull-left" data-gen="bigEntrance">
							<div class="h_slider"><img class="custom_1" src="images/assets/t1.png" alt="tablet"></div>
							<div class="h_slider"><img class="custom_2" src="images/assets/t2.png" alt="tablet"></div>
							<div class="h_slider"><img class="custom_3" src="images/assets/t3.png" alt="tablet"></div>
							<div class="h_slider"><img class="custom_4" src="images/assets/t4.png" alt="tablet"></div>
							<div class="h_slider"><img class="custom_5" src="images/assets/t5.png" alt="tablet"></div>
                            <div class="h_slider"><img class="custom_6" src="images/assets/t6.png" alt="tablet"></div>
						</div><!-- end grid6 -->

						<div class="grid_6 custom_block1 pull-left" data-gen="bigEntrance" >
							<div class="inner_list">
								<h3>- تمتع بإستخدام الخدمات المقدمة من موقع المدرسة</h3>
								<ul>
									<li><a href="Schedule.aspx" data-id="#custom_1"><i class="icon_box-checked"></i> جدول الحصص</a></li>
									<li><a href="Pages.aspx?PID=10" data-id="#custom_2"><i class="icon_box-checked"></i> مواعيد المدرسة</a></li>
									<li><a href="SchoolBus.aspx" data-id="#custom_3"><i class="icon_box-checked"></i> سيارة المدرسة</a></li>
									<li><a href="Results.aspx" data-id="#custom_4"><i class="icon_box-checked"></i> النتائج</a></li>
									<li><a href="OutStandings.aspx" data-id="#custom_5"><i class="icon_box-checked"></i> أوائل الطلبة</a></li>
                                    <li><a href="ClassAttachment.aspx" data-id="#custom_6"><i class="icon_box-checked"></i> ملفات و فيديو </a></li>
								</ul>
							</div><!-- end inner -->
						</div><!-- end grid6 -->
					</div><!-- end row -->
				</div><!-- end grey line -->

				<div class="row mbs clearfix">
					<div class="tac"><h3 class="block_title">أنشطة المدرسة</h3><span class="after_line"></span></div>

					<div class="grid_3 f_blog">
						<div class="f_thumb">
							<img src="images/assets/post_1.jpg" alt="#">
							<div class="f_hover"><a href="HonorPanel.aspx"><i class="icon_link_alt"></i></a></div>
						</div>
						<h4> <a href="HonorPanel.aspx">لوحة الشرف</a> </h4>
						
					</div><!-- end grid3 -->

					<div class="grid_3 f_blog">
						<div class="f_thumb">
							<img src="images/assets/post_2.jpg" alt="#">
							<div class="f_hover"><a href="gpage.aspx?PID=13"><i class="icon_link_alt"></i></a></div>
						</div>
						<h4> <a href="gpage.aspx?PID=13">الأعمال الفنية</a> </h4>
						
					</div><!-- end grid3 -->

					<div class="grid_3 f_blog">
						<div class="f_thumb">
							<img src="images/assets/post_3.jpg" alt="#">
                            <div class="f_hover"><a href="gpage.aspx?PID=11"><i class="icon_link_alt"></i></a></div>
						</div>
						<h4> <a href="gpage.aspx?PID=11">الزيارات والرحلات </a> </h4>
						
					</div><!-- end grid3 -->

                     <div class="grid_3 f_blog">
						<div class="f_thumb">
							<iframe src="http://player.vimeo.com/video/8191217?title=0&amp;byline=0&amp;badge=0&amp;color=5486DA" height="144"></iframe>
						</div>
						<h4> <a href="#">مدرسة الزهراء</a> </h4>						
					</div><!-- end grid3 -->
					
				</div><!-- end row -->
                <%--
				<div class="row clearfix mbs">
					<div class="grid_6">
						<ul class="tabs">
							<li><a href="#A_1" class="active">مدرسة الزهراء 1</a></li>
							<li><a href="#A_2">مدرسة الزهراء 2</a></li>
							<li><a href="#A_3">مدرسة الزهراء 3</a></li>
						</ul><!-- tabs -->

						<ul class="tabs-content">
							<li id="A_1" class="active"><img src="images/assets/character.jpg" alt="" class="fll">تعالى معنا و شاهد بعينيك مقدرة طلابنا على العزف بالألوان ، إذ تضم مدرستنا الصفوة من الفنانين الصغار ..لهم جولات كثيرة في المعارض. و يتميز نشاط التربية الفنية في المدرسة بعمل الأطفال في فترات الراحة و حصص التربية الفنية. ويتم إنجاز العديد من الأعمال الفنية المنفذة بالخامات المختلفة. ومعرضنا يمثل صورة حقيقية لأعمال التلاميذ. و سوف يستمر تنمية المواهب خلال النادي الصيفي ، حيث يختار التلميذ المجال الذي يرغب العمل فيه  من رسم أو نحت أو خزف أو أشغال فنية  </li><!-- tab content -->

							<li id="A_2"><p>تعالى معنا و شاهد بعينيك مقدرة طلابنا على العزف بالألوان ، إذ تضم مدرستنا الصفوة من الفنانين الصغار ..لهم جولات كثيرة في المعارض. و يتميز نشاط التربية الفنية في المدرسة بعمل الأطفال في فترات الراحة و حصص التربية الفنية. ويتم إنجاز العديد من الأعمال الفنية المنفذة بالخامات المختلفة. ومعرضنا يمثل صورة حقيقية لأعمال التلاميذ. و سوف يستمر تنمية المواهب خلال النادي الصيفي ، حيث يختار التلميذ المجال الذي يرغب العمل فيه  من رسم أو نحت أو خزف أو أشغال فنية </p></li><!-- tab content -->

							<li id="A_3">تعالى معنا و شاهد بعينيك مقدرة طلابنا على العزف بالألوان ، إذ تضم مدرستنا الصفوة من الفنانين الصغار ..لهم جولات كثيرة في المعارض. و يتميز نشاط التربية الفنية في المدرسة بعمل الأطفال في فترات الراحة و حصص التربية الفنية. ويتم إنجاز العديد من الأعمال الفنية المنفذة بالخامات المختلفة. ومعرضنا يمثل صورة حقيقية لأعمال التلاميذ. و سوف يستمر تنمية المواهب خلال النادي الصيفي ، حيث يختار التلميذ المجال الذي يرغب العمل فيه  من رسم أو نحت أو خزف أو أشغال فنية </li><!-- tab content -->
						</ul><!-- end tabs -->
					</div><!-- end grid6 -->

					<div class="grid_6">
							<ul class="tt-accordion">
								<li class="sub-accordion">
									<div class="accordion-head">
										<div class="accordion-head-sign"></div>
										<p>مدرسة الزهراء 1</p>
									</div>
									<div class="accordion-content">
										تعالى معنا و شاهد بعينيك مقدرة طلابنا على العزف بالألوان ، إذ تضم مدرستنا الصفوة من الفنانين الصغار ..لهم جولات كثيرة في المعارض. و يتميز نشاط التربية الفنية في المدرسة بعمل الأطفال في فترات الراحة و حصص التربية الفنية. ويتم إنجاز العديد من الأعمال الفنية المنفذة بالخامات المختلفة. ومعرضنا يمثل صورة حقيقية لأعمال التلاميذ. و سوف يستمر تنمية المواهب خلال النادي الصيفي ، حيث يختار التلميذ المجال الذي يرغب العمل فيه  من رسم أو نحت أو خزف أو أشغال فنية 
									</div>
								</li>
								<li class="sub-accordion">
									<div class="accordion-head">
										<div class="accordion-head-sign"></div>
										<p>مدرسة الزهراء 2</p>
									</div>
									<div class="accordion-content">تعالى معنا و شاهد بعينيك مقدرة طلابنا على العزف بالألوان ، إذ تضم مدرستنا الصفوة من الفنانين الصغار ..لهم جولات كثيرة في المعارض. و يتميز نشاط التربية الفنية في المدرسة بعمل الأطفال في فترات الراحة و حصص التربية الفنية. ويتم إنجاز العديد من الأعمال الفنية المنفذة بالخامات المختلفة. ومعرضنا يمثل صورة حقيقية لأعمال التلاميذ. و سوف يستمر تنمية المواهب خلال النادي الصيفي ، حيث يختار التلميذ المجال الذي يرغب العمل فيه  من رسم أو نحت أو خزف أو أشغال فنية 
									</div>
								</li>
								<li class="sub-accordion">
									<div class="accordion-head">
										<div class="accordion-head-sign"></div>
										<p>مدرسة الزهراء 3</p>
									</div>
									<div class="accordion-content">تعالى معنا و شاهد بعينيك مقدرة طلابنا على العزف بالألوان ، إذ تضم مدرستنا الصفوة من الفنانين الصغار ..لهم جولات كثيرة في المعارض. و يتميز نشاط التربية الفنية في المدرسة بعمل الأطفال في فترات الراحة و حصص التربية الفنية. ويتم إنجاز العديد من الأعمال الفنية المنفذة بالخامات المختلفة. ومعرضنا يمثل صورة حقيقية لأعمال التلاميذ. و سوف يستمر تنمية المواهب خلال النادي الصيفي ، حيث يختار التلميذ المجال الذي يرغب العمل فيه  من رسم أو نحت أو خزف أو أشغال فنية 
									</div>
								</li>
							</ul><!-- end accordion -->
					</div><!-- end grid6 -->
				</div><!-- clearfix -->
--%>
				
			</div><!-- end page content -->
</asp:Content>
