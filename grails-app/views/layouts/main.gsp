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
    <meta name="keywords" content="HTML5 Template"/>
    <meta name="description" content="Porto - Responsive HTML5 Template">
    <meta name="author" content="okler.net">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Web Fonts  -->
    <link
            href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800%7CShadows+Into+Light"
            rel="stylesheet" type="text/css">

    <!-- Vendor CSS -->

    <asset:stylesheet src="vendor/bootstrap/bootstrap.css"/>
    <asset:stylesheet src="vendor/fontawesome/css/font-awesome.css"/>
    <asset:stylesheet src="vendor/owlcarousel/owl.carousel.min.css"/>
    <asset:stylesheet src="vendor/owlcarousel/owl.theme.default.min.css"/>
    <asset:stylesheet src="vendor/magnific-popup/magnific-popup.css"/>

    <!-- Theme CSS -->

    <asset:stylesheet src="css/theme.css"/>
    <asset:stylesheet src="css/theme-elements.css"/>
    <asset:stylesheet src="css/theme-blog.css"/>
    <asset:stylesheet src="css/theme-shop.css"/>
    <asset:stylesheet src="css/theme-animate.css"/>


    <!-- Current Page CSS -->
    <asset:stylesheet src="vendor/rs-plugin/css/settings.css"/>
    <asset:stylesheet src="vendor/circle-flip-slideshow/css/component.css"/>

    <!-- Admin Extension Specific Page Vendor CSS -->
    <asset:stylesheet
            src="admin/assets/vendor/bootstrap-datepicker/css/datepicker3.css"/>
    <asset:stylesheet
            src="admin/assets/vendor/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css"/>
    <asset:stylesheet src="admin/assets/vendor/select2/select2.css"/>
    <asset:stylesheet
            src="admin/assets/vendor/bootstrap-multiselect/bootstrap-multiselect.css"/>
    <asset:stylesheet
            src="admin/assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.css"/>
    <asset:stylesheet
            src="admin/assets/vendor/bootstrap-colorpicker/css/bootstrap-colorpicker.css"/>
    <asset:stylesheet
            src="admin/assets/vendor/bootstrap-timepicker/css/bootstrap-timepicker.css"/>
    <asset:stylesheet src="admin/assets/vendor/dropzone/css/basic.css"/>
    <asset:stylesheet src="admin/assets/vendor/dropzone/css/dropzone.css"/>
    <asset:stylesheet
            src="admin/assets/vendor/bootstrap-markdown/css/bootstrap-markdown.min.css"/>
    <asset:stylesheet src="admin/assets/vendor/summernote/summernote.css"/>
    <asset:stylesheet
            src="admin/assets/vendor/summernote/summernote-bs3.css"/>
    <asset:stylesheet
            src="admin/assets/vendor/codemirror/lib/codemirror.css"/>
    <asset:stylesheet src="admin/assets/vendor/codemirror/theme/monokai.css"/>
    <asset:stylesheet
            src="admin/assets/vendor/bootstrap-fileupload/bootstrap-fileupload.min.css"/>

    <!-- Admin Extension CSS -->
    <asset:stylesheet
            src="admin/assets/stylesheets/theme-admin-extension.css"/>

    <!-- Admin Extension Skin CSS -->
    <asset:stylesheet src="admin/assets/stylesheets/skins/extension.css"/>

    <!-- Skin CSS -->
    <asset:stylesheet src="css/skins/default.css"/>

    <!-- Theme Custom CSS -->
    <asset:stylesheet src="css/custom.css"/>

    <!-- Head Libs -->
    <asset:javascript src="vendor/modernizr/modernizr.js"/>

    <!--[if IE]>
    <asset:stylesheet src="css/ie.css"/>
    <![endif]-->

    <asset:javascript src="vendor/jquery/jquery.js"/>
    <!--[if lte IE 8]>
    <asset:javascript src="vendor/respond/respond.js"/>
    <asset:javascript src="vendor/excanvas/excanvas.js"/>
    <![endif]-->

    %{--Admin--}%
    <asset:stylesheet src="admin/assets/vendor/pnotify/pnotify.custom.css"/>
    <asset:stylesheet
            src="admin/assets/vendor/font-awesome/css/font-awesome.css"/>



    <!--  Custome CSS -->
    <asset:stylesheet src="custom.css"/>
    <asset:stylesheet src="css/admin.css"/>

    <script>
        $(document).ready(function () {
            <g:if test="${flash.message}">
            new PNotify({
                title: 'Info',
                text: '${flash.message}',
                type: 'notice'

            });
            </g:if>
            <g:if test="${flash.error}">
            new PNotify({
                title: 'Error!',
                text: '${flash.error}',
                type: 'error'
            });
            </g:if>
        });
    </script>

    <g:layoutHead/>
</head>

<body class="one-page" data-target=".single-menu" data-spy="scroll"  data-offset="200" data-loading-overlay="data-loading-overlay">
<span class="loading-overlay light">
    <span class="loader black"></span>
</span>

<div class="body">
<header id="header">
<div class="container">
    <div class="logo">
     %{--   <a href="${createLink(uri:'/')}"> <asset:image alt="Porto"
                                                       width="411" height="80" data-sticky-width="257"
                                                       data-sticky-height="50" src="img/logosmall.png" />
        </a>--}%
        <a href="${createLink(uri:'/')}"> <asset:image alt="Porto"
                                                       width="257" height="50" data-sticky-width="206"
                                                       data-sticky-height="40" src="img/logosmall.png" />
        </a>
    </div>
    <div class="search">
    </div>
    <ul class="social-icons">
        <li class="facebook"><a href="${siteParams?.FACEBOOK}" target="_blank" title="Facebook">Facebook</a></li>
        <li class="twitter"><a href="${siteParams?.TWITTER}" target="_blank" title="Twitter">Twitter</a></li>
        <li class="linkedin"><a href="${siteParams?.LINKEDIN}" target="_blank" title="Linkedin">Linkedin</a></li>
    </ul>
    <nav>
        <ul class="nav nav-pills nav-top">
            <li class="phone">
                <span><i class="fa fa-phone"></i>${siteParams?.PHONENUMBER}</span>
            </li>
        </ul>
    </nav>
    <button class="btn btn-responsive-nav btn-inverse" data-toggle="collapse" data-target=".nav-main-collapse">
        <i class="fa fa-bars"></i>
    </button>
</div>
     <div class="navbar-collapse nav-main-collapse collapse">
        <div class="container">

            <nav class="nav-main mega-menu">
                <ul class="nav nav-pills nav-main" id="mainMenu">
                    <li><a href="${createLink(uri:'/')}#home">Home</a></li>
                    <sec:ifAllGranted roles="ROLE_USER">
                        <li><a href="${createLink(uri:'/upload') }">Upload</a></li>
                        <li><a href="${createLink(uri:'/projects') }">My Orders</a></li>
                    </sec:ifAllGranted>
                    <sec:ifAllGranted roles="ROLE_ADMIN">
                        <li><a href="${createLink(uri:'/user') }">User</a></li>
                        <li><a href="${createLink(action: 'index',controller: 'project') }">Projects</a></li>
                        <li><a href="${createLink(uri:'/technique') }">Techniques</a></li>
                        <li><a href="${createLink(uri:'/siteParams') }">Site Params</a></li>
                    </sec:ifAllGranted>
                    <sec:ifAllGranted roles="ROLE_RETOUCHER">
                        <li><a href="${createLink(uri:'/tasks') }">My Tasks
                            <g:if test="${incompleteTaskCount!=null}">
                                <span class="badge">${incompleteTaskCount}</span>
                            </g:if>
                        </a></li>
                        <li><a href="${createLink(uri:'/new-tasks') }">New Tasks
                            <g:if test="${newTaskCount!=null}">
                                <span class="badge">${newTaskCount}</span>
                            </g:if>
                        </a>
                        </li>
                    </sec:ifAllGranted>

                    <sec:ifNotLoggedIn>
                        <li><a href="${createLink(uri:'/')}#techniques">Techniques</a></li>

                        <li class="dropdown mega-menu-item mega-menu-signin signin" id="headerAccount">
                            <a class="dropdown-toggle" href="${createLink(uri:'/login') }">
                                <i class="fa fa-user"></i> Sign In
                                <i class="fa fa-angle-down"></i>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <div class="mega-menu-content">
                                        <div class="row">
                                            <div class="col-md-12">

                                                <div class="signin-form">

                                                    <span class="mega-menu-sub-title">Sign In</span>

                                                    <form action="${postUrl}" id="loginForm" method="post"
                                                          name="loginForm" autocomplete='off'>
                                                        <div class="row">
                                                            <div class="form-group">
                                                                <div class="col-md-12">
                                                                    <label>Username</label> <input tabindex="1"
                                                                        name="j_username" id="username"
                                                                        class="form-control input-lg">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="form-group">
                                                                <div class="col-md-12">
                                                                    <g:link controller="register" action="forgotPassword" tabindex="3"
                                                                            class="pull-right">(Lost Password?)</g:link>
                                                                    <label>Password</label> <input type="password" tabindex="2"
                                                                                                   name="j_password" id="passwordMenu"
                                                                                                   class="form-control input-lg">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="  margin-top: 6px;">
                                                            <div class="col-md-6">
                                                                <span class="remember-box checkbox"> <label
                                                                        for="remembememenu"> <input type="checkbox"
                                                                                                 name="${rememberMeParameter}" id="remembememenu"
                                                                                                 name="rememberme">Remember Me
                                                                </label>
                                                                </span>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <input type="submit" value="Login"
                                                                       class="btn btn-primary pull-right push-bottom"
                                                                       data-loading-text="Loading...">
                                                            </div>

                                                        </div>

                                                        <div class="row">
                                                            <div class="form-group">
                                                                <div class="col-md-12">
                                                                    <p class="sign-up-info">
                                                                        Don't have an account yet?
                                                                        <g:link controller="register">Sign
													Up</g:link>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>

                                                </div>

                                                <div class="signup-form">
                                                    <span class="mega-menu-sub-title">Create Account</span>

                                                    <form action="" id="" method="post">
                                                        <div class="row">
                                                            <div class="form-group">
                                                                <div class="col-md-12">
                                                                    <label>E-mail Address</label>
                                                                    <input type="text" value="" class="form-control input-lg">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="form-group">
                                                                <div class="col-md-6">
                                                                    <label>Password</label>
                                                                    <input type="password" value="" class="form-control input-lg">
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label>Re-enter Password</label>
                                                                    <input type="password" value="" class="form-control input-lg">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <input type="submit" value="Create Account" class="btn btn-primary pull-right push-bottom" data-loading-text="Loading...">
                                                            </div>
                                                        </div>
                                                    </form>

                                                    <p class="log-in-info">Already have an account? <a href="#" id="headerSignIn">Log In</a></p>
                                                </div>

                                                <div class="recover-form">
                                                    <span class="mega-menu-sub-title">Reset My Password</span>
                                                    <p>Complete the form below to receive an email with the authorization code needed to reset your password.</p>

                                                    <form action="" id="" method="post">
                                                        <div class="row">
                                                            <div class="form-group">
                                                                <div class="col-md-12">
                                                                    <label>E-mail Address</label>
                                                                    <input type="text" value="" class="form-control input-lg">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <input type="submit" value="Submit" class="btn btn-primary pull-right push-bottom" data-loading-text="Loading...">
                                                            </div>
                                                        </div>
                                                    </form>

                                                    <p class="log-in-info">Already have an account? <a href="#" id="headerRecoverCancel">Log In</a></p>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>

                        %{----}%
                    </sec:ifNotLoggedIn>
                    <sec:ifLoggedIn>

                        <li class="dropdown"><a data-hash
                                                       class="dropdown-toggle" href="${createLink(uri:'/')}#home"> <i class="fa fa-user"></i>
                            <sec:username /> <i class="fa fa-angle-down"></i>
                        </a>
                            <ul class="dropdown-menu">
                                <li><g:link controller="user" action="show" id="${sec.loggedInUserInfo(field: 'id')}">My Account</g:link></li>
                                <li><a href="${createLink(uri:'/logout')}">Log Out</a></li>
                            </ul></li>
                    </sec:ifLoggedIn>
                </ul>
            </nav>
        </div>
    </div>
</header>
<g:layoutBody/>


<footer class="short" id="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <h4>About 1hretouch</h4>

                <p>${siteParams?.ABOUTUS}</p>
                <hr class="light">
            </div>

            <div class="col-md-3 col-md-offset-1">
                <h5 class="short">Contact Us</h5>
                <span class="phone">${siteParams?.PHONENUMBER}</span>

                <p class="short">${siteParams?.ADDRESS1}</p>

                <p class="short">${siteParams?.ADDRESS2}</p>
                <ul class="list icons list-unstyled">
                    <li><i class="fa fa-envelope"></i> <a
                            href="mailto:${siteParams?.EMAIL}">${siteParams?.EMAIL}</a></li>
                </ul>

                <div class="social-icons">
                    <ul class="social-icons">
                        <li class="facebook"><a href="${siteParams?.FACEBOOK}"
                                                target="_blank" data-placement="bottom" data-tooltip
                                                title="Facebook">Facebook</a></li>
                        <li class="twitter"><a href="${siteParams?.TWITTER}"
                                               target="_blank" data-placement="bottom" data-tooltip
                                               title="Twitter">Twitter</a></li>
                        <li class="linkedin"><a href="${siteParams?.LINKEDIN}"
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
                <div class="col-md-2">
                    <a href="index.html" class="logo"><asset:image
                            alt="Porto Website Template" class="img-responsive"
                            src="img/logogrey.png"/>
                    </a>
                </div>

                <div class="col-md-10">
                    <p>${siteParams?.COPYRIGHT}</p>
                </div>
            </div>
        </div>
    </div>
</footer>
</div>

<!-- Vendor -->

<asset:javascript src="vendor/jquery.appear/jquery.appear.js"/>
<asset:javascript src="vendor/jquery.easing/jquery.easing.js"/>
<asset:javascript src="vendor/jquery-cookie/jquery-cookie.js"/>
<asset:javascript src="vendor/bootstrap/bootstrap.js"/>
<asset:javascript src="vendor/common/common.js"/>
<asset:javascript src="vendor/jquery.validation/jquery.validation.js"/>
<asset:javascript src="vendor/jquery.stellar/jquery.stellar.js"/>
<asset:javascript
        src="vendor/jquery.easy-pie-chart/jquery.easy-pie-chart.js"/>
<asset:javascript src="vendor/jquery.gmap/jquery.gmap.js"/>
<asset:javascript src="vendor/isotope/jquery.isotope.js"/>
<asset:javascript src="vendor/owlcarousel/owl.carousel.js"/>
<asset:javascript src="vendor/jflickrfeed/jflickrfeed.js"/>
<asset:javascript src="vendor/magnific-popup/jquery.magnific-popup.js"/>
<asset:javascript src="vendor/vide/vide.js"/>


%{--Admin--}%

<asset:javascript src="admin/assets/vendor/pnotify/pnotify.custom.js"/>

<!-- Theme Base, Components and Settings -->
<asset:javascript src="js/theme.js"/>

<!-- Specific Page Vendor and Views -->
<asset:javascript
        src="vendor/rs-plugin/js/jquery.themepunch.tools.min.js"/>
<asset:javascript
        src="vendor/rs-plugin/js/jquery.themepunch.revolution.min.js"/>
<asset:javascript
        src="vendor/circle-flip-slideshow/js/jquery.flipshow.js"/>
<asset:javascript src="js/views/view.home.js"/>

<!-- Theme Custom -->
<asset:javascript src="js/custom.js"/>

<!-- Theme Initialization Files -->
<asset:javascript src="js/theme.init.js"/>


<!-- Admin Extension Specific Page Vendor -->
<asset:javascript
        src="admin/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"/>
<asset:javascript
        src="admin/assets/vendor/jquery-ui/js/jquery-ui-1.10.4.custom.js"/>
<asset:javascript
        src="admin/assets/vendor/jquery-ui-touch-punch/jquery.ui.touch-punch.js"/>
<asset:javascript src="admin/assets/vendor/select2/select2.js"/>
<asset:javascript
        src="admin/assets/vendor/bootstrap-multiselect/bootstrap-multiselect.js"/>
<asset:javascript
        src="admin/assets/vendor/jquery-maskedinput/jquery.maskedinput.js"/>
<asset:javascript
        src="admin/assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.js"/>
<asset:javascript
        src="admin/assets/vendor/bootstrap-colorpicker/js/bootstrap-colorpicker.js"/>
<asset:javascript
        src="admin/assets/vendor/bootstrap-timepicker/js/bootstrap-timepicker.js"/>
<asset:javascript src="admin/assets/vendor/fuelux/js/spinner.js"/>
<asset:javascript src="admin/assets/vendor/intercooler/intercooler-0.4.8.js"/>
<asset:javascript src="admin/assets/vendor/dropzone/dropzone.js"/>
<asset:javascript
        src="admin/assets/vendor/bootstrap-markdown/js/markdown.js"/>
<asset:javascript
        src="admin/assets/vendor/bootstrap-markdown/js/to-markdown.js"/>
<asset:javascript
        src="admin/assets/vendor/bootstrap-markdown/js/bootstrap-markdown.js"/>
<asset:javascript
        src="admin/assets/vendor/codemirror/lib/codemirror.js"/>
<asset:javascript
        src="admin/assets/vendor/codemirror/addon/selection/active-line.js"/>
<asset:javascript
        src="admin/assets/vendor/codemirror/addon/edit/matchbrackets.js"/>
<asset:javascript
        src="admin/assets/vendor/codemirror/mode/javascript/javascript.js"/>
<asset:javascript src="admin/assets/vendor/codemirror/mode/xml/xml.js"/>
<asset:javascript
        src="admin/assets/vendor/codemirror/mode/htmlmixed/htmlmixed.js"/>
<asset:javascript src="admin/assets/vendor/codemirror/mode/css/css.js"/>
<asset:javascript src="admin/assets/vendor/summernote/summernote.js"/>
<asset:javascript
        src="admin/assets/vendor/bootstrap-maxlength/bootstrap-maxlength.js"/>
<asset:javascript
        src="admin/assets/vendor/bootstrap-fileupload/bootstrap-fileupload.min.js"/>
<asset:javascript src="admin/assets/vendor/ios7-switch/ios7-switch.js"/>

<!-- Admin Extension -->
<asset:javascript
        src="admin/assets/javascripts/theme.admin.extension.js"/>

<!-- Admin Extension Examples -->
%{--
<asset:javascript
    src="admin/assets/javascripts/forms/examples.advanced.form.js" />
--}%

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