<%@ page import="com.retouch.User" %>
<%@ page import="com.retouch.Role" %>

<div class="container">
    <div class="row show-grid">
        <div class="col-md-3">
            <section>
                <h4 class="page-header">User Information</h4>

                <div class="row fontawesome-icon-list">

                    <div class="col-md-12 col-sm-12">
                        <i class="fa fa-user"></i>
                            <g:fieldValue bean="${userInstance}" field="username"/>
                    </div>

                    <div class="col-md-12 col-sm-12">
                        <i class="fa fa-smile-o"></i>
                        <g:fieldValue bean="${userInstance}" field="firstname"/>
                        <g:fieldValue bean="${userInstance}" field="lastname"/>
                    </div>

                    <div class="col-md-12 col-sm-12">
                        <i class="fa fa-envelope"></i>
                        <g:fieldValue bean="${userInstance}" field="email"/>
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

        <div class="col-md-8">
            <h4 class="page-header">Personal Information</h4>
            <fieldset>
                <div class="form-group">
                    <label class="col-md-3 control-label" for="firstname">First
                    Name</label>

                    <div class="col-md-8">
                        <g:textField name="firstname" id="firstname" class="form-control"
                                     required="" value="${userInstance?.firstname}"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label" for="lastname">Last
                    Name</label>

                    <div class="col-md-8">
                        <g:textField name="lastname" id="lastname" class="form-control"
                                     required="" value="${userInstance?.lastname}"/>
                    </div>
                </div>
            </fieldset>
            <sec:ifAnyGranted roles="ROLE_ADMIN">
                <hr class="dotted tall">
                <h4 class="mb-xlg">Access Control</h4>
                <fieldset>
                    <div class="form-group">
                        <label class="col-xs-5 control-label mt-xs pt-none">User
                        Role</label>

                        <div class="col-md-5">
                            <div class="">
                                <g:select class="form-control populate" name="role" from="${Role.list()}"
                                          value="${userInstance.id ? userInstance?.authorities.iterator().next() : ""}"/>
                                <label for="enabled"></label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-5 control-label mt-xs pt-none">Enabled</label>

                        <div class="col-md-5">
                            <div class="checkbox-custom checkbox-default checkbox-inline mt-xs">
                                <g:checkBox name="enabled" id="enabled"
                                            value="${userInstance?.enabled}"/>
                                <label for="enabled"></label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-5 control-label mt-xs pt-none">Password
                        Expired</label>

                        <div class="col-md-5">
                            <div class="checkbox-custom checkbox-default checkbox-inline mt-xs">
                                <g:checkBox name="passwordExpired" id="passwordExpired"
                                            value="${userInstance?.passwordExpired}"/>
                                <label for="passwordExpired"></label>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </sec:ifAnyGranted>
            <hr class="dotted tall">
            <h4 class="mb-xlg">Enter Password</h4>
            <fieldset class="mb-xl">
                <div class="form-group">
                    <label class="col-md-3 control-label" for="password">
                        Password</label>

                    <div class="col-md-8">
                        <g:passwordField name="password" id="password" class="form-control"
                                         required="" value="${userInstance?.password}"/>
                    </div>
                </div>

                <div class="panel-footer">
                    <div class="row">
                        <div class="col-md-9 col-md-offset-3">
                            <button type="submit" class="btn btn-primary">Submit</button>
                            <button type="reset" class="btn btn-default">Reset</button>
                        </div>
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
</div>
