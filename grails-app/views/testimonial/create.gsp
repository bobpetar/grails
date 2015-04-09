<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'testimonial.label', default: 'Testimonial')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<div role="main" class="main">

    <section class="page-top">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h1>
                        <g:message code="default.list.label" args="[entityName]" />
                    </h1>
                </div>
            </div>
        </div>
    </section>
    <div id="create-testimonial" class="content scaffold-create container" role="main">
        <g:hasErrors bean="${testimonialInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${testimonialInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form url="[resource:testimonialInstance, action:'save']" >
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
            <div class="col-md-9 col-md-offset-3 push-top">
                <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </div>
        </g:form>
    </div>
</div>
</body>
</html>
