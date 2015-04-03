
<%@ page import="com.retouch.Project" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'project.label', default: 'Task')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

<section class="page-top">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <ul class="breadcrumb">
                    <li><a class="home" href="${createLink(uri: '/')}"><g:message
                            code="default.home.label" /></a></li>
                    <li>My Task</li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <h1>
                    Task # ${projectInstance.projectId}
                </h1>
            </div>
        </div>
    </div>
</section>

<div class="container">

    <div class="row show-grid">
        <div class="col-md-4">


            <section class="panel">

                <header class="panel-heading">
                    <div class="panel-actions">
                        <a href="#" class="panel-action panel-action-toggle" data-panel-toggle></a>
                        %{--                <a href="#" class="panel-action panel-action-dismiss" data-panel-dismiss></a>--}%
                    </div>

                    <h2 class="panel-title">Task Details</h2>
                    <p class="panel-subtitle">
                        <g:formatDate date="${projectInstance?.createdDate}" />
                    </p>
                </header>
                <div class="panel-body">

                    <div class="row">
                        <div class="form-group">
                            <ul class="property-list project">

                                <g:if test="${projectInstance?.assignedTo}">
                                    <li class="fieldcontain">
                                        <span id="assignedTo-label" class="property-label"><g:message code="project.assignedTo.label" default="Assigned To" /></span>

                                        <span class="property-value" aria-labelledby="assignedTo-label">: ${projectInstance?.assignedTo?.username?.encodeAsHTML()}</span>

                                    </li>
                                </g:if>

                                <g:if test="${projectInstance?.client}">
                                    <li class="fieldcontain">
                                        <span id="client-label" class="property-label"><g:message code="project.client.label" default="Client" /></span>

                                        <span class="property-value" aria-labelledby="client-label">: ${projectInstance?.client?.username?.encodeAsHTML()}</span>

                                    </li>
                                </g:if>

                                <g:if test="${projectInstance?.note}">
                                    <li class="fieldcontain">
                                        <span id="note-label" class="property-label"><g:message code="project.note.label" default="Note" /></span>

                                        <span class="property-value" aria-labelledby="note-label">: <g:fieldValue bean="${projectInstance}" field="note"/></span>

                                    </li>
                                </g:if>



                                <g:if test="${projectInstance?.projectId}">
                                    <li class="fieldcontain">
                                        <span id="projectId-label" class="property-label"><g:message code="project.projectId.label" default="Project Id" /></span>

                                        <span class="property-value" aria-labelledby="projectId-label">: <g:fieldValue bean="${projectInstance}" field="projectId"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${projectInstance?.createdDate}">
                                    <li class="fieldcontain">
                                        <span id="createdDate-label" class="property-label"><g:message code="project.createdDate.label" default="Created Date" /></span>

                                        <span class="property-value" aria-labelledby="createdDate-label">: <g:formatDate date="${projectInstance?.createdDate}" /></span>

                                    </li>
                                </g:if>

                                <g:if test="${projectInstance?.lastUpdated}">
                                    <li class="fieldcontain">
                                        <span id="lastUpdated-label" class="property-label"><g:message code="project.lastUpdated.label" default="Last Updated" /></span>

                                        <span class="property-value" aria-labelledby="lastUpdated-label">: <g:formatDate date="${projectInstance?.lastUpdated}" /></span>

                                    </li>
                                </g:if>

                                <g:if test="${projectInstance?.status}">
                                    <li class="fieldcontain">
                                        <span id="status-label" class="property-label"><g:message code="project.status.label" default="Status" /></span>

                                        <span class="property-value" aria-labelledby="status-label">: <g:fieldValue bean="${projectInstance}" field="status"/></span>

                                    </li>
                                </g:if>

                            </ul>

                            <div class="form-group">
                                <label class="control-label">Techniques</label>
                                <br>
                                <g:each in="${projectInstance?.task?.techniques}" >
                                    <span class="label label-success" title="${it.description}">${it.name}</span>
                                </g:each>
                            </div>
                            <div class="form-group">
                                <g:if test="${projectInstance?.assignedTo}">
                                    <label class="control-label">Upload Finished Image</label>
                                    <g:form action="upload" enctype="multipart/form-data" id="${projectInstance.id}" >
                                        <fieldset class="buttons">
                                            <input type="file" name="reimage" required="required" style="margin: auto;"/>
                                        </fieldset>
                                        <br>
                                        <fieldset class="buttons">
                                            <g:submitButton name="upload" class="btn btn-primary btn-sm " value="Upload" />
                                        </fieldset>
                                    </g:form>
                                </g:if>
                                <g:else>
                                    <g:link controller="task" action="claimTask" id="${projectInstance.id}" class="mb-xs mt-xs mr-xs btn btn-primary "><i class="fa fa-flag-o"></i> Claim</g:link>
                                </g:else>

                            </div>
                        </div>

                    </div>

                </div>

            </section>

        </div>
        <div class="col-md-8">

            <div class="isotope-item document col-md-11" style="float:none;">
                <h2>Original Image</h2>
                <div class="thumbnail">
                    <div class="thumb-preview">
                        <a class="thumb-image" href="javascript:void(0);">
                            <div id="imageovelaynote">
                                <img id="uploadedImage" class="%{--img-responsive--}%" style="width: 100%;" %{--onError="this.onerror=null;this.src='${createLink(uri: '/')}assets/noimage.png';"--}% src="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.originalImage?.getLargeImageName()}"/>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="form-group" style="float: right">
                    <a type="button" class="mb-xs mt-xs mr-xs btn btn-primary" href="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.originalImage?.toString()}" target="_blank"><i class="fa fa-download"></i> Download</a>
                </div>

            </div>

<g:if test="${projectInstance?.task?.finalImage}">
    <hr class="tall">
    <div class="isotope-item document col-md-11" style="float:none;">
        <h2>Retouched Image</h2>
        <div class="thumbnail">
            <div class="thumb-preview">
                <a class="thumb-image" href="javascript:void(0);">
                    <div>
                        <img class="%{--img-responsive--}%" style="width: 100%;" %{--onError="this.onerror=null;this.src='${createLink(uri: '/')}assets/noimage.png';"--}% src="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.finalImage?.getLargeImageName()}"/>
                    </div>
                </a>
            </div>
        </div>
        <div class="form-group" style="float: right">
            <a type="button" class="mb-xs mt-xs mr-xs btn btn-primary" href="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.finalImage?.toString()}" target="_blank"><i class="fa fa-download"></i> Download</a>
        </div>

    </div>
</g:if>

        </div>
    </div>
</div>


</body>
</html>
