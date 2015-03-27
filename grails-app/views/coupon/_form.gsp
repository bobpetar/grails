<%@ page import="com.retouch.Coupon" %>



<div class="row">
<div class="form-group ${hasErrors(bean: couponInstance, field: 'discountPercent', 'error')} required">
    <div class="col-md-12">
	<label for="discountPercent" class="control-label">
		<g:message code="coupon.discountPercent.label" default="Discount Percent" />
		<span class="required-indicator">*</span>
	</label>

        <g:field name="discountPercent" type="number" min="1" max="100" value="${couponInstance.discountPercent}" required=""/>

    </div>

</div>
</div>

<div class="row">
<div class="form-group ${hasErrors(bean: couponInstance, field: 'active', 'error')} ">
    <div class="col-md-12">
	<label for="active" class="control-label">
		<g:message code="coupon.active.label" default="Active" />
		
	</label>

        <g:checkBox name="active" value="${couponInstance?.active}" />

    </div>

</div>
</div>

<div class="row">
<div class="form-group ${hasErrors(bean: couponInstance, field: 'daysValid', 'error')} required">
    <div class="col-md-12">
	<label for="daysValid" class="control-label">
		<g:message code="coupon.daysValid.label" default="Days Valid" />
		<span class="required-indicator">*</span>
	</label>

        <g:field name="daysValid" type="number" value="${couponInstance.daysValid}" required=""/>

    </div>

</div>
</div>

<div class="row">
<div class="form-group ${hasErrors(bean: couponInstance, field: 'name', 'error')} required">
    <div class="col-md-12">
	<label for="name" class="control-label">
		<g:message code="coupon.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>

        <g:textField name="name" required="" value="${couponInstance?.name}"/>

    </div>

</div>
</div>

