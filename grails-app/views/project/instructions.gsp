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
</head>
<body>
<div role="main" class="main">

    <section class="page-top">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li class="active">Instructions</li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h1>Instructions</h1>
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
        <hr class="tall">

        <div class="row show-grid">
            <div class="col-md-4">
                <g:form action="addInstructions" id="${projectInstance?.projectId}" >
                    <header class="panel-heading">
                        <h3>Instructions</h3>
                    </header>
                    <textarea class="form-control" rows="3" id="textareaDefault" required="required" name="note" style="margin-top: 0px; margin-bottom: 0px; height: 150px;" >${projectInstance?.note}</textarea>
                    <br>
                    <fieldset class="buttons">
                        <g:submitButton name="continue" class="btn btn-primary" value="Continue" />
                    </fieldset>
                </g:form>
           </div>
            <div class="col-md-8"> <div class="isotope-item document col-md-11" style="float:none;">
                <div class="thumbnail">
                    <div class="thumb-preview">
                        <a class="thumb-image" href="#">

                            <img class="img-responsive" %{--onError="this.onerror=null;this.src='${createLink(uri: '/')}assets/noimage.png';"--}% src="${grailsApplication.config.retouch.imageServer}${projectInstance?.originalImage?.imagePath}"/>

                        </a>

                    </div>

                </div>
            </div></div>
        </div>
    </div>








</div>

</body>
</html>