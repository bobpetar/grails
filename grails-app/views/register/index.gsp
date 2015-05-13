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
                    <h1>Create Account</h1>
                </div>
            </div>
        </div>
    </section>
</div>

<div class="container">
    <div class="row center">
        <div class="col-md-12">
            <h4>
                Let's get started!<br>
                First, tell us what you're looking for.<hr class="tall"/>
            </h4>
        </div>
        <div class="col-md-5">
            <a href="${createLink(uri:'/register/customer')}" class="btn btn-block btn-primary">I want to hire a retoucher</a>
        </div>
        <div class="col-md-2">OR</div>
        <div class="col-md-5">
            <a href="${createLink(uri: '/register/retoucher')}" class="btn btn-block btn-primary">I am looking for online retouching work</a>
        </div>
    </div>
</div>
</html>