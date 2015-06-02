

<%@ page import="com.retouch.SiteParams" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'siteParams.label', default: 'SiteParams')}" />
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
                                    code="default.home.label"/></a></li>
                            <li><g:message code="default.list.label" args="[entityName]"/></li>
                            <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                                                  args="[entityName]"/></g:link></li>
						</ul>
					</div>
				</div>
			</div>
		</section>

		<div class="container">

			<div class="panel-body">
				<div class="table-responsive">
					<table
						class="table table-bordered table-striped table-condensed mb-none">
						<thead>
							<tr>
								
						<g:sortableColumn property="parameterName" title="${message(code: 'siteParams.parameterName.label', default: 'Parameter Name')}" />
					
						<g:sortableColumn property="parameterValue" title="${message(code: 'siteParams.parameterValue.label', default: 'Parameter Value')}" />
					
							</tr>
						</thead>
						<tbody>
							<g:each in="${siteParamsInstanceList}" status="i"
								var="siteParamsInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
									<td><g:link action="show" id="${siteParamsInstance.id}">${fieldValue(bean: siteParamsInstance, field: "parameterName")}</g:link></td>
								
									<td>${fieldValue(bean: siteParamsInstance, field: "parameterValue")}</td>
								

								</tr>
							</g:each>
						</tbody>
					</table>
					<ul class="pagination">
						<retouch:paginate total="${siteParamsInstanceCount ?: 0}" />
					</ul>

				</div>
			</div>
			</section>
		</div>
	</div>
</body>
</html>
