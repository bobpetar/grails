<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page expressionCodec="none" %>
<%@ page import="com.retouch.Technique" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'project.label', default: 'Technique')}"/>
    <title><g:message code="default.create.label"
                      args="[entityName]"/></title>
</head>

<body>
<div role="main" class="main">

    <section class="page-top">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li class="active"><g:link action="index"><g:message code="default.list.label"
                                                                              args="[entityName]"/></g:link></li>
                        <li class="active"><g:link action="create"><g:message code="default.create.label"
                                                                              args="[entityName]"/></g:link></li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <div class="container">

        <div class="panel-body">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-6">
                        <img src="${grailsApplication.config.retouch.techniqueImageServer}${techniqueInstance.getLargeImageName()}"
                             class="img-responsive" alt="">
                    </div>

                    <div class="col-md-6">

                        <h4><strong>${techniqueInstance.name}</strong></h4>

                        <p class="taller"> ${techniqueInstance.description}</p>



                        <g:form url="[resource:techniqueInstance, action:'delete']" method="DELETE">
                            <g:link action="edit" class="btn btn-primary btn-icon" resource="${techniqueInstance}"><i class="fa fa-external-link"></i>Edit Me! </g:link>
                            <span data-appear-animation-delay="800" data-appear-animation="rotateInUpLeft"
                                  class="arrow hlb appear-animation rotateInUpLeft appear-animation-visible"
                                  style="animation-delay: 800ms;"></span>
                                <g:actionSubmit class="btn btn-danger btn-icon" action="delete" value="Delete Me!" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                       </g:form>

                        <ul class="portfolio-details">
                            <li>
                                <ul class="list list-skills icons list-unstyled list-inline text-uppercase">
                                    <li><i class="fa fa-check-circle"></i> ${techniqueInstance.groep} (group)</li>
                                </ul>
                            </li>
                        </ul>

                    </div>
                </div>

            </div>

        </div>

    </div>
</div>
</body>

</html>