<%@ page import="com.retouch.User" %>
<%@ page import="com.retouch.Role" %>

<div class="container">
    <div class="row show-grid">
        <div class="col-md-3">

        </div>

        <div class="col-md-8">


            <hr class="dotted tall">
            <h4 class="mb-xlg">Payment Account</h4>
            <fieldset class="mb-xl">
                <div class="form-group">
                    <label class="col-md-3 control-label" for="paypalemail">
                        Paypal ID</label>

                    <div class="col-md-8">
                        <g:textField name="paypalAccount" id="paypalemail" class="form-control"   required="" value="${userInstance?.paypalAccount}" />
                    </div>
                </div>

                <div class="panel-footer">
                    <div class="row">
                        <div class="col-md-9 col-md-offset-3">
                            <button type="submit" class="btn btn-primary">Update</button>
                        </div>
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
</div>
