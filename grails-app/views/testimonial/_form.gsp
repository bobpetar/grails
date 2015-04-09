<%@ page import="com.retouch.Testimonial" %>

<div class="container">
    <div class="row show-grid">

        <div class="col-md-12">
            <h4 class="page-header text-capitalize">${testimonialInstance.fullName}</h4>

            <div class="form-group">
                <label class="col-md-3 control-label" for="fullName">Full Name</label>

                <div class="col-md-9">
                    <g:textField name="fullName" class="form-control"  required="" value="${testimonialInstance?.fullName}"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label" for="customerPosition">Customer Position</label>

                <div class="col-md-9">
                    <g:textField name="customerPosition" class="form-control" value="${testimonialInstance?.customerPosition}"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label" for="userType">User Type</label>

                <div class="col-md-9">
                    <g:select name="userType" class="form-control" from="${testimonialInstance.constraints.userType.inList}" required="" value="${testimonialInstance?.userType}" valueMessagePrefix="testimonial.userType"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label" for="testimonial">Testimonial</label>

                <div class="col-md-9">
                    <g:textArea rows="5" name="testimonial" class="form-control" required="" value="${testimonialInstance?.testimonial}"/>
                </div>
            </div>

            <g:textField name="photo" class="form-control hidden" value="${testimonialInstance?.photo}"/>


            <div class="form-group">
                <label class="col-md-3 control-label">Profile Photo</label>

                <div class="col-md-9">
                    <input type="file" name="photofile" accept='image/*'>
                </div>
            </div>

        </div>
    </div>
</div>
