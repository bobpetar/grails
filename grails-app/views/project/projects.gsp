<%--
  Created by IntelliJ IDEA.
  User: Aasiz
  Date: 2/26/2015
  Time: 2:06 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div role="main" class="main">

    <section class="page-top">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>My Orders</h1>
                </div>
            </div>
        </div>
    </section>

    <div class="container">
        <nav class="nav-main mega-menu pull-right">
            <ul class="nav nav-pills nav-main text-uppercase" id="statusMenu">
                <li>
                    <g:remoteLink action="projectsStatusList" id="projectUploaded" name="New" update="projectFilterList"
                                  class="dropdown-toggle notification-icon">
                        Uploaded
                        <span class="badge">${allProjectInstance.status.count('Paid') + allProjectInstance.status.count('New')}</span>
                    </g:remoteLink>
                </li>
                <li>
                    <g:remoteLink action="projectsStatusList" id="In Progress" update="projectFilterList"
                                  class="dropdown-toggle notification-icon">
                        In Editing Progress
                        <span class="badge">${allProjectInstance.status.count('In Progress')}</span>
                    </g:remoteLink>
                </li>
                <li>
                    <g:remoteLink action="projectsStatusList" id="In Review" update="projectFilterList"
                                  class="dropdown-toggle notification-icon">
                        Client Reviewing
                        <span class="badge">${allProjectInstance.status.count('In Review')}</span>
                    </g:remoteLink>
                </li>
                <li>
                    <g:remoteLink action="projectsStatusList" id="Complete" update="projectFilterList"
                                  class="dropdown-toggle notification-icon">
                        Complete
                        <span class="badge">${allProjectInstance.status.count('Complete')}</span>
                    </g:remoteLink>
                </li>
            </ul>
        </nav>
    </div>

    <div class="container" id="projectFilterList">
        <div class="col-md-12">
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:each in="${projectInstanceList}" status="i" var="projectInstance">
                <div class="col-md-12 push-top">

                    <div class="col-md-4">
                        <img id="uploadedImage1" class="img-rounded img-responsive"
                             src="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.originalImage?.getLargeImageName()}">
                    </div>
                    <br>
                    <div class="well col-md-8 center">
                        <div class="col-md-4">
                            <g:if test="${projectInstance?.task?.payment?.status == 'COMPLETE'}"><a
                                    href="${createLink(uri: '/project/orderdetails')}/${projectInstance.projectId}">#${fieldValue(bean: projectInstance, field: "projectId")}</a></g:if>
                            <g:else><a
                                    href="${createLink(uri: '/project/technique')}/${projectInstance.projectId}#eyes">#${fieldValue(bean: projectInstance, field: "projectId")}</a></g:else>
                        </div>

                        <div class="col-md-4">
                            <prettytime:display date="${projectInstance.createdDate}"/>
                        </div>

                        <div class="col-md-4">
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


