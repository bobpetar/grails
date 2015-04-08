<%--
  Created by IntelliJ IDEA.
  User: bkpandey
  Date: 3/24/15
  Time: 1:24 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page expressionCodec="none" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Upload Details</title>
</head>

<body>
<div role="main" class="main">

    <section class="page-top">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>My Orders</h1>
                </div>
            </div>
        </div>
    </section>

    <div class="container">

        <div class="panel-body">
            <div class="col-md-12">
                <div class="col-md-7">
                    <h3>#${projectInstance.projectId}</h3>
                    <hr>
                    <img id="uploadedImage" class="img-rounded img-responsive" src="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.originalImage?.getLargeImageName()}">
                </div>

                <div class="col-md-5">
                    <div class="col-md-12">
                        <h3>Invoice</h3>
                        <hr>
                        <!-- Invoice block start -->
                        <div id="techniqueList">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>Techniques</th>
                                    <th>Price</th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${techniqueInvoiceList}" status="i" var="techniqueInstance">
                                    <tr>
                                        <td>${techniqueInstance.name} (${techniqueInstance.groep})</td>
                                        <td>$${techniqueInstance.ratePerTechnique}</td>
                                    </tr>
                                </g:each>
                                <tr><td>Total</td></td><td>$${sumInvoiceTechnique}</td><td></td></tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- Invoice block end -->
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
</body>

</html>