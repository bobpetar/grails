<%@ page import="com.retouch.User" %>
<%@ page import="com.retouch.Role" %>

<div class="container">
    <div class="row show-grid">
        <div class="col-md-3">

        </div>

        <div class="col-md-8">


            <hr class="dotted tall">
            <h4 class="mb-xlg">Change Password</h4>
            <fieldset class="mb-xl">
                <div class="form-group">
                    <label class="col-md-3 control-label" for="password">
                        Password</label>

                    <div class="col-md-8">
                        <g:passwordField name="password" id="password" class="form-control"
                                         required="" value="" />
                        <g:each in="${userInstance?.authorities?.id}" status="i" var="authority">
                            <input id="role" name="role" value="${authority}" type="hidden"/>
                        </g:each>
                    </div>
                </div>

                <div class="panel-footer">
                    <div class="row">
                        <div class="col-md-9 col-md-offset-3">
                            <button type="submit" class="btn btn-primary">Change</button>
                        </div>
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
</div>
