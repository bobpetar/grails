

<%@ page import="com.retouch.Task" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'task.label', default: 'Task')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

	<div role="main" class="main">

		<section class="page-top">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<ul class="breadcrumb">
							<li><a class="home" href="${createLink(uri: '/')}"><g:message
										code="default.home.label" /></a></li>
							<li><g:message code="default.list.label" args="[entityName]" /></li>
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

		<div class="container">
			<div class="alert alert-info">Change Text</div>

			<div class="panel-body">
				<div class="table-responsive">
					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					<table
						class="table table-bordered table-striped table-condensed mb-none">
						<thead>
							<tr>
								
						<th><g:message code="task.finalImage.label" default="Final Image" /></th>
					
						<g:sortableColumn property="createAt" title="${message(code: 'task.createAt.label', default: 'Create At')}" />
					
						<th><g:message code="task.originalImage.label" default="Original Image" /></th>
					
						<th><g:message code="task.project.label" default="Project" /></th>
					
							</tr>
						</thead>
						<tbody>
							<g:each in="${taskInstanceList}" status="i"
								var="taskInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
									<td><g:link action="show" id="${taskInstance.id}">${fieldValue(bean: taskInstance, field: "finalImage")}</g:link></td>
								
									<td><g:formatDate date="${taskInstance.createAt}" /></td>
								
									<td>${fieldValue(bean: taskInstance, field: "originalImage")}</td>
								
									<td>${fieldValue(bean: taskInstance, field: "project")}</td>
								

								</tr>
							</g:each>
						</tbody>
					</table>
					<ul class="pagination">
						<retouch:paginate total="${taskInstanceCount ?: 0}" />
					</ul>

				</div>
			</div>
			</section>
		</div>
	</div>
</body>
</html>
