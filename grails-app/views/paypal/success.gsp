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
                    <h1>Transaction Success</h1>
                </div>
            </div>
        </div>
    </section>

    <div class="container">

        <div class="panel-body">
            <div class="col-md-12"></head>
                Your purchase is complete. Information for your reference can be seen below:
                <div id="transactionSummary" class="transactionSummary">
                    <div class="transSummaryItem">
                        <span class="transSummaryItemName">Transaction ID:</span>
                        <span class="transSummaryItemValue">${payment.transactionId}</span>
                    </div>
                <g:render template="txsummary" model="[payment:payment]"/>
            </div>

        </div>

    </div>
</div>
</body>

</html>