<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page expressionCodec="none" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'project.label', default: 'Project')}"/>
    <title><g:message code="default.create.label"
                      args="[entityName]"/></title>

    <script type="application/javascript" >
        function disable1(i){
            $("#chooseTechnique1"+i).prop("disabled",true);
            $("#chooseTechnique2"+i).prop("disabled",true);
        }

        function enable1(i){
            alert(i)
            $("#chooseTechnique1"+i).prop("disabled",false);
            $("#chooseTechnique2"+i).prop("disabled",false);
        }

        %{--function disableonload(i){--}%
            %{--if(${techniques.id.containsAll(techniqueInvoiceList.id)}){--}%
               %{--var list = ${techniqueInvoiceList.id}--}%

            %{--} else {--}%
                %{--alert("nothing")--}%
                %{--alert(${techniqueInvoiceList.id})--}%
                %{--alert(${techniques.id})--}%
            %{--}--}%
        %{--}--}%

        %{--window.onload = function(){--}%
            %{--disableonload1()--}%
        %{--}--}%

    </script>
</head>

<body>
<div role="main" class="main">

    <section class="page-top">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li class="active">Instructions</li>
                    </ul>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <h1>Techniques</h1>
                </div>
            </div>
        </div>
    </section>

    <div class="container">

        <!-- Flow start -->

        %{--<div class="col-md-12">--}%
        %{--<g:render template="flow"/>--}%
        %{--</div>--}%

        <!-- Flow End -->

        <div class="panel-body">
                <div class="col-md-8">
                    <!-- Technique list template -->
                    <g:render template="technique"></g:render>
                </div>

                <div class="col-md-4">
                    <div class="col-md-12">
                        <h3>Invoice</h3>
                        <hr>
                        <!-- Invoice block start -->
                        <div id="techniqueList">
                            <g:render template="invoicelist"/>
                        </div>
                        <!-- Invoice block end -->
                    </div>

                    <div class="col-md-12">
                        <g:form controller="paypal" action="buy" >
                            <input name="taskInstance" value="${taskInstance.id}" type="hidden"/>
                            <input type="submit" value="Checkout" class="btn btn-primary btn-lg pull-right push-top">
                        </g:form>
                    </div>

                </div>
        </div>

    </div>
</div>
</body>

</html>