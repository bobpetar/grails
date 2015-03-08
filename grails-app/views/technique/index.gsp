

<%@ page import="com.retouch.Technique" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'technique.label', default: 'Technique')}" />
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
						<g:sortableColumn property="name" title="${message(code: 'technique.image.label', default: 'BeforeAfterImage')}" />
								
						<g:sortableColumn property="name" title="${message(code: 'technique.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'technique.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="groep" title="${message(code: 'technique.groep.label', default: 'Groep')}" />
					
							</tr>
						</thead>
						<tbody>
							<g:each in="${techniqueInstanceList}" status="i"
								var="techniqueInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								
									<td><img id="uploadedImage" class="" style="width: 100%;" src="${grailsApplication.config.retouch.imageServer}${fieldValue(bean: techniqueInstance, field: "beforeafterimage")}"/></td>
									
									<td><g:link action="show" id="${techniqueInstance.id}">${fieldValue(bean: techniqueInstance, field: "name")}</g:link></td>
								
									<td>${fieldValue(bean: techniqueInstance, field: "description")}</td>
								
									<td>${fieldValue(bean: techniqueInstance, field: "groep")}</td>
								

								</tr>
							</g:each>
						</tbody>
					</table>
					<ul class="pagination">
						<retouch:paginate total="${techniqueInstanceCount ?: 0}" />
					</ul>

				</div>
			</div>
			</section>
		</div>
	</div>
</body>
</html>
