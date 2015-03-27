
<%@ page import="com.retouch.Coupon" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'coupon.label', default: 'Coupon')}" />
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


  <div id="show-coupon" class="content scaffold-show container" role="main">
        <ul class="property-list coupon">
            
            <g:if test="${couponInstance?.discountPercent}">
                <li class="fieldcontain">
                    <span id="discountPercent-label" class="property-label"><g:message code="coupon.discountPercent.label" default="Discount Percent" /></span>
                    
                    <span class="property-value" aria-labelledby="discountPercent-label"><g:fieldValue bean="${couponInstance}" field="discountPercent"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${couponInstance?.active}">
                <li class="fieldcontain">
                    <span id="active-label" class="property-label"><g:message code="coupon.active.label" default="Active" /></span>
                    
                    <span class="property-value" aria-labelledby="active-label"><g:formatBoolean boolean="${couponInstance?.active}" /></span>
                    
                </li>
            </g:if>
            
            <g:if test="${couponInstance?.daysValid}">
                <li class="fieldcontain">
                    <span id="daysValid-label" class="property-label"><g:message code="coupon.daysValid.label" default="Days Valid" /></span>
                    
                    <span class="property-value" aria-labelledby="daysValid-label"><g:fieldValue bean="${couponInstance}" field="daysValid"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${couponInstance?.name}">
                <li class="fieldcontain">
                    <span id="name-label" class="property-label"><g:message code="coupon.name.label" default="Name" /></span>
                    
                    <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${couponInstance}" field="name"/></span>
                    
                </li>
            </g:if>
            
        </ul>
        <g:form url="[resource:couponInstance, action:'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="mb-xs mt-xs mr-xs btn btn-sm btn-default" action="edit" resource="${couponInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <g:actionSubmit class="mb-xs mt-xs mr-xs btn btn-sm btn-primary" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
        </g:form>
    </div>
</div>
</body>
</html>
