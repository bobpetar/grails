<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page expressionCodec="none" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'project.label', default: 'Technique')}"/>
    <title><g:message code="default.create.label"
                      args="[entityName]"/></title>
</head>

<body>
<div role="main" class="main">

    <section class="page-top">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li class="active"><g:link action="create"> <g:message code="default.create.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <div class="container">

        <div class="panel-body">
            <div class="col-md-12">
                <!-- Technique list template -->
                <g:render template="techniquelist"></g:render>
            </div>

        </div>

    </div>
</div>
</body>

</html>