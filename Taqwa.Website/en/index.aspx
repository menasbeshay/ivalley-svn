<%@ Page Title="" Language="C#" MasterPageFile="~/Zahraa.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Taqwa.Website.en.index" %>
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
				<img class="ls-bg" src="../images/slides/1.jpg" alt="">
				<img class="ls-s2"  src="../images/slides/ip2.png" alt="" style="position: absolute; top: 100px; left: 60px; slidedirection : bottom; slideoutdirection : bottom;  durationin : 1000; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">
				<img class="ls-s2"  src="../images/slides/cap_a1.png" alt="" style="position: absolute; top: 160px; left: 600px; slidedirection : top; slideoutdirection : top;  durationin : 2000; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">
				<img class="ls-s2"  src="../images/slides/cap_a2.png" alt="" style="position: absolute; top: 290px; left: 600px; slidedirection : right; slideoutdirection : right;  durationin : 2500; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">
				<img class="ls-s2"  src="../images/slides/cap_a3.png" alt="" style="position: absolute; top: 410px; left: 600px; slidedirection : bottom; slideoutdirection : bottom;  durationin : 3000; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">
				<img class="ls-s2"  src="../images/slides/cap_a3.png" alt="" style="position: absolute; top: 410px; left: 750px; slidedirection : bottom; slideoutdirection : bottom;  durationin : 3500; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">
			</div>

			<div class="ls-layer" style="slidedirection: bottom; transition2d: all; slidedelay: 5500; durationin: 1000; durationout: 1500; easingin: easeInQuint; easingout: easeInOutQuint; delayin: 0; delayout: 0;">							
				<img class="ls-bg" src="../images/slides/2.jpg" alt="">
				<img class="ls-s2"  src="../images/slides/cap_b1.png" alt="" style="position: absolute; top: 200px; left: 520px; slidedirection : right; slideoutdirection : right;  durationin : 2000; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">
				<img class="ls-s2"  src="../images/slides/cap_b2.png" alt="" style="position: absolute; top: 270px; left: 520px; slidedirection : right; slideoutdirection : right;  durationin : 2700; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">
				<img class="ls-s2"  src="../images/slides/cap_b5.png" alt="" style="position: absolute; top: 336px; left: 481px; slidedirection : bottom; slideoutdirection : bottom;  durationin : 4500; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 100; delayout : 0; showuntil : 0; ">
				<img class="ls-s2"  src="../images/slides/cap_b3.png" alt="" style="position: absolute; top: 340px; left: 520px; slidedirection : right; slideoutdirection : right;  durationin : 3400; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">
				<img class="ls-s2"  src="../images/slides/cap_b4.png" alt="" style="position: absolute; top: 410px; left: 525px; slidedirection : right; slideoutdirection : right;  durationin : 4100; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">
				<img class="ls-s2"  src="../images/slides/ip1.png" alt="" style="position: absolute; top: 82px; left: 60px; slidedirection : bottom; slideoutdirection : bottom;  durationin : 1000; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">
			</div>

			<div class="ls-layer" style="slidedirection: right; transition2d: all; slidedelay: 4500; durationin: 1000; durationout: 1500; easingin: easeInQuint; easingout: easeInOutQuint; delayin: 0; delayout: 0;">							
				<img class="ls-bg" src="../images/slides/3.jpg" alt="">
				<img class="ls-s2"  src="../images/slides/ip3.png" alt="" style="position: absolute; top: 53px; left: 500px; slidedirection : right; slideoutdirection : right;  durationin : 1000; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">
				<img class="ls-s2"  src="../images/slides/cap_c1.png" alt="" style="position: absolute; top: 380px; left: 60px; slidedirection : bottom; slideoutdirection : bottom;  durationin : 1700; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">
			</div>

            <div class="ls-layer" style="slidedirection: right; transition2d: all; slidedelay: 4500; durationin: 1000; durationout: 1500; easingin: easeInQuint; easingout: easeInOutQuint; delayin: 0; delayout: 0;">							
				<img class="ls-bg" src="../images/slides/4.jpg" alt="">		
                <img class="ls-s2"  src="../images/slides/ip4.png" alt="" style="position: absolute; top: 110px; left: 340px; slidedirection : bottom; slideoutdirection : bottom;  durationin : 1000; durationout : 750; easingin : easeInOutQuint; easingout : easeInBack; delayin : 500; delayout : 0; showuntil : 0; ">				
			</div>
					</div>		
				</div>
			</div>
		<!-- End Layer Slider -->

			<div class="intro_p tac">
				<div class="row inner clearfix">
					<h2>Clean, Unique, Modern & Responsive HTML5 Template, Inspired iOS7 <small>Connect with us</small></h2>
					<a href="#" class="tbutton large"><i class="icon_comment_alt"></i><span>Match Me To Advisors</span></a>
					<a href="#" class="tbutton large m_left"><i class="icon_lightbulb_alt"></i><span>Do Your One Search</span></a>
				</div><!-- End row -->
			</div><!-- End intro p -->

			<div class="page-content">
				
				<div class="row mbs clearfix">
					<div class="f_portfolio">
						<div class="intro_content">
							<div class="inner">
								<h3> SCHOOL IMAGES GALLERY </h3>
								<p> Enjoy viewing photo album .. <a href="gallery.aspx">View All</a></p>
							</div>
						</div>
						<div class="f_items">
							<div class="portfolio_carousel">
								<div class="anyClass">
									<ul>
										<li>
											<img src="../images/assets/portfolio1.jpg" alt="#">
											<div class="f_hover">
												<div class="f_links">
													<a class="tbutton small" href="../images/assets/portfolio1.jpg" data-gal="lightbox[folio]"><span><i class="arrow_expand"></i></span></a>
													<a class="tbutton small" href="#"><span>More Details</span></a>
												</div>
												<h5> <a href="#">Portfolio Project Title Here</a> </h5>
											</div>
										</li><!-- portfolio item -->
										<li>
											<img src="../images/assets/portfolio2.jpg" alt="#">
											<div class="f_hover">
												<div class="f_links">
													<a class="tbutton small" href="../images/assets/portfolio2.jpg" data-gal="lightbox[folio]"><span><i class="arrow_expand"></i></span></a>
													<a class="tbutton small" href="#"><span>More Details</span></a>
												</div>
												<h5> <a href="#">Portfolio Project Title Here</a> </h5>
											</div>
										</li><!-- portfolio item -->
										<li>
											<img src="../images/assets/portfolio3.jpg" alt="#">
											<div class="f_hover">
												<div class="f_links">
													<a class="tbutton small" href="../images/assets/portfolio3.jpg" data-gal="lightbox[folio]"><span><i class="arrow_expand"></i></span></a>
													<a class="tbutton small" href="#"><span>More Details</span></a>
												</div>
												<h5> <a href="#">Portfolio Project Title Here</a> </h5>
											</div>
										</li><!-- portfolio item -->
										<li>
											<img src="../images/assets/portfolio4.jpg" alt="#">
											<div class="f_hover">
												<h5> <a href="#">Sed ut perspiciatis unde</a> </h5>
											<div class="f_hover">
												<div class="f_links">
													<a class="tbutton small" href="../images/assets/portfolio4.jpg" data-gal="lightbox[folio]"><span><i class="arrow_expand"></i></span></a>
													<a class="tbutton small" href="#"><span>More Details</span></a>
												</div>
												<h5> <a href="#">Portfolio Project Title Here</a> </h5>
											</div>
											</div>
										</li><!-- portfolio item -->
										<li>
											<img src="../images/assets/portfolio5.jpg" alt="#">
											<div class="f_hover">
												<div class="f_links">
													<a class="tbutton small" href="../images/assets/portfolio5.jpg" data-gal="lightbox[folio]"><span><i class="arrow_expand"></i></span></a>
													<a class="tbutton small" href="#"><span>More Details</span></a>
												</div>
												<h5> <a href="#">Portfolio Project Title Here</a> </h5>
											</div>
										</li><!-- portfolio item -->
										<li>
											<img src="../images/assets/portfolio6.jpg" alt="#">
											<div class="f_hover">
												<div class="f_links">
													<a class="tbutton small" href="../images/assets/portfolio6.jpg" data-gal="lightbox[folio]"><span><i class="arrow_expand"></i></span></a>
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

				<div class="grey-line mbs">
					<div class="row clearfix">
						<div class="grid_6 custom_block1_img" data-gen="bigEntrance">
							<div class="h_slider"><img class="custom_1" src="../images/assets/t1.png" alt="tablet"></div>
							<div class="h_slider"><img class="custom_2" src="../images/assets/t2.png" alt="tablet"></div>
							<div class="h_slider"><img class="custom_3" src="../images/assets/t3.png" alt="tablet"></div>
							<div class="h_slider"><img class="custom_4" src="../images/assets/t4.png" alt="tablet"></div>
							<div class="h_slider"><img class="custom_5" src="../images/assets/t5.png" alt="tablet"></div>
						</div><!-- end grid6 -->

						<div class="grid_6 custom_block1" data-gen="bigEntrance">
							<div class="inner_list">
								<h3>- Enjoy Al Zahraa school website services</h3>
								<ul>
									<li><a href="#custom_1"><i class="icon_box-checked"></i> School Timetable</a></li>
									<li><a href="#custom_2"><i class="icon_box-checked"></i> Dates of School</a></li>
									<li><a href="#custom_3"><i class="icon_box-checked"></i> Al Zahraa School Bus</a></li>
									<li><a href="#custom_4"><i class="icon_box-checked"></i> Results </a></li>
									<li><a href="#custom_5"><i class="icon_box-checked"></i> Top students</a></li>
								</ul>
							</div><!-- end inner -->
						</div><!-- end grid6 -->
					</div><!-- end row -->
				</div><!-- end grey line -->

				<div class="row mbs clearfix">
					<div class="tac"><h3 class="block_title">School Activities</h3><span class="after_line"></span></div>

					<div class="grid_3 f_blog">
						<div class="f_thumb">
							<img src="../images/assets/post_1.jpg" alt="#">
							<div class="f_hover"><a href="#"><i class="icon_link_alt"></i></a></div>
						</div>
						<h4> <a href="#">Honor board</a> </h4>
					</div><!-- end grid3 -->

					<div class="grid_3 f_blog">
						<div class="f_thumb">
							<img src="../images/assets/post_2.jpg" alt="#">
							<div class="f_hover"><a href="#"><i class="icon_link_alt"></i></a></div>
						</div>
						<h4> <a href="#">Art Work Activity</a> </h4>
					</div><!-- end grid3 -->

					<div class="grid_3 f_blog">
						<div class="f_thumb">
							<img src="../images/assets/post_3.jpg" alt="#">
                            <div class="f_hover"><a href="#"><i class="icon_link_alt"></i></a></div>
						</div>
						<h4> <a href="#">Visits and Trips</a> </h4>
					</div><!-- end grid3 -->

                    <div class="grid_3 f_blog">
						<div class="f_thumb">
							<iframe src="http://player.vimeo.com/video/8191217?title=0&amp;byline=0&amp;badge=0&amp;color=5486DA" height="144"></iframe>
						</div>
						<h4> <a href="#">Phasellus vehicula justo eget diam posuer</a> </h4>						
					</div><!-- end grid3 -->
					
				</div><!-- end row -->
                
				<div class="row clearfix mbs">
					<div class="grid_6">
						<ul class="tabs">
							<li><a href="#A_1" class="active">Al Zahraa School 1</a></li>
							<li><a href="#A_2">Al Zahraa School 2</a></li>
							<li><a href="#A_3">Al Zahraa School 3</a></li>
						</ul><!-- tabs -->

						<ul class="tabs-content">
							<li id="A_1" class="active"><img src="../images/assets/character.jpg" alt="" class="fll">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sem dui, molestie vitae ornare tincidunt, semper non metus. Ut id arcu leo, id feugiat mauris. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed consequat, quam id ultricies mollis, quam odio viverra nisi, vulputate fringilla risus leo ac ante. In eleifend sem eu turpis viverra quis interdum dolor tempor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sem dui, molestie vitae ornare tincidunt, semper non metus. Ut id arcu leo, id feugiat mauris. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed consequat, quam id ultricies mollis, quam odio viverra nisi, vulputate fringilla risus leo ac ante. In eleifend sem eu turpis viverra quis interdum dolor tempor. </li><!-- tab content -->

							<li id="A_2"><p>Donec sed odio dui. Nulla vitae elit libero, a pharetra augue. Nullam id dolor id nibh ultricies vehicula ut id elit. Integer posuere erat a ante venenatis dapibus aliquet. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget...</p><p>"Nulla sagittis porttitor varius. Vestibulum eleifend, lorem sit amet gravida accumsan, nisi est tempor risus, non suscipit lectus nunc sit amet nunc. Pellentesque iaculis sapien at lacus vulputate sodales et eget quam. Etiam tristique bibendum leo, quis sagittis urna tempus non. Aliquam aliquet, nibh nec placerat tempus, tellus neque accumsan justo,consectetur lorem fringilla vel. Nulla facilisi."</p></li><!-- tab content -->

							<li id="A_3">Nulla sagittis porttitor varius. Vestibulum eleifend, lorem sit amet gravida accumsan, nisi est tempor risus, non suscipit lectus nunc sit amet nunc. Pellentesque iaculis sapien at lacus vulputate sodales et eget quam. Etiam tristique bibendum leo, quis sagittis urna tempus non. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sem dui, molestie vitae ornare tincidunt, semper non metus. Ut id arcu leo, id feugiat mauris. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed consequat, quam id ultricies mollis, quam odio viverra nisi, vulputate fringilla risus leo ac ante. In eleifend sem eu turpis viverra quis interdum dolor tempor.</li><!-- tab content -->
						</ul><!-- end tabs -->
					</div><!-- end grid6 -->

					<div class="grid_6">
							<ul class="tt-accordion">
								<li class="sub-accordion">
									<div class="accordion-head">
										<div class="accordion-head-sign"></div>
										<p>Al Zahraa School 1</p>
									</div>
									<div class="accordion-content">
										Nulla vitae elit libero, a pharetra augue. Nullam id dolor id nibh ultricies vehicula ut id elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sem dui, molestie vitae ornare tincidunt, semper non metus. Ut id arcu leo, id feugiat mauris. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed consequat, quam id ultricies mollis, quam odio viverra nisi, vulputate fringilla risus leo ac ante. In eleifend sem eu turpis viverra quis interdum dolor tempor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sem dui, molestie vitae ornare tincidunt, semper non metus. Ut id arcu leo, id feugiat mauris.
									</div>
								</li>
								<li class="sub-accordion">
									<div class="accordion-head">
										<div class="accordion-head-sign"></div>
										<p>Al Zahraa School 2</p>
									</div>
									<div class="accordion-content">Nulla id ligula arcu. Integer et tincidunt lectus. Duis id ligula diam, quis dapibus erat. Curabitur nec libero et est vulputate sollicitudin. Fusce sit amet turpis sed mauris volutpat posuere. Morbi vulputate, odio eget adipiscing faucibus, lorem ipsum facilisis justo, gravida tempus orci nisi ac eros. Pellentesque metus dolor, imperdiet sed ornare vel, tempus eu ipsum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec malesuada, massa ut lacinia congue, eros felis aliquam arcu, non euismod ligula sapien in est. Etiam vitae congue orci.
									</div>
								</li>
								<li class="sub-accordion">
									<div class="accordion-head">
										<div class="accordion-head-sign"></div>
										<p>Al Zahraa School 3</p>
									</div>
									<div class="accordion-content">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sem dui, molestie vitae ornare tincidunt, semper non metus. Ut id arcu leo, id feugiat mauris. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed consequat, quam id ultricies mollis, quam odio viverra nisi, vulputate fringilla risus leo ac ante. In eleifend sem eu turpis viverra quis interdum dolor tempor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sem dui, molestie vitae ornare tincidunt, semper non metus. Ut id arcu leo, id feugiat mauris.
									</div>
								</li>
							</ul><!-- end accordion -->
					</div><!-- end grid6 -->
				</div><!-- clearfix -->

				
			</div><!-- end page content -->
</asp:Content>
