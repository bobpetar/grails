
<%@ page import="com.retouch.Earning" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'earning.label', default: 'Earning')}" />
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


  <div id="show-earning" class="content scaffold-show container" role="main">
        <ul class="property-list earning">
            
            <g:if test="${earningInstance?.amount}">
                <li class="fieldcontain">
                    <span id="amount-label" class="property-label"><g:message code="earning.amount.label" default="Amount" /></span>
                    
                    <span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${earningInstance}" field="amount"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${earningInstance?.createdDate}">
                <li class="fieldcontain">
                    <span id="createdDate-label" class="property-label"><g:message code="earning.createdDate.label" default="Created Date" /></span>
                    
                    <span class="property-value" aria-labelledby="createdDate-label"><g:formatDate date="${earningInstance?.createdDate}" /></span>
                    
                </li>
            </g:if>
            
            <g:if test="${earningInstance?.project}">
                <li class="fieldcontain">
                    <span id="project-label" class="property-label"><g:message code="earning.project.label" default="Project" /></span>
                    
                    <span class="property-value" aria-labelledby="project-label"><g:link controller="project" action="show" id="${earningInstance?.project?.id}">${earningInstance?.project?.encodeAsHTML()}</g:link></span>
                    
                </li>
            </g:if>
            
            <g:if test="${earningInstance?.retoucher}">
                <li class="fieldcontain">
                    <span id="retoucher-label" class="property-label"><g:message code="earning.retoucher.label" default="Retoucher" /></span>
                    
                    <span class="property-value" aria-labelledby="retoucher-label"><g:link controller="user" action="show" id="${earningInstance?.retoucher?.id}">${earningInstance?.retoucher?.encodeAsHTML()}</g:link></span>
                    
                </li>
            </g:if>
            
        </ul>
        <g:form url="[resource:earningInstance, action:'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="mb-xs mt-xs mr-xs btn btn-sm btn-default" action="edit" resource="${earningInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <g:actionSubmit class="mb-xs mt-xs mr-xs btn btn-sm btn-primary" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
        </g:form>
    </div>
</div>
</body>
</html>
