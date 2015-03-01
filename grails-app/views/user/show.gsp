<%@ page import="com.retouch.User"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="main" role="main">

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
							</ul>
						</div>
					</sec:ifAnyGranted>
				</div>
				<div class="row">
					<div class="col-md-12">
						<h1>
							<g:message code="default.show.label" args="[entityName]" />
						</h1>
					</div>
				</div>
			</div>
		</section>

		<div class="container">
			<div class="row show-grid">
				<div class="col-md-3">
					<section>
						<h4 class="page-header">User Information</h4>
						<div class="row fontawesome-icon-list">
							<div class="col-md-12 col-sm-12">
								<i class="fa fa-user"></i>
								<g:link class="edit" action="edit" resource="${userInstance}">
									<g:fieldValue bean="${userInstance}" field="firstname" />
									<g:fieldValue bean="${userInstance}" field="lastname" />
								</g:link>
							</div>
							<div class="col-md-12 col-sm-12">
								<i class="fa fa-envelope"></i>
								<g:fieldValue bean="${userInstance}" field="email" />
							</div>
							<hr class="tall" />
						</div>
					</section>
				</div>
				<div class="col-md-9">
					<h4 class="page-header">Project List: Uploaded</h4>
					<table class="table table-striped">
						<tbody>
							<tr>

								<td>
									<div class="post-image">
										<div class="img-thumbnail">
											<a href="#"> <asset:image
													src="admin/images/post-thumb-1.jpg" />
											</a>
										</div>
									</div>
								</td>

								<td>#1387218</td>

								<td>New</td>

								<td>Uploaded 2 days ago</td>

							</tr>
							<tr>

								<td>
									<div class="post-image">
										<div class="img-thumbnail">
											<a href="#"> <asset:image
													src="admin/images/post-thumb-1.jpg" />
											</a>
										</div>
									</div>
								</td>

								<td>#1387218</td>

								<td>New</td>

								<td>Uploaded 2 days ago</td>

							</tr>
							<tr>

								<td>
									<div class="post-image">
										<div class="img-thumbnail">
											<a href="#"> <asset:image
													src="admin/images/post-thumb-1.jpg" />
											</a>
										</div>
									</div>
								</td>

								<td>#1387218</td>

								<td>New</td>

								<td>Uploaded 2 days ago</td>

							</tr>
							<tr>

								<td>
									<div class="post-image">
										<div class="img-thumbnail">
											<a href="#"> <asset:image
													src="admin/images/post-thumb-1.jpg" />
											</a>
										</div>
									</div>
								</td>

								<td>#1387218</td>

								<td>New</td>

								<td>Uploaded 2 days ago</td>

							</tr>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>
</body>
</html>
