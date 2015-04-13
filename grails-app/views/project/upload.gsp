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
    <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    <asset:javascript src="admin/vendor/dropzone/css/dropzone.css"/>
    <asset:javascript src="admin/vendor/dropzone/css/basic.css"/>
</head>

<body>
<div role="main" class="main">

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

        <div class="row center">
            <div class="col-md-12">
                <g:form action="addTask" enctype="multipart/form-data" id="${projectInstance.projectId}">
                    <div class="fileupload fileupload-new" data-provides="fileupload">
                        <div class="input-append">
                            <div class="uneditable-input">
                                <i class="fa fa-file fileupload-exists"></i>
                                <span class="fileupload-preview"></span>
                            </div>
                            <span class="btn btn-default btn-file">
                                <span class="fileupload-exists">Change</span>
                                <span class="fileupload-new">Select file</span>
                                <input type="file" name="reimage" required="required" accept='image/*'/>
                            </span>
                            <a href="#" class="btn btn-default fileupload-exists" data-dismiss="fileupload">Remove</a>
                        </div>
                    </div>
                    <br>
                    <fieldset class="buttons">
                        <g:submitButton name="upload" class="btn btn-primary btn-lg" value="Upload Image!"/>
                    </fieldset>
                </g:form>
            </div>
        </div>

        <hr class="tall">
    </div>

</div>

</body>
</html>