

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
							<li><a href="${createLink(uri:'/') }">Home</a></li>
							<li class="active"><a
								href="${createLink(uri:'/user/create') }"><g:message
										code="default.create.label" args="[entityName]" /></a></li>
                            <li><g:message code="default.list.label" args="[entityName]" /></li>
						</ul>
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

					<div class="col-md-12">
						<table class="table table-striped">
							<thead>
								<tr>

									<g:sortableColumn property="firstname"
										title="${message(code: 'user.fullname.label', default: 'Name')}" />

									<g:sortableColumn property="username"
										title="${message(code: 'user.username.label', default: 'Username')}" />

                                    <th>Role</th>

									<g:sortableColumn property="accountExpired"
										title="${message(code: 'user.accountExpired.label', default: 'Account Enabled')}" />

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
                                            <g:each in="${userInstance.authorities}" status="j" var="roleInstance">
                                                <span class="tag label btn-danger
                                                <g:if test="${roleInstance == 'ROLE_ADMIN'}">btn-danger</g:if>
                                                <g:if test="${roleInstance == 'ROLE_USER'}">btn-warning</g:if>
                                                <g:if test="${roleInstance == 'ROLE_RETOUCHER'}">btn-info</g:if> ">
                                                    ${roleInstance}
                                                </span>
                                            </g:each>

                                        </td>

                                        <td><span class="tag label
                                            <g:if test="${userInstance.enabled}">btn-primary</g:if>
                                            <g:else>btn-danger</g:else>">
                                            <g:formatBoolean boolean="${userInstance.enabled}" />
                                        </span></td>


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
