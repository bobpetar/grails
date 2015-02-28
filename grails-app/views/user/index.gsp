

<%@ page import="com.retouch.User"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
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

			<div class="panel-body">
				<div class="table-responsive">
					<g:if test="${flash.message}">
						<div class="alert alert-info" role="status">
							${flash.message}
						</div>
					</g:if>

					<h4>Striped</h4>

					<div class="col-md-12">
						<table class="table table-striped">
							<thead>
								<tr>

									<g:sortableColumn property="firstname"
										title="${message(code: 'user.fullname.label', default: 'Name')}" />

									<g:sortableColumn property="username"
										title="${message(code: 'user.username.label', default: 'Username')}" />

									<g:sortableColumn property="email"
										title="${message(code: 'user.email.label', default: 'Email')}" />

									<g:sortableColumn property="accountExpired"
										title="${message(code: 'user.accountExpired.label', default: 'Account Expired')}" />

								</tr>
							</thead>
							<tbody>
								<g:each in="${userInstanceList}" status="i" var="userInstance">
									<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

										<td><g:link action="show" id="${userInstance.id}">
												${fieldValue(bean: userInstance, field: "firstname")}
												${fieldValue(bean: userInstance, field: "lastname")}
											</g:link></td>

										<td>
											${fieldValue(bean: userInstance, field: "username")}
										</td>

										<td>
											${fieldValue(bean: userInstance, field: "email")}
										</td>

										<td><g:formatBoolean
												boolean="${userInstance.accountExpired}" /></td>


									</tr>
								</g:each>
							</tbody>
						</table>
						<ul class="pagination">
							<retouch:paginate total="${userInstanceCount ?: 0}" />
						</ul>

					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>
