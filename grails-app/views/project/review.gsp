<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'project.label', default: 'Project')}"/>
    <title><g:message code="default.create.label"
                      args="[entityName]"/></title>

    <script>
        function applyApproval(){
            $("#approvalField").val("YES");
            $("#myForm").removeAttr('onsubmit');
        }
    </script>
</head>

<body>
<div role="main" class="main">
    <section class="page-top">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="${createLink(uri: '/')}">Home</a></li>
                        <li class="active">Order Details</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <div class="container">

        <div class="panel-body">
            <div class="col-md-8">
            <!-- Technique list template -->
                <g:if test="${projectInstance?.task?.finalImage}">
                    <div class="isotope-item document col-md-12">
                        <h3>Retouched Image</h3>

                        <div class="col-md-12 push-bottom">

                            <g:if test="${projectInstance?.assignedTo}">
                                <span class="label btn-primary">Retoucher: ${projectInstance?.assignedTo?.firstname?.encodeAsHTML()} ${projectInstance?.assignedTo?.lastname?.encodeAsHTML()}</span>
                            </g:if>

                            <g:if test="${projectInstance?.createdDate}">
                                <span class="label btn-primary">Create Date: <prettytime:display date="${projectInstance.createdDate}" /></span>
                            </g:if>

                            <g:if test="${projectInstance?.lastUpdated}">
                                <span class="label btn-primary">Last Updated: <prettytime:display date="${projectInstance.lastUpdated}" /></span>
                            </g:if>

                        </div>
                        <g:if test="${projectInstance.status=='Complete'}">
                            <a class="img-thumbnail lightbox pull-left"	href="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.finalImage?.getLargeImageName()}" data-plugin-options='{"type":"image"}'>

                                <img style="width: 100%;" class="img-responsive"  src="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.finalImage?.getLargeImageName()}"/>
                                <span class="zoom">
                                    <i class="fa fa-search"></i>
                                </span>
                            </a>
                        </g:if>
                        <g:else>
                            <a style="width: 100%;" class="img-thumbnail lightbox pull-left"	href="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.finalImage?.getWaterMarkedImageName()}" data-plugin-options='{"type":"image"}'>

                                <img style="width: 100%;" class="img-responsive" src="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.finalImage?.getWaterMarkedImageName()}"/>
                                <span class="zoom">
                                    <i class="fa fa-search"></i>
                                </span>
                            </a>
                        </g:else>


                        <div class="col-md-12">
                            <g:if test="${projectInstance.status=='Complete'}">
                                <div class="form-group" style="float: right">
                                    <a type="button" class="mb-xs mt-xs mr-xs btn btn-primary" href="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.finalImage?.toString()}" target="_blank"><i class="fa fa-download"></i> Download</a>
                                </div>
                            </g:if>

                            <g:else>
                                <div class="form-group">
                                    <span class="label btn-warning">
                                        Please approve the task to download the watermark free version of the image.
                                    </span>
                                </div>
                                <div class="form-group" style="float: right">
                                    <a type="button" class="mb-xs mt-xs mr-xs btn btn-primary" href="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.finalImage?.getWaterMarkedImageName()}" target="_blank"><i class="fa fa-download"></i> Download</a>
                                    <g:link controller="project" type="button" class="mb-xs mt-xs mr-xs btn btn-primary" action="approveProject" id="${projectInstance.id}"><i class="fa fa-check"></i> Approve</g:link>
                                </div>

                            </g:else>
                        </div>

                    </div>
                </g:if>

                <div class="row isotope-item document col-md-12">
                    <hr class="tall">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="panel-actions">
                                <a href="#" class="panel-action panel-action-toggle" data-panel-toggle></a>
                            </div>

                            <h2 class="panel-title"><i class="fa fa-comment"></i>  Messages </h2>
                        </header>
                        <div class="panel-body" id="messageHolder" ic-get-from="${createLink(action: 'getMessageThread',controller:'project',id:projectInstance.task.id)}" ic-trigger-on="load">
                            <div class="panel-body loading-overlay-showing" data-loading-overlay="" data-loading-overlay-options="{ &quot;startShowing&quot;: true }" style="min-height: 150px; position: relative;">
                                Content.
                                <div class="loading-overlay" style="border-radius: 0 0 5px 5px; background-color: rgb(253, 253, 253);"><div class="loader black"></div></div></div>
                        </div>
                    </section>
                </div>


            </div>

            <div class="col-md-4">
                <div class="col-md-12">
                    <h3>Order Details</h3>
                    <hr>

                    <div class="col-md-12 push-bottom">
                        <h4>#${projectInstance.projectId}</h4>

                        <a class="img-thumbnail lightbox pull-left"	href="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.originalImage?.getLargeImageName()}" data-plugin-options='{"type":"image"}'>
                            <img class="img-responsive" style="width: 100%;" width="215" src="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.originalImage?.getThumbnailImageName()}">
                            <span class="zoom">
                                <i class="fa fa-search"></i>
                            </span>
                        </a>
                    </div>


                    <div class="col-md-12">
                        <div class="portfolio-item">
                            <a class="thumb-info lightbox" href="#showInvoice" data-plugin-options="{&quot;type&quot;:&quot;inline&quot;, preloader: false}">
                                Show Invoice Details
                            </a>
                        </div>
                        <!-- Invoice block start -->
                        <div id="techniqueList">
                            <g:render template="invoicelist"/>
                        </div>
                    </div>
                    <!-- Invoice block end -->
                </div>

            </div>
        </div>
    </div>
</div>
</body>

</html>