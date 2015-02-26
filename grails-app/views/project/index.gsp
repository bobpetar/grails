
<%@ page import="com.retouch.Project" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-project" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="project.assignedTo.label" default="Assigned To" /></th>
					
						<th><g:message code="project.createdBy.label" default="Created By" /></th>
					
						<g:sortableColumn property="createdDate" title="${message(code: 'project.createdDate.label', default: 'Created Date')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'project.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="note" title="${message(code: 'project.note.label', default: 'Note')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'project.status.label', default: 'Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectInstanceList}" status="i" var="projectInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${projectInstance.id}">${fieldValue(bean: projectInstance, field: "assignedTo")}</g:link></td>
					
						<td>${fieldValue(bean: projectInstance, field: "createdBy")}</td>
					
						<td><g:formatDate date="${projectInstance.createdDate}" /></td>
					
						<td><g:formatDate date="${projectInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: projectInstance, field: "note")}</td>
					
						<td>${fieldValue(bean: projectInstance, field: "status")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${projectInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
