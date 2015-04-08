
<%@ page import="com.retouch.Testimonial" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'testimonial.label', default: 'Testimonial')}" />
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


  <div id="show-testimonial" class="content scaffold-show container" role="main">
        <ul class="property-list testimonial">
            
            <g:if test="${testimonialInstance?.fullName}">
                <li class="fieldcontain">
                    <span id="fullName-label" class="property-label"><g:message code="testimonial.fullName.label" default="Full Name" /></span>
                    
                    <span class="property-value" aria-labelledby="fullName-label"><g:fieldValue bean="${testimonialInstance}" field="fullName"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${testimonialInstance?.customerPosition}">
                <li class="fieldcontain">
                    <span id="customerPosition-label" class="property-label"><g:message code="testimonial.customerPosition.label" default="Customer Position" /></span>
                    
                    <span class="property-value" aria-labelledby="customerPosition-label"><g:fieldValue bean="${testimonialInstance}" field="customerPosition"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${testimonialInstance?.testimonial}">
                <li class="fieldcontain">
                    <span id="testimonial-label" class="property-label"><g:message code="testimonial.testimonial.label" default="Testimonial" /></span>
                    
                    <span class="property-value" aria-labelledby="testimonial-label"><g:fieldValue bean="${testimonialInstance}" field="testimonial"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${testimonialInstance?.userType}">
                <li class="fieldcontain">
                    <span id="userType-label" class="property-label"><g:message code="testimonial.userType.label" default="User Type" /></span>
                    
                    <span class="property-value" aria-labelledby="userType-label"><g:fieldValue bean="${testimonialInstance}" field="userType"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${testimonialInstance?.photo}">
                <li class="fieldcontain">
                    <span id="photo-label" class="property-label"><g:message code="testimonial.photo.label" default="Photo" /></span>
                    
                    <span class="property-value" aria-labelledby="photo-label"><g:fieldValue bean="${testimonialInstance}" field="photo"/></span>
                    
                </li>
            </g:if>
            
        </ul>
        <g:form url="[resource:testimonialInstance, action:'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="mb-xs mt-xs mr-xs btn btn-sm btn-default" action="edit" resource="${testimonialInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <g:actionSubmit class="mb-xs mt-xs mr-xs btn btn-sm btn-primary" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
        </g:form>
    </div>
</div>
</body>
</html>
