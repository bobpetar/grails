<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>

		<!-- Basic -->
		<meta charset="utf-8">
		<title>Porto - Responsive HTML5 Template 3.7.0</title>		
		<meta name="keywords" content="HTML5 Template" />
		<meta name="description" content="Porto - Responsive HTML5 Template">
		<meta name="author" content="okler.net">

		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- Web Fonts  -->
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800%7CShadows+Into+Light" rel="stylesheet" type="text/css">
		
		<!--  Custome CSS -->
		<asset:stylesheet src="custom.css" />
		
		<!-- Vendor CSS -->
		
		<asset:stylesheet src="vendor/bootstrap/bootstrap.css"/>
		<asset:stylesheet src="vendor/fontawesome/css/font-awesome.css"/>
		<asset:stylesheet src="vendor/owlcarousel/owl.carousel.min.css"/>
		<asset:stylesheet src="vendor/owlcarousel/owl.theme.default.min.css"/>
		<asset:stylesheet src="vendor/magnific-popup/magnific-popup.css"/>

		<!-- Theme CSS -->
		
		<asset:stylesheet src="css/theme.css"/>
		<asset:stylesheet src="css/admin.css"/>
		<asset:stylesheet src="css/theme-elements.css"/>
		<asset:stylesheet src="css/theme-blog.css"/>
		<asset:stylesheet src="css/theme-shop.css"/>
		<asset:stylesheet src="css/theme-animate.css"/>

		<!-- Current Page CSS -->
		<asset:stylesheet src="vendor/rs-plugin/css/settings.css"/>
		<asset:stylesheet src="vendor/circle-flip-slideshow/css/component.css"/>

		<!-- Skin CSS -->
		<asset:stylesheet src="css/skins/default.css"/>

		<!-- Theme Custom CSS -->
		<asset:stylesheet src="css/custom.css"/>

		<!-- Head Libs -->
		<asset:javascript src="vendor/modernizr/modernizr.js"/>

		<!--[if IE]>
			<asset:stylesheet src="css/ie.css"/>
		<![endif]-->

		<!--[if lte IE 8]>
			<asset:javascript src="vendor/respond/respond.js"/>
			<asset:javascript src="vendor/excanvas/excanvas.js"/>
		<![endif]-->
		
		<g:layoutHead/>
	</head>
	<body>

		<div class="body">
			<header id="header">
				<div class="container">
					<div class="logo">
						<a href="index.html">
							<asset:image alt="Porto" width="111" height="54" data-sticky-width="82" data-sticky-height="40" src="img/logo.png" />
						</a>
					</div>
					<div class="search">
						<form id="searchForm" action="page-search-results.html" method="get">
							<div class="input-group">
								<input type="text" class="form-control search" name="q" id="q" placeholder="Search..." required>
								<span class="input-group-btn">
									<button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
								</span>
							</div>
						</form>
					</div>
					<nav>
						<ul class="nav nav-pills nav-top">
							<li>
								<a href="about-us.html"><i class="fa fa-angle-right"></i>About Us</a>
							</li>
							<li>
								<a href="contact-us.html"><i class="fa fa-angle-right"></i>Contact Us</a>
							</li>
							<li class="phone">
								<span><i class="fa fa-phone"></i>(123) 456-7890</span>
							</li>
						</ul>
					</nav>
					<button class="btn btn-responsive-nav btn-inverse" data-toggle="collapse" data-target=".nav-main-collapse">
						<i class="fa fa-bars"></i>
					</button>
				</div>
				<div class="navbar-collapse nav-main-collapse collapse">
					<div class="container">
						<ul class="social-icons">
							<li class="facebook"><a href="http://www.facebook.com/" target="_blank" title="Facebook">Facebook</a></li>
							<li class="twitter"><a href="http://www.twitter.com/" target="_blank" title="Twitter">Twitter</a></li>
							<li class="linkedin"><a href="http://www.linkedin.com/" target="_blank" title="Linkedin">Linkedin</a></li>
						</ul>
						<nav class="nav-main mega-menu">
							<ul class="nav nav-pills nav-main" id="mainMenu">
								<li class="dropdown active">
									<a class="dropdown-toggle" href="index.html">
										Home
										<i class="fa fa-angle-down"></i>
									</a>
									<ul class="dropdown-menu">
										<li><a href="index.html">Home - Default</a></li>
										<li><a href="index-1.html">Home - Corporate <span class="tip">hot</span></a></li>
										<li><a href="index-2.html">Home - Color</a></li>
										<li><a href="index-3.html">Home - Light</a></li>
										<li><a href="index-4.html">Home - Video</a></li>
										<li><a href="index-5.html">Home - Video - Light</a></li>
										<li><a href="index-one-page.html">One Page Website</a></li>
										<li class="dropdown-submenu">
											<a href="#">Sliders</a>
											<ul class="dropdown-menu">
												<li><a href="index.html">Revolution Slider</a></li>
												<li><a href="index-slider-2.html">Nivo Slider</a></li>
											</ul>
										</li>
									</ul>
								</li>
								<li>
									<a href="shortcodes.html">Shortcodes</a>
								</li>
								<li class="dropdown">
									<a class="dropdown-toggle" href="#">
										About Us
										<i class="fa fa-angle-down"></i>
									</a>
									<ul class="dropdown-menu">
										<li><a href="about-us.html">About Us</a></li>
										<li><a href="about-us-basic.html">About Us - Basic</a></li>
										<li><a href="about-me.html">About Me</a></li>
									</ul>
								</li>
								<li class="dropdown mega-menu-item mega-menu-fullwidth">
									<a class="dropdown-toggle" href="#">
										Features
										<i class="fa fa-angle-down"></i>
									</a>
									<ul class="dropdown-menu">
										<li>
											<div class="mega-menu-content">
												<div class="row">
													<div class="col-md-3">
														<ul class="sub-menu">
															<li>
																<span class="mega-menu-sub-title">Main Features</span>
																<ul class="sub-menu">
																	<li><a href="feature-pricing-tables.html">Pricing Tables</a></li>
																	<li><a href="feature-icons.html">Icons</a></li>
																	<li><a href="feature-animations.html">Animations</a></li>
																	<li><a href="feature-typography.html">Typography</a></li>
																	<li><a href="feature-grid-system.html">Grid System</a></li>
																</ul>
															</li>
														</ul>
													</div>
													<div class="col-md-3">
														<ul class="sub-menu">
															<li>
																<span class="mega-menu-sub-title">Headers</span>
																<ul class="sub-menu">
																	<li><a href="headers-overview.html">Overview</a></li>
																	<li><a href="index-header-2.html">Header 2</a></li>
																	<li><a href="index-header-3.html">Header 3</a></li>
																	<li><a href="index-header-4.html">Header 4</a></li>
																	<li><a href="index-header-5.html">Header 5</a></li>
																	<li><a href="index-header-6.html">Header 6</a></li>
																	<li><a href="index-header-7.html">Header 7 - Below Slider</a></li>
																	<li><a href="index-header-8.html">Header 8 - Full Video</a></li>
																	<li><a href="index-header-9.html">Header 9 - Narrow</a></li>
																	<li><a href="index-header-10.html">Header 10 - Always Sticky</a></li>
																	<li><a href="index-header-11.html">Header 11 - Transparent</a></li>
																	<li><a href="index-header-12.html">Header 12 - Semi Transparent</a></li>
																	<li><a href="index-header-13.html">Header 13 - Semi Transparent - Light</a></li>
																	<li><a href="index-header-14.html">Header 14 - Full-Width</a></li>
																</ul>
															</li>
														</ul>
													</div>
													<div class="col-md-3">
														<ul class="sub-menu">
															<li>
																<span class="mega-menu-sub-title">Header Account</span>
																<ul class="sub-menu">
																	<li><a href="index-header-signin.html">Header - Sign In / Sign Up</a></li>
																	<li><a href="index-header-logged.html">Header - Logged</a></li>
																</ul>
																<span class="mega-menu-sub-title">Footers</span>
																<ul class="sub-menu">
																	<li><a href="index.html#footer">Footer 1</a></li>
																	<li><a href="index-footer-2.html#footer">Footer 2</a></li>
																	<li><a href="index-footer-3.html#footer">Footer 3</a></li>
																	<li><a href="index-footer-4.html#footer">Footer 4</a></li>
																	<li><a href="index-footer-5.html#footer">Footer 5 - Light</a></li>
																	<li><a href="index-footer-6.html#footer">Footer 6 - Light Narrow</a></li>
																	<li><a href="index-footer-7.html#footer">Footer 7 - Color</a></li>
																</ul>
															</li>
														</ul>
													</div>
													<div class="col-md-3">
														<ul class="sub-menu">
															<li>
																<span class="mega-menu-sub-title">Admin Extension <em class="not-included">(Not Included)</em></span>
																<ul class="sub-menu">
																	<li><a href="feature-admin-forms-basic.html">Forms Basic</a></li>
																	<li><a href="feature-admin-forms-advanced.html">Forms Advanced</a></li>
																	<li><a href="feature-admin-forms-wizard.html">Forms Wizard</a></li>
																	<li><a href="feature-admin-forms-code-editor.html">Code Editor</a></li>
																	<li><a href="feature-admin-tables-advanced.html">Tables Advanced</a></li>
																	<li><a href="feature-admin-tables-responsive.html">Tables Responsive</a></li>
																	<li><a href="feature-admin-tables-editable.html">Tables Editable</a></li>
																	<li><a href="feature-admin-tables-ajax.html">Tables Ajax</a></li>
																	<li><a href="feature-admin-charts.html">Charts</a></li>
																</ul>
															</li>
														</ul>
													</div>
												</div>
											</div>
										</li>
									</ul>
								</li>
								<li class="dropdown">
									<a class="dropdown-toggle" href="#">
										Portfolio
										<i class="fa fa-angle-down"></i>
									</a>
									<ul class="dropdown-menu">
										<li><a href="portfolio-4-columns.html">4 Columns</a></li>
										<li><a href="portfolio-3-columns.html">3 Columns</a></li>
										<li><a href="portfolio-2-columns.html">2 Columns</a></li>
										<li><a href="portfolio-lightbox.html">Portfolio Lightbox</a></li>
										<li><a href="portfolio-timeline.html">Portfolio Timeline</a></li>
										<li><a href="portfolio-full-width.html">Portfolio Full Width</a></li>
										<li><a href="portfolio-single-project.html">Single Project</a></li>
									</ul>
								</li>
								<li class="dropdown">
									<a class="dropdown-toggle" href="#">
										Pages
										<i class="fa fa-angle-down"></i>
									</a>
									<ul class="dropdown-menu">
										<li class="dropdown-submenu">
											<a href="#">Shop</a>
											<ul class="dropdown-menu">
												<li><a href="shop-full-width.html">Shop - Full Width</a></li>
												<li><a href="shop-sidebar.html">Shop - Sidebar</a></li>
												<li><a href="shop-product-full-width.html">Shop - Product Full Width</a></li>
												<li><a href="shop-product-sidebar.html">Shop - Product Sidebar</a></li>
												<li><a href="shop-cart.html">Shop - Cart</a></li>
												<li><a href="shop-login.html">Shop - Login</a></li>
												<li><a href="shop-checkout.html">Shop - Checkout</a></li>
											</ul>
										</li>
										<li class="dropdown-submenu">
											<a href="#">Blog</a>
											<ul class="dropdown-menu">
												<li><a href="blog-full-width.html">Blog Full Width</a></li>
												<li><a href="blog-large-image.html">Blog Large Image</a></li>
												<li><a href="blog-medium-image.html">Blog Medium Image</a></li>
												<li><a href="blog-timeline.html">Blog Timeline</a></li>
												<li><a href="blog-post.html">Single Post</a></li>
											</ul>
										</li>
										<li class="dropdown-submenu">
											<a href="#">Layouts</a>
											<ul class="dropdown-menu">
												<li><a href="page-full-width.html">Full width</a></li>
												<li><a href="page-left-sidebar.html">Left sidebar</a></li>
												<li><a href="page-right-sidebar.html">Right sidebar</a></li>
											</ul>
										</li>
										<li class="dropdown-submenu">
											<a href="#">Extra</a>
											<ul class="dropdown-menu">
												<li><a href="page-404.html">404 Error</a></li>
												<li><a href="page-coming-soon.html">Coming Soon</a></li>
												<li><a href="page-maintenance-mode.html">Maintenance Mode</a></li>
												<li><a href="sitemap.html">Sitemap</a></li>
											</ul>
										</li>
										<li><a href="page-custom-header.html">Custom Header</a></li>
										<li><a href="page-team.html">Team</a></li>
										<li><a href="page-services.html">Services</a></li>
										<li><a href="page-careers.html">Careers</a></li>
										<li><a href="page-our-office.html">Our Office</a></li>
										<li><a href="page-faq.html">FAQ</a></li>
										<li><a href="page-login.html">Login / Register</a></li>
									</ul>
								</li>
								<li class="dropdown">
									<a class="dropdown-toggle" href="#">
										Contact Us
										<i class="fa fa-angle-down"></i>
									</a>
									<ul class="dropdown-menu">
										<li><a href="contact-us.html">Contact Us - Basic</a></li>
										<li><a href="contact-us-advanced.php">Contact Us - Advanced</a></li>
									</ul>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</header>
			
		<g:layoutBody/>
		

<footer id="footer">
				<div class="container">
					<div class="row">
						<div class="footer-ribbon">
							<span>Get in Touch</span>
						</div>
						<div class="col-md-3">
							<div class="newsletter">
								<h4>Newsletter</h4>
								<p>Keep up on our always evolving product features and technology. Enter your e-mail and subscribe to our newsletter.</p>
			
								<div class="alert alert-success hidden" id="newsletterSuccess">
									<strong>Success!</strong> You've been added to our email list.
								</div>
			
								<div class="alert alert-danger hidden" id="newsletterError"></div>
			
								<form id="newsletterForm" action="php/newsletter-subscribe.php" method="POST">
									<div class="input-group">
										<input class="form-control" placeholder="Email Address" name="newsletterEmail" id="newsletterEmail" type="text">
										<span class="input-group-btn">
											<button class="btn btn-default" type="submit">Go!</button>
										</span>
									</div>
								</form>
							</div>
						</div>
						<div class="col-md-3">
							<h4>Latest Tweets</h4>
							<div id="tweet" class="twitter" data-plugin-tweets data-plugin-options='{"username": "", "count": 2}'>
								<p>Please wait...</p>
							</div>
						</div>
						<div class="col-md-4">
							<div class="contact-details">
								<h4>Contact Us</h4>
								<ul class="contact">
									<li><p><i class="fa fa-map-marker"></i> <strong>Address:</strong> 1234 Street Name, City Name, United States</p></li>
									<li><p><i class="fa fa-phone"></i> <strong>Phone:</strong> (123) 456-7890</p></li>
									<li><p><i class="fa fa-envelope"></i> <strong>Email:</strong> <a href="mailto:mail@example.com">mail@example.com</a></p></li>
								</ul>
							</div>
						</div>
						<div class="col-md-2">
							<h4>Follow Us</h4>
							<div class="social-icons">
								<ul class="social-icons">
									<li class="facebook"><a href="http://www.facebook.com/" target="_blank" data-placement="bottom" data-tooltip title="Facebook">Facebook</a></li>
									<li class="twitter"><a href="http://www.twitter.com/" target="_blank" data-placement="bottom" data-tooltip title="Twitter">Twitter</a></li>
									<li class="linkedin"><a href="http://www.linkedin.com/" target="_blank" data-placement="bottom" data-tooltip title="Linkedin">Linkedin</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="footer-copyright">
					<div class="container">
						<div class="row">
							<div class="col-md-1">
								<a href="index.html" class="logo">
									<asset:image alt="Porto Website Template" class="img-responsive" src="img/logo-footer.png" />
								</a>
							</div>
							<div class="col-md-7">
								<p>© Copyright 2015. All Rights Reserved.</p>
							</div>
							<div class="col-md-4">
								<nav id="sub-menu">
									<ul>
										<li><a href="page-faq.html">FAQ's</a></li>
										<li><a href="sitemap.html">Sitemap</a></li>
										<li><a href="contact-us.html">Contact</a></li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</footer>
		</div>

		<!-- Vendor -->
		<asset:javascript src="vendor/jquery/jquery.js" />
		<asset:javascript src="vendor/jquery.appear/jquery.appear.js" />
		<asset:javascript src="vendor/jquery.easing/jquery.easing.js" />
		<asset:javascript src="vendor/jquery-cookie/jquery-cookie.js" />
		<asset:javascript src="vendor/bootstrap/bootstrap.js" />
		<asset:javascript src="vendor/common/common.js" />
		<asset:javascript src="vendor/jquery.validation/jquery.validation.js" />
		<asset:javascript src="vendor/jquery.stellar/jquery.stellar.js" />
		<asset:javascript src="vendor/jquery.easy-pie-chart/jquery.easy-pie-chart.js" />
		<asset:javascript src="vendor/jquery.gmap/jquery.gmap.js" />
		<asset:javascript src="vendor/isotope/jquery.isotope.js" />
		<asset:javascript src="vendor/owlcarousel/owl.carousel.js" />
		<asset:javascript src="vendor/jflickrfeed/jflickrfeed.js" />
		<asset:javascript src="vendor/magnific-popup/jquery.magnific-popup.js" />
		<asset:javascript src="vendor/vide/vide.js" />
		
		<!-- Theme Base, Components and Settings -->
		<asset:javascript src="js/theme.js" />
		
		<!-- Specific Page Vendor and Views -->
		<asset:javascript src="vendor/rs-plugin/js/jquery.themepunch.tools.min.js" />
		<asset:javascript src="vendor/rs-plugin/js/jquery.themepunch.revolution.min.js" />
		<asset:javascript src="vendor/circle-flip-slideshow/js/jquery.flipshow.js" />
		<asset:javascript src="js/views/view.home.js" />
		
		<!-- Theme Custom -->
		<asset:javascript src="js/custom.js" />
		
		<!-- Theme Initialization Files -->
		<asset:javascript src="js/theme.init.js" />	

		<!-- Google Analytics: Change UA-XXXXX-X to be your site's ID. Go to http://www.google.com/analytics/ for more information.
		<script type="text/javascript">
		
			var _gaq = _gaq || [];
			_gaq.push(['_setAccount', 'UA-12345678-1']);
			_gaq.push(['_trackPageview']);
		
			(function() {
			var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
			})();
		
		</script>
		 -->

	</body>
</html>
