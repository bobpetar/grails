<%@ page import="com.retouch.SiteParams" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'siteParams.label', default: 'SiteParams')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
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
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <div id="edit-siteParams" class="content scaffold-edit container" role="main">
        <div class="panel">
            <g:hasErrors bean="${siteParamsInstance}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${siteParamsInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form url="[resource:siteParamsInstance, action:'update']" method="PUT" >
            <g:hiddenField name="version" value="${siteParamsInstance?.version}" />
            <fieldset class="form">
                <g:render template="form"/>
            </fieldset>
            <fieldset class="buttons">
                <g:actionSubmit class="mb-xs mt-xs mr-xs btn btn-sm btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
            </fieldset>
            </g:form>
        </div>

    </div>
</div>
</body>
</html>
