<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
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
    <link
            href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800%7CShadows+Into+Light"
            rel="stylesheet" type="text/css">



    <!--  Custome CSS -->
    <asset:stylesheet src="custom.css" />
    <asset:stylesheet src="css/admin.css"/>



    <!-- Vendor CSS -->

    <asset:stylesheet src="vendor/bootstrap/bootstrap.css" />
    <asset:stylesheet src="vendor/fontawesome/css/font-awesome.css" />
    <asset:stylesheet src="vendor/owlcarousel/owl.carousel.min.css" />
    <asset:stylesheet src="vendor/owlcarousel/owl.theme.default.min.css" />
    <asset:stylesheet src="vendor/magnific-popup/magnific-popup.css" />



    <!-- Theme CSS -->

    <asset:stylesheet src="css/theme.css" />
    <asset:stylesheet src="css/theme-elements.css" />
    <asset:stylesheet src="css/theme-blog.css" />
    <asset:stylesheet src="css/theme-shop.css" />
    <asset:stylesheet src="css/theme-animate.css" />

    <!-- Current Page CSS -->
    <asset:stylesheet src="vendor/rs-plugin/css/settings.css" />
    <asset:stylesheet src="vendor/circle-flip-slideshow/css/component.css" />

    <!-- Skin CSS -->
    <asset:stylesheet src="css/skins/default.css" />

    <!-- Theme Custom CSS -->
    <asset:stylesheet src="css/custom.css" />

    <!-- Head Libs -->
    <asset:javascript src="vendor/modernizr/modernizr.js" />

    <!--[if IE]>
    <asset:stylesheet src="css/ie.css"/>
    <![endif]-->

    <asset:javascript src="vendor/jquery/jquery.js" />
    <!--[if lte IE 8]>
    <asset:javascript src="vendor/respond/respond.js"/>
    <asset:javascript src="vendor/excanvas/excanvas.js"/>
    <![endif]-->

    %{--Admin--}%
    <asset:stylesheet src="admin/vendor/pnotify/pnotify.custom.css" />
    <asset:stylesheet src="admin/vendor/font-awesome/css/font-awesome.css" />


    <g:layoutHead />
</head>
<body>

<div class="body">
    <header id="header">
        <div class="container">
            <div class="logo">
                <a href="${createLink(uri:'/')}"> <asset:image alt="Porto"
                                                               width="111" height="54" data-sticky-width="82"
                                                               data-sticky-height="40" src="img/logo.png" />
                </a>
            </div>
            <div class="search"></div>

            <ul class="social-icons">
                <li class="facebook"><a href="http://www.facebook.com/"
                                        target="_blank" title="Facebook">Facebook</a></li>
                <li class="twitter"><a href="http://www.twitter.com/"
                                       target="_blank" title="Twitter">Twitter</a></li>
                <li class="linkedin"><a href="http://www.linkedin.com/"
                                        target="_blank" title="Linkedin">Linkedin</a></li>
            </ul>

            <nav>
                <ul class="nav nav-pills nav-top">
                    <li><a href="about-us.html"><i class="fa fa-angle-right"></i>About
                    Us</a></li>
                    <li><a href="contact-us.html"><i
                            class="fa fa-angle-right"></i>Contact Us</a></li>
                    <li class="phone"><span><i class="fa fa-phone"></i>(123)
                    456-7890</span></li>
                </ul>
            </nav>
            <button class="btn btn-responsive-nav btn-inverse"
                    data-toggle="collapse" data-target=".nav-main-collapse">
                <i class="fa fa-bars"></i>
            </button>
        </div>
        <div class="navbar-collapse nav-main-collapse collapse">
            <div class="container">
                <nav class="nav-main mega-menu">
                    <ul class="nav nav-pills nav-main" id="mainMenu">
                        <li><a href="${createLink(uri:'/')}">Home</a></li>
                        <sec:ifLoggedIn>
                            <li><a href="${createLink(uri:'/upload') }">Upload</a></li>
                        </sec:ifLoggedIn>
                        <sec:ifLoggedIn>
                            <li><a href="${createLink(uri:'/projects') }">Projects</a></li>
                        </sec:ifLoggedIn>
                        <li><a href="${createLink(uri:'/examples')}">Examples</a></li>
                        <li><a href="${createLink(uri:'/pricing') }">Pricing</a></li>
                        <li><a href="${createLink(uri:'/faq') }">FAQ</a></li>

                        <sec:ifNotLoggedIn>
                            <li><a href="${createLink(uri:'/login') }">Login</a></li>
                        </sec:ifNotLoggedIn>

                        <sec:ifLoggedIn>
                            <li id="headerAccount"
                                class="dropdown mega-menu-item mega-menu-signin signin logged"><a
                                    class="dropdown-toggle extra" href="#"><i
                                        class="fa fa-angle-down"></i></a> <a href="page-login.html"
                                                                             class="dropdown-toggle disabled"> <i class="fa fa-user"></i>
                                <sec:username /> <i class="fa fa-angle-down"></i>
                            </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <div class="mega-menu-content">
                                            <div class="row">
                                                <div class="col-md-8">
                                                    <div class="user-avatar">
                                                        <div class="img-thumbnail">
                                                            <asset:image alt="" src="img/clients/client-1.jpg" />
                                                        </div>
                                                        <p>
                                                            <strong><sec:username /></strong><span>CEO &amp;
                                                        Founder - Okler</span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <ul class="list-account-options">
                                                        <li><a href="#">My Account</a></li>
                                                        <li><a href="${createLink(uri:'/logout') }">Log
                                                        Out</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul></li>
                        </sec:ifLoggedIn>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <g:layoutBody />


    <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="footer-ribbon">
                    <span>Get in Touch</span>
                </div>

                <div class="col-md-6">
                    <div class="contact-details">
                        <h4>Contact Us</h4>
                        <ul class="contact">
                            <li><p>
                                <i class="fa fa-map-marker"></i> <strong>Address:</strong>
                                1234 Street Name, City Name, United States
                            </p></li>
                            <li><p>
                                <i class="fa fa-phone"></i> <strong>Phone:</strong> (123)
                                456-7890
                            </p></li>
                            <li><p>
                                <i class="fa fa-envelope"></i> <strong>Email:</strong> <a
                                        href="mailto:mail@example.com">mail@example.com</a>
                            </p></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6">
                    <h4>Follow Us</h4>
                    <div class="social-icons">
                        <ul class="social-icons">
                            <li class="facebook"><a href="http://www.facebook.com/"
                                                    target="_blank" data-placement="bottom" data-tooltip
                                                    title="Facebook">Facebook</a></li>
                            <li class="twitter"><a href="http://www.twitter.com/"
                                                   target="_blank" data-placement="bottom" data-tooltip
                                                   title="Twitter">Twitter</a></li>
                            <li class="linkedin"><a href="http://www.linkedin.com/"
                                                    target="_blank" data-placement="bottom" data-tooltip
                                                    title="Linkedin">Linkedin</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-copyright">
            <div class="container">
                <div class="row">
                    <div class="col-md-1">
                        <a href="index.html" class="logo"> <asset:image
                                alt="1hRetouch" class="img-responsive"
                                src="img/logo-footer.png" />
                        </a>
                    </div>
                    <div class="col-md-7">
                        <p>© Copyright 2015. All Rights Reserved.</p>
                    </div>
                    <div class="col-md-4">
                        <nav id="sub-menu">
                            <ul>
                                <li><a href="${createLink(uri:'/faq')}">FAQ's</a></li>
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


%{--Admin--}%

<asset:javascript src="admin/vendor/dropzone/dropzone.js" />
<asset:javascript src="admin/vendor/pnotify/pnotify.custom.js" />

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
