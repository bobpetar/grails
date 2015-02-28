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
    <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <asset:javascript src="admin/vendor/dropzone/css/dropzone.css" />
    <asset:javascript src="admin/vendor/dropzone/css/basic.css" />
</head>
<body>
<div role="main" class="main">

    <section class="page-top">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li class="active">Upload</li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h1>Upload</h1>
                </div>
            </div>
        </div>
    </section>

    <div class="container">

        <div class="row center">
            <div class="col-md-12">
                <g:render template="flow"/>
            </div>
        </div>

        <div class="row center">
            <div class="col-md-12">
                <g:form action="addTask" enctype="multipart/form-data" id="${projectInstance.projectId}" >
                    <fieldset class="buttons">
                        <input type="file" name="reimage" required="required" style="margin: auto;" class="btn btn-primary btn-lg"/>
                    </fieldset>
                    <br>
                    <fieldset class="buttons">
                        <g:submitButton name="upload" class="btn btn-primary btn-lg" value="Upload" />
                    </fieldset>
                </g:form>

               %{-- <div class="col-xs-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="panel-actions">
                                <a href="#" class="panel-action panel-action-toggle" data-panel-toggle></a>
                                <a href="#" class="panel-action panel-action-dismiss" data-panel-dismiss></a>
                            </div>

                            <h2 class="panel-title">File Upload Drag'n Drop</h2>
                        </header>
                        <div class="panel-body">
                            <form action="/upload" class="dropzone dz-square" id="dropzone-example"></form>
                        </div>
                    </section>
                </div>--}%


            </div>
        </div>

        <hr class="tall">
    </div>


</div>

</body>
</html>