<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="vstudio.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Header [Small Navigation & Large Navigation] ---->
	<section id="header">
		<div id="nav-small">
			<div id="arabic" class="text-center">
				<a href="arabic.aspx"><span>عربي</span></a>
			</div>
			<div id="logo" class="home-icon text-center">
				<a href="#"><img src="img/logo-icon.png"/></a>
			</div>
			<div id="menu" class="text-center">
				<ul class="list-unstyled hover-both">
					<li id="menu-products" class="products"><a href="#"><img src="img/menu-1.png" width="32px" height="32px"/></a></li>
					<li id="menu-pd" class="pds"><a href="#"><span style="line-height:32px;">&nbsp;</span></a></li>
					<li id="menu-services" class="services"><a href="#"><img src="img/menu-2.png" width="32px" height="32px"/></a></li>
					<li id="menu-cb" class="cbs"><a href="#"><span style="line-height:32px;">&nbsp;</span></a></li>
                    <li id="menu-multi" class="multi"><a href="#"><img src="img/menu-4.png" width="32px" height="32px"/></a></li>
					<li id="menu-way" class="3dway"><a href="#"><img src="img/menu-3.png" width="32px" height="32px"/></a></li>
                    <li id="menu-mtsa" class="mtsa"><a href="#"><img src="img/menu-mtsa.png" width="32px" height="32px"/></a></li>
					<li id="menu-contact" class="contact"><a href="#"><img src="img/menu-6.png" width="32px" height="32px"/></a></li>
					<li id="menu-portfolio" class="ps"><a href="#"><span style="line-height:32px;">&nbsp;</span></a></li>
					<li id="menu-join" class="jus"><a href="#"><span style="line-height:32px;">&nbsp;</span></a></li>
				</ul>
			</div>
			<div id="contact" class="text-center">
				<img src="img/contact.png"/>
			</div>
		</div>
		<div id="nav-large" style="display:none;">
			<div id="logo1" class="home-icon text-left" style="display:none;">
				<a href="#"><img src="img/studio.png"/></a>
			</div>
			<div id="menu1" style="display:none;">
				<ul class="list-unstyled hover-both">
					<li id="menu-products" class="products"><a href="#">Holography & Projection</a></li>
					<li id="menu-pd" class="pds"><a href="#">Product Description</a></li>
					<li id="menu-services" class="services"><a href="#">Multimedia Services</a></li>
					<li id="menu-cb" class="cbs"><a href="#">Corporate Branding</a></li>
					<li id="menu-multi" class="multi"><a href="#">Multi Touchscreens</a></li>
					<li id="menu-way" class="3dway"><a href="#">3D Wayfinding</a></li>
                    <li id="menu-mtsa" class="mtsa"><a href="#">MTSA</a></li>
					<li id="menu-contact" class="contact"><a href="#">Contact Us</a></li>
					<li id="menu-portfolio" class="ps"><a href="#">Portfolio</a></li>
					<li id="menu-join" class="jus"><a href="#">Join Us</a></li>
				</ul>
			</div>
			<div id="contact1" style="display:none;">
				<ul class="list-unstyled">
					<li>+966 12 283 4088</li>
					<li>info@v-studio.co</li>
				</ul>
			</div>
			<div id="social" style="display:none;">
				<ul class="hover-both list-inline">
					<li class="youtube"><a href=""><img src="img/youtube.png"/></a></li>
					<li class="twitter"><a href=""><img src="img/twitter.png"/></a></li>
					<li class="google"><a href=""><img src="img/google.png"/></a></li>
					<li class="facebook"><a href=""><img src="img/facebook.png"/></a></li>
				</ul>
			</div>
		</div>
	</section>
	<!-- Header [Small Navigation & Large Navigation] ---->
	<section id="home">
		<div class="bg-slide">
			<div class="slide12">
			<div  id="home-wrap">
				<div id="logo-slide" style="display:none;">
					<img src="img/logo-full.png" id="final-logo" />
				</div>
				<div id="bulb-container" style="">
					<img src="img/1b.png" id="bulbon" style="position:fixed; width:20.5%;	height:55%; left:39%; bottom:33%; display:none;"/>
				</div>
				<div id="bulb-container" style="" >
					<img src="img/1a.png" id="bulboff"   style="position:fixed; width:20.5%;	height:55%; left:39%; bottom:33%; display:none;"/>
				</div>
				
				<div id="bulb-form">
						<div id="bulb-7" style="display:none;"><img src="img/bulb-6.png" style="position:fixed; width:8.3%; height:15.6%; left:40.4%; top:17.7%; "/></div>
						<div id="bulb-6" style="display:none;"><img style="position:fixed; width:11.5%; height:18%; left:46%; top:15%; " src="img/bulb-7.png" /></div>
						<div id="bulb-5" style="display:none;"><img style="position:fixed; width:12.9%; height:9.33%; left:40.5%; top:31.5%; " src="img/bulb-5.png"/></div>
						<div id="bulb-4" style="display:none;"><img style="position:fixed; width:6.29%; height:16.6%; left:51.9%; top:27%; " src="img/bulb-4.png"/></div>
						<div id="bulb-3" style="display:none;"><img style="position:fixed; width:10.02%; height:13.92%; left:41.5%; top:39%; " src="img/bulb-3.png"/></div>
						<div id="bulb-2"style="display:none;"><img style="position:fixed; width:6.73%; height:14.3%; left:49.5%; top:43.2%; " src="img/bulb-2.png"/></div>
						<div id="bulb-1" style="display:none;"><img style="position:fixed; width:8.05%; height:18.07%; left:45%; bottom:36%; " src="img/bulb-1.png"/></div>
				</div>
				<div id="bulb-holder">
					<button id="switch1" disabled></button>
					<button id="switch" disabled></button>
					<button class="" disabled id="toggle-button-up"></button>
					<button class="" disabled id="toggle-button-down" style="display:none;"></button>
				</div>
				<div >
					<img src="img/pull-me-down.png" id="pull-me-down"/>
				</div>
				
				<div id="sager-text" style="position:absolute; display:none;">
					<h1>At Sager V-Studio, We are an enthusiastic & passionate marketing team which loves to create.</h1>
					<p>Whether you want to have a lasting impression identity, present yourself and your products through innovative website and impressive video, need cartoon animation, 3D visualization or wish to uniquely market your products & blow people's minds using our out of box multi touchscreen, 3D Wayfinding, holography and projection visual marketing products,</p>
					<span class="text-med">we at V-Studio are here PROMOTING VISIONS</span>					
				</div>
				<div class="right-icons" id="watch-video" style="display:none; z-index:3000;">
					<img src="img/watch-video.png" class="img-responsive"/>
				</div>
				<div id="common-elements">
					<div style="display:none;" class="vp icon-rotate"><a href="#"><img src="img/video_productions.png" class="img-responsive"/></a></div>
					<div style="display:none;" class="hp icon-rotate"><a href="#"><img src="img/3d_wayfinding.png" class="img-responsive"/></a></div>
					<div style="display:none;" class="wf icon-rotate"><a href="#"><img src="img/holography_projections.png" class="img-responsive"/></a></div>
					<div style="display:none;" class="mt icon-rotate"><a href="#"><img src="img/multi_touchscreens.png" class="img-responsive"/></a></div>
				</div>
				<div id="arabic1" class="text-center">
					<a href="arabic/"><span>عربي</span></a>
				</div>
			</div>
			</div>
		</div>
	</section>
	<section id="video" style="display:none;">
			<video id='media-video' preload="none" class="video-js" poster="img/bg-video.jpg">
				<source src='http://203.124.98.195/~vstudioco/wp-content/themes/vstudio/media/demo1.mp4'  type="video/mp4">
Your browser does not support the video tag
			</video>

			
		<div id="video-cover" style=" z-index:99;">
			<div class="container">
				<div class="row">
					<div id="watch-video-icon" class="text-center icon-rotate">
						<br><br><br><br><br>
						<img class="" src="img/play-button.png" />
						<br><br><br>
					</div>
					<div id="watch-video-text" class="text-center" style="padding-left: 72px; padding-top: 13px;">
						<img src="img/watch-the-video.png" />
						<br><br>
					</div>
                                        <div class="text-center">
                                                <span class="start-video-again">Start the Video Again</span>
<br><br><br><br><br>
                                        </div>
					<div class="text-center icon-rotate">
						<img src="img/download-catalouge-1.png"/>
					</div>
				</div>
				
			</div>
		</div>
                <div id="arrow-video" style="position:fixed; left:7%; top:44%; z-index:99; cursor:pointer;">
                                       <img src="img/arrow_left_violet.png" width="77" height="75" alt="Left Arrow"/>
				</div>
	</section>
	<section id="holography" style="display:none;">
		<div id="holography-cover">
			<div class="container">
				<div class="row" style="height:100px;">
					<div class="col-md-12 page-heading">
						<h1 class="heading1">HOLOGRAPHY & PROJECTION</h1>
					</div>
				</div>
                                <%--<div id="arrow-holo-more" class="arrow" style="right:30%; z-index:200; position:absolute; bottom:7%;">
				    <img src="img/arrow_right_violet.png" width="65" height="63" alt="Right Arrow"/>
				</div>
                                 <div id="arrow-holo-more-left" class="arrow" style="left:7%; z-index:200; position:absolute; bottom:7%;">
				    <img src="img/arrow_left_violet.png" width="65" height="63" alt="Left Arrow"/>
				</div>--%>
				<div class="row">
					<div class="col-md-8" id="holo-left">
						<div id="holo-middle" style=" position:absolute; left:0px;width:780px; height:380px;">
							<div id="mac" class="mac" style="display:none; position:absolute; width:780px; height:372px; background-image:url(img/screen.jpg); background-position:24% 100%; background-repeat:no-repeat; z-index:4; overflow:hidden;	background-size:85% 92%; z-index:0">
								<!--
								<div id="mac1" style="width:445px; height:273px; position:absolute;z-index:3; overflow:hidden;left:110px; top:62px;">
									<img src="img/vid-1.png" style=" position:absolute; z-index:2"/>
								</div>
								-->
								
								<div id="mac2" style="width:500px; height:300px; position:absolute;z-index:3; overflow:hidden;left:110px; top:40px;">
									<video id="holo-video" controls poster="img/vid-1.png">
										<source src='media/media1.mp4' type='video/mp4'>
Your browser does not support the video tag

									</video>
									
								</div>
								<!--
                                <div id="mac3" style="display:none; width:445px; height:273px; position:absolute;z-index:3; overflow:hidden;left:110px; top:62px;">
									<video id='media-video' controls>
										<source src='media/media1.mp4' type='video/mp4'>
Your browser does not support the video tag

									</video>
									
								</div>
                                <div id="mac4" style="display:none; width:445px; height:273px; position:absolute;z-index:3; overflow:hidden;left:110px; top:62px;">
									<video id='media-video' controls>
										<source src='media/media1.mp4' type='video/mp4'>
Your browser does not support the video tag

									</video>
									
								</div>
                                <div id="mac5" style="display:none; width:445px; height:273px; position:absolute;z-index:3; overflow:hidden;left:110px; top:62px;">
									<video id='media-video' controls>
										<source src='media/media1.mp4' type='video/mp4'>
Your browser does not support the video tag

									</video>
								</div>
                                <div id="mac6" style="display:none; width:445px; height:273px; position:absolute;z-index:3; overflow:hidden;left:110px; top:62px;">
									<video id='media-video' controls>
										<source src='media/media1.mp4' type='video/mp4'>
Your browser does not support the video tag

									</video>
									
								</div>
								
								<div class="media-icon-hover" style="visibility:visible">
									<img  src="img/3d-media-icon.png" />
								</div>
								
									<div style="left:110px; top:62px; z-index:4; width:445px; height:273px; position:absolute;">
									</div>
								-->
							</div>
							<div id="shadow" style="width:100%; height:41px; position:absolute; bottom:-13px; background-image:url(img/bottom-shadow.png); background-position:20% 100%; background-repeat:no-repeat; background-size:70% 100%; display:none;">
								&nbsp;
							</div>
						</div>
						<div id="holo-bottom" style="position:absolute; height:auto; top:390px;" class="col-md-12">
							<h2 style="font-family:Ubuntu-Regular; font-size:24px;">Products’ Videos</h2>
                            <div class="row">
                                <div id="arrow-holo-more" class="arrow" style="right:-10%; z-index:200; position:absolute; ">
				                    <img src="img/arrow_right_violet.png" width="65" height="63" alt="Right Arrow"/>
				                </div>
                                                 <div id="arrow-holo-more-left" class="arrow" style="left:-2%; z-index:200; position:absolute; ">
				                    <img src="img/arrow_left_violet.png" width="65" height="63" alt="Left Arrow"/>
				                </div>
                                <div class="col-md-11 col-md-offset-1">
                                    <div class="row holo-vids">
                                        <div class="col-md-3 vid-hover" >
                                            <img style="border: 2px solid #0072bc; border-radius: 10px;width:100%;height:90px;" src="img/holo/1.jpg" class="img-responsive" />
                                            <div class="vid-play text-center" style="background: url(img/cap.png);background-repeat:no-repeat; background-size:cover; z-index: 100; display: none; position: absolute; top: 0px; left: 15px; width:83%;height:90px !important; border: 2px solid #0072bc; border-radius: 10px;padding-top:50px;color:#fff;">
                                             Hologram Showcases
                                            </div>
                                        </div>
                                        <div class="col-md-3 vid-hover1" >
                                            <img style="border: 2px solid #0072bc; border-radius: 10px;width:100%;height:90px;" src="img/holo/2.jpg" class="img-responsive" />
                                            <div class="vid-play1 text-center" style="background: url(img/cap.png);background-repeat:no-repeat; background-size:cover; z-index: 100; display: none; position: absolute; top: 0px; left: 15px; width:83%;height:90px !important; border: 2px solid #0072bc; border-radius: 10px;padding-top:50px;color:#fff;">
                                            Rear Projection film
                                             </div>
                                        </div>
                                        <div class="col-md-3 vid-hover2" >
                                            <img style="border: 2px solid #0072bc; border-radius: 10px;width:100%;height:90px;" src="img/holo/3.jpg" class="img-responsive" />
                                            <div class="vid-play2 text-center" style="background: url(img/cap.png);background-repeat:no-repeat; background-size:cover; z-index: 100; display: none; position: absolute; top: 0px; left: 15px; width:83%;height:90px !important; border: 2px solid #0072bc; border-radius: 10px;padding-top:50px;color:#fff;">
                                            Virtual speaker</div>
                                        </div>

                                        <div class="col-md-3 vid-hover3" >
                                            <img style="border: 2px solid #0072bc; border-radius: 10px;width:100%;height:90px;" src="img/holo/4.jpg" class="img-responsive" />
                                            <div class="vid-play3 text-center" style="background: url(img/cap.png);background-repeat:no-repeat; background-size:cover; z-index: 100; display: none; position: absolute; top: 0px; left: 15px; width:83%;height:90px !important; border: 2px solid #0072bc; border-radius: 10px;padding-top:50px;color:#fff;">
                                            Video screen Roll Up</div>
                                        </div>
                                        <div style="display: none;" class="col-md-3 vid-hover4" >
                                            <img style="border: 2px solid #0072bc; border-radius: 10px;width:100%;height:90px;" src="img/holo/5.jpg" class="img-responsive" />
                                            <div class="vid-play4 text-center" style="background: url(img/cap.png);background-repeat:no-repeat; background-size:cover; z-index: 100; display: none; position: absolute; top: 0px; left: 15px; width:83%;height:90px !important; border: 2px solid #0072bc; border-radius: 10px;padding-top:50px;color:#fff;">
                                            Mini virtual promoter</div>
                                        </div>
                                        <div style="display: none;" class="col-md-3 vid-hover5" >
                                            <img style="border: 2px solid #0072bc; border-radius: 10px;width:100%;height:90px;" src="img/holo/6.jpg" class="img-responsive" />
                                            <div class="vid-play5 text-center" style="background: url(img/cap.png);background-repeat:no-repeat; background-size:cover; z-index: 100; display: none; position: absolute; top: 0px; left: 15px; width:83%;height:90px !important; border: 2px solid #0072bc; border-radius: 10px;padding-top:50px;color:#fff;">
                                            LCD cooler’s door </div>
                                        </div>
                                         <div style="display: none;" class="col-md-3 vid-hover6" >
                                            <img style="border: 2px solid #0072bc; border-radius: 10px;width:100%;height:90px;" src="img/holo/7.jpg" class="img-responsive" />
                                            <div class="vid-play6 text-center" style="background: url(img/cap.png);background-repeat:no-repeat; background-size:cover; z-index: 100; display: none; position: absolute; top: 0px; left: 15px; width:83%;height:90px !important; border: 2px solid #0072bc; border-radius: 10px;padding-top:50px;color:#fff;">
                                            Holographic ebook</div>
                                        </div>
                                        <div style="display: none;" class="col-md-3 vid-hover7" >
                                            <img style="border: 2px solid #0072bc; border-radius: 10px;width:100%;height:90px;" src="img/holo/8.jpg" class="img-responsive" />
                                            <div class="vid-play7 text-center" style="background: url(img/cap.png);background-repeat:no-repeat; background-size:cover; z-index: 100; display: none; position: absolute; top: 0px; left: 15px; width:83%;height:90px !important; border: 2px solid #0072bc; border-radius: 10px;padding-top:50px;color:#fff;">
                                            Floor projection</div>
                                        </div>

                                    </div>
                                </div>
                            </div>
						</div>
					</div>
					<div id="presenter" style="background:#fff; width:380px; position:absolute; right:70px;"; >
					<video style="height:550px; width:344px; background:#fff; background-position:0px 0px; background-repeat:no-repeat; background-size:110% 85%;" id='presenter-video' preload="none" >
				<source src='media/3MB.mp4' >
Your browser does not support the video tag
			</video>
						<div style="width:135px; height:51px; position:absolute; right:-5px; bottom:8%; padding:10px 0 0 20px;">
							<ul class="list-inline" >
								<li id="play"><div class="play" style="width:30px; text-align:center; background:#5f5f5f; padding:5px; color: #fff;font-size: 14px;" id="presenter-play"><span class="glyphicon glyphicon-pause"></span></div></li>
<li id="pause1" style="display:none;"><div class="play" style="background:#5f5f5f; width:30px; text-align:center; padding:5px; color: #fff; font-size: 14px;" id="presenter-play"><span class="glyphicon glyphicon-play"></span></div></li>
								<li>&nbsp;</li>
								<li id="volume"><div class="volume" style="background:#5f5f5f; width:30px; text-align:center; padding:5px; color: #fff;font-size: 14px;" id="presenter-volume"><span class="glyphicon glyphicon-volume-up"></span></div></li>
<li id="no-volume" style="display:none;"><div class="no-volume" style="background:#5f5f5f; width:30px; text-align:center; padding:5px; color: #fff;font-size: 14px;" id="presenter-volume"><span class="glyphicon glyphicon-volume-off"></span></div></li>
							</ul>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		<div class="right-icons" id="read-more" style="display:none;">
			<img src="img/read-more.png" class="img-responsive"/>
		</div>
	</section>

	<section id="productdes" style="display:none;">
		<div id="video-bg">
			<video preload="none" class="video-js" id="product-des-video" autoplay loop muted>
				
Your browser does not support the video tag

			</video>
			`
		</div>
		<div id="productdes-cover" style="background:rgba(255,255,255,0.7);">
			<div class="container">
				<div id="arrow-product-des" class="arrow" style="left:100px; position:absolute; top:42%;">
				    <img src="img/arrow_left_violet.png" width="77" height="75" alt="Left Arrow"/>
				</div>
				<div class="row" id="page-heading" style="height:100px;">
					<div class="col-md-11 col-md-offset-1 page-heading">
						<h1 class="heading2" style="display:none;">PRODUCTS</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-5 col-md-offset-1 productWrapper" style="">
						<h2>Holoconic ™
						<a href="" class="pull-right"><img src="img/logo1.png"  height="65"/></a>
						</h2>
						<h3 style="font-size:16px;">Holography& LCD displays
							
						</h3>
						<hr>
						<p>Holoconic™ display holography is a large-scale optical illusion features 3D content as if it were floating in air.
<ul>
<li>Customize to mix real objects with virtual content</li>
<li>View content from multiple to all angles</li>
<li>Advanced gesture-recognition technologies</li>
<li>Networkable, customizable and effectively memorable</li>
</ul></p>
						<br>
						<span class="span-text">
                            <a target="_blank" href="media/catalogue.pdf" class="pull-left"><img src="img/d_flash.png" /> Download Flash Video</a>
						    <a href="#" data-toggle="modal" data-target="#myModal" class="pull-right" style="margin-top:10px;"><img src="img/3d-image-icon1.png"/> View Presentation</a>
						</span>
  <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">

        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title" id="myModalLabel">Holoconic ™</h4>
        </div>
        <div class="modal-body">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="item active">
          <img src="img/demo.jpg" alt="First slide">
        </div>
        <div class="item">
          <img src="img/demo.jpg" alt="First slide">
        </div>
        <div class="item">
           <img src="img/demo.jpg" alt="First slide">
        </div>
      </div>
      <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
      </a>
      <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
      </a>
    </div>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
					</div>
					<div class="col-md-6 productWrapper">
						<h2>Winshow ™
						<a href="" class="pull-right"><img src="img/logo3.png"  height="65"/></a>
						</h2>
						<h3 style="font-size:16px;">Rear projection film
							
						</h3>
						<hr>
						<p>V-Studio brings to you WINSHOW™, a seamless rear projection solution for all your shop’s window display needs. Just paste the V-Studio RT-RPF film on a transparent surface and mold the application with the appropriate surrounding lighting environment and distance between Winshow™ projector and surface & your product or service video display on your window is ready to impress all! No computer/laptop or video player is required.</p>
						<br>
						<span class="span-text"><a target="_blank" href="media/catalogue.pdf" class="pull-left"><img src="img/d_flash.png" /> Download Flash Video</a>
						<a href="#" data-toggle="modal" data-target="#myModal1" class="pull-right" style="margin-top:10px;"><img src="img/3d-image-icon1.png" /> View Presentation</a>
						</span>
  <div id="myModal1" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">

        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title" id="myModalLabel">Winshow ™</h4>
        </div>
        <div class="modal-body">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="item active">
          <img src="img/demo.jpg" alt="First slide">
        </div>
        <div class="item">
          <img src="img/demo.jpg" alt="First slide">
        </div>
        <div class="item">
          <img src="img/demo.jpg" alt="First slide">
        </div>
      </div>
      <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
      </a>
      <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
      </a>
    </div>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-5 col-md-offset-1 productWrapper" >
						<h2>C. MA. Roll Up ™
						<a href="" class="pull-right"><img src="img/logo2.png"  height="65"/></a>
						</h2>
						<h3 style="font-size:16px;">Projected Screen Roll Up
							
						</h3>
						<hr>
						<p>Create an incredible experience for your target audience with a unique video screen Roll Up banner having V-Studio RT-RPF film coating & our Winshow™ projector. No computer/laptop or video is required. It is 1.1m or 0.8 wide x 2m in height and is available in full screen or ½ screens with print graphics.</p><br>
												<span class="span-text"><a target="_blank" href="media/catalogue.pdf" class="pull-left"><img src="img/d_flash.png" /> Download Flash Video</a>
						<a href="#" data-toggle="modal" data-target="#myModal2" class="pull-right" style="margin-top:10px;"><img src="img/3d-image-icon1.png"/> View Presentation</a>
						</span>
  <div id="myModal2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">

        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title" id="myModalLabel">C. MA. Roll Up ™</h4>
        </div>
        <div class="modal-body">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="item active">
          <img src="img/demo.jpg" alt="First slide">
        </div>
        <div class="item">
          <img src="img/demo.jpg" alt="First slide">
        </div>
        <div class="item">
          <img src="img/demo.jpg" alt="First slide">
        </div>
      </div>
      <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
      </a>
      <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
      </a>
    </div>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
					</div>
					<div class="col-md-6 productWrapper">
						<h2>Hostalk ™
						<a href="" class="pull-right"><img src="img/logo4.png" height="65"/></a>
						</h2>
						<h3 style="font-size:16px;">Virtual Promoter Mannequin
							
						</h3>
						<hr>
						<p>Give the ultimate boost to your campaign with the help of HOSTALK™, the virtual mannequin speaker by V-Studio, powered by the latest rear projection techniques. Let your virtual speaker grab endless opportunities for you in the marketplace through providing a warm-up prior to events, presenting vital information uniquely, and rendering unparalleled entertainment to the audience.	</p><br>
						<span class="span-text"><a target="_blank" href="media/catalogue.pdf"class="pull-left"><img src="img/d_flash.png" /> Download Flash Video</a>
						<a href="#" data-toggle="modal" data-target="#myModal3" class="pull-right" style="margin-top:10px;"><img src="img/3d-image-icon1.png"/> View Presentation</a>
						</span>
  <div id="myModal3" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">

        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title" id="myModalLabel">Hostalk ™</h4>
        </div>
        <div class="modal-body">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="item active">
          <img src="img/demo.jpg" alt="First slide">
        </div>
        <div class="item">
          <img src="img/demo.jpg" alt="First slide">
        </div>
        <div class="item">
          <img src="img/demo.jpg" alt="First slide">
        </div>
      </div>
      <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
      </a>
      <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
      </a>
    </div>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<section id="services" style="display:none;">
		      <div  id="service-video" style="height: 420px; width: 730px; left: 5%; bottom: 2.5%;">
			<video class="video-js" id="service-video-cont" poster="img/big-hex.jpg" style=" position: absolute; z-index: -99;  background-size:cover;right: 0; bottom: 0; min-width: 100%; min-height: 650px; width: auto; height: 650px; z-index: -100;">
Your browser does not support the video tag

				
			</video>
                      </div>
		
		<div id="services-wrap" style="z-index:99;">
			<div class="container">
				<div class="row" id="page-heading1" style="height:100px;">

					<div class="col-md-12 page-heading">
						<h1 class="heading1" style="display:none;font-family:'Ubuntu-Medium';">MULTIMEDIA SERVICES </h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3" style="padding-left:0px;">
						<ul >
							<li style="padding-top:5px;">Animation & Infographics </li>
							<li style="padding-top:5px;">3D Visualization</li>
							<li style="padding-top:5px;">Video Production</li>
						</ul>
					</div>
					<div class="col-md-4">
						<ul>
							<li style="padding-top:5px;">Creative & Corporate Identity Designs</li>
							<li style="padding-top:5px;">Web Development & Web Presenters</li>
							<li style="padding-top:5px;">Mobile Applications Development</li>
						</ul>
					</div>
					<div class="col-md-5">
					</div>
				</div>
				
				<div id="discover">
				<br><br><br><br>
					<p>Discover our<br> creative & corporate<br>identity designs service</p>
					<img id="discover-more" src="img/service-arrow.png"/>
				</div>
				<div id="download-catalog" class="icon-rotate" >
					<img src="img/service-download.png" style="max-height:40px;"/>
					<p>Can't stream video ? <br />Download All Services video</p>
                    <img src="img/service-download.png" style="max-height:40px;"/>
                    <p>Download Services <br />Presentation</p>
				</div>
				<!--
				<div id="service-hex-1">
				</div>
				-->
				<div id="service-hex-2" class="service-text text-center icon-rotate">
					
					<img class="serve-img" src="img/phone.png" />
					
					<p style="padding-top:3px;">Mobile Applications <br> Development</p>
				</div>
				<div id="service-hex-hover-2">
				</div>
				<div id="service-hex-3" class="service-text text-center icon-rotate">
					
					<img class="serve-img" src="img/animation.png"/>
					
					<p>Animation & Infographics</p>
				</div>
				<div id="service-hex-hover-3">
				</div>
				<div id="service-hex-4" class="service-text text-center icon-rotate">
					
					<img class="serve-img" src="img/video.png"/>
					
					<p>Video Production</p>
				</div>
				<div id="service-hex-hover-4">
				</div>
				<div id="service-hex-5" class="service-text text-center icon-rotate">
					
					<img class="serve-img" src="img/web.png" />
					
					<p>Web Development & <br> Web Presenter</p>
				</div>
				<div id="service-hex-hover-5">
				</div>
				<div id="service-hex-6" class="service-text text-center icon-rotate">
					
					<img class="serve-img" src="img/3d.png"/>
					
					<p>3D Visualization</p>
				</div>
				<div id="service-hex-hover-6">
				</div>
				<!--
				<div id="service-media">
					<div class="media-icon">
						<img class="serve-img" src="img/service-media.png" width="100%" height="100%" />
					</div>
				</div>
				<div id="service-video">
					
				</div>
				-->
		</div>
		</div>
	</section>
	<section id="corporate" style="display:none;">
		<div id="corporate-cover">
			<div class="container">
                                <div id="arrow-corporate" class="arrow" style="position:absolute; top:40%; left:100px;">
                                       <img src="img/arrow_left.png" width="77" height="75" alt="Left Arrow"/>
				</div>
				<div class="row">
					<br><br><br>
				</div>
				<div class="row">
					<div class="col-md-6 col-md-offset-1">
						<h2 id="corp-1" style="display:none;">YOU NEVER GET A SECOND CHANCE</h2>
						<h1 id="corp-2" style="display:none;">TO MAKE A FIRST IMPRESSION</h1>
						
						<div id="corp-3" style="display:none;">
						<hr>
						<p>Inspire your audience to action with v-studio creative, corporate identity, branding, and marketing services. 

Increase your brand recognition and value through:</p>
                            <ul>
<li>Corporate identity and branding</li>
<li>Logo development and design</li>
<li>Stationery, sales kits, presentation kits</li>
<li>Brochures, flyers, direct mail, catalogues</li>
<li>Multi-media and digital design </li>
<li>and much more</li></ul>
						</div>
						<br>
						<div id="corp-4" style="display:none;">
						<span>Make the right impression by delivering the right message to the right audience in the right way</span>
						<hr>
						<span>Contact v-studio today to help you harness the power to captivate your audience again and again.</span>
	                    </div>
					</div>
					<div class="col-md-5">
					</div>
				</div>
			</div>
		</div>
	</section>
	<section id="wayfinding" style="display:none;">
		<div id="wayfinding-cover">
			<div class="container-fluid">
  <div id="wayModel" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">

        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title" id="myModalLabel">Image Gallery</h4>
        </div>
        <div class="modal-body">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="item active">
          <img src="img/demo.jpg" alt="First slide">
        </div>
        <div class="item">
          <img src="img/demo.jpg" alt="First slide">
        </div>
        <div class="item">
          <img src="img/demo.jpg" alt="First slide">
        </div>
      </div>
      <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
      </a>
      <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
      </a>
    </div>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
<!--
                                <div id="arrow-wayfinding" class="arrow" style="position:absolute; z-index:1024; right:50px; bottom:18%;">
                                       <img src="img/arrow_right_violet.png" width="65" height="63" alt="Left Arrow"/>
				</div>
-->
				<div class="row" style="height:100px; left:9.3%; position:relative;">
					<div class="page-heading">
						<h1 class="text-left heading4" style="display:none;">3D WAYFINDING <img width="150" height="47" src="img/3D-Wayfinding_logo.png"></h1>
						
					</div>
				</div>
				<div class="row">
					<div id="way-left" style="display:none; position:absolute; left:3.7%;">
						<div class="col-md-6" >
							
							<h2>3D Wayfinder for kiosks, smartphones and the web</h2>
							<div class="line-3d" style="width:95%"></div>
							<p>Al daleel 3D Wayfinding is an interactive 3D map directory for large public buildings works on large multi-touch-screens with location-based view of the buildinghelping visitors find their destination, designed for indoor navigation in shopping malls, department stores, airports, train stations, hospitals, campuses, office buildings, universities, convention & exhibition centers etc.</p>
							<h2>Features</h2>
							<div class="line-3d" style="width:95%"></div>
							<ul>
								<li>Additional revenue through contextual banne	and	advertisements</li>
<li>Events calendar and announcements</li>
<li>Interactive info about tenants grouped by keyword, location, A-Z</li>
<li>Search by tag, name, location, keyword</li>
<li>Web-based content management for tenants</li>
<li>Requires no apps to be installed on mobile phone whether Symbian, Android or iOS, Al daleel 3D Way finding is compatible with all major smart phones.</li>							</ul>
                                                        <img src="img/wayfinding-lower.png" height="150" width="437"/>
						</div>
					</div>
                                        <div class="col-md-1">
                                        </div>
					<div id="way-right" style="display:none; position:absolute; right:0px;">
						<div class="col-md-12" >
							<div style="height:460px;">
							<div id="tv" >
<video id="way-vid" style="width: 88%; height: 53%;
position: absolute; top: 15px; left: 40px;" controls poster="img/vid-0.png" src="media/media1.mp4">
Your browser does not support the video tag

</video>
									
								
							</div>
							<div class="shadow-3d"></div>
							</div>
							<br><br>
							<div class="row" id="way-buttons-bar">
								<div class="col-md-3" id="button-3d-1">
								<div id="b-effect" href="#" data-toggle="modal" data-target="#wayModel">
									<button id="button-3d-1-no-hover" class="button-3d b-effect text-center"><img src="img/3d-image-icon.png"/> &nbsp; Presentation</button>
								</div>
								</div>
                                                                <div class="col-md-3" id="button-3d-2">
								<div id="b-effect" class="watch-button">
									<button  id="button-3d-2-no-hover" class="button-3d text-center"><img src="img/poly-play.png"/> &nbsp; Video</button>
								</div>
									
								</div>
                                                                <div class="col-md-3" id="button-3d-1">
								<div id="b-effect" href="#" data-toggle="modal" data-target="#wayModel">
									<button id="button-3d-1-no-hover" class="button-3d b-effect text-center"><img src="img/3d-image-icon.png"/> &nbsp; Try a demo</button>
								</div>
									
								</div>
								
                                                                <div class="col-md-3" id="button-3d-2">
								<div id="b-effect" class="watch-button">
									<button  id="button-3d-2-no-hover" class="button-3d text-center"><img src="img/poly-play.png"/> &nbsp; Website</button>
								</div>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section id="polytouch"  style="display:none;">
		<div id="polytouch-cover">
			<div class="container-fluid">
  <div id="polyModel" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">

        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title" id="myModalLabel">Image Gallery</h4>
        </div>
        <div class="modal-body">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="item active">
          <img src="img/demo.jpg" alt="First slide">
        </div>
        <div class="item">
          <img src="img/demo.jpg" alt="First slide">
        </div>
        <div class="item">
          <img src="img/demo.jpg" alt="First slide">
        </div>
      </div>
      <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
      </a>
      <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
      </a>
    </div>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->

<!--
                                <div id="arrow-polytouch" class="arrow" style="right:50px;z-index:1024; position:absolute; top:52%;">
                                       <img src="img/arrow_left_violet.png" width="65" height="63" alt="Left Arrow"/>
				</div>
-->
				<div class="row" style="height:100px;left:9.3%; position:relative;">
					<div class="col-md-12 page-heading">
						<h1 class="heading5" style="display:none; padding-left:5px;"><img width="236" height="49" src="img/polytouch-logo.png"/></h1>
						
					</div>
				</div>
				
				<div class="row">
					<div id="way-left1" style="display:none; position:absolute; left:3.7%;">
						<div class="col-md-6" >
							<h2>intuitive, emotional, interactive</h2>
							<div class="poly-line"></div>
							<p>Polytouch® POS Line allows the perfect digital presentation of your products. Let your customers have more fun with polytouch® in product selection and purchase and you dramatically increase your sales. In-Store Commerce with polytouch®, in conjunction with your existing e-commerce system, optimizes customer service and generates relaxed and satisfied customers. Hundreds of installations across Europe (June 2013), demonstrate the success, let yourself be advised by the Pyramid team, the German manufacturer of polytouch®.

Omni-channel sales with polytouch® Nowadays customers want to use all channels simultaneously. polytouch® is the in-store omni-channel device that virtually extends your shelves. Customers can scan products to read additional information, browse accessories, check availability in other branches, order for pickup or home delivery, redeem vouchers, post messages on social networks and much more.</p>
							<div class="poly-line"></div>
							<h3>Whatever your business is,
it will be smarter with polytouch®</h3>

                                                        <img src="img/poly-bottom.png" width="100%" class="img-responsive"/>
						</div>
					</div>
					<div id="way-right1" style="display:none; position:absolute; margin-left:10px; right:10px;">
						<div class="col-md-12">
							<div class="text-center" >
								
<div id="poly-tv">
<video id="poly-vid" style="width: 320px; height: 175px;
position: absolute; top: 30px; left: 130px;" controls poster="img/tv-image.png" src="media/media1.mp4">
Your browser does not support the video tag

</video>
</div>
<div id="poly-tv1">
<video id="poly-vid1" autoplay loop muted style="width: 320px; height: 180px;
position: relative; top: 30px; margin-bottom:30px; left:115px;" src="media/Video.mp4">
Your browser does not support the video tag

</video>
</div>
									
								
							
							</div>
							<div class="shadow-poly"></div>
							<br><br>
							<div class="row" id="poly-buttons-bar">
								<div class="col-md-4" id="poly-button-1">
									<div id="b-effect" href="#" data-toggle="modal" data-target="#polyModel">
										<button id="poly-1-no-hover" class="poly-button"><img src="img/poly-image.png"/> &nbsp; Catalogue</button>
									</div>
									
								</div>
								<div class="col-md-4" id="poly-button-2">
									<div id="b-effect" href="#" >
										<button id="poly-2-no-hover" class="poly-button"><img src="img/poly-play.png"/> &nbsp; Watch Video</button>
									</div>
									
								</div>
								<div class="col-md-4" id="poly-button-3">
									<div id="b-effect">
										<button id="poly-3-no-hover" class="poly-button"><img src="img/poly-image1.png"/> View Website</button>
									</div>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="contactus" style="display:none;">
		<div id="contactus-cover">
			<div class="container">
				<div class="row" style="height:100px;">
					<div class="col-md-12 page-heading">
						<h1  class="heading6" style="display:none;">CONTACT US</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-7">
						<p>S.O. Sager International established in 1982 in Jeddah, Saudi Arabia. V-Studio is a division of S.O. Sager International provides specialized visual marketing services & products for small to medium size corporate and marketing communication or advertisement companies. Our services are offered through our website only and our products are sold through authorized distributors</p>
					</div>
					<div class="col-md-1"><div class="line2"></div></div>
					<div class="col-md-4">
						
						<div class="media">
									<a href="#" class="pull-left">
										<img src="img/sager-logo.png" class="media-object img-responsive"/>
									</a>
									<div class="media-body" style="padding-top:15px;">
										
										<span>V-Studio is a Division of<br>S.O Sager International</span>
									</div>
								</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-11">
						<h2>Head Office</h2>
						<div class="line1"></div>
						<div class="row">
							<div class="col-md-4">
								<div class="media">
									<a href="#" class="pull-left" style="width:46px; text-align:center">
<span class="glyphicon glyphicon-map-marker"></span>
										<!--<img class="media-object" src="img/mapmarker.png" class="img-responsive"/>-->
									</a>
									<div class="media-body">
										<address>
											Level 9 Jameel Square<br>
Corner of Tahlia and Al Andalus Street<br>
P. O Box 40538 Jeddah 21511, Saudi Arabia<br><br>

Tel: (+966) 12- 283 4088 | Fax: (+966) 12-660 8128 <br>
info@v-studio.co                                           
										</address>
									</div>
								</div>
							</div>
							<!--
							<div class="col-md-2 text-right contact-image ">
								<img src="img/hq.png" class="img-responsive"/>
								<img src="img/hq.png" width="350px" height="250px" class="contact-image-hover img-rounded" style="z-index:2000; display:none; position:absolute; left:120px top:10px;"/>
							</div>
							-->
							<div class="col-md-1"><div class="line2"></div></div>
                                                        <div class="col-md-3">
								<h3>Send us a message</h3>
<form class="form-horizontal" role="form">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-3 control-label">Name</label>
    <div class="col-sm-9">
      <input type="email" data-toggle="modal" data-target="#ContactModal" id="inputEmail3" placeholder="">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-3 control-label">Email</label>
    <div class="col-sm-9">
      <input type="password" data-toggle="modal" data-target="#ContactModal"  id="inputPassword3" placeholder="">
    </div>
  </div>
</form>
<div class="modal fade" id="ContactModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <a style="color:#000;"class="close" data-dismiss="modal"><span style="color:#000;" aria-hidden="true">&times;</span><span class="sr-only">Close</span></a>
        <h4 class="modal-title" id="myModalLabel">Send us a message</h4>
      </div>
      <div class="modal-body">
<form class="form-horizontal" role="form" method="" action="">
											<div class="form-group">
<label class="col-sm-3 control-label">Name</label>
<div class="col-sm-9">
												<input type="text" maxlength="255" name="telephone" value="" placeholder="Name *"/>
</div>
											</div>
<div class="form-group">
<label class="col-sm-3 control-label">Email</label>
<div class="col-sm-9">
												<input type="text" maxlength="255" name="telephone" value="" placeholder="Email *"/>
</div>
											</div>
											<div class="form-group">
<label class="col-sm-3 control-label">Address</label>
<div class="col-sm-9">
												<input type="text" maxlength="255" name="telephone" value="" placeholder="Address *"/>
</div>
											</div>
<div class="form-group">
<label class="col-sm-3 control-label">Tel</label>
<div class="col-sm-9">
												<input type="text" maxlength="255" name="telephone" value="" placeholder="Tel *"/>
</div>
											</div>
<div class="form-group">
<label class="col-sm-3 control-label">Mobile phone</label>
<div class="col-sm-9">
												<input type="text" maxlength="255" name="telephone" value="" placeholder="Mobile phone *"/>
</div>
											</div>
<div class="form-group">
<label class="col-sm-3 control-label">Subject</label>
<div class="col-sm-9">
												<input type="text" maxlength="255" name="telephone" value="" placeholder="Subject *"/>
</div>
											</div>
<div class="form-group">
<label class="col-sm-3 control-label">Message</label>
<div class="col-sm-9">
												<textarea style="height:70px;" rows="2" name="telephone" value="" placeholder=""></textarea>
</div>
											</div>
<div class="form-group">
<label class="col-sm-3 control-label">Captcha</label>
<div class="col-sm-9">
										<div class="row">
<div class="col-sm-12">
										<div class="col-sm-5">	
											<div style="margin:0px; height:40px; padding-top:0px; line-height:35px; font-size:24px;"class="captcha-box text-center">J K L 7 8 O</div>
										</div>
										<div class="col-sm-7">
											<input type="text" maxlength="255" name="captcha" value="" placeholder=""/>
										</div>
</div>
</div>
</div>
									</div>
									
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
<div class="col-sm-9 col-sm-offset-3">
												<button style="z-index:1024;" type="submit">Submit</button>
</div>
											</div>
										</div>
									</div>
      </div>
      <div class="modal-footer text-center pull-left">
        <p style="text-align:center;">Uncompleted form or untrue information including phone number may result in not answering your message.</p>
      </div>
    </div>
  </div>
</div>
							</div>
                                                        <div class="col-md-1"><div class="line2"></div></div>
							<div class="col-md-3">
								<address>
									Riyadh Office: Al Faisaliah Tower<br>
Al Khobar office: Al Hugayet Tower                                          
								</address>
							</div>
						</div>
					</div>
					<div class="col-md-1" style="padding-top:60px; cursor:pointer;">
						
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 text-center">
						<span>We love to meet our clients, but would appreciate a pre-arranged appointment prior to visiting us.</span>
					</div>
				</div>
				
			</div>
<div class="container-fluid">
					<div class="col-md-12">
<iframe width="100%" height="250" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?key=afhkshgkkgGJSJJHitfufbdkyIITTGHKLDL35y&q=Jeddah 21511"></iframe>
					</div>
				</div>
		</div>
		<div class="right-icons" id="watch-port">
			<img src="img/watch-recent.png" class="img-reponsive"/>
		</div>
	</section>
	<section id="portfolio" style="display:none;">
		<div id="portfolio-cover">
			<div class="container">
                                <div id="arrow-portfolio" class="arrow" style="position:absolute; top:45%; z-index:99; ">
                                       <img src="img/arrow_left.png" width="77" height="75" alt="Left Arrow"/>
				</div>
				<div class="row" style="height:100px;">
					<div class="col-md-12 text-center page-heading">
						<h1  class="heading7" style="color:#dfd9e6; text-align:center; display:none;">PORTFOLIO & TESTIMONIALS</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 text-center">
						<h2>Watch our recent works & What do clients say about us</h2>
					</div>
				</div>
				<br>
				<div class="row" id="portfolio-carousel">
					<div class="col-md-12">
					 	<div id="portfolio-carousel">
						<!--<div id="background"></div>	-->	
						<div class="arrows">
							
							<a href="#" class="prev">Previous</a>
							<a href="#" class="next">Next</a>
						</div>
						<div class="gallery">
							<div class="inside">
								<div class="item">
									<div><img src="img/portfolio/1.jpg" alt="image1" /></div>
									<div><iframe frameborder="0" height="100%" width="50%" 	    src="https://youtube.com/embed/x52SCcpUhms"></iframe></div>
									<div><img src="<img src="img/portfolio/3.jpg" alt="image3" /></div>
								</div>
								<div class="item">
									<div><img src="img/portfolio/4.jpg" alt="image4" /></div>
									<div><iframe frameborder="0" height="100%" width="50%" 	    src="https://youtube.com/embed/x52SCcpUhms"></iframe></div>
								</div>
								<div class="item">
									<div><img src="img/portfolio/6.jpg" alt="image6" /></div>
									<div><img src="img/portfolio/7.jpg" alt="image7" /></div>
									<div><img src="img/portfolio/8.jpg" alt="image8" /></div>
									<div><img src="img/portfolio/9.jpg" alt="image9" /></div>
									<div><img src="img/portfolio/10.jpg" alt="image10" /></div>
									<div><img src="img/portfolio/11.jpg" alt="image11" /></div>
								</div>
								<div class="item">
									<div><img src="img/portfolio/12.jpg" alt="image12" /></div>
									<div><img src="img/portfolio/13.jpg" alt="image13" /></div>
									<div><img src="img/portfolio/14.jpg" alt="image14" /></div>
									<div><img src="img/portfolio/15.jpg" alt="image15" /></div>
								</div>
							</div>
						</div>
                                             </div>
						
					</div>
					
				</div>
                                <br>
				<div class="row">
					<div class="col-md-12 text-center">
						<img src="img/comma.png" width="18" height="17"/>
						<p>The team at V-studios surpassed all our expectations with the final outcome<br>
of our engagement. They were able to deliver quality work in a short period of time, <br>
and their creativity, expertise and design quality is something we have not seen in <br>
any other design company so far. Two thumbs way up! </p>
					</div>
				</div>
			</div>
		</div>
		<div class="right-icons" id="work-with-us">
			<img src="img/work-with-us.png" class="img-responsive"/>
		</div>
	</section>
	
	<section id="join" style="display:none;">
		<div id="join-cover">
		<div id="join-wrap">
			<div class="container" >
                                <div id="arrow-join" class="arrow" style="position:absolute; top:47%; left:100px;">
                                       <img src="img/arrow_left.png" width="77" height="75" alt="Left Arrow"/>
				</div>
				<div class="row" style="height:100px;">
					<div class="col-md-11 col-md-offset-1 page-heading">
						<h1  class="heading8" style="display:none;">JOIN US</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-11 col-md-offset-1">
						<p>Are you looking for a rewarding business & willing to invest little money to establish a profitable distributorship business? <br>
Are you an innovative, creative & results-oriented sales rep, voiceover talent, web presenter or cameraman? </p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<h2>Write to us</h2>

						<form method="post" action="">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<input type="text" style="z-index:1024;" name="name" maxlength="255" value="" placeholder="Name *"/>
									</div>
									<div class="form-group">
										<input type="text" name="email" maxlength="255" value="" placeholder="Email *"/>
									</div>
									<div class="form-group">
										<input type="text" name="subject" maxlength="255" value="" placeholder="Subject *"/>
									</div>
									<div class="form-group">
										<textarea name="message" maxlength="500" placeholder="Message *"></textarea>
									</div>
								</div>
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<input type="text" maxlength="255" name="telephone" value="" placeholder="Telephone *"/>
											</div>
<div class="form-group">
												<input type="text" maxlength="255" name="telephone" value="" placeholder="Mobile phone *"/>
											</div>
											<div class="form-group">
												<input type="text" maxlength="255" name="telephone" value="" placeholder="Address *"/>
											</div>

										</div>
									</div>
									<div class="row">
										<div class="col-md-5">	
											<div class="captcha-box text-center">J K L 7 8 O</div>
										</div>
										<div class="col-md-7">
											<input type="text" maxlength="255" name="captcha" value="" placeholder=""/>
										</div>
									</div>
									
									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<button style="z-index:1024;" type="submit">Submit</button>
											</div>
										</div>
									</div>
								</div>						
							</div>
						</form>
						
					</div>
				</div>
			</div>
			</div>
		</div>
	</section>


</asp:Content>
