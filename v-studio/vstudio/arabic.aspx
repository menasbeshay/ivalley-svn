<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="arabic.aspx.cs" Inherits="vstudio.arabic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
@font-face {
  font-family: 'Arabic';
  font-style: normal;
  font-weight: 400;
  src: url(fonts/arabic.ttf);
}
        </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Header [Small Navigation & Large Navigation] ---->
	<section id="header" style="font-family: 'Alj'; unicode-bidi: embed;">
		<div id="nav-small">
			<div id="arabic" class="text-center">
				<a href="home"><span style="font-family:Ubuntu-Regular;font-size:14px;">English</span></a>
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
					<li id="menu-products" class="products"><a href="#">هولوجرام والعرض الضوئي </a></li>
					<li id="menu-pd" class="pds"><a href="#">Product Description</a></li>
					<li id="menu-services" class="services"><a href="#">خدمات الوسائط الإعلامية المتعددة</a></li>
					<li id="menu-cb" class="cbs"><a href="#">Corporate Branding</a></li>
					<li id="menu-multi" class="multi"><a href="#">الشاشات تعددية اللمس</a></li>
					<li id="menu-way" class="3dway"><a href="#">الدليل ثلاثي الأبعاد للمباني</a></li>
					<li id="menu-contact" class="contact"><a href="#">إتصل بنا</a></li>
					<li id="menu-portfolio" class="ps"><a href="#">أعمالنا وعملاؤنا</a></li>
					<li id="menu-join" class="jus"><a href="#">إنضم إلينا</a></li>
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
	<section id="home" style="direction: rtl; font-family: 'Alj'; unicode-bidi: embed;">
		<div class="bg-slide">
			<div class="slide12">
			<div  id="home-wrap">
				<div id="logo-slide" style="display:none;direction:ltr;">
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
					<img src="img/pull-me-down-a.png" id="pull-me-down"/>
				</div>
				</div>
				<div id="sager-text" style="position:absolute; display:none;font-family: 'Alj'">
					<h1></h1>
					<p style="line-height:20px;"> نحن فريقٌ لدى صقر في ستديو يقوده شغف وحماس التسويق ولكننا نعشق الإبتكار ايضا . سواءً كنت تبحث عن تصميم هوية تجارية تترك إنطباعا دائما أو ترغب في تقديم أعمالك ومنتجاتك من خلال موقع  إلكتروني متميز أو إنتاج فيديو مفعم بالإبهار أو   ممن تستهويهم إبداعات خلق الرسوم المتحركة وتصاميم الأجسام ثلاثية الأبعاد والفيديو التخيّلي  أو تتوق لتسويق منتجاتك بأفضل ما يكون من خلال استخدام منتجاتنا للتسويق المرئي خارج المنافسة من شاشات تعمل باللمس وتطبيقاتها المختلفة بمافي ذلك الدليل الإرشادي للمباني ثلاثي الأبعاد  أو الهولوجرام وأجهزة العرض الضوئي</p>
					
					<span class="text-med">نحن هنا في صقر في ستديو  لنعـزّز الرؤى</span>
				</div>
				<div class="right-icons" id="watch-video" style="display:none; z-index:3000;">
					<img src="img/watch-video-a.png" class="img-responsive"/>
				</div>
				<div id="common-elements">
					<div style="display:none;" class="vp vparabic icon-rotate"><a href="#"><img src="img/video_productions_a.png" class="img-responsive"/></a></div>
					<div style="display:none;" class="hp hparabic icon-rotate"><a href="#"><img src="img/3d_wayfinding_a.png" class="img-responsive"/></a></div>
					<div style="display:none;" class="wf wfarabic icon-rotate"><a href="#"><img src="img/holography_projections_a.png" class="img-responsive"/></a></div>
					<div style="display:none;" class="mt mtarabic icon-rotate"><a href="#"><img src="img/multi_touchscreens_a.png" class="img-responsive"/></a></div>
				</div>
				<div id="arabic1" class="text-center">
					<a href="home.aspx"><span style="font-family:Ubuntu-Regular; font-size:14px;">English</span></a>
				</div>
			
			</div>
		</div>
	</section>
	<section id="video" style="display:none; direction: rtl; font-family: 'Alj'; unicode-bidi: embed;">
			<video id='media-video' preload="none" class="video-js" poster="img/bg-video-a.jpg">
				<source src='http://203.124.98.195/~vstudioco/wp-content/themes/vstudio/media/demo1.mp4'  type="video/mp4">
Your browser does not support the video tag
			</video>

			
		<div id="video-cover" style=" z-index:99;">
			<div class="container">
				<div class="row">
					<div id="watch-video-icon" class="text-center icon-rotate">
						<br></br><br><br><br>
						<img class="" src="img/play-button.png" />
						<br><br><br>
					</div>
					<div id="watch-video-text" class="text-center" style="padding-left: 72px; padding-top: 13px;">
						<img src="img/watch-the-video-a.png" />
						<br><br>
					</div>
                                        <div class="text-center">
                                                <span class="start-video-again">إعادة عرض الفيديو</span>
<br><br><br><br><br>
                                        </div>
					<div class="text-center icon-rotate">
						<img src="img/download-catalouge-1-a.png"/>
					</div>
				</div>
				
			</div>
		</div>
                <div id="arrow-video" style="position:fixed; left:7%; top:44%; z-index:99; cursor:pointer;">
                                       <img src="img/arrow_left_violet.png" width="77" height="75" alt="Left Arrow"/>
				</div>
	</section>
	<section id="holography" style="display:none; direction: rtl; font-family: 'Alj'; unicode-bidi: embed;">
		<div id="holography-cover">
			<div class="container">
				<div class="row" style="height:100px;">
					<div class="col-md-12 page-heading">
						<h1 class="heading1" style="font-family: 'Ge';text-align:right;">هولوجرام والعرض الضوئي</h1>
					</div>
				</div>
                                <div id="arrow-holo-more" class="arrow" style="right:30%; z-index:200; position:absolute; bottom:7%;">
				    <img src="img/arrow_right_violet.png" width="65" height="63" alt="Right Arrow"/>
				</div>
                                 <div id="arrow-holo-more-left" class="arrow" style="left:7%; z-index:200; position:absolute; bottom:7%;">
				    <img src="img/arrow_left_violet.png" width="65" height="63" alt="Left Arrow"/>
				</div>
				<div class="row">
					<div class="col-md-8" id="holo-left">
						<div id="holo-middle" style=" position:absolute; left:0px;width:780px; height:380px;">
							<div id="mac" class="mac" style="display:none; position:absolute; width:780px; height:372px; background-image:url(img/screen.jpg); background-position:20% 100%; background-repeat:no-repeat; z-index:4; overflow:hidden;	background-size:85% 92%; z-index:0">
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
							<h2 style="font-family:'Ge'; font-size:24px;text-align:right;">فيديو المنتجات </h2>
                            <div class="row">
                                <div class="col-md-11 col-md-offset-1">
                                    <div class="row holo-vids">
                                        <div class="col-md-3 vid-hover" >
                                            <img style="border: 2px solid #0072bc; border-radius: 10px;width:100%;height:90px;" src="img/holo/1.jpg" class="img-responsive" />
                                            <div class="vid-play text-center" style="background: url(img/cap.png);background-repeat:no-repeat; background-size:cover; z-index: 100; display: none; position: absolute; top: 0px; left: 15px; width:83%;height:90px !important; border: 2px solid #0072bc; border-radius: 10px;padding-top:50px;color:#fff;">
                                                وحدات عرض هولوجرام
                                            </div>
                                        </div>
                                        <div class="col-md-3 vid-hover1" >
                                            <img style="border: 2px solid #0072bc; border-radius: 10px;width:100%;height:90px;" src="img/holo/2.jpg" class="img-responsive" />
                                            <div class="vid-play1 text-center" style="background: url(img/cap.png);background-repeat:no-repeat; background-size:cover; z-index: 100; display: none; position: absolute; top: 0px; left: 15px; width:83%;height:90px !important; border: 2px solid #0072bc; border-radius: 10px;padding-top:50px;color:#fff;">
                                            فيلم العرض الضوئي 
                                             </div>
                                        </div>
                                        <div class="col-md-3 vid-hover2" >
                                            <img style="border: 2px solid #0072bc; border-radius: 10px;width:100%;height:90px;" src="img/holo/3.jpg" class="img-responsive" />
                                            <div class="vid-play2 text-center" style="background: url(img/cap.png);background-repeat:no-repeat; background-size:cover; z-index: 100; display: none; position: absolute; top: 0px; left: 15px; width:83%;height:90px !important; border: 2px solid #0072bc; border-radius: 10px;padding-top:50px;color:#fff;">
                                            المتحدث الإفتراضي </div>
                                        </div>

                                        <div class="col-md-3 vid-hover3" >
                                            <img style="border: 2px solid #0072bc; border-radius: 10px;width:100%;height:90px;" src="img/holo/4.jpg" class="img-responsive" />
                                            <div class="vid-play3 text-center" style="background: url(img/cap.png);background-repeat:no-repeat; background-size:cover; z-index: 100; display: none; position: absolute; top: 0px; left: 15px; width:83%;height:90px !important; border: 2px solid #0072bc; border-radius: 10px;padding-top:50px;color:#fff;">
                                            رول اب بشاشة فيديو </div>
                                        </div>
                                        <div style="display: none;" class="col-md-3 vid-hover4" >
                                            <img style="border: 2px solid #0072bc; border-radius: 10px;width:100%;height:90px;" src="img/holo/5.jpg" class="img-responsive" />
                                            <div class="vid-play4 text-center" style="background: url(img/cap.png);background-repeat:no-repeat; background-size:cover; z-index: 100; display: none; position: absolute; top: 0px; left: 15px; width:83%;height:90px !important; border: 2px solid #0072bc; border-radius: 10px;padding-top:50px;color:#fff;">
                                            المسوق الإفتراضي الصغير</div>
                                        </div>
                                        <div style="display: none;" class="col-md-3 vid-hover5" >
                                            <img style="border: 2px solid #0072bc; border-radius: 10px;width:100%;height:90px;" src="img/holo/6.jpg" class="img-responsive" />
                                            <div class="vid-play5 text-center" style="background: url(img/cap.png);background-repeat:no-repeat; background-size:cover; z-index: 100; display: none; position: absolute; top: 0px; left: 15px; width:83%;height:90px !important; border: 2px solid #0072bc; border-radius: 10px;padding-top:50px;color:#fff;">
                                             لثلاجة العرض LCD شاشة </div>
                                        </div>
                                         <div style="display: none;" class="col-md-3 vid-hover6" >
                                            <img style="border: 2px solid #0072bc; border-radius: 10px;width:100%;height:90px;" src="img/holo/7.jpg" class="img-responsive" />
                                            <div class="vid-play6 text-center" style="background: url(img/cap.png);background-repeat:no-repeat; background-size:cover; z-index: 100; display: none; position: absolute; top: 0px; left: 15px; width:83%;height:90px !important; border: 2px solid #0072bc; border-radius: 10px;padding-top:50px;color:#fff;">
                                            الكتاب الإلكتروني الهولوغرافي</div>
                                        </div>
                                        <div style="display: none;" class="col-md-3 vid-hover7" >
                                            <img style="border: 2px solid #0072bc; border-radius: 10px;width:100%;height:90px;" src="img/holo/8.jpg" class="img-responsive" />
                                            <div class="vid-play7 text-center" style="background: url(img/cap.png);background-repeat:no-repeat; background-size:cover; z-index: 100; display: none; position: absolute; top: 0px; left: 15px; width:83%;height:90px !important; border: 2px solid #0072bc; border-radius: 10px;padding-top:50px;color:#fff;">
                                            العرض الضوئي على الأرضيات </div>
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
			<img src="img/read-more-a.png" class="img-responsive"/>
		</div>
	</section>

	<section id="productdes" style="display:none; direction: rtl; font-family: 'Alj'; unicode-bidi: embed;">
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
					<div class="col-md-11 col-md-offset-1">
						<h1 class="heading2" style="display:none; font-family: 'Ge';font-size:90px;">منتجاتنا</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-5 col-md-offset-1" style="">
						<h2>هولوكونيك™ 
						<a href="" class="pull-left"><img src="img/logo1.png"  height="65"/></a>
						</h2>
						<h3 style="font-size:12px;font-family: 'Ge';">وحدات عرض هولوجرام والكريستال السائل LCD 
							
						</h3>
						<hr>
						<p>الهولوجرام هو من أحد أحدث تقنيات العروض المشاهدَة وهي صورة وهمية مكبرة متعددة الأبعاد  عائمة في الهواء لها تأثير كبير على المشاهدين.
<ul>
<li>تقدّم وحدات العرض صورة ثلاثية الأبعاد تبدو عائمة في الهواء</li>
<li>يمكن الجمع بين عرض المنتج الحقيقي والعرض الإفتراضي داخل وحدة العرض الهولوجرام</li>
<li>يمكن مشاهدة العرض من زاوية أو عدة زوايا أو جميع الزوايا من أجل رؤية ومشاهدة مدهشة</li>
<li>تقنية متطورة ببساطة تثير الدهشة </li>
<li>فعالّة ومتوافقة للعمل مع تقنيات أخرى </li>
</ul></p>
						<br>
						<span class="view-gallery"><a target="_blank" href="media/catalogue.pdf"><img src="img/d_flash.png" /> تحميل الفيدو فلاش </a>
						<a href="#" data-toggle="modal" data-target="#myModal" class="pull-left"><img src="img/3d-image-icon1.png"/> <span class="view-gallery">تحميل العرض التفصيلي </span></a>
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
					<div class="col-md-6">
						<h2>وينشــو™ 
						<a href="" class="pull-left"><img src="img/logo3.png"  height="65"/></a>
						</h2>
						<h3 style="font-size:16px;font-family: 'Ge';"> فيلم العرض الضوئي
							
						</h3>
						<hr>
						<p>في ستيديو V-Studio  تقدّم أنظمة العرض الضوئي المبتكرة "وينشــو ™"  حلٌ سلس لجميع متطلبات العرض ، فقط نقوم بلصق الفيلم V-Studio RT-RPF الناقل للصورة المسقطة من الخلف على واجهة محلك التجاري الزجاجية ونقوم بضبط جهاز نقل الصورة Winshow™ Projector حسب المسافة وشدة الإضاءة وعرض الفيديو الخاص بمنتجاتك أو خدماتك على واجهة محلك التجاري دون الحاجة لكمبيوتر أو جهاز فيديو أو أي جهاز آخر .</p>
						<br>
						<span class="view-gallery"><a target="_blank" href="media/catalogue.pdf"><img src="img/d_flash.png" /> تحميل الفيدو فلاش </a>
						<a href="#" data-toggle="modal" data-target="#myModal1" class="pull-left"><img src="img/3d-image-icon1.png" /> <span class="view-gallery">تحميل العرض التفصيلي </span></a>
						</span>
  <div id="myModal1" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">

        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title" id="myModalLabel">وينشــو™ </h4>
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
					<div class="col-md-5 col-md-offset-1" >
						<h2>سي ما رول اب™  
						<a href="" class="pull-left"><img src="img/logo2.png"  height="65"/></a>
						</h2>
						<h3 style="font-size:16px;font-family: 'Ge';">ستاند رول أب بشاشة فيديو
							
						</h3>
						<hr>
						<p style="text-align:justify;">الآن أخلق تجربة لاتنسى لجمهورك المستهدف مع لوحتنا الإعلانية القابلة للطي (سي ما رول أب™) بشاشة عرض فيديو ذاتية بإستخدام أنظمتنا للعرض الضوئي من خلال الفيلم V-Studio RT-RPF  الخاص بنا والملصق على اللوحة وجهاز العرض  Winshow™ Projector الخاص بنا  ودون الحاجة لكمبيوتر أو  جهاز فيديو أو أي جهاز آخر.  أبعاد اللوحة 1,1م  أو 0،8 م عرض × 2 م إرتفاع وتتوفر بطرازين مختلفين واحد بشاشة عرض فيديو كاملة،  والطراز الثاني يحتوي على نصف شاشة عرض فيدو والنصف الآخر للرسالة الإعلانية المطبوعة .</p><br>
												<span class="view-gallery"><a target="_blank" href="media/catalogue.pdf"><img src="img/d_flash.png" /> تحميل الفيدو فلاش </a>
						<a href="#" data-toggle="modal" data-target="#myModal2" class="pull-left"><img src="img/3d-image-icon1.png"/> <span class="view-gallery">تحميل العرض التفصيلي </span></a>
						</span>
  <div id="myModal2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">

        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title" id="myModalLabel">سي ما رول اب™  </h4>
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
					<div class="col-md-6">
						<h2>هوست توك™ 
						<a href="" class="pull-left"><img src="img/logo4.png" height="65"/></a>
						</h2>
						<h3 style="font-size:16px;font-family: 'Ge';">المتحدث الإفتراضي " المانيكان " 
							
						</h3>
						<hr>
						<p style="text-align:justify;">إدعم حملتك التسويقية بقوة وسحر "هوست توك™ " المتحدّث الإفتراضي (مانيكان)  من V-Studio في ستيديو الذي يعمل بأحدث تقنيات العرض الضوئي والصورة المسقطة من الخلف .  أترك المهمة للمتحدث الإفتراضي هوست توك™ لإنتزاع فرص لانهائية لأعمالك للتوهّج بالسوق من خلال إلقاء تحية متميزة لجمهورك بالمناسبات والمعارض والمؤتمرات  أو التحدث إليهم عن منتجاتك أو خدماتك وتقديم معلومات هامة لهم بشكل متميّز  أو حتى الترفيه عنهم بشكل غير مسبوق.	</p><br>
						<span class="view-gallery"><a target="_blank" href="media/catalogue.pdf"><img src="img/d_flash.png" /> تحميل الفيدو فلاش </a>
						<a href="#" data-toggle="modal" data-target="#myModal3" class="pull-left"><img src="img/3d-image-icon1.png"/> <span class="view-gallery">تحميل العرض التفصيلي </span></a>
						</span>
  <div id="myModal3" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">

        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title" id="myModalLabel">هوست توك™ </h4>
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
	<section id="services" style="display:none; direction: rtl; font-family: 'Alj'; unicode-bidi: embed;">
		      <div  id="service-video" style="height: 420px; width: 730px; left: 5%; bottom: 2.5%;">
			<video class="video-js" id="service-video-cont" poster="img/big-hex.jpg" style=" position: absolute; z-index: -99;  background-size:cover;right: 0; bottom: 0; min-width: 100%; min-height: 650px; width: auto; height: 650px; z-index: -100;">
Your browser does not support the video tag

				
			</video>
                      </div>
		
		<div id="services-wrap" style="z-index:99;">
			<div class="container">
				<div class="row" id="page-heading1" style="height:100px;">

					<div class="col-md-6">
						<h1 class="heading3" style="display:none;font-size:40px;"> خدمات الوسائط الإعلامية المتعـددة  </h1>
					</div>
				</div>
                <div style="height:1px;clear:both;"></div>
				<div class="row col-md-8" style="float:left;">
					<div class="col-md-5" style="padding-left:0px; font-size:12px;">
						<ul >
							<li style="padding-top:5px;">الرسوم المتحركة والجرافكس التوضيحي</li>
							<li style="padding-top:5px;"> إنتاج فيديو المحاكاة التخيّلي ثلاثي الأبعاد  </li>
							<li style="padding-top:5px;">تصميم الهويّة التجارية والمطبوعات</li>
						</ul>
					</div>
					<div class="col-md-5">
						<ul>
							<li style="padding-top:5px;">إنتاج الفيديو</li>
							<li style="padding-top:5px;">تصميم المواقع ومقدّم المواقع الإفتراضي</li>
							<li style="padding-top:5px;">تطوير تطبيقات شاشات اللمس والأجهزة الذكية</li>
						</ul>
					</div>
				</div>
				
				<div id="discover">
				<br><br><br><br>
					<img id="discover-more" src="img/service-arrow-a.png"/>
				</div>
				<div id="download-catalog" class="icon-rotate">
					<img src="img/service-download.png" style="max-height:40px;"/>
					<p>لاتستطيع مشاهدة الفيديو؟<br />حمّل فيديو الخدمات  فلاش </p>
                    <img src="img/service-download.png" style="max-height:40px;"/>
                    <p>تحميل عرض<br /> جميع الخدمات </p>
				</div>
				<!--
				<div id="service-hex-1">
				</div>
				-->
				<div id="service-hex-2" class="service-text text-center icon-rotate">
					
					<img class="serve-img" src="img/phone.png" />
					
					<p style="padding-top:3px;">تطوير تطبيقات شاشات اللمس والأجهزة الذكية</p>
				</div>
				<div id="service-hex-hover-2">
				</div>
				<div id="service-hex-3" class="service-text text-center icon-rotate">
					
					<img class="serve-img" src="img/animation.png"/>
					
					<p>الرسوم المتحركة والجرافكس التوضيحي</p>
				</div>
				<div id="service-hex-hover-3">
				</div>
				<div id="service-hex-4" class="service-text text-center icon-rotate">
					
					<img class="serve-img" src="img/video.png"/>
					
					<p>تصميم الهويّة التجارية والمطبوعات</p>
				</div>
				<div id="service-hex-hover-4">
				</div>
				<div id="service-hex-5" class="service-text text-center icon-rotate">
					
					<img class="serve-img" src="img/web.png" />
					
					<p>تصميم المواقع ومقدّم المواقع الإفتراضي</p>
				</div>
				<div id="service-hex-hover-5">
				</div>
				<div id="service-hex-6" class="service-text text-center icon-rotate">
					
					<img class="serve-img" src="img/3d.png"/>
					
					<p> إنتاج فيديو المحاكاة التخيّلي ثلاثي الأبعاد  </p>
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
	<section id="corporate" style="display:none; direction: rtl; font-family: 'Alj'; unicode-bidi: embed;">
		<div id="corporate-cover" style="background-image:url(../img/ci-bg_a.jpg)">
			<div class="container">
                                <div id="arrow-corporate" class="arrow" style="position:absolute; top:40%; left:100px;">
                                       <img src="img/arrow_left.png" width="77" height="75" alt="Left Arrow"/>
				</div>
				<div class="row">
					<br><br><br>
				</div>
				<div class="row">
					
					<div class="col-md-5">
					</div>
                    <div class="col-md-6 col-md-offset-1">
						<h2 id="corp-1" style="display:none;">لن تحظى بفرصة ثانية لخلق الإنطباع الأول</h2>
						<%--<h1 id="corp-2" style="display:none;">TO MAKE A FIRST IMPRESSION</h1>--%>
						
						<div id="corp-3" style="display:none;">
						<hr>
						<p>ألهم جمهورك بالتفاعل مع خدمات في ستديو V-studio  لتصاميم الجرافكس للهوية التجارية والتسويق  حيث الحلول الشاملة 

</p>
                            <ul>
                                <li>صناعة  وتصميم الهوية التجارية</li>
                                <li>تصميم وتطوير وتطبيقات الشعار</li>
                                <li>تصميم المطبوعات ووسائل التسويق والعروض</li>
                                <li>تصميم الكتيبات والمنشورات التسويقية ونشرات البريد الالكتروني</li>
                                <li>خدمات الوسائط المتعددة</li>
                                <li>والكثير من الخدمات الأخرى</li>
                            </ul>
						</div>
						<br>
						<div id="corp-4" style="display:none;">
						<span>أترك إنطباعا أفضل من خلال إيصال الرسالة التسويقية المناسبة للجمهور المستهدف بالطريقة الأفضل.</span>
						<hr>
						<span>إتصل ب في ستديو V-studio   لمساعدتك في تسخير القدرات على الإستحواذ على إهتمام جمهورك مرارا وتكرارا.</span>
	                    </div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section id="wayfinding" style="display:none; direction: rtl; font-family: 'Alj'; unicode-bidi: embed;">
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
					<div class="page-heading col-md-5" style="width:auto;">
						<h1 class="text-left heading4" style="width:auto;text-align:right; display:none;"><img width="150" height="47" src="img/3D-Wayfinding_logo.png"> الدليل ثلاثي الأبعاد للمباني </h1>
						
					</div>
				</div>
				<div class="row">
					<div id="way-left" style="display:none; text-align:right; position:absolute; left:3.7%;">
						<div class="col-md-5" >
							
							<h2>دليل المباني ثلاثي الأبعاد لمنصات شاشات اللمس ، والهواتف الذكية والمواقع الألكترونية</h2>
							<div class="line-3d" style="width:95%"></div>
							<p>الدليل ثلاثي الأبعاد هو دليل تفاعلي بخارطة ثلاثية الأبعاد للمباني الكبيرة تساعد زوارها على إيجاد طريقهم ، وهو  برنامج مصمم للعمل على شاشة تعمل باللمس للملاحة داخل المباني كما في المراكز التجارية ، والمتاجر الكبرى والمطارات ومحطات السكة الحديدية والمستشفيات والجامعات والمجمعات السكنية الكبيرة وأثناء المعارض التجارية وخلاف ذلك. الدليل ثلاثي الأبعاد للمباني العامة تطبيق يمكن تثبيته على شاشاتنا باللمس او للعمل على أجهزة الهواتف الذكيّة او على شبكة الإنترنت.</p>
							<h2>الخصائص الفنيّة :</h2>
							<div class="line-3d" style="width:95%"></div>
							<p>
								•	دخل إضافي للمشغّل من خلال إعلانات مبتكرة على الشاشة
•	جدول للفعاليات و النشرات الإعلانية
•	معلومات تفاعلية للمستأجرين  تظهر باستخدام كلمات بحث او موقع او أحرف أو ماركة تجارية
•	التحكم بالمحتوى وتغييره عبر الإنترنت عن بعد
•	لايحتاج إلى تحميل تطبيقات لمستخدمي الهواتف الذكية أيا كان نوعها عند الرغبة في نقل خارطة منطقة الوصول من الشاشة باللمس.							</p>
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
									<button id="button-3d-1-no-hover" style="font-size:12px;"  class="button-3d b-effect text-center"><img src="img/3d-image-icon.png"/> &nbsp; العرض التفصيلي</button>
								</div>
								</div>
                                                                <div class="col-md-3" id="button-3d-2">
								<div id="b-effect" class="watch-button">
									<button  id="button-3d-2-no-hover" class="button-3d text-center"><img src="img/poly-play.png"/> &nbsp; شاهد الفيديو</button>
								</div>
									
								</div>
                                                                <div class="col-md-3" id="button-3d-1">
								<div id="b-effect" href="#" data-toggle="modal" data-target="#wayModel">
									<button id="button-3d-1-no-hover" class="button-3d b-effect text-center"><img src="img/3d-image-icon.png"/> &nbsp; جرّب التطبيق</button>
								</div>
									
								</div>
								
                                                                <div class="col-md-3" id="button-3d-2">
								<div id="b-effect" class="watch-button">
									<button  id="button-3d-2-no-hover" style="font-size:10px;" class="button-3d text-center"><img src="img/poly-play.png"/> &nbsp; تصفّح الموقع الخاص</button>
								</div>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section id="polytouch"  style="display:none; direction: rtl; font-family: 'Alj'; unicode-bidi: embed;">
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
						<h1 class="heading5" style="display:none; padding-left:5px;"><img width="236" height="49" src="img/polytouch-logo1.jpg"/></h1>
						
					</div>
				</div>
				
				<div class="row">
					<div id="way-left1" style="display:none; position:absolute; left:3.7%;">
						<div class="col-md-6" >
							<h2>عربي عربي عربيعربي عربيعربيعربي عربي عربيعربي عربيعربي</h2>
							<div class="poly-line"></div>
							<p>Polytouch  هي شاشة تعددية اللمس قابلة للتوسع تعمل بتقنية ) PCT ) وهي نفس التقنية المستخدمة في شاشات الأجهزة الذكية والغير حساسة إطلاقا لضوء النهار أو الأشعة تحت الحمراء ، وهي الأولى في العالم بشاشة 32 و 46 بوصة بهذه التقنية ومن الطراز المسمّى الجميع في واحد all in 1) ( . النظام الجديد لـ Polytouch  (التركيب السريع) QMS   (براءة الإختراع تحت التسجيل)  يضمن للمستخدم  إستبدال بعض القطع لتوسيع وظائف النظام الخاص به أو لتكييفه مع متطلبات جديدة أو أنظمة حديثة. 
نظرا لتصميم Polytouch الإنسيابي الذكي المتضمن كمبيوتر بداخل الشاشة يمكن إستخدام هذه الشاشات أينما وجد قابس كهرباء ، التركيب السريع السهل وأبعاد عمق الشاشة الصغيره والشاشة المسطحة تجعل منها آداة رائعة لنقاط البيع بالإضافة للإستخدامات الأخرى في أعمال وتطبيقات كثيرة. مهما كان نوع أعمالك فهي قطعا أذكى مع Polytouch</p>
							<div class="poly-line"></div>
							<h3>عربي عربي عربيعربي عربيعربي
عربي عربي عربيعربي عربيعربي
عربي عربي عربيعربي عربيعربي
عربي عربي عربيعربي عربيعربي</h3>

                                                        <img src="img/poly-bottom.png" width="100%" class="img-responsive"/>
						</div>
					</div>
					<div id="way-right1" style="display:none; position:absolute;float:left;direction:ltr; margin-left:10px; right:10px;">
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
										<button id="poly-1-no-hover" class="poly-button"><img src="img/poly-image.png"/> &nbsp; تحميل الكاتلوج</button>
									</div>
									
								</div>
								<div class="col-md-4" id="poly-button-2">
									<div id="b-effect" href="#" >
										<button id="poly-2-no-hover" class="poly-button"><img src="img/poly-play.png"/> &nbsp; شاهد الفيديو</button>
									</div>
									
								</div>
								<div class="col-md-4" id="poly-button-3">
									<div id="b-effect">
										<button id="poly-3-no-hover" style="font-size:12px;" class="poly-button"><img src="img/poly-image1.png"/> تصفح الموقع الخاص</button>
									</div>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="contactus" style="display:none; direction: rtl; font-family: 'Alj'; unicode-bidi: embed;">
		<div id="contactus-cover">
			<div class="container">
				<div class="row" style="height:100px;">
					<div class="col-md-7">
						<h1  class="heading6" style="display:none;font-family: 'Ge';text-align:right">الإتصال بنا</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-7">
						<p>تأسست مؤسسة  س.ع. صقر الدولية في جدة عام 1982 م ، في ستديو هي إحدى  أعمالها وتقدم حلولاً تسويقية مرئية شاملة للأعمال الصغيرة والمتوسطة وشركات التسويق والدعاية.  خدماتنا تُقدّم فقط عبر موقعنا الإلكتروني وتوزّع منتجاتنا من خلال موزعين معتمدين.</p>
					</div>
					<div class="col-md-1"><div class="line2"></div></div>
					<div class="col-md-4">
						
						<div class="media">
									<a href="#" class="pull-left">
										<img src="img/sager-logo.png" class="media-object img-responsive"/>
									</a>
									<div class="media-body" style="padding-top:15px;">
										
										<span>في ستديوإحدى أعمال<br>س. ع. صقر الدولية</span>
									</div>
								</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-11">
						<h2>المركز الرئيسي:</h2>
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
											الطابق التاسع ،  جميل سكوير<br>
تقلطع شارع الأمير محمد بن عبد العزيز  (التحلية) وشارع الأندلس، جدة<br>
ص.ب 40538 ، جدة 21511، المملكة العربية السعودية <br><br>

هاتف: +966 12-283 4088  .  قاكس  : +966 12-660 8128<br>
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
    <label for="inputEmail3" class="col-sm-3 control-label">الإسم</label>
    <div class="col-sm-9">
      <input type="email" data-toggle="modal" data-target="#ContactModal" id="inputEmail3" placeholder="">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-3 control-label">البريد الإلكتروني</label>
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
<label class="col-sm-3 control-label">الإسم</label>
<div class="col-sm-9">
												<input type="text" maxlength="255" name="telephone" value="" placeholder="الإسم *"/>
</div>
											</div>
<div class="form-group">
<label class="col-sm-3 control-label">البريد الإلكتروني</label>
<div class="col-sm-9">
												<input type="text" maxlength="255" name="telephone" value="" placeholder="البريد الإلكتروني *"/>
</div>
											</div>
											<div class="form-group">
<label class="col-sm-3 control-label">العنوان</label>
<div class="col-sm-9">
												<input type="text" maxlength="255" name="telephone" value="" placeholder="العنوان *"/>
</div>
											</div>
<div class="form-group">
<label class="col-sm-3 control-label">الهاتف</label>
<div class="col-sm-9">
												<input type="text" maxlength="255" name="telephone" value="" placeholder="الهاتف *"/>
</div>
											</div>
<div class="form-group">
<label class="col-sm-3 control-label">الهاتف</label>
<div class="col-sm-9">
												<input type="text" maxlength="255" name="telephone" value="" placeholder="الهاتف *"/>
</div>
											</div>
<div class="form-group">
<label class="col-sm-3 control-label">الموضوع</label>
<div class="col-sm-9">
												<input type="text" maxlength="255" name="telephone" value="" placeholder="الموضوع *"/>
</div>
											</div>
<div class="form-group">
<label class="col-sm-3 control-label">الرسالة</label>
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
												<button style="z-index:1024;" type="submit">أرسل</button>
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
									فروعنا: مكتب الرياص: برج الفيصلية<br>
مكتب الخبر: برج الحقيط                                          
								</address>
							</div>
						</div>
					</div>
					<div class="col-md-1" style="padding-top:60px; cursor:pointer;">
						
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 text-center">
						<span>نسعد بلقاء عملائنا  ونرغب في منحهم الوقت الكافي ، لذى نقّدر لهم تفهمهم وترتيب موعد مسبق للزيارة . </span>
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
			<img src="img/watch-recent-a.png" class="img-reponsive"/>
		</div>
	</section>
	<section id="portfolio" style="display:none; direction: rtl; font-family: 'Alj'; unicode-bidi: embed;">
		<div id="portfolio-cover">
			<div class="container">
                                <div id="arrow-portfolio" class="arrow" style="position:absolute; top:45%;float:left; left:100px; z-index:99; ">
                                       <img src="img/arrow_left.png" width="77" height="75" alt="Left Arrow"/>
				</div>
				<div class="row" style="height:100px;">
					<div class="col-md-12 text-center page-heading">
						<h1  class="heading7" style="color:#dfd9e6;font-family: 'Ge';text-align:center; display:none;">PORTFOLIO & TESTIMONIALS</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 text-center">
						<h2>شاهد أحدث أعمالنا وماذا يقول عملاؤنا عنا</h2>
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
			<img src="img/work-with-us-a.png" class="img-responsive"/>
		</div>
	</section>
	
	<section id="join" style="display:none; direction: rtl; font-family: 'Arabic'; unicode-bidi: embed;">
		<div id="join-cover">
		<div id="join-wrap">
			<div class="container" >
                                <div id="arrow-join" class="arrow" style="position:absolute; top:47%; left:100px;">
                                       <img src="img/arrow_left.png" width="77" height="75" alt="Left Arrow"/>
				</div>
				<div class="row" style="height:100px;">
					<div class="col-md-10 col-md-offset-1" style="text-align:right">
						<h1  class="heading8 pull-right text-right" style="display:none; font-family: 'Ge';text-align:right">إنضم إلينا</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<p>Are you looking for a rewarding business & willing to invest little money to establish a profitable distributorship business? <br>
Are you an innovative, creative & results-oriented sales rep, voiceover talent, web presenter or cameraman? </p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<h2>أكتب إلينا</h2>

						<form method="post" action="">
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<input type="text" maxlength="255" name="telephone" value="" placeholder="الهاتف *"/>
											</div>
<div class="form-group">
												<input type="text" maxlength="255" name="telephone" value="" placeholder="العنوان *"/>
											</div>
											<div class="form-group">
												<input type="text" maxlength="255" name="telephone" value="" placeholder="العنوان *"/>
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
										<div class="col-md-4 col-md-offset-8">
											<div class="form-group">
												<button style="z-index:1024;" type="submit">أرسل</button>
											</div>
										</div>
									</div>
								</div>	
                                                                <div class="col-md-6">
									<div class="form-group">
										<input type="text" style="z-index:1024;" name="name" maxlength="255" value="" placeholder="الإسم *"/>
									</div>
									<div class="form-group">
										<input type="text" name="email" maxlength="255" value="" placeholder="البريد الإلكتروني *"/>
									</div>
									<div class="form-group">
										<input type="text" name="subject" maxlength="255" value="" placeholder="الموضوع *"/>
									</div>
									<div class="form-group">
										<textarea name="message" maxlength="500" placeholder="الرسالة *"></textarea>
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
