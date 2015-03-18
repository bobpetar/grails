<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'technique.label', default: 'Technique')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>

<div role="main" class="main">

    <section class="page-top">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="${createLink(uri:'/') }">Home</a></li>
                        <li class="active"><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h1>
                        <g:message code="default.create.label" args="[entityName]" />
                    </h1>
                </div>
            </div>
        </div>
    </section>

    <div class="container">
        <g:if test="${flash.message}">
            <div class="message" role="status">
                ${flash.message}
            </div>
        </g:if>
        <g:hasErrors bean="${techniqueInstance}">
            <div class="alert alert-info">
                <ul role="alert">
                    <g:eachError bean="${techniqueInstance}" var="error">
                        <li
                            <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                error="${error}" /></li>
                    </g:eachError>
                </ul>
            </div>
        </g:hasErrors>


        <div class="panel-body">
            <g:if test="${flash.message}">
                <div class="message" role="status">
                    ${flash.message}
                </div>
            </g:if>
            <g:form enctype="multipart/form-data"  url="[resource:techniqueInstance, action:'update']" method="PUT">
                <g:hiddenField name="version" value="${techniqueInstance?.version}" />
                <fieldset class="form">
                    <g:render template="formedit"/>
                </fieldset>
            </g:form>
        </div>
    </section>
    </div>
</div>
</body>
</html>
