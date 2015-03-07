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
                        <li class="active">Service</li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h1>Service</h1>
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
            <div class="col-md-12">
                <div class="isotope-item document col-md-3">
                    <div class="thumbnail">
                        <div class="thumb-preview">
                            <a class="thumb-image" href="#">

                                <img class="img-responsive" %{--onError="this.onerror=null;this.src='${createLink(uri: '/')}assets/noimage.png';"--}% src="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.originalImage?.getThumbnailImageName()}"/>

                            </a>

                        </div>

                    </div>
                </div>
                <div class="col-md-9">
                    <h4>Instructions</h4>

                        <g:each in="${projectInstance.task.techniques}">
                            <span class="label label-success" title="${it.description}">${it.name}</span>
                        </g:each>
                   <br>
                    <span>${projectInstance.note}</span>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="tabs">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#regularService" data-toggle="tab"> Regular</a>
                        </li>
                        <li>
                            <a href="#standardService" data-toggle="tab"><i class="fa fa-star"></i>Standard</a>
                        </li>
                        <li>
                            <a href="#specialService" data-toggle="tab">Special</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="regularService" class="tab-pane active">
                            <p>Regular</p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitat.</p>
                        </div>
                        <div id="standardService" class="tab-pane">
                            <p>Standard</p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitat.</p>
                        </div>
                        <div id="specialService" class="tab-pane">
                            <p>Special</p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitat.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>

</body>
</html>