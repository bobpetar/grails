
<%@ page import="com.retouch.Project" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Order Details</title>
</head>
<body>

<section class="page-top">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>
                    Order Details
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

                    <h2 class="panel-title">Order Details</h2>
                    <p class="panel-subtitle">
                        <prettytime:display date="${projectInstance.createdDate}" />
                    </p>
                </header>
                <div class="panel-body">
                    <div class="row">
                        <div class="isotope-item document col-md-11" style="float:none;">

                            <br>
                            <a class="img-thumbnail lightbox pull-left"	href="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.originalImage?.getLargeImageName()}" data-plugin-options='{"type":"image"}'>
                                <img class="img-responsive" style="width: 100%;" width="215" src="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.originalImage?.getThumbnailImageName()}">
                                <span class="zoom">
                                    <i class="fa fa-search"></i>
                                </span>
                            </a>

                            %{--    <div class="form-group" style="float: right">
                                    <a type="button" class="btn btn-default btn-sm" href="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.originalImage?.toString()}" target="_blank"><i class="fa fa-download"></i> Download</a>
                                </div>--}%
                        </div>

                    </div>
                    <hr class="tall">
                    <div class="row">
                        <div class="form-group">
                            <ul class="property-list project">

                                <g:if test="${projectInstance?.assignedTo}">
                                    <li class="fieldcontain">
                                        <span id="assignedTo-label" class="property-label">Retoucher</span>

                                        <span class="property-value" aria-labelledby="assignedTo-label">: ${projectInstance?.assignedTo?.username?.encodeAsHTML()}</span>

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
                                        <span id="createdDate-label" class="property-label">Created</span>

                                        <span class="property-value" aria-labelledby="createdDate-label">: <prettytime:display date="${projectInstance.createdDate}" /></span>

                                    </li>
                                </g:if>

                                <g:if test="${projectInstance?.lastUpdated}">
                                    <li class="fieldcontain">
                                        <span id="lastUpdated-label" class="property-label"><g:message code="project.lastUpdated.label" default="Last Updated" /></span>

                                        <span class="property-value" aria-labelledby="lastUpdated-label">: <prettytime:display date="${projectInstance.lastUpdated}" /></span>

                                    </li>
                                </g:if>

                      %{--          <g:if test="${projectInstance?.status}">
                                    <li class="fieldcontain">
                                        <span id="status-label" class="property-label"><g:message code="project.status.label" default="Status" /></span>

                                        <span class="property-value" aria-labelledby="status-label">: <g:fieldValue bean="${projectInstance}" field="status"/></span>

                                    </li>
                                </g:if>--}%

                            </ul>

                            %{--<div class="form-group">
                                <label class="control-label">Techniques</label>
                                <br>
                                <g:each in="${projectInstance?.task?.techniques}" >
                                    <span class="label label-success" title="${it.description}">${it.name}</span>
                                </g:each>
                            </div>--}%

                        </div>

                    </div>

                </div>

            </section>

            <div class="row">
                <label class="control-label">Techniques</label>
                <div class="col-sm-12">
                    <g:each in="${projectInstance?.task?.techniques}" >
                        <div class="feature-box">
                            %{--<div class="feature-box-icon">
                                <i class="fa fa-check"></i>
                            </div>--}%
                            <div class="feature-box-info">
                                <h5 class="shorter"><i class="fa fa-check"></i> ${it.name}</h5>
                               %{-- <p class="tall">${it.description}</p>--}%
                            </div>
                        </div>

                    </g:each>



                </div>
            </div>
        </div>
        <div class="col-md-8">


            <g:if test="${projectInstance?.task?.finalImage}">
                <div class="isotope-item document col-md-11" style="float:none;">
                    <h2>Retouched Image</h2>


                            <a style="width: 100%;" class="img-thumbnail lightbox pull-left"	href="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.finalImage?.getLargeImageName()}" data-plugin-options='{"type":"image"}'>

                                    <img class="img-responsive" style="width: 100%;" %{--onError="this.onerror=null;this.src='${createLink(uri: '/')}assets/noimage.png';"--}% src="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.finalImage?.getLargeImageName()}"/>

                                <span class="zoom">
                                    <i class="fa fa-search"></i>
                                </span>
                            </a>

                    <div class="form-group" style="float: right">
                        <a type="button" class="mb-xs mt-xs mr-xs btn btn-primary" href="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.finalImage?.toString()}" target="_blank"><i class="fa fa-download"></i> Download</a>
                    </div>

                </div>
            </g:if>


            <div class="row isotope-item document col-md-11">
                <hr class="tall">

                <section class="panel">

                    <header class="panel-heading">
                        <div class="panel-actions">
                            <a href="#" class="panel-action panel-action-toggle" data-panel-toggle></a>
                            %{--                <a href="#" class="panel-action panel-action-dismiss" data-panel-dismiss></a>--}%
                        </div>

                        <h2 class="panel-title"><i class="fa fa-comment"></i>  Messages </h2>
                    </header>
                    <div class="panel-body" id="messageHolder" ic-get-from="${createLink(action: 'getMessageThread',controller:'project',id:projectInstance.task.id)}" ic-trigger-on="load">
                        <div class="panel-body loading-overlay-showing" data-loading-overlay="" data-loading-overlay-options="{ &quot;startShowing&quot;: true }" style="min-height: 150px; position: relative;">
                            Content.
                            <div class="loading-overlay" style="border-radius: 0px 0px 5px 5px; background-color: rgb(253, 253, 253);"><div class="loader black"></div></div></div>


                    </div>
                </section>

            </div>


        </div>
    </div>
</div>


</body>
</html>
