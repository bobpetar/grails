

<%@ page import="com.retouch.Coupon" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'coupon.label', default: 'Coupon')}" />
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
				%{--	<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>--}%
					<table
						class="table table-bordered table-striped table-condensed mb-none">
						<thead>
							<tr>
								
						<g:sortableColumn property="discountPercent" title="${message(code: 'coupon.discountPercent.label', default: 'Discount Percent')}" />
					
						<g:sortableColumn property="active" title="${message(code: 'coupon.active.label', default: 'Active')}" />
					
						<g:sortableColumn property="daysValid" title="${message(code: 'coupon.daysValid.label', default: 'Days Valid')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'coupon.name.label', default: 'Name')}" />
					
							</tr>
						</thead>
						<tbody>
							<g:each in="${couponInstanceList}" status="i"
								var="couponInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
									<td><g:link action="show" id="${couponInstance.id}">${fieldValue(bean: couponInstance, field: "discountPercent")}</g:link></td>
								
									<td><g:formatBoolean boolean="${couponInstance.active}" /></td>
								
									<td>${fieldValue(bean: couponInstance, field: "daysValid")}</td>
								
									<td>${fieldValue(bean: couponInstance, field: "name")}</td>
								

								</tr>
							</g:each>
						</tbody>
					</table>
					<ul class="pagination">
						<retouch:paginate total="${couponInstanceCount ?: 0}" />
					</ul>

				</div>
			</div>
			</section>
		</div>
	</div>
</body>
</html>
