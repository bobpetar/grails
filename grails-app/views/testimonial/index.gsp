<%@ page import="com.retouch.Testimonial" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'testimonial.label', default: 'Testimonial')}" />
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
                            <li class="active"><g:link action="create"><g:message code="default.create.label"
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
                            <g:sortableColumn property="photo" title="${message(code: 'testimonial.photo.label', default: 'Image')}" />

                            <g:sortableColumn property="fullName" title="${message(code: 'testimonial.fullName.label', default: 'Full Name')}" />

                            <g:sortableColumn property="customerPosition" title="${message(code: 'testimonial.customerPosition.label', default: 'Customer Position')}" />

                            <g:sortableColumn property="testimonial" title="${message(code: 'testimonial.testimonial.label', default: 'Testimonial')}" />

                            <g:sortableColumn property="userType" title="${message(code: 'testimonial.userType.label', default: 'User Type')}" />

                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${testimonialInstanceList}" status="i"
                                var="testimonialInstance">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                <td>
                                    <g:if test="${testimonialInstance.photo}">
                                        <div class="img-thumbnail img-thumbnail-small">
                                            <img src="${grailsApplication?.config?.retouch?.techniqueImageServer}${testimonialInstance?.getThumbnailImageName()}"
                                                 class="img-responsive" alt="">

                                        </div>
                                    </g:if>
                                </td>

                                <td><g:link action="show" id="${testimonialInstance.id}">${fieldValue(bean: testimonialInstance, field: "fullName")}</g:link></td>

                                <td>${fieldValue(bean: testimonialInstance, field: "customerPosition")}</td>

                                <td>${fieldValue(bean: testimonialInstance, field: "testimonial")}</td>

                                <td>${fieldValue(bean: testimonialInstance, field: "userType")}</td>

                            </tr>
                        </g:each>
                        </tbody>
                    </table>
					<ul class="pagination">
						<retouch:paginate total="${testimonialInstanceCount ?: 0}" />
					</ul>

				</div>
			</div>
			</section>
		</div>
	</div>
</body>
</html>
