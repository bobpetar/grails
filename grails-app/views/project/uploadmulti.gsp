<%--
  Created by IntelliJ IDEA.
  User: bkpandey
  Date: 3/16/15
  Time: 3:47 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    <asset:javascript src="admin/vendor/dropzone/css/dropzone.css"/>
    <asset:javascript src="admin/vendor/dropzone/css/basic.css"/>
</head>

<body>
<section class="page-top">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Upload</h1>
            </div>
        </div>
    </div>
</section>

<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <section class="panel">
                <header class="panel-heading">

                    <h2 class="panel-title">Upload your photo here!</h2>
                </header>

                <div class="panel-body">
                    <g:form action="addTaskMulti" name="multiple-upload" enctype="multipart/form-data" id="${projectInstance.projectId}" class="dropzone dz-square">

                    </g:form>
                </div>
            </section>
        </div>
    </div>
</div>

</body>
</html>