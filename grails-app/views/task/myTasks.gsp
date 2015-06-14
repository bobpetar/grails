<%--
  Created by IntelliJ IDEA.
  User: Aasiz
  Date: 2/26/2015
  Time: 2:06 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'project.label', default: 'My Task')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<div role="main" class="main">

    <section class="page-top">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li class="active">My Tasks</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <div class="container" id="projectFilterList">
        <div class="col-md-12">

            <div class="col-md-9 pull-right bold">
                <div class="col-md-3">
                    Project Id
                </div>
                <div class="col-md-3">
                    Date Created
                </div>
                <div class="col-md-3">
                    Last Updated
                </div>
                <div class="col-md-3">
                    Status
                </div>
            </div>

            <g:each in="${projectInstanceList}" status="i" var="projectInstance">
                <div class="col-md-12 push-top">

                    <div class="col-md-3">
                        <g:link action="show" id="${projectInstance.id}">
                            <img id="uploadedImage1" class="img-rounded img-responsive"
                                 src="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.originalImage?.getLargeImageName()}">
                        </g:link>
                    </div>

                    <br>
                    <div class="well col-md-9 center">
                        <div class="col-md-3">
                            <g:link action="show" id="${projectInstance.id}">${fieldValue(bean: projectInstance, field: "projectId")}</g:link>
                        </div>

                        <div class="col-md-3">
                            <prettytime:display date="${projectInstance.createdDate}"/>
                        </div>

                        <div class="col-md-3">
                            <prettytime:display date="${projectInstance.lastUpdated}"/>
                        </div>

                        <div class="col-md-3">
                            <span class="tag label
                            <g:if test="${projectInstance.status == 'New'}">btn-danger</g:if>
                            <g:if test="${projectInstance.status == 'Paid'}">btn-warning</g:if>
                            <g:if test="${projectInstance.status == 'In Progress'}">btn-info</g:if>
                            <g:if test="${projectInstance.status == 'In Review'}">btn-dark</g:if>
                            <g:if test="${projectInstance.status == 'Complete'}">btn-success</g:if> ">
                                ${fieldValue(bean: projectInstance, field: "status")}
                            </span>
                        </div>
                    </div>
                </div>
                <hr class="tall" />
            </g:each>
            <ul class="pagination pull-right">
                <retouch:paginate total="${projectInstanceCount ?: 0}"/>
            </ul>
        </div>
    </div>








</div>

</body>
</html>


