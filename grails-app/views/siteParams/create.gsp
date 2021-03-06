<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'siteParams.label', default: 'SiteParams')}" />
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
        </div>
    </section>
    <div id="create-siteParams" class="content scaffold-create container" role="main">
        <g:hasErrors bean="${siteParamsInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${siteParamsInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form url="[resource:siteParamsInstance, action:'save']" >
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="mb-xs mt-xs mr-xs btn btn-sm btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </fieldset>
        </g:form>
    </div>
</div>
</body>
</html>
