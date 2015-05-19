<%@ page import="com.retouch.Earning" %>



<div class="row">
<div class="form-group ${hasErrors(bean: earningInstance, field: 'amount', 'error')} required">
    <div class="col-md-12">
	<label for="amount" class="control-label">
		<g:message code="earning.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>

        <g:field name="amount" type="number" value="${earningInstance.amount}" required=""/>

    </div>

</div>
</div>

<div class="row">
<div class="form-group ${hasErrors(bean: earningInstance, field: 'createdDate', 'error')} required">
    <div class="col-md-12">
	<label for="createdDate" class="control-label">
		<g:message code="earning.createdDate.label" default="Created Date" />
		<span class="required-indicator">*</span>
	</label>

        <g:datePicker name="createdDate" precision="day"  value="${earningInstance?.createdDate}"  />

    </div>

</div>
</div>

<div class="row">
<div class="form-group ${hasErrors(bean: earningInstance, field: 'project', 'error')} required">
    <div class="col-md-12">
	<label for="project" class="control-label">
		<g:message code="earning.project.label" default="Project" />
		<span class="required-indicator">*</span>
	</label>

        <g:select id="project" name="project.id" from="${com.retouch.Project.list()}" optionKey="id" required="" value="${earningInstance?.project?.id}" class="many-to-one"/>

    </div>

</div>
</div>

<div class="row">
<div class="form-group ${hasErrors(bean: earningInstance, field: 'retoucher', 'error')} required">
    <div class="col-md-12">
	<label for="retoucher" class="control-label">
		<g:message code="earning.retoucher.label" default="Retoucher" />
		<span class="required-indicator">*</span>
	</label>

        <g:select id="retoucher" name="retoucher.id" from="${com.retouch.User.list()}" optionKey="id" required="" value="${earningInstance?.retoucher?.id}" class="many-to-one"/>

    </div>

</div>
</div>

