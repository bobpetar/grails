<%--
  Created by IntelliJ IDEA.
  User: bkpandey
  Date: 5/13/15
  Time: 1:10 PM
--%>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <title>Welcome to 1hRetouch !!!</title>
</head>
<div role="main" class="main">

    <section class="page-top">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="${createLink(uri: '/')}">Home</a></li>
                        <li class="active">Create Account</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
</div>

<div class="container">

    <g:if test='${emailSent}'>
        <div class="box-content">
            <br />
            <g:message code='spring.security.ui.register.sent' />
        </div>
    </g:if>

    <g:else>
        <div class="row center">
            <div class="col-md-12">
                <p>
                    Let's get started!<br>
                    First, tell us what you're looking for.<hr class="tall"/>
                </p>
            </div>
        </div>
        <div class="home-intro" id="home-intro">
            <div class="container">
                <center>
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-3">
                            <div class="upLoad">
                                <a href="${createLink(uri:'/register/customer')}" class="btn btn-lg btn-primary">Upload your photo</a>

                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="retoucher">
                                <a href="${createLink(uri: '/register/retoucher')}" class="btn btn-lg btn-retoucher">Become a retoucher</a>

                            </div>
                        </div>
                        <div class="col-md-3"></div>
                    </div>
                <center>
            </div>
        </div>
    </g:else>
</div>
</html>