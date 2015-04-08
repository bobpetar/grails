<%@ page import="com.retouch.Testimonial" %>



<div class="row">
<div class="form-group ${hasErrors(bean: testimonialInstance, field: 'fullName', 'error')} required">
    <div class="col-md-12">
	<label for="fullName" class="control-label">
		<g:message code="testimonial.fullName.label" default="Full Name" />
		<span class="required-indicator">*</span>
	</label>

        <g:textField name="fullName" required="" value="${testimonialInstance?.fullName}"/>

    </div>

</div>
</div>

<div class="row">
<div class="form-group ${hasErrors(bean: testimonialInstance, field: 'customerPosition', 'error')} ">
    <div class="col-md-12">
	<label for="customerPosition" class="control-label">
		<g:message code="testimonial.customerPosition.label" default="Customer Position" />
		
	</label>

        <g:textField name="customerPosition" value="${testimonialInstance?.customerPosition}"/>

    </div>

</div>
</div>

<div class="row">
<div class="form-group ${hasErrors(bean: testimonialInstance, field: 'testimonial', 'error')} required">
    <div class="col-md-12">
	<label for="testimonial" class="control-label">
		<g:message code="testimonial.testimonial.label" default="Testimonial" />
		<span class="required-indicator">*</span>
	</label>

        <g:textField name="testimonial" required="" value="${testimonialInstance?.testimonial}"/>

    </div>

</div>
</div>

<div class="row">
<div class="form-group ${hasErrors(bean: testimonialInstance, field: 'userType', 'error')} required">
    <div class="col-md-12">
	<label for="userType" class="control-label">
		<g:message code="testimonial.userType.label" default="User Type" />
		<span class="required-indicator">*</span>
	</label>

        <g:select name="userType" from="${testimonialInstance.constraints.userType.inList}" required="" value="${testimonialInstance?.userType}" valueMessagePrefix="testimonial.userType"/>

    </div>

</div>
</div>

<div class="row">
<div class="form-group ${hasErrors(bean: testimonialInstance, field: 'photo', 'error')} ">
    <div class="col-md-12">
	<label for="photo" class="control-label">
		<g:message code="testimonial.photo.label" default="Photo" />
		
	</label>

        <g:textField name="photo" value="${testimonialInstance?.photo}"/>

    </div>

</div>
</div>

