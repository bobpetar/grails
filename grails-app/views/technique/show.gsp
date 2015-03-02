
<%@ page import="com.retouch.Technique" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'technique.label', default: 'Technique')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-technique" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-technique" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list technique">
			
				<g:if test="${techniqueInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="technique.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${techniqueInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${techniqueInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="technique.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${techniqueInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${techniqueInstance?.groep}">
				<li class="fieldcontain">
					<span id="groep-label" class="property-label"><g:message code="technique.groep.label" default="Groep" /></span>
					
						<span class="property-value" aria-labelledby="groep-label"><g:fieldValue bean="${techniqueInstance}" field="groep"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:techniqueInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${techniqueInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
