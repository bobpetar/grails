<%@ page import="com.retouch.User"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<div role="main" class="main">
		<section class="page-top">
			<div class="container">
				<div class="row">
					<sec:ifAnyGranted roles="ROLE_ADMIN">
						<div class="col-md-12">
							<ul class="breadcrumb">
								<li class="active"><a href="${createLink(uri:'/user') }"><g:message
											code="default.list.label" args="[entityName]" /></a></li>
								<li class="active"><a
									href="${createLink(uri:'/user/create') }"><g:message
											code="default.create.label" args="[entityName]" /></a></li>
                                <li class="active"><g:link class="edit" action="show" resource="${userInstance}">
                                            <g:message code="default.show.label" args="[entityName]" /></g:link></li>
							</ul>
						</div>
					</sec:ifAnyGranted>
				</div>
				<div class="row">
					<div class="col-md-12">
						<h1>
							<g:message code="default.edit.label" args="[entityName]" />
						</h1>
					</div>
				</div>
			</div>
		</section>

		<div class="container">
			<div class="nav" role="navigation"></div>
			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
				<div class="alert alert-info">
					<ul role="alert">
						<g:eachError bean="${userInstance}" var="error">
							<li
								<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
									error="${error}" /></li>
						</g:eachError>
					</ul>
				</div>
			</g:hasErrors>

			<div class="panel-body">
					<g:if test="${flash.message}">
						<div class="message" role="status">
							${flash.message}
						</div>
					</g:if>
					<g:form url="[resource:userInstance, action:'update']" method="PUT"
						class="form-horizontal">
						<g:hiddenField name="version" value="${userInstance?.version}" />
						<fieldset class="form">
							<g:render template="formedit" />
						</fieldset>
					</g:form>
			</div>
		</div>
	</div>
</body>
</html>
