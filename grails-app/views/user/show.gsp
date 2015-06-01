<%@ page import="com.retouch.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
    <script type="application/javascript">
        window.onload = function(){
            <g:if test="${userProjects}">
            $("#deleteme").prop("disabled",true);
            </g:if>
        }
    </script>
</head>

<body>
<div class="main" role="main">

    <section class="page-top">
        <div class="container">
            <div class="row">
                <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <div class="col-md-12">

                        <ul class="breadcrumb">
                            <li class="active"><a href="${createLink(uri: '/user')}"><g:message
                                    code="default.list.label" args="[entityName]"/></a></li>
                            <li class="active"><a
                                    href="${createLink(uri: '/user/create')}"><g:message
                                        code="default.create.label" args="[entityName]"/></a></li>
                            <li class="active"> <g:link class="edit" action="edit" resource="${userInstance}">
                                <g:message code="default.edit.label" args="[entityName]"/>
                            </g:link></li>
                            <li><g:message code="default.show.label" args="[entityName]"/></li>

                        </ul>
                    </div>
                </sec:ifAnyGranted>
            </div>

        </div>
    </section>

    <div class="container">
        <div class="row show-grid">
            <h4 class="page-header">User Information</h4>
            <div class="col-md-3">
                <section>
                    <div class="row fontawesome-icon-list">
                        <div class="col-md-12 col-sm-12">
                            <i class="fa fa-user"></i>
                            <g:link class="edit" action="edit" resource="${userInstance}">
                                <g:fieldValue bean="${userInstance}" field="username"/>
                            </g:link>
                        </div>

                        <div class="col-md-12 col-sm-12">
                            <i class="fa fa-smile-o"></i>
                            <g:fieldValue bean="${userInstance}" field="firstname"/>
                            <g:fieldValue bean="${userInstance}" field="lastname"/>
                        </div>

                        <sec:ifAllGranted roles="ROLE_ADMIN">
                            <div class="col-md-12 col-sm-12">
                                <i class="fa fa-thumbs-up"></i>
                                <g:each in="${userInstance.authorities}" status="j" var="roleInstance">
                                    <span class="tag label btn-danger">
                                        ${roleInstance}
                                    </span>
                                </g:each>
                            </div>
                        </sec:ifAllGranted>
                        <hr class="tall"/>
                    </div>
                </section>
            </div>

            <div class="col-md-9">
                <sec:ifAllGranted roles="ROLE_ADMIN">
                <g:form url="[resource:userInstance, action:'delete']" method="DELETE">
                    <g:link action="edit" class="btn btn-primary btn-icon" resource="${userInstance}"><i class="fa fa-external-link"></i>Edit Me! </g:link>
                    <span data-appear-animation-delay="800" data-appear-animation="rotateInUpLeft"
                          class="arrow hlb appear-animation rotateInUpLeft appear-animation-visible"
                          style="animation-delay: 800ms;"></span>
                    <g:actionSubmit class="btn btn-danger btn-icon" id="deleteme" action="delete" value="Delete Me!" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </g:form>
                </sec:ifAllGranted>
                <g:if test="${userProjects}">
                <h4 class="page-header">Project List: Uploaded</h4>
                </g:if>
                <table class="table table-striped">
                    <tbody>
                    <g:each in="${userProjects}">
                        <tr>

                            <td>#${it.projectId}</td>

                            <td>${it.status}</td>

                            <td><prettytime:display date="${it.createdDate}" /></td>

                        </tr>
                    </g:each>


                    </tbody>
                </table>

            </div>
        </div>
    </div>
</div>
</body>
</html>
