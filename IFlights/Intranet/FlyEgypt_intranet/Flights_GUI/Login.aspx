<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Flights_GUI.Login" %>


<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>I-Flights - Fly Egypt - login</title>
		<meta name="description" content="I-Valley">
		<meta name="author" content="I-Valley">
		
		<!-- Mobile Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		
		<!-- Put favicon.ico and apple-touch-icon(s).png in the images folder -->
	    
		    	
		<!-- CSS StyleSheets -->
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800&amp;amp;subset=latin,latin-ext">
		<link rel="stylesheet" href="../ThemesFiles/ExceptionsLight/css/font-awesome.min.css">        
		<link rel="stylesheet" href="../ThemesFiles/ExceptionsLight/css/animate.css">
		<link rel="stylesheet" href="../ThemesFiles/ExceptionsLight/css/prettyPhoto.css">
		<link rel="stylesheet" href="../ThemesFiles/ExceptionsLight/css/slick.css">
		<link rel="stylesheet" href="../ThemesFiles/ExceptionsLight/rs-plugin/css/settings.css">
		<link rel="stylesheet" href="../ThemesFiles/ExceptionsLight/css/style.css">
		<link rel="stylesheet" href="../ThemesFiles/ExceptionsLight/css/responsive.css">
		<!--[if lt IE 9]>
	    	<link rel="stylesheet" href="../ThemesFiles/ExceptionsLight/css/ie.css">
	    	<script type="text/javascript" src="../ThemesFiles/ExceptionsLight/js/html5.js"></script>
	    <![endif]-->

		
		<!-- Skin style (** you can change the link below with the one you need from skins folder in the css folder **) -->
		<link rel="stylesheet" href="../ThemesFiles/ExceptionsLight/css/skins/default.css">
        <link rel="stylesheet" href="../ThemesFiles/ExceptionsLight/css/skins/skin6.css">
	    <!-- Load JS siles -->	
 		<script type="text/javascript" src="../ThemesFiles/ExceptionsLight/js/jquery.min.js"></script>
	    
	    <!-- Waypoints script -->
		<script type="text/javascript" src="../ThemesFiles/ExceptionsLight/js/waypoints.min.js"></script>
		
		<!-- SLIDER REVOLUTION SCRIPTS  -->
		<script type="text/javascript" src="../ThemesFiles/ExceptionsLight/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
		<script type="text/javascript" src="../ThemesFiles/ExceptionsLight/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
		
		<!-- Animate numbers increment -->
		<script type="text/javascript" src="../ThemesFiles/ExceptionsLight/js/jquery.animateNumber.min.js"></script>
		
		<!-- slick slider carousel -->
		<script type="text/javascript" src="../ThemesFiles/ExceptionsLight/js/slick.min.js"></script>
		
		<!-- Animate numbers increment -->
		<script type="text/javascript" src="../ThemesFiles/ExceptionsLight/js/jquery.easypiechart.min.js"></script>
		
		<!-- PrettyPhoto script -->
		<script type="text/javascript" src="../ThemesFiles/ExceptionsLight/js/jquery.prettyPhoto.js"></script>
		
		<!-- Input placeholder plugin -->
		<script type="text/javascript" src="../ThemesFiles/ExceptionsLight/js/jquery.placeholder.js"></script>
		
		<!-- NiceScroll plugin -->
		<script type="text/javascript" src="../ThemesFiles/ExceptionsLight/js/jquery.nicescroll.min.js"></script>
		<style type="text/css">
        .rgMasterTable, .RadTreeView_Default {
            font-family:'Ubuntu', sans-serif !important;
        }
            .RadTreeView_Default .rtSelected .rtIn {
                background:none #32C2CD !important;
            }
            .RadTreeView_Default .rtHover .rtIn {
                background:none #3be1ee !important;
            }
            .RadTreeView_Default, .RadTreeView_Default a.rtIn, .RadTreeView_Default .rtEdit .rtIn input {
                font-size:inherit !important;
            }
        .RadGrid_Office2007, .RadGrid_Office2007 .rgMasterTable, .RadGrid_Office2007 .rgDetailTable, .RadGrid_Office2007 .rgGroupPanel table, .RadGrid_Office2007 .rgCommandRow table, .RadGrid_Office2007 .rgEditForm table, .RadGrid_Office2007 .rgPager table, .GridToolTip_Office2007 {
            font-size:13px !important;
        }
		    .login-box table {
		   border:0 !important;
                 }
		    .login-box {
		    padding:0 !important;
            }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#loginLink').trigger('click');
        });
    </script>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body id="login-body">
     <!-- site preloader start -->
	    <div class="page-loader">
	    	<div class="loader-in"></div>
	    </div>
	    <!-- site preloader end -->
	    
    <form id="form1" runat="server">
    
    <div class="pageWrapper">
		    
		    <!-- login box start -->
        <div class="login-box">
        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                <asp:Login ID="Login1" runat="server">
            <LayoutTemplate>
                
				<a class="close-login" href="#"><i class="fa fa-times"></i></a>
				
					<div class="container">
						
						<div class="login-controls">
							<div class="skew-25 input-box left">								                                
                                <asp:TextBox ID="UserName" runat="server" CssClass="txt-box skew25" placeholder="Username"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="ctl00$Login1">*</asp:RequiredFieldValidator>
							</div>
							<div class="skew-25 input-box left">								                                
                                <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="txt-box skew25" placeholder="Password" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="ctl00$Login1">*</asp:RequiredFieldValidator>
							</div>
							<div class="left skew-25 main-bg">								                                
                                 <asp:Button ID="LoginButton" runat="server" CommandName="Login" CssClass="btn skew25" Text="Login" ValidationGroup="ctl00$Login1" />
							</div>
                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
							
						</div>
					</div>
				
			               
            </LayoutTemplate>
            
            </asp:Login>
            </AnonymousTemplate>
            <LoggedInTemplate>
                <asp:LoginStatus ID="LoginStatus1" runat="server" />
            </LoggedInTemplate>
        </asp:LoginView>
        </div> 
			
			<!-- login box End -->

			<!-- Header Start -->
			<div id="headWrapper" class="clearfix">
		    	
		    	<!-- top bar start -->
		    	<div class="top-bar">
				    <div class="container">
						<div class="row">
							<div class="cell-5">
							    
							</div>
							<div class="cell-7 right-bar">
					    		<ul class="right">
						    	    
						    	    <li><a href="#" class="login-btn" id="loginLink"><i class="fa fa-unlock-alt"></i> Login</a></li>
						        </ul>
							</div>
						</div>
				    </div>
			    </div>
			    <!-- top bar end -->
			    
			    <!-- Logo, global navigation menu and search start -->
			    <header class="top-head" data-sticky="true">
				    <div class="container">
					    <div class="row">
					    	<div class="logo cell-3">
						    	<a href="home.html"></a>
						    </div>
						    <div class="cell-9 top-menu">
							     
                                
							    <!-- top navigation menu start -->
							    <%--<nav class="top-nav">
								    <ul>
								      
								      <li><a href="#"><i class="fa fa-key"></i><span>Headers</span></a>
									      <ul>
										      <li><a href="home.html">Navigation 1</a></li>
										      <li><a href="nav-2.html">Navigation 2</a></li>
										      <li><a href="nav-3.html">Navigation 3</a></li>
										      <li><a href="mega-menu.html">Mega Menu</a></li>
										      <li><a href="nav-sticky.html">Sticky Navigation</a></li>
										      <li><a href="header2.html">Header 2</a></li>
										      <li><a href="header3.html">Header 3</a></li>
									      </ul>
								      </li>
								      <li><a href="#"><i class="fa fa-gift"></i><span>Portfolio</span></a>
								      		<ul>
										      <li><a href="portfolio-2-cols.html">Portfolio 2 columns</a></li>
										      <li><a href="portfolio-3-cols.html">Portfolio 3 columns</a></li>
										      <li><a href="portfolio-4-cols.html">Portfolio 4 columns</a></li>
										      <li><a href="portfolio-full.html">Portfolio full</a></li>
										      <li><a href="portfolio-single.html">Portfolio single</a></li>
										      <li><a href="portfolio-single2.html">Portfolio single 2</a></li>
									      </ul>
								      </li>
								      <li><a href="#"><i class="fa fa-copy"></i><span>Pages</span></a>
								      		<ul>
										      <li><a href="about-us.html">About us</a></li>
										      <li><a href="about-me.html">About me</a></li>
										      <li><a href="FAQ.html">FAQ</a></li>
										      <li><a href="find-job.html">Find a job</a></li>
										      <li><a href="pricing.html">Pricing</a></li>
										      <li><a href="services.html">Services</a></li>
										      <li><a href="#">Meet the team</a>
										      	<ul>
										      		<li><a href="team.html">Meet the team Style 1</a></li>
										      		<li><a href="team2.html">Meet the team Style 2</a></li>
										      	</ul>
										      </li>
										      <li><a href="page-full.html">Page Full width</a></li>
										      <li><a href="page-sidebar.html">Page with Sidebar</a></li>
										      <li><a href="page-left-bar.html">Page with Left Sidebar</a></li>
										      <li><a href="404.html">404 Page not found</a></li>
										      <li><a href="coming-soon.html">Coming Soon</a></li>

									      </ul>
								      </li>
								      <li><a href="#"><i class="fa fa-suitcase"></i><span>Shop</span></a>
								      		<ul>
								      			<li><a href="#">Shop Products listing</a>
							      					<ul>
							      						<li><a href="shop-right-bar.html">Right Side Bar</a></li>
							      						<li><a href="shop.html">Left Side Bar</a></li>
							      						<li><a href="shop-no-bar.html">No side bar</a></li>
							      					</ul>
								      			</li>
								      			<li><a href="#">Product Page</a>
								      				<ul>
							      						<li><a href="product-right-bar.html">Right Side Bar</a></li>
							      						<li><a href="product.html">Left Side Bar</a></li>
							      						<li><a href="product-no-bar.html">No side bar</a></li>
							      					</ul>
								      			</li>
								      			<li><a href="cart.html">Shoping cart</a></li>
								      			<li><a href="check-out.html">Check out</a></li>
								      		</ul>
								      </li>
								      <li><a href="#"><i class="fa fa-book"></i><span>Blog</span></a>
								      		<ul>
										      <li><a href="#">Blog Large Image</a>
										      		<ul>
										      			<li><a href="blog.html">Right Side Bar</a></li>
										      			<li><a href="blog-left-bar.html">Left Side Bar</a></li>
										      			<li><a href="blog-no-bar.html">No side bar</a></li>
										      		</ul>
										      </li>
										      <li><a href="#">Blog Small Image</a>
										      		<ul>
										      			<li><a href="blog-thumbnails.html">Right Side Bar</a></li>
										      			<li><a href="blog-thumbnails-left-bar.html">Left Side Bar</a></li>
										      			<li><a href="blog-thumbnails-no-bar.html">No side bar</a></li>
										      		</ul>
										      </li>
										      <li><a href="#">Blog masonry</a>
										      		<ul>
										      			<li><a href="blog-masonry.html">Right Side Bar</a></li>
										      			<li><a href="blog-masonry-left-bar.html">Left Side Bar</a></li>
										      			<li><a href="blog-masonry-no-bar.html">No side bar</a></li>
										      		</ul>
										      </li>
										      <li><a href="#">Blog Single</a>
										      		<ul>
										      			<li><a href="blog-single.html">Right Side Bar</a></li>
										      			<li><a href="blog-single-left-bar.html">Left Side Bar</a></li>
										      			<li><a href="blog-single-no-bar.html">No side bar</a></li>
										      		</ul>
										      </li>
										      
									      </ul>
								      </li>
								      <li><a href="#"><i class="fa fa-leaf"></i><span>Elements</span></a>
								      		<ul>
										      <li><a href="columns.html">Columns</a></li>
										      <li><a href="elements.html">Page Elements</a></li>
										      <li><a href="#">Page Title</a>
										      	<ul>
										      		<li><a href="page-title.html">Page Title 1</a></li>
										      		<li><a href="page-title2.html">Page Title 2</a></li>
										      		<li><a href="page-title3.html">Page Title 3</a></li>
										      		<li><a href="page-title4.html">Page Title 4</a></li>
										      	</ul>
										      </li>
										      <li><a href="typography.html">Typography</a></li>
										      <li><a href="font-icons.html">Icons</a></li>
									      </ul>
								      </li>
								      <li><a href="#"><i class="fa fa-phone"></i><span>Contact</span></a>
								      	<ul>
								      		<li><a href="contact.html">Contact 1</a></li>
								      		<li><a href="contact.php">Contact 1 + PHP Captcha</a></li>
								      		<li><a href="contact2.html">Contact 2</a></li>
								      		<li><a href="contact2.php">Contact 2 + PHP Captcha</a></li>
								      		<li><a href="contact3.html">Contact 3</a></li>
								      		<li><a href="contact3.php">Contact 3 + PHP Captcha</a></li>
								      		<li><a href="contact4.html">Contact 4</a></li>
								      		<li><a href="contact4.php">Contact 4 + PHP Captcha</a></li>
								      	</ul>
								      </li>
								    </ul>
							    </nav>--%>
							    <!-- top navigation menu end -->
							    
							    <!-- top search start -->
							    <!-- top navigation menu end -->
							    
							    <!-- top search start -->
							    
							    <!-- top search end -->

							    <!-- top search end -->
							</div>
					    </div>
				    </div>
			    </header>
			    <!-- Logo, Global navigation menu and search end -->
			    
			</div>
			<!-- Header End -->
			
			<!-- Content Start -->
			<div id="contentWrapper">
                <div class="page-title title-1">
					<div class="container">
						<div class="row">
							<div class="cell-12">
								<h1 class="fx animated fadeInLeft" data-animate="fadeInLeft">
                                   Welcome to Fly Egypt Intranet</h1>								
							</div>
						</div>
					</div>
				</div>
			<div class="sectionWrapper" style="padding-top:40px;">
                <div class="container">
                    <div class="cell-12">                        
                        <img src="images/slide-1-img.png" style="display:block;margin:0 auto;" data-animate="fadeInLeft" class="fx animated fadeInLeft"/>
				<asp:login id="Login1" runat="server" RenderOuterTable="False" Visible="false">
        <LayoutTemplate>
                        <div class="control-wrap">
                          
                            <div class="control-group">
                                
                                        <%--<input id="input-username" type="text" placeholder="Username" />--%>
                                        <asp:TextBox ID="UserName" runat="server" placeholder="Username"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                        ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                        ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    
                            </div>
                            <div class="control-group">
                                   
                                        <%--<input id="input-password" type="password"  />--%>
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                        ControlToValidate="Password" ErrorMessage="Password is required." 
                                        ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="mtop10">
                                        <div class="block-hint pull-left small">
                                            <asp:CheckBox ID="RememberMe" runat="server" Text="" /> Remember Me                                            
                                        </div>
                                        <div class="block-hint pull-right">
                                            <a href="javascript:;" class="" id="forget-password">Forgot Password?</a>
                                        </div>
                                    </div>
                                    <div class="clearfix space5">
                                    </div>
                                
                        </div>

                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" CssClass="btn btn-block login-btn"/>
                         </LayoutTemplate>
    </asp:login>
                        </div>
			</div>
                </div>
                </div>
			<!-- Content End -->
			
			<!-- Footer start -->
		    <footer id="footWrapper">
		    	
			    
			    <!-- footer bottom bar start -->
			    <div class="footer-bottom">
				    <div class="container">
			    		<div class="row">
				    		<!-- footer copyrights left cell -->
				    		<div class=" cell-9">
                                
                            </div>

                            <!-- footer social links right cell start -->
                            <div class="copyrights cell-3">
                                &copy; Copyrights
                                <a href="http://i-valley.com" target="_blank">
                                <img src="../images/IValley.png"  style="vertical-align: middle" /></a>
                                2015. All rights reserved.
                            </div>
						    <!-- footer social links right cell end -->
						    
			    		</div>
				    </div>
			    </div>
			    <!-- footer bottom bar end -->
			    
		    </footer>
		    <!-- Footer end -->
		    
		    <!-- Back to top Link -->
	    	<div id="to-top" class="main-bg"><span class="fa fa-chevron-up"></span></div>
	    	
	    </div>
    
    </form>
    <!-- general script file -->
	<script type="text/javascript" src="../ThemesFiles/ExceptionsLight/js/script.js"></script>
</body>
<!-- END BODY -->
</html>
