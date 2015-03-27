
<%@ page import="com.retouch.SiteParams" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'siteParams.label', default: 'SiteParams')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
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
            <div class="row">
                <div class="col-md-12">
                    <h1>
                        <g:message code="default.list.label" args="[entityName]" />
                    </h1>
                </div>
            </div>
        </div>
    </section>


  <div id="show-siteParams" class="content scaffold-show container" role="main">
        <ul class="property-list siteParams">
            
            <g:if test="${siteParamsInstance?.parameterName}">
                <li class="fieldcontain">
                    <span id="parameterName-label" class="property-label"><g:message code="siteParams.parameterName.label" default="Parameter Name" /></span>
                    
                    <span class="property-value" aria-labelledby="parameterName-label"><g:fieldValue bean="${siteParamsInstance}" field="parameterName"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${siteParamsInstance?.parameterValue}">
                <li class="fieldcontain">
                    <span id="parameterValue-label" class="property-label"><g:message code="siteParams.parameterValue.label" default="Parameter Value" /></span>
                    
                    <span class="property-value" aria-labelledby="parameterValue-label"><g:fieldValue bean="${siteParamsInstance}" field="parameterValue"/></span>
                    
                </li>
            </g:if>
            
        </ul>
        <g:form url="[resource:siteParamsInstance, action:'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="mb-xs mt-xs mr-xs btn btn-sm btn-default" action="edit" resource="${siteParamsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <g:actionSubmit class="mb-xs mt-xs mr-xs btn btn-sm btn-primary" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
        </g:form>
    </div>
</div>
</body>
</html>
