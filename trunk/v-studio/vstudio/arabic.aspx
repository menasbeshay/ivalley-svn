<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="arabic.aspx.cs" Inherits="vstudio.arabic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
@font-face {
  font-family: 'Arabic';
  font-style: normal;
  font-weight: 400;
  src: url(fonts/arabic.ttf);
}

        #menu1 ul li {
            font-family:'JF_Flat_Regular' !important;
        }
         #menu .services, #menu .mtsa {
            line-height:18px !important;
        }
          #menu1 .services, #menu1 .mtsa {
            line-height:25px !important;
        }
        </style>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Header [Small Navigation & Large Navigation] ---->
	<section id="header" style="font-family: 'JF_Flat_Regular'; unicode-bidi: embed;">
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
					<li id="menu-services" class="services"><a href="#"><img src="img/menu-2.png" width="32px" height="32px"/><br /><span style="line-height:18px;">&nbsp;</span></a></li>                    
					<li id="menu-cb" class="cbs"><a href="#"><span style="line-height:32px;">&nbsp;</span></a></li>
                    <li id="menu-multi" class="multi"><a href="#"><img src="img/menu-4.png" width="32px" height="32px"/></a></li>
					<li id="menu-way" class="_3dway"><a href="#"><img src="img/menu-3.png" width="32px" height="32px"/></a></li>
                    <li id="menu-mtsa" class="mtsa"><a href="http://www.mtsakiosk.com" target="_blank"><img src="img/menu-mtsa.png" width="32px" height="32px"/><br /><span style="line-height:18px;">&nbsp;</span></a></li>
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
					<li id="menu-pd" class="pds"><a href="#">وصف المنتجات</a></li>
					<li id="menu-services" class="services" ><a href="#">خدمات الوسائط<br /> الإعلامية المتعددة</a></li>
					<li id="menu-cb" class="cbs"><a href="#">العلامات التجارية للشركات</a></li>
					<li id="menu-multi" class="multi"><a href="#">الشاشات تعددية اللمس</a></li>
					<li id="menu-way" class="_3dway"><a href="#">الدليل ثلاثي الأبعاد للمباني</a></li>
                    <li id="menu-mtsa" class="mtsa"><a href="http://www.mtsakiosk.com" target="_blank">منصات الشاشات باللمس <br />واللوحات الإعلانية الرقمية</a></li>
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
				<div id="sager-text" style="position:absolute; display:none;">
					<h1></h1>
					<p style="line-height:23px;font-size:16px;" class="vs_content"> نحن فريقٌ لدى صقر في ستديو يقوده شغف وحماس التسويق ولكننا نعشق الإبتكار ايضا . سواءً كنت تبحث عن تصميم هوية تجارية تترك إنطباعا دائما أو ترغب في تقديم أعمالك ومنتجاتك من خلال موقع  إلكتروني متميز أو إنتاج فيديو مفعم بالإبهار أو   ممن تستهويهم إبداعات خلق الرسوم المتحركة وتصاميم الأجسام ثلاثية الأبعاد والفيديو التخيّلي  أو تتوق لتسويق منتجاتك بأفضل ما يكون من خلال استخدام منتجاتنا للتسويق المرئي خارج المنافسة من شاشات تعمل باللمس وتطبيقاتها المختلفة بمافي ذلك الدليل الإرشادي للمباني ثلاثي الأبعاد  أو الهولوجرام وأجهزة العرض الضوئي &nbsp;<span class="text-med vs_header" style="margin-right:5px;font-size:14px;">نحن هنا في صقر في ستديو  لنعـزّز الرؤى</span></p>
					
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
				<source src='media/videos/arabic/home.mp4'  type="video/mp4">
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
                                                <span class="start-video-again vs_header" style="font-size:16px;">إعادة عرض الفيديو</span>
<br><br><br><br><br>
                                        </div>
					<div class="text-center icon-rotate">
						<a href="media/videos/arabic/home.mp4" download="download" target="_blank"><img src="img/download-catalouge-1-a.png"/></a>
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
						<h1 class="heading1 vs_header" style="text-align:center;">هولوجرام والعرض الضوئي</h1>
					</div>
				</div>
                                <!-- arrows here -->
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
									<video id="holo-video" controls poster="img/holo/holo.jpg">
										
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

							<h2 class="vs_header" style=" font-size:24px;text-align:right;">فيديو المنتجات </h2>
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
                                            <img style="border: 2px solid #0072bc; width:100%;height:90px;" src="img/holo/1.jpg" class="img-responsive" />
                                            <div class="vid-play text-center" style="background: url(img/cap.png);background-repeat:no-repeat; background-size:cover; z-index: 100; display: none; position: absolute; top: 0px; left: 15px; width:83%;height:90px !important; border: 2px solid #0072bc; padding-top:50px;color:#fff;">
                                                وحدات عرض هولوجرام
                                            </div>
                                        </div>
                                        <div class="col-md-3 vid-hover1" >
                                            <img style="border: 2px solid #0072bc; width:100%;height:90px;" src="img/holo/2.jpg" class="img-responsive" />
                                            <div class="vid-play1 text-center" style="background: url(img/cap.png);background-repeat:no-repeat; background-size:cover; z-index: 100; display: none; position: absolute; top: 0px; left: 15px; width:83%;height:90px !important; border: 2px solid #0072bc; padding-top:50px;color:#fff;">
                                            فيلم العرض الضوئي 
                                             </div>
                                        </div>
                                        <div class="col-md-3 vid-hover2" >
                                            <img style="border: 2px solid #0072bc; width:100%;height:90px;" src="img/holo/3.jpg" class="img-responsive" />
                                            <div class="vid-play2 text-center" style="background: url(img/cap.png);background-repeat:no-repeat; background-size:cover; z-index: 100; display: none; position: absolute; top: 0px; left: 15px; width:83%;height:90px !important; border: 2px solid #0072bc; padding-top:50px;color:#fff;">
                                            المتحدث الإفتراضي </div>
                                        </div>

                                        <div class="col-md-3 vid-hover3" >
                                            <img style="border: 2px solid #0072bc; width:100%;height:90px;" src="img/holo/4.jpg" class="img-responsive" />
                                            <div class="vid-play3 text-center" style="background: url(img/cap.png);background-repeat:no-repeat; background-size:cover; z-index: 100; display: none; position: absolute; top: 0px; left: 15px; width:83%;height:90px !important; border: 2px solid #0072bc; padding-top:50px;color:#fff;">
                                            رول اب بشاشة فيديو </div>
                                        </div>
                                        <div style="display: none;" class="col-md-3 vid-hover4" >
                                            <img style="border: 2px solid #0072bc; width:100%;height:90px;" src="img/holo/5.jpg" class="img-responsive" />
                                            <div class="vid-play4 text-center" style="background: url(img/cap.png);background-repeat:no-repeat; background-size:cover; z-index: 100; display: none; position: absolute; top: 0px; left: 15px; width:83%;height:90px !important; border: 2px solid #0072bc; padding-top:50px;color:#fff;">
                                            المسوق الإفتراضي الصغير</div>
                                        </div>
                                        <div style="display: none;" class="col-md-3 vid-hover5" >
                                            <img style="border: 2px solid #0072bc; width:100%;height:90px;" src="img/holo/6.jpg" class="img-responsive" />
                                            <div class="vid-play5 text-center" style="background: url(img/cap.png);background-repeat:no-repeat; background-size:cover; z-index: 100; display: none; position: absolute; top: 0px; left: 15px; width:83%;height:90px !important; border: 2px solid #0072bc; padding-top:50px;color:#fff;">
                                             لثلاجة العرض LCD شاشة </div>
                                        </div>
                                         <div style="display: none;" class="col-md-3 vid-hover6" >
                                            <img style="border: 2px solid #0072bc; width:100%;height:90px;" src="img/holo/7.jpg" class="img-responsive" />
                                            <div class="vid-play6 text-center" style="background: url(img/cap.png);background-repeat:no-repeat; background-size:cover; z-index: 100; display: none; position: absolute; top: 0px; left: 15px; width:83%;height:90px !important; border: 2px solid #0072bc; padding-top:50px;color:#fff;">
                                            الكتاب الإلكتروني الهولوغرافي</div>
                                        </div>
                                        <div style="display: none;" class="col-md-3 vid-hover7" >
                                            <img style="border: 2px solid #0072bc; width:100%;height:90px;" src="img/holo/8.jpg" class="img-responsive" />
                                            <div class="vid-play7 text-center" style="background: url(img/cap.png);background-repeat:no-repeat; background-size:cover; z-index: 100; display: none; position: absolute; top: 0px; left: 15px; width:83%;height:90px !important; border: 2px solid #0072bc; padding-top:50px;color:#fff;">
                                            العرض الضوئي على الأرضيات </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
						</div>
					</div>
					<div id="presenter" style="background:#fff; width:330px; position:absolute; right:70px;overflow:hidden"; >
					<video style="height:550px; width:344px; background:#fff; background-position:0px 0px; background-repeat:no-repeat; background-size:110% 85%;" id='presenter-video' preload="none" >
				<source src='media/ar_webpres.mp4' >
Your browser does not support the video tag
			</video>
						<div style="width:165px; height:51px; position:absolute; right:-5px; bottom:8%; padding:10px 0 0 20px;">
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
						<h1 class="heading2 vs_header" style="display:none; font-size:40px;line-height:initial;">منتجاتنا</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 col-md-offset-1 productWrapper" style="">
						<h2 class="vs_header">هولوكونيك™ 
						<a href="" class="pull-left"><img src="img/logo1.png"  height="65"/></a>
						</h2>
						<h3 style="font-size:12px;" class="vs_content">وحدات عرض هولوجرام والكريستال السائل LCD 
							
						</h3>
						<hr>
						<p class="vs_content">الهولوجرام هو من أحد أحدث تقنيات العروض المشاهدَة وهي صورة وهمية مكبرة متعددة الأبعاد  عائمة في الهواء لها تأثير كبير على المشاهدين.
<ul >
<li class="vs_content">تقدّم وحدات العرض صورة ثلاثية الأبعاد تبدو عائمة في الهواء</li>
<li class="vs_content">يمكن الجمع بين عرض المنتج الحقيقي والعرض الإفتراضي داخل وحدة العرض الهولوجرام</li>
<li class="vs_content">يمكن مشاهدة العرض من زاوية أو عدة زوايا أو جميع الزوايا من أجل رؤية ومشاهدة مدهشة</li>
<li class="vs_content">تقنية متطورة ببساطة تثير الدهشة </li>
<li class="vs_content">فعالّة ومتوافقة للعمل مع تقنيات أخرى </li>
</ul></p>
						<br>
						<span class="span-text"><a target="_blank" href="https://www.dropbox.com/s/xcvypohpsxhu798/V-Studio%20Holoconic%20Hologram%20video%20Arabic.swf?dl=0" download="download"  class="pull-right vs_content"><img src="img/d_flash.png" /> تحميل الفيديو فلاش </a>
						<a target="_blank" href="media/presentation/VStudioHoloconicHologrampresentation.pdf" download="download"  class="pull-left vs_content" style="margin-top:10px;"><img src="img/3d-image-icon1.png"/> تحميل العرض التفصيلي </a>
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
					<div class="col-md-5 productWrapper">
						<h2 class="vs_header">وينشــو™ 
						<a href="" class="pull-left"><img src="img/logo3.png"  height="65"/></a>
						</h2>
						<h3 style="font-size:16px;" class="vs_content"> فيلم العرض الضوئي
							
						</h3>
						<hr>
						<p class="vs_content">في ستيديو V-Studio  تقدّم أنظمة العرض الضوئي المبتكرة "وينشــو ™"  حلٌ سلس لجميع متطلبات العرض ، فقط نقوم بلصق الفيلم V-Studio RT-RPF الناقل للصورة المسقطة من الخلف على واجهة محلك التجاري الزجاجية ونقوم بضبط جهاز نقل الصورة Winshow™ Projector حسب المسافة وشدة الإضاءة وعرض الفيديو الخاص بمنتجاتك أو خدماتك على واجهة محلك التجاري دون الحاجة لكمبيوتر أو جهاز فيديو أو أي جهاز آخر .</p>
						<br>
						<span class="span-text"><a target="_blank" href="https://www.dropbox.com/s/36xxmricz1zszsn/Winshow_arabic_%20video%20with%20logo.swf?dl" download="download" class="pull-right vs_content"><img src="img/d_flash.png" /> تحميل الفيديو فلاش </a>
						<a target="_blank" href="media/presentation/VstudioWinshowrearprojectionpresentation.pdf" class="pull-left vs_content" style="margin-top:10px;"><img src="img/3d-image-icon1.png" /> تحميل العرض التفصيلي </a>
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
				<div class="clearfix" style="height:1px;"></div>
				<div class="row">
					<div class="col-md-6 col-md-offset-1 productWrapper" >
						<h2 class="vs_header">سي ما رول اب™  
						<a href="" class="pull-left"><img src="img/logo2.png"  height="65"/></a>
						</h2>
						<h3 style="font-size:16px;" class="vs_content">ستاند رول أب بشاشة فيديو
							
						</h3>
						<hr>
						<p style="text-align:justify;" class="vs_content">الآن أخلق تجربة لاتنسى لجمهورك المستهدف مع لوحتنا الإعلانية القابلة للطي (سي ما رول أب™) بشاشة عرض فيديو ذاتية بإستخدام أنظمتنا للعرض الضوئي من خلال الفيلم V-Studio RT-RPF  الخاص بنا والملصق على اللوحة وجهاز العرض  Winshow™ Projector الخاص بنا  ودون الحاجة لكمبيوتر أو  جهاز فيديو أو أي جهاز آخر.  أبعاد اللوحة 1,1م  أو 0،8 م عرض × 2 م إرتفاع وتتوفر بطرازين مختلفين واحد بشاشة عرض فيديو كاملة،  والطراز الثاني يحتوي على نصف شاشة عرض فيدو والنصف الآخر للرسالة الإعلانية المطبوعة .</p><br>
												<span class="span-text"><a target="_blank" href="https://www.dropbox.com/s/tdy0mixkcofkzfs/V-Studio%20C.MA.Roll%20Up%20Video%20Arabic.swf?dl=0" download="download"  class="pull-right vs_content"><img src="img/d_flash.png" /> تحميل الفيديو فلاش </a>
						<a target="_blank" href="media/presentation/VstudioCMARolluppresentation.pdf" download="download" class="pull-left vs_content" style="margin-top:10px;"><img src="img/3d-image-icon1.png"/> تحميل العرض التفصيلي </a>
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
					<div class="col-md-5 productWrapper">
						<h2 class="vs_header">هوست توك™ 
						<a href="" class="pull-left"><img src="img/logo4.png" height="65"/></a>
						</h2>
						<h3 style="font-size:16px;" class="vs_content">المتحدث الإفتراضي " المانيكان " 
							
						</h3>
						<hr>
						<p style="text-align:justify;" class="vs_content">إدعم حملتك التسويقية بقوة وسحر "هوست توك™ " المتحدّث الإفتراضي (مانيكان)  من V-Studio في ستيديو الذي يعمل بأحدث تقنيات العرض الضوئي والصورة المسقطة من الخلف .  أترك المهمة للمتحدث الإفتراضي هوست توك™ لإنتزاع فرص لانهائية لأعمالك للتوهّج بالسوق من خلال إلقاء تحية متميزة لجمهورك بالمناسبات والمعارض والمؤتمرات  أو التحدث إليهم عن منتجاتك أو خدماتك وتقديم معلومات هامة لهم بشكل متميّز  أو حتى الترفيه عنهم بشكل غير مسبوق.	</p><br>
						<span class="span-text"><a target="_blank" href="https://www.dropbox.com/s/8jo62pai4vur564/V-Studio%20Hostalk%20Video%20Arabic.swf?dl=0" download="download"  class="pull-right vs_content"><img src="img/d_flash.png" /> تحميل الفيديو فلاش </a>
						<a target="_blank" href="media/presentation/Vstudiohostalkpresentation.pdf" download="download" class="pull-left vs_content" style="margin-top:10px;"><img src="img/3d-image-icon1.png"/> تحميل العرض التفصيلي </a>
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
		      <div  id="service-video" style="height: 480px; width: 540px; left: 11%; bottom: -10px;background-image:url(img/mssbg.jpg)">
			<video class="video-js" id="service-video-cont" style="max-width:540px; position: absolute; z-index: -99;  background-size:cover;right: 0; bottom: 0; min-width: 100%; max-height: 480px; width: auto; height: 480px; z-index: -100;">
Your browser does not support the video tag

				
			</video>
                      </div>
		
		<div id="services-wrap" style="z-index:99;">
			<div class="container">
				<div class="row" id="page-heading1" style="height:100px;">

					<div class="col-md-6">
						<h1 class="heading1 vs_header" style="display:none;font-size:35px;"> خدمات الوسائط الإعلامية المتعـددة  </h1>
					</div>
				</div>
                <div style="height:1px;clear:both;"></div>
				<div class="row col-md-8 vs_content" style="float:left;">
					
					<div class="col-md-6">
						<ul >
							<li style="padding-top:5px;" class="vs_content">تصميم الهويّة التجارية والمطبوعات</li>
							<li style="padding-top:5px;" class="vs_content">تصميم المواقع ومقدّم المواقع الإفتراضي</li>
							<li style="padding-top:5px;" class="vs_content">تطوير تطبيقات شاشات اللمس والأجهزة الذكية</li>
						</ul>
					</div>
                    <div class="col-md-5 " style="padding-left:0px;">
						<ul >
							<li style="padding-top:5px;" class="vs_content">الرسوم المتحركة والجرافكس التوضيحي</li>
							<li style="padding-top:5px;" class="vs_content"> إنتاج فيديو المحاكاة التخيّلي ثلاثي الأبعاد  </li>
                            <li style="padding-top:5px;" class="vs_content">إنتاج الفيديو</li>
							
						</ul>
					</div>
				</div>
				
				<div id="discover">
				<br><br><br><br>
					<img id="discover-more" src="img/service-arrow-a.png"/>
				</div>
				<div id="download-catalog" class="icon-rotate " style="right:38%;">
					<img src="img/service-download.png" style="max-height:40px;"/>
					<p class="vs_content">لاتستطيع مشاهدة الفيديو؟<br />حمّل فيديو الخدمات  فلاش </p>
                    <img src="img/service-download.png" style="max-height:40px;"/>
                    <p class="vs_content">تحميل عرض<br /> جميع الخدمات </p>
				</div>
				<!--
				<div id="service-hex-1">
				</div>
				-->
				<div id="service-hex-2" class="service-text text-center icon-rotate ">
					
					<img class="serve-img" src="img/phone.png" />
					
					<p style="padding-top:3px;" class="vs_content">تطوير تطبيقات شاشات اللمس والأجهزة الذكية</p>
				</div>
				<div id="service-hex-hover-2">
				</div>
				<div id="service-hex-3" class="service-text text-center icon-rotate ">
					
					<img class="serve-img" src="img/animation.png"/>
					
					<p class="vs_content"> الرسوم المتحركة والجرافكس التوضيحي</p>
				</div>
				<div id="service-hex-hover-3">
				</div>
				<div id="service-hex-4" class="service-text text-center icon-rotate ">
					
					<img class="serve-img" src="img/video.png"/>
					
					<p class="vs_content">تصميم الهويّة التجارية والمطبوعات</p>
				</div>
				<div id="service-hex-hover-4">
				</div>
				<div id="service-hex-5" class="service-text text-center icon-rotate ">
					
					<img class="serve-img" src="img/web.png" />
					
					<p class="vs_content">تصميم المواقع ومقدّم المواقع الإفتراضي</p>
				</div>
				<div id="service-hex-hover-5">
				</div>
				<div id="service-hex-6" class="service-text text-center icon-rotate ">
					
					<img class="serve-img" src="img/3d.png"/>
					
					<p class="vs_content"> إنتاج فيديو المحاكاة التخيّلي ثلاثي الأبعاد  </p>
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
						<h2 id="corp-1" style="display:none;" class="vs_header">لن تحظى بفرصة ثانية لخلق الإنطباع الأول</h2>
						<%--<h1 id="corp-2" style="display:none;">TO MAKE A FIRST IMPRESSION</h1>--%>
						
						<div id="corp-3" style="display:none;">
						<hr>
						<p class="vs_content">ألهم جمهورك بالتفاعل مع خدمات في ستديو V-studio  لتصاميم الجرافكس للهوية التجارية والتسويق  حيث الحلول الشاملة 

</p>
                            <ul >
                                <li class="vs_content">صناعة  وتصميم الهوية التجارية</li>
                                <li class="vs_content">تصميم وتطوير وتطبيقات الشعار</li>
                                <li class="vs_content">تصميم المطبوعات ووسائل التسويق والعروض</li>
                                <li class="vs_content">تصميم الكتيبات والمنشورات التسويقية ونشرات البريد الالكتروني</li>
                                <li class="vs_content">خدمات الوسائط المتعددة</li>
                                <li class="vs_content">والكثير من الخدمات الأخرى</li>
                            </ul>
						</div>
						<br>
						<div id="corp-4" style="display:none;">
						<span class="vs_header">أترك إنطباعا أفضل من خلال إيصال الرسالة التسويقية المناسبة للجمهور المستهدف بالطريقة الأفضل.</span>
						<hr>
						<span class="vs_header">إتصل ب في ستديو V-studio   لمساعدتك في تسخير القدرات على الإستحواذ على إهتمام جمهورك مرارا وتكرارا.</span>
	                    </div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section id="wayfinding" style="display:none; direction: rtl; font-family: 'Alj'; unicode-bidi: embed;">
		<div id="wayfinding-cover">
			<div class="col-lg-12 col-sm-12 col-md-12 clearfix" style="padding:15px;">
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
				<%--<div class="row" style="height:100px; left:9.3%; position:relative;">
					<div class="page-heading col-md-5" style="width:auto;">
						<h1 class="text-left heading4 vs_header" style="width:auto;text-align:right; display:none;font-weight:bold;font-size:35px;"><img width="150" height="47" src="img/3D-Wayfinding_logo.png"> الدليل ثلاثي الأبعاد للمباني </h1>
						
					</div>
				</div>
				<div class="row">
					<div id="way-left" style="display:none; text-align:right; position:absolute; left:3.7%;direction:rtl;width:45%" >
						<div class="col-md-12" >
							
							<h2 style="margin:5px;font-size:25px;" class="vs_header">دليل المباني ثلاثي الأبعاد لمنصات شاشات اللمس ، والهواتف الذكية والمواقع الألكترونية</h2>
							<div class="line-3d" style="width:95%;"></div>
							<p class="vs_content">الدليل ثلاثي الأبعاد هو دليل تفاعلي بخارطة ثلاثية الأبعاد للمباني الكبيرة تساعد زوارها على إيجاد طريقهم ، وهو  برنامج مصمم للعمل على شاشة تعمل باللمس للملاحة داخل المباني كما في المراكز التجارية ، والمتاجر الكبرى والمطارات ومحطات السكة الحديدية والمستشفيات والجامعات والمجمعات السكنية الكبيرة وأثناء المعارض التجارية وخلاف ذلك. الدليل ثلاثي الأبعاد للمباني العامة تطبيق يمكن تثبيته على شاشاتنا باللمس او للعمل على أجهزة الهواتف الذكيّة او على شبكة الإنترنت.</p>
							<h2 style="margin:5px" class="vs_header">الخصائص الفنيّة :</h2>
							<div class="line-3d" style="width:95%"></div>
							<ul >
								<li class="vs_content" style="font-size:16px;">دخل إضافي للمشغّل من خلال إعلانات مبتكرة على الشاشة</li>
<li class="vs_content" style="font-size:16px;">جدول للفعاليات و النشرات الإعلانية</li>
<li class="vs_content" style="font-size:16px;"> معلومات تفاعلية للمستأجرين  تظهر باستخدام كلمات بحث او موقع او أحرف أو ماركة تجارية</li>
<li class="vs_content" style="font-size:16px;">التحكم بالمحتوى وتغييره عبر الإنترنت عن بعد</li>
<li class="vs_content" style="font-size:16px;">لايحتاج إلى تحميل تطبيقات لمستخدمي الهواتف الذكية أيا كان نوعها عند الرغبة في نقل خارطة منطقة الوصول من الشاشة باللمس.	</li>						</ul>
                                                        <img src="img/wayfinding-lower.png" height="150" width="437" style="float:left;"/>
						</div>
					</div>
                                        <div class="col-md-1">
                                        </div>
					<div id="way-right" style="display:none; position:absolute; right:0px;">
						<div class="col-md-12" >
							<div style="height:460px;">
							<div id="tv" >
<video id="way-vid" style="width: 88%; height: 53%;
position: absolute; top: 15px; left: 40px;" controls poster="img/vid-0.png" src="media/videos/arabic/3dway.mp4">
Your browser does not support the video tag

</video>
									
								
							</div>
							<div class="shadow-3d"></div>
							</div>
							<br><br>
							<div class="row " id="way-buttons-bar">
								<div class="col-md-3" id="button-3d-1">
								<div id="b-effect" href="#" data-toggle="modal" data-target="#wayModel">
									<button id="button-3d-1-no-hover" style="font-size:12px;"  class="button-3d b-effect text-center vs_content"><img src="img/3d-image-icon.png"/> &nbsp; العرض التفصيلي</button>
								</div>
								</div>
                                                                <div class="col-md-3" id="button-3d-2">
								<div id="b-effect" class="watch-button">
									<button  id="button-3d-2-no-hover" class="button-3d text-center vs_content"><img src="img/poly-play.png"/> &nbsp; شاهد الفيديو</button>
								</div>
									
								</div>
                                                                <div class="col-md-3" id="button-3d-1">
								<div id="b-effect" href="#" data-toggle="modal" data-target="#wayModel">
									<button id="button-3d-1-no-hover" class="button-3d b-effect text-center vs_content"><img src="img/3d-image-icon.png"/> &nbsp; جرّب التطبيق</button>
								</div>
									
								</div>
								
                                                                <div class="col-md-3" id="button-3d-2">
								<div id="b-effect" class="watch-button">
									<button  id="button-3d-2-no-hover" style="font-size:10px;" class="button-3d text-center vs_content"><img src="img/poly-play.png"/> &nbsp; تصفّح الموقع الخاص</button>
								</div>
									
								</div>
							</div>
						</div>
					</div>
				</div>--%>
                <div class="col-lg-11 col-sm-11 col-md-11 clearfix" style="margin:0px;float:right;height:100%;">
                        
                        
                        <div class="col-lg-12 col-sm-12 col-md-12" style="padding:0;margin-top:15px;">
                        <div class="col-lg-7 col-sm-7 col-md-7 pull-right" style="margin-top:25px;">
                            <video loop id="3dflashvideo" preload="auto" style="max-width:100%;transform:scaleX(1.1) scaleY(1.2);">                                 <source type="video/mp4" src="../media/3DWayfinding.mp4" >
                             </video>  
                            <div class="clearfix" style="height:2px;clear:both"></div>
                                                        
                        </div>
                        <div class="col-lg-5 col-sm-5 col-md-5" style="margin-left:-30px;" >
                            
                            <div class="col-md-4 col-sm-4 col-lg-4 pull-right" style="padding:0;">
                                <img src="../images/aldaleel_mtsa.png" style="max-width:100%;"/>
                                <br />
                                <span style="font-family: 'Ubuntu', sans-serif;font-weight:600;color:#6f647c;font-size:17px;">
                                3D WAYFINDING</span><br />
                                
                            </div> 
                            <div class="col-lg-10 col-md-10 col-sm-10 pull-right" style="text-align:right;">
                                <label style="color:#fff;font-weight:bold;font-size:18px;">الدليل ثلاثى الأبعاد للمبانى العامة</label>
                            </div>   
                            <div class="clearfix" style="height:15px;clear:both"></div>                        
                            
                            <p style="text-align:justify;font-size:18px;line-height:24px;direction:rtl">
                            تقدّم MTSA  إم تي اس آي ( أحد أعمال صقر الدولية ) خدمة ومنتجات الدليل ثلاثي الأبعاد للمباني العامة كالمراكز التجارية والمطارات والجامعات والمستشفبات الكبيرة ومجمّعات المباني . الدليل ثلاثي الأبعاد هو تطبيق يساعد زوار المباني الكبيرة على إيجاد الطريق لجهة الوصول المطلوبة بسهولة وبسرعة ودون عناء.  الدليل ثلاثي الأبعاد تطبيق تفاعلي يتم تثبيته على شاشاتنا باللمس ، يتوفر ايضا كتطبيق على الهواتف الذكية او على موقع بالانترنت.
                                <br /><a target="_blank" href="media/presentation/3DWayfindingpresentationG3.pdf" download="download" class="arabic downloadLink" > قم بتحميل العرض لمزيد من التفاصيل</a>
                            </p>
                            <div class="clearfix" style="height:15px;clear:both"></div>                                                    
                            </div>
                            
                         </div>
                            
                    </div>
			</div>
            <div class="col-lg-12 col-sm-12 col-md-12 clearfix bottom">
                <div class="col-lg-11 col-sm-11 col-md-11 pull-right" style="padding:0;width:95%">
            <div class="col-lg-5 col-sm-5 col-md-5 ">  
                                <img src="../images/Icons/Kiosk.png" style="margin:0 15px 0 0;width:21.5%;"/>
                                <img src="../images/Icons/mobile.png" style="margin:0 15px 0 0;width:21.5%;" />
                                <img src="../images/Icons/print.png" style="margin:0 15px 0 0;width:21.5%;"/>
                                <img src="../images/Icons/web.png"  style="margin:0;width:21.5%;"/>                               
                            </div>

                        <div class="col-lg-6 col-sm-6 col-md-6 " style="width:58.33333333% !important;">    
                            <a href="../files/MTSA3DWayfindingpresentationG3.pdf" style="margin:0 25px 0 0px;width:16.5%;float:left;display:block;padding-right:20px;">
                                <img src="../images/Icons/try_a.png" style="width:100%" /></a>                    
                                <img src="../images/icons/png/large/10.png" style="margin:0 12px 0 0;width:12%;"/>
                                <img src="../images/icons/png/large/12.png" style="margin:0 12px;width:12%;"/>
                                <img src="../images/icons/png/large/6.png" style="margin:0 12px;width:12%;"/>
                                <img src="../images/icons/png/large/2.png" style="margin:0 12px;width:12%;"/>
                                <img src="../images/icons/png/large/9.png" style="margin:0 12px;width:12%;"/>
                            
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
						<h1 class="heading5" style="display:none; padding-left:5px;margin-top:0 !important;"><img width="236" height="49" src="img/polytouch-logo.png"/></h1>
						
					</div>
				</div>
				
				<div class="row">
					<div id="way-left1" style="display:none; position:absolute; left:3.7%;top:80px;" class="col-md-7">
						<div class="col-md-12" style="padding:0 !important;width:99.5%">
							<h2 style="margin-top:1px !important;">Polytouch</h2>
							<div class="poly-line"></div>
							<p style="text-align:justify;" class="vs_content">Polytouch  هي شاشة تعددية اللمس قابلة للتوسع تعمل بتقنية ) PCT ) وهي نفس التقنية المستخدمة في شاشات الأجهزة الذكية والغير حساسة إطلاقا لضوء النهار أو الأشعة تحت الحمراء ، وهي الأولى في العالم بشاشة 32 و 46 بوصة بهذه التقنية ومن الطراز المسمّى الجميع في واحد all in 1) ( . النظام الجديد لـ Polytouch  (التركيب السريع) QMS   (براءة الإختراع تحت التسجيل)  يضمن للمستخدم  إستبدال بعض القطع لتوسيع وظائف النظام الخاص به أو لتكييفه مع متطلبات جديدة أو أنظمة حديثة. 
نظرا لتصميم Polytouch الإنسيابي الذكي المتضمن كمبيوتر بداخل الشاشة يمكن إستخدام هذه الشاشات أينما وجد قابس كهرباء ، التركيب السريع السهل وأبعاد عمق الشاشة الصغيره والشاشة المسطحة تجعل منها آداة رائعة لنقاط البيع بالإضافة للإستخدامات الأخرى في أعمال وتطبيقات كثيرة. مهما كان نوع أعمالك فهي قطعا أذكى مع Polytouch</p>							
                            <div class="col-md-6" style="padding:0 !important;padding-right:20px !important;">
                                <h3 style="margin-top:3px !important;font-size:15px;font-weight:bold;" class="vs_header">QMS نظام التركيب السريع في شاشات نقاط البيع</h3>
                            <div class="poly-line"></div>
							<p style="text-align:justify;" class="vs_content">تقدم شاشات Polytouch POS المخصصة لنقاط البيع نظام QMS التركيب السريع ومع براءة الإختراع هذه تنفرد Polytouch POS بسهولة تغيير أو ترقية مكونات نظام الشاشة ، أجزاء التغيير أو الترقية تشمل الطابعه ، الشريحة ، قراءة كلمة سر المدفوعات، الكاميرا، بالاضافة للأنظمة الجديدة RFID و NFC ، فقط وحدها Polytouch بنظام QMS التركيب السريع تضمن لك مطابقة الأنظمة الجديدة معها.</p>
                                </div>
                            <div class="col-md-6" style="padding:0 !important;">
                                 <h3 style="margin-top:1px !important;font-size:20px;font-weight:bold;" class="vs_header">البرامج والتطبيقات</h3>
                            <div class="poly-line"></div>
							<p style="text-align:justify;" class="vs_content">اذا كنت قد قمت بتطوير تطبيق أو برنامج خاص بنقاط البيع او أي استخدام آخر ، أو كنت من مصممي ومطوري التطبيقات ،  Polytouch  هي الشاشة التي تبحث عنها في ظل اللامحدودية من الإمكانيات. تقدم في ستديو V-Studio مجموعة من تطبيقات الأعمال وتعمل بالتعاون مع شركائها المطورين على تطوير المزيد من التطبيقات ، حاليا تشمل التطبيقات المتوفرة: دليل المباني ثلاثي الأبعاد ، تطبيق عقارات لبيع وتأجير العقار  ، تطبيقات البيع بالتجزئة ، والتسجيل والمغادرة الذاتية بالفنادق ، ومعرض الصور والفيديو..</p>
                                </div>
							
							<div class="poly-line"></div>
                           
                            <img src="img/poly-bottom.png" style="width:85%;float:left;" class="img-responsive"/>
						</div>
					</div>
					<div id="way-right1" style="display:none; position:absolute;float:left;direction:ltr; margin-left:10px; right:10px;">
						<div class="col-md-12">
							<div class="text-center" >
								
<div id="poly-tv">
<video id="poly-vid" style="width: 320px; height: 175px;
position: absolute; top: 30px; left: 130px;" controls poster="img/tv-image.png" src="media/videos/arabic/polytouch.mp4">
Your browser does not support the video tag

</video>
</div>
<div id="poly-tv1">
<video id="poly-vid1" autoplay loop muted style="width: 320px; height: 180px;
position: relative; top: 30px; margin-bottom:30px; left:115px;" src="media/video.mp4">
Your browser does not support the video tag

</video>
</div>
									
								
							
							</div>
							<div class="shadow-poly"></div>
							<br><br>
							<div class="row vs_content" id="poly-buttons-bar">
								<div class="col-md-4" id="poly-button-1">
									<div id="b-effect" href="#" data-toggle="modal" data-target="#polyModel">
										<button id="poly-1-no-hover" class="poly-button vs_content"><img src="img/poly-image.png"/> &nbsp; تحميل الكاتلوج</button>
									</div>
									
								</div>
								<div class="col-md-4" id="poly-button-2">
									<div id="b-effect" href="#" >
										<button id="poly-2-no-hover" class="poly-button vs_content"><img src="img/poly-play.png"/> &nbsp; شاهد الفيديو</button>
									</div>
									
								</div>
								<div class="col-md-4" id="poly-button-3">
									<div id="b-effect">
										<button id="poly-3-no-hover" style="font-size:12px;" class="poly-button vs_content"><img src="img/poly-image1.png"/> تصفح الموقع الخاص</button>
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
				<div class="row">
					<div class="col-md-12">
						<h1  class="heading6 vs_header" style="display:none;text-align:right;margin:20px 0 15px 0;">الإتصال بنا</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8" style="float:right;">
						<p class="vs_content">تأسست مؤسسة  س.ع. صقر الدولية في جدة عام 1982 م ، في ستديو V-Studio   هي إحدى فروعها وتقدم حلولاً 

تسويقية مرئية شاملة من خدمات ومنتجات تقوم بتصميمها وتصنيعها لحسابها  تستفيد منها الأعمال الصغيرة والمتوسطة  

والكبيرة وشركات التسويق والدعاية والإعلان.  خدماتنا تُقدّم فقط عبر موقعنا الإلكتروني وتوزّع منتجاتنا من خلال موزعين 

معتمدين.</p>
					</div>
					<div class="col-md-1" style="float:right;"><div class="line2"></div></div>
					<div class="col-md-3" style="float:right;">
						
						<div class="media vs_content">
                            <span class="contactus_span">في ستديو إحدى أعمال</span><br />
									<a href="#" class="pull-right">
										<img src="img/sager-logo.jpg" class="media-object img-responsive" style="max-width:125px;"/>
									</a>
									
								</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-11">
						<h2 class="vs_header" style="margin:5px 0px; ">المركز الرئيسي:</h2>
						<div class="line1"></div>
						<div class="row">
							<div class="col-md-4" style="float:right;">
								<div class="media">
									<a href="#" class="pull-right" style="width:46px; text-align:center">
<span class="glyphicon glyphicon-map-marker contactus_span"></span>
										<!--<img class="media-object" src="img/mapmarker.png" class="img-responsive"/>-->
									</a>
									<div class="media-body vs_content">
										<address>
											الطابق التاسع ،  جميل سكوير<br>
تقاطع شارع الأمير محمد بن عبد العزيز  (التحلية) وشارع الأندلس، جدة<br>
ص.ب 40538 ، جدة 21511، المملكة العربية السعودية <br><br>

هاتف: +966 12-283 4088  .  قاكس  : +966 12-660 8128<br>
info@v-studio.co                                      <br />
                                            <br /><b>
									فروعنا: مكتب الرياض.  مكتب الخبر                      </b>
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
							<div class="col-md-1" style="float:right;"><div class="line2"></div></div>
                                                        <div class="col-md-6" style="float:right;">
								<h3 class="vs_header">أرسل لنا</h3>
<div class="form-horizontal" role="form">
  <div class="form-group col-md-12 pull-right">
    <label for="inputEmail3" class="col-sm-4 control-label vs_content" style="float:right;">الإسم</label>
    <div class="col-sm-8" style="float:right;">
      <input type="email" data-toggle="modal" data-target="#ContactModal" id="inputEmail3" placeholder="">
    </div>
  </div>
  <div class="form-group col-md-12 pull-right">
    <label for="inputPassword3" class="col-sm-4 control-label vs_content" style="float:right;">البريد الإلكتروني</label>
    <div class="col-sm-8" style="float:right;">
      <input type="password" data-toggle="modal" data-target="#ContactModal"  id="inputPassword3" placeholder="">
    </div>
  </div>
</div>
<div class="modal fade" id="ContactModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <a style="color:#000;"class="close" data-dismiss="modal"><span style="color:#000;" aria-hidden="true">&times;</span><span class="sr-only">Close</span></a>
        <h4 class="modal-title" id="myModalLabel">أرسل لنا</h4>
      </div>
      <div class="modal-body">
<form class="form-horizontal" role="form" method="" action="">
											<div class="form-group col-md-12">
<label class="col-sm-3 control-label pull-right">الإسم</label>
<div class="col-sm-9 pull-right">
												<input type="text" maxlength="255" name="telephone" value="" placeholder="الإسم *"/>
</div>
											</div>
<div class="form-group col-md-12">
<label class="col-sm-3 control-label pull-right">البريد الإلكتروني</label>
<div class="col-sm-9 pull-right">
												<input type="text" maxlength="255" name="telephone" value="" placeholder="البريد الإلكتروني *"/>
</div>
											</div>
											<div class="form-group col-md-12">
<label class="col-sm-3 control-label pull-right">العنوان</label>
<div class="col-sm-9 pull-right">
												<input type="text" maxlength="255" name="telephone" value="" placeholder="العنوان *"/>
</div>
											</div>
<div class="form-group col-md-12">
<label class="col-sm-3 control-label pull-right">الهاتف</label>
<div class="col-sm-9 pull-right">
												<input type="text" maxlength="255" name="telephone" value="" placeholder="الهاتف *"/>
</div>
											</div>
<div class="form-group col-md-12">
<label class="col-sm-3 control-label pull-right">الهاتف</label>
<div class="col-sm-9 pull-right">
												<input type="text" maxlength="255" name="telephone" value="" placeholder="الهاتف *"/>
</div>
											</div>
<div class="form-group col-md-12">
<label class="col-sm-3 control-label pull-right">الموضوع</label>
<div class="col-sm-9 pull-right">
												<input type="text" maxlength="255" name="telephone" value="" placeholder="الموضوع *"/>
</div>
											</div>
<div class="form-group col-md-12">
<label class="col-sm-3 control-label pull-right">الرسالة</label>
<div class="col-sm-9 pull-right">
												<textarea style="height:70px;" rows="2" name="telephone" value="" placeholder=""></textarea>
</div>
											</div>
<div class="form-group col-md-12">
<label class="col-sm-3 control-label pull-right">Captcha</label>
<div class="col-sm-9 pull-right">
										<div class="row">
<div class="col-sm-12 pull-right">
										<div class="col-sm-5 pull-right">	
											<div style="margin:0px; height:40px; padding-top:0px; line-height:35px; font-size:24px;"class="captcha-box text-center">J K L 7 8 O</div>
										</div>
										<div class="col-sm-7 pull-right">
											<input type="text" maxlength="255" name="captcha" value="" placeholder=""/>
										</div>
</div>
</div>
</div>
									</div>
									
									<div class="row">
										<div class="col-md-12">
											<div class="form-group col-md-12">
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
                                      
						</div>
					</div>
					<div class="col-md-1" style="padding-top:60px; cursor:pointer;">
						
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 text-center vs_content">
						<span class="contactus_span">نسعد بلقاء عملائنا  ونرغب في منحهم الوقت الكافي ، لذى نقّدر لهم تفهمهم وترتيب موعد مسبق للزيارة . </span>
					</div>
				</div>
				
			</div>

			<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script><div style="overflow:hidden;width:100%;"><div id="gmap_canvas" style="width:100%;height:140px;"></div><style>#gmap_canvas img{max-width:none!important;background:none!important}</style></div><script type="text/javascript"> function init_map() { var myOptions = { zoom: 16, center: new google.maps.LatLng(21.549454, 39.153385), mapTypeId: google.maps.MapTypeId.ROADMAP }; map = new google.maps.Map(document.getElementById("gmap_canvas"), myOptions); marker = new google.maps.Marker({ map: map, position: new google.maps.LatLng(21.549454, 39.153385) }); infowindow = new google.maps.InfoWindow({ content: "<b>MTSA</b> " }); google.maps.event.addListener(marker, "click", function () { infowindow.open(map, marker); }); } google.maps.event.addDomListener(window, 'load', init_map);</script>			

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
						<h1  class="heading7" style="color:#dfd9e6;text-align:center; display:none;margin-top:0;">PORTFOLIO & TESTIMONIALS</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 text-center">
						<h2 class="vs_header" style="margin-top:-20px;">شاهد أحدث أعمالنا وماذا يقول عملاؤنا عنا</h2>
					</div>
				</div>
				
				<div class="row" id="portfolio-carousel" >
					<div class="center-block" style="overflow:hidden;height:385px;text-align:center;margin-bottom:5px;" id="default_port">					 	
						<img src="img/portfolio_def2.jpg" style="max-height:460px;margin-top:-40px;"/>
					</div>

                    <div class="portfolio_grid center-block" id="portfolio_grid">
                        <div class="galleryContainer customizable">
                            <div class="col-lg-12 col-md-12 col-sm-12 clearfix">
                            <a href="#" class="gallery-back" style="float:left;">
                                <img src="img/arrow_left.png" style="max-width:30px;"/></a>

                            <a href="#" style="float:right;" class="closePortfolio">
                                <img src="img/close.png" style="max-width:20px;"/></a>
                            <!-- Back button -->
                            </div>
                            <ul class="gallery-grid column3">
                                <!-- Main grid container having 3 columns -->
                                <li>
                                    <!-- Grid Item 1 -->
                                    <div class="child-container">
                                        <!-- Grid Item Container --> 
                                      
                    <a href="#" class="open-gallery">
                         <img src="img/portfolio/logos/logo1_8.png" /></a>
                                        <span class="item-caption">تصوير وإنتاج 3 أفلام مدتها 30 دقيقة عن تعليمات السلامة والصحة وبأربع لغات مختلفة (العربية والإنجليزية و الأردو والفلبينية) .
تم التصوير من قبل طاقم صقر في ستديو بمناجم شركة معادن الذهب والمكتب الرئيسي للشركة ولمدة سبعة أيام عمل . تم التقاط الكثير من الصور الفوتوغرافية الإحترافية أثناء التصوير لإستخدامها في الإنتاج. 
تنوي شركة معادن للذهب إستخدام هذه الأفلام في التدريب وورش العمل ولإرشاد الزوار والمقاولين بتعليمات السلامة قبل زيارتهم للمناجم. 
.  </span>
                                        <div class="inner_caption">
                                        إنتـاج الفيديو
                                            </div>
                                        <!-- Button to expand its gallery -->
                                    </div>

                                     <ul class="gallery-grid subgallery column1">
                                        <!-- Subgallery of Grid Item 1 having 4 columns -->
                                        <li>
                                            <img src="http://img.youtube.com/vi/AI_npbN_ywQ/0.jpg" id="logo1_thumb" />
                                            <img src="images/icons/play.png" style="max-width:150px;position:absolute;top:20%;left:40%;z-index:1;cursor:pointer" id="logo1_play" />
                                            <div id="logo1_video" style="width:100%;height:355px;" data-vedioid="AI_npbN_ywQ"></div>
                                        </li>

                                    </ul>

                                </li>

                                <li>
                                    <!-- Grid Item 1 -->
                                    <div class="child-container">
                                        <!-- Grid Item Container -->
                                       
                                    <a href="#" class="open-gallery">
                                        <img src="img/portfolio/logos/Logo2.png" /></a>
                                        <span class="item-caption">تصوير وإنتاج فيلم مدته 5 دقائق يعمل على تعريف خدمة المولدات المتنقلة المستخدمة عند إنقطاع التيار الكهربائي كخدمة جديدة متميزة تقدمها الشركة السعودية للكهرباء للمشتركين. تم تصوير الفيديو في منشاءات الشركة السعودية للكهرباء ومن على شاحناتها اثناء القيادة ، وأنتج باللغة العربية فقط. تسعى الشركة من خلال هذا الفيديو لتعريف العامة بخدماتها الجديدة المبتكرة. 
تم تصوير الفيلم في ثلاثة أيام عمل واستخدمت في التصوير كاميرات داخل الشاحنات ورافعات بالاضافة للمعدات الأخرى التقليدية.
</span>
                                         <div class="inner_caption">
                                        إنتـاج الفيديو
                                            </div>
                                       <!-- Button to expand its gallery -->
                                    </div>

                                    <ul class="gallery-grid subgallery column1">
                                        <!-- Subgallery of Grid Item 1 having 4 columns -->
                                        <li>
                                            <img src="http://img.youtube.com/vi/EgGuaAveLRg/0.jpg" id="logo2_thumb" />
                                            <img src="images/icons/play.png" style="max-width:150px;position:absolute;top:20%;left:40%;z-index:1;cursor:pointer" id="logo2_play" />
                                            <div id="logo2_video" style="width:100%;height:355px;" data-vedioid="EgGuaAveLRg"></div>
                                        </li>

                                    </ul>

                                </li>

                                <li>
                                    <!-- Grid Item 1 -->
                                    <div class="child-container">
                                        <!-- Grid Item Container -->
                                        
                    <a href="#" class="open-gallery">
                        <img src="img/portfolio/logos/logo03.jpg" />
                    </a>
                                        <span class="item-caption">تصوير وإنتاج فيلم مدته 5 دقائق يعمل على تسليط الضوء على مشاركة الخليجيون للمطابخ بمعرض الديكور السعودي بجده ، 
كشركة رائدة في تصنيع المطابخ في المملكة العربية السعودية ، رغبت الشركة في تصوير مشاركتها بالمعرض وتوثيقها وإطلاع عملائها على مشاركاتها بالفعاليات المختلفة . تم تصوير الفيلم أثناء الفعالية وشمل عدة لقاءات مع مديري الشركة وبعض عملائها .
</span>
                                        <div class="inner_caption">
                                        إنتـاج الفيديو
                                            </div>
                                        <!-- Button to expand its gallery -->
                                    </div>

                                     <ul class="gallery-grid subgallery column1">
                                        <!-- Subgallery of Grid Item 1 having 4 columns -->
                                        <li>
                                            <img src="http://img.youtube.com/vi/VLFDXCoeWwc/0.jpg" id="logo3_thumb" />
                                            <img src="images/icons/play.png" style="max-width:150px;position:absolute;top:20%;left:40%;z-index:1;cursor:pointer" id="logo3_play" />
                                            <div id="logo3_video" style="width:100%;height:355px;" data-vedioid="VLFDXCoeWwc"></div>
                                        </li>

                                    </ul>

                                </li>

                                <li>
                                    <!-- Grid Item 1 -->
                                    <div class="child-container">
                                        <!-- Grid Item Container -->
                                        
                    <a href="#" class="open-gallery">
                         <img src="img/portfolio/logos/logo04_07.jpg" /></a>
                                        <span class="item-caption">تصوير وإنتاج فيلم مدته 5 دقائق يعمل على تعريف العملاء بمصانع ومنتجات مجموعة البراك الصناعية ، إحدى الشركات الصناعية الرائدة في المملكة العربية السعودية المصنّعة للأبواب الأتوماتيكة ، والزجاج والبلاستيك القماش والغازات ومقرها الأحساء بالمنطقة الشرقية من المملكة العربية السعودية. تم تصوير الفيلم في 3 ايام في عدد من مصانع المجموعة وتضمن لقاء مع الرئيس التنفيذي وانتاج بعض فيديوهات المحاكاة التي أدمجت في الإنتاج النهائي للفيديو.  </span>
                                        <div class="inner_caption">
                                        إنتـاج الفيديو
                                            </div>
                                        <!-- Button to expand its gallery -->
                                    </div>

                                     <ul class="gallery-grid subgallery column1">
                                        <!-- Subgallery of Grid Item 1 having 4 columns -->
                                        <li>
                                            <img src="http://img.youtube.com/vi/3FNu7hJL9is/0.jpg" id="logo4_thumb" />
                                            <img src="images/icons/play.png" style="max-width:150px;position:absolute;top:20%;left:40%;z-index:1;cursor:pointer" id="logo4_play" />
                                            <div id="logo4_video" style="width:100%;height:355px;" data-vedioid="3FNu7hJL9is"></div>
                                        </li>

                                    </ul>

                                </li>

                                <li>
                                    <!-- Grid Item 1 -->
                                    <div class="child-container">
                                        <!-- Grid Item Container -->
                                        
                    <a href="#" class="open-gallery">
                        <img src="img/portfolio/logos/logo5.png" />
                    </a>
                                        <span class="item-caption">إنتاج  فيديو توضيحي من الرسوم المتحركة (أنيميشن) لحساب الإدارة العامة للمرور بالمملكة العربية السعودية لشرح نظام الإعتراض على مخالفات الرصد الآلي "ســاهر" . تم إنتاج الفيديو وتسليمه خلال خمسة أيام لشركة مشاريع التكنولوجيا إحدى الشركات السعودية الرائدة في تطوير البرامج والحلول التقنية بما في ذلك الصوت المقدّم باللغة العربية فقط . 
الفيديو التوضيحي يعمل على إرشاد العامة لكيقية إستخدام بوابة وزارة الداخلية الإلكترونية وتسجيل إعتراض في حال إستلام سائق المركبة لمخالفة مرورية.
</span>
                                        <div class="inner_caption">
                                        إنتاج الرسوم المتحركة
                                            </div>
                                        <!-- Button to expand its gallery -->
                                    </div>

                                     <ul class="gallery-grid subgallery column1">
                                        <!-- Subgallery of Grid Item 1 having 4 columns -->
                                        <li>
                                            <img src="http://img.youtube.com/vi/F6VsJbjqHCs/0.jpg" id="logo5_thumb" />
                                            <img src="images/icons/play.png" style="max-width:150px;position:absolute;top:20%;left:40%;z-index:1;cursor:pointer" id="logo5_play" />
                                            <div id="logo5_video" style="width:100%;height:355px;" data-vedioid="F6VsJbjqHCs"></div>
                                        </li>

                                    </ul>

                                </li>

                                <li>
                                    <!-- Grid Item 1 -->
                                    <div class="child-container">
                                        <!-- Grid Item Container -->
                                        
                    <a href="#" class="open-gallery"><img src="img/portfolio/logos/logo06.png" /></a>
                                        <span class="item-caption">
                                            موقع الكتروني خارج المألوف  تم تصميمه بتقنية الموقع الصفحة الواحدة التفاعلي والمختلف المنظروبنظام التحكم في المحتوى لحساب MTSA وهي إحدى الأعمال الشقيقة ل V-Studio والتابعة  لصقر الدولية وتنتج أنظمة منصات الشاشات المعلوماتية التي تعمل باللمس واللوحات الإعلانية الرقمية  وتتطور برامج وتطبيقات للشاشات التي تعمل باللمس.
كجميع تصاميمنا للمواقع الإلكترونية لا نستخدم قوالب مصممة مسبقا وانما تم تصميم كل صفحة وجزء بالموقع بعناية كاملة لإيصال الرسالة المطلوبة بافضل أشكالها . الموقع تم تصميمه بشكل يتوافق مع أجهزة الهواتف الذكية  والكمبيوتر اللوحي لضمان أكبر قدر من المشاهدة والتصفح. أنقر <a href="http://www.mtsakiosk.com" target="_blank"> هنـا</a> لزيارة الموقع

                                        </span>
                                        <div class="inner_caption">
                                        تصميم مواقع الكترونية
                                            </div>
                                        <!-- Button to expand its gallery -->
                                    </div>

                                    <ul class="gallery-grid subgallery column1">
                                        <!-- Subgallery of Grid Item 1 having 4 columns -->
                                        <li>
                                            <img src="img/portfolio/logos/Portfolio06.jpg" />
                                        </li>

                                    </ul>

                                </li>

                                <li>
                                    <!-- Grid Item 1 -->
                                    <div class="child-container">
                                        <!-- Grid Item Container -->
                                        <a href="#" class="open-gallery"><img src="img/portfolio/logos/logo04_07.jpg" /></a>
                                        <span class="item-caption">
                                            موقع الكتروني من أكثر من 30 صفحة ، تفاعلي مع عدد من اللوحات الفلاش ، وفيديو وأعمال برمجة. ونظام التحكم بالمحتوى، الموقع يسلط الضوء على تعريف العملاء بمجموعة البراك الصناعية ومنتجاتها .
كجميع تصاميمنا للمواقع الإلكترونية لا نستخدم قوالب مصممة مسبقا وانما تم تصميم كل صفحة وجزء بالموقع بعناية كاملة لإيصال الرسالة المطلوبة بافضل أشكالها ، أنقر <a href="http://www.al-barrakgroup.com" target="_blank"> هنـا</a> لزيارة الموقع

                                        </span>
                                        <div class="inner_caption">
                                        تصميم مواقع الكترونية
                                            </div>
                                        <!-- Button to expand its gallery -->
                                    </div>

                                    <ul class="gallery-grid subgallery column1">
                                        <!-- Subgallery of Grid Item 1 having 4 columns -->
                                        <li>
                                            <img src="img/portfolio/logos/Portfolio07.jpg" />
                                        </li>

                                    </ul>

                                </li>

                                <li>
                                    <!-- Grid Item 1 -->
                                    <div class="child-container">
                                        <!-- Grid Item Container -->
                                       
                    <a href="#" class="open-gallery">
                        <img src="img/portfolio/logos/logo1_8.png" />
                    </a>
                                        <span class="item-caption">إنتاج  فيديو تعليمي من الرسوم المتحركة (أنيميشن) لحساب شركة معادن للذهب مدته 6 دقائق كجزء من مسئولية الشركة الإجتماعية.
تهدف الشركة من وراء إنتاج هذا الفيديو إلى زيادة معرفة الطلاب بنشاط شركة معادن للذهب ودورها الفعال في المشاركة في تنمية الإقتصاد الوطني. 
الفيديو تضمن معلومات عن مناجم الشركة وأعمال التعدين بالإضافة لتعليمات السلامة الخاصة بالزوار. 

</span>
                                        <div class="inner_caption">
                                        إنتاج الرسوم المتحركة
                                            </div>
                                        <!-- Button to expand its gallery -->
                                    </div>

                                     <ul class="gallery-grid subgallery column1">
                                        <!-- Subgallery of Grid Item 1 having 4 columns -->
                                        <li>
                                            <img src="http://img.youtube.com/vi/rft4CS57Uyg/0.jpg" id="logo8_thumb" />
                                            <img src="images/icons/play.png" style="max-width:150px;position:absolute;top:20%;left:40%;z-index:1;cursor:pointer" id="logo8_play" />
                                            <div id="logo8_video" style="width:100%;height:355px;" data-vedioid="rft4CS57Uyg"></div>
                                        </li>

                                    </ul>

                                </li>

                                <li>
                                    <!-- Grid Item 1 -->
                                    <div class="child-container">
                                        <!-- Grid Item Container -->
                                      
                    <a href="#" class="open-gallery">
                        <img src="img/portfolio/logos/logo09.png" /></a>
                                        <span class="item-caption">كانت مشاركة جامعة الطائف في معرض التعليم العالي بالرياض 2014 مميزة ولافتة لنظر الحضور. قامت الجامعة باستخدام وحدة عرض الهولوجرام "هولوكونيك" والمتحدث الإفتراضي "هوست توك" في جناحها مما اثار إعجاب الكثير من الجمهور وخلق تواجدا ضخما من الزوار حول الجناح. إستخدمت جامعة الطائف هذه الأدوات التسويقسة المبتكرة للتعريف بالجامعة وتاريخها وخططها المستقبلية التوسعية. </span>
                                        <div class="inner_caption">
                                        الهولوجرام والمتحدث الإفتراضي 
                                            </div>
                                        <!-- Button to expand its gallery -->
                                    </div>

                                    <ul class="gallery-grid subgallery column1">
                                        <!-- Subgallery of Grid Item 1 having 4 columns -->
                                        <li>
                                            <img src="http://img.youtube.com/vi/sFbaauPL_iM/0.jpg" id="logo9_thumb" />
                                            <img src="images/icons/play.png" style="max-width:150px;position:absolute;top:20%;left:40%;z-index:1;cursor:pointer" id="logo9_play" />
                                            <div id="logo9_video" style="width:100%;height:355px;" data-vedioid="sFbaauPL_iM"></div>
                                        </li>

                                    </ul>

                                </li>

                                <li>
                                    <!-- Grid Item 1 -->
                                    <div class="child-container">
                                        <!-- Grid Item Container -->
                                        
                    <a href="#" class="open-gallery">
                         <img src="img/portfolio/logos/logo10.png" /></a>
                                        <span class="item-caption">تصوير وإنتاج فيلم مدته 12 دقيقة يعمل على تعريف العملاء بمنتجات شركة زان الحديثة المحدودة ، إحدى الشركات الرائدة في مجال توريد معدات المساحة في المملكة العربية السعودية ، مع التركيز على أحدث مشاريعها "/شروع قطار الرياض" . قامت في ستديو بصياغة نص الفيديو باللغة الإنجليزية بالإضافة لخلق الجملة التسويقية الخاصة بالشعار بالاضافة لتصوير وانتاج الفيديو </span>
                                        <div class="inner_caption">
                                        إنتـاج الفيديو
                                            </div>
                                        <!-- Button to expand its gallery -->
                                    </div>

                                     <ul class="gallery-grid subgallery column1">
                                        <!-- Subgallery of Grid Item 1 having 4 columns -->
                                        <li>
                                            <img src="http://img.youtube.com/vi/kaM3kCv-UR0/0.jpg" id="logo10_thumb" />
                                            <img src="images/icons/play.png" style="max-width:150px;position:absolute;top:20%;left:40%;z-index:1;cursor:pointer" id="logo10_play" />
                                            <div id="logo10_video" style="width:100%;height:355px;" data-vedioid="kaM3kCv-UR0"></div>
                                        </li>

                                    </ul>

                                </li>


                            </ul>

                        </div>
                    </div>

                    <div class="center-block" style="overflow:hidden;height:320px;text-align:center;" id="default_test">    					 	
						<img src="img/portfolio/4.jpg" style="max-height:320px;"/>
					</div>

                    <div class="testmon_grid center-block" id="testmon_grid">
                        <div class="galleryContainer customizable " style="max-width:100% !important;">
                            <div class="col-lg-12 col-md-12 col-sm-12 clearfix">
                            

                            <a href="#" style="float:right;" class="closetestmon">
                                <img src="img/close.png" style="max-width:20px;"/></a>
                            <!-- Back button -->
                            </div>
                            <ul class="gallery-grid column1">
                                <!-- Main grid container having 3 columns -->
                                <li>
                                    <!-- Grid Item 1 -->
                                    <img src="images/icons/play.png" style="max-width:150px;position:absolute;top:30%;left:40%;z-index:1;cursor:pointer" id="testmon_play" />
                                    <div id="testmon_vedio" style="width:100%;height:355px;" data-vedioid="RYcb-PrkAqg"></div>
                                       <%--<iframe width="560" height="355" src="https://www.youtube.com/embed/RYcb-PrkAqg" frameborder="0" allowfullscreen></iframe>--%>
                                    
                                   

                                </li>                                



                            </ul>

                        </div>
                    </div>
					    
				</div>                                
				<div class="row">
					<div class="col-md-12 text-center">
                         <a href="#" class="btn btn-default vs_content" style="width:150px;font-weight:bold;" onclick="$('#portfolio_grid').delay(300).fadeIn(300);$('#default_port').fadeOut(300);$('#testmon_grid').fadeOut(300);">أعمــال حديثـة</a> &nbsp; &nbsp; &nbsp; 
                        <a href="#" class="btn btn-default vs_content" style="width:150px;font-weight:bold;"  onclick="$('#testmon_grid').delay(300).fadeIn(300);$('#default_port').fadeOut(300);$('#portfolio_grid').fadeOut(300);">شهادات العملاء</a>
                        <br />
						<img src="img/comma.png" width="18" height="17"/>
						<p class="vs_content" id="port-text-def">إختر أحد أحدث أعمالنا من خدمات الوسائط الإعلامية أو أحد مشاريع منتجاتنا الحديثة وأنقر على الصورة للمشاهدة وقراءة المزيد من التفاصيل 
تستطيع أيضا وبالفيديو الإطلاع على بعض شهادات عملائنا وبدون اي تزييف لشهادات عملاء وهميين. </p>
                        <p id="port-text-caption"></p>
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
						<h1  class="heading8 pull-right text-right vs_header" style="display:none; text-align:right">إنضم إلينا</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10 col-md-offset-1 ">
						<p class="vs_content">هل تبحث عن إستثمار مجزئ في بيئة عمل  تعزّز الرفاهية والنمو ، ولديك الإستعداد لإستثمار القليل من المال لتصبح موزعاً لنا ؟<span style="color:#09a0f8;font-size:18px;"> إتصل بنا </span><br>
هل تتمتع بالشخصية المنتجة والمبتكرة وترغب في العمل كممثل مبيعات مستقل أو مقدّم صوت فيديو أو  مقدّما للمواقع الإلكترونية أو تزاول مهنة تصوير الفيديو الإحترافي ؟ <span style="color:#09a0f8;font-size:18px;"> إنضم الينا </span></p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<h2 class="vs_header">أكتب إلينا</h2>

						<div class="vs_content">
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
						</div>
						
					</div>
				</div>
			</div>
			</div>
		</div>
	</section>
</asp:Content>
