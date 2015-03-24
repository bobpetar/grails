<%--
  Created by IntelliJ IDEA.
  User: bkpandey
  Date: 3/23/15
  Time: 2:31 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page expressionCodec="none" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Transaction Cancelled</title>
</head>

<body>
<div role="main" class="main">

    <section class="page-top">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>Transaction Cancelled</h1>
                </div>
            </div>
        </div>
    </section>

    <div class="container">

        <div class="panel-body">
            <div class="col-md-12">
                Your purchase transaction has been cancelled. Information about the items you planned to purchase can be seen below:
                <div id="transactionSummary" class="transactionSummary">
                    <g:render template="txsummary" model="[payment:payment]"/>
                </div>
            </div>

        </div>

    </div>
</div>
</body>

</html>