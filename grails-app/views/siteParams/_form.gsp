<%@ page import="com.retouch.SiteParams" %>



<div class="row">
<div class="form-group ${hasErrors(bean: siteParamsInstance, field: 'parameterName', 'error')} required">
    <div class="col-md-12">
	<label for="parameterName" class="control-label">
		<g:message code="siteParams.parameterName.label" default="Parameter Name" />
		<span class="required-indicator">*</span>
	</label>

        <g:textField name="parameterName" required="" value="${siteParamsInstance?.parameterName}"/>

    </div>

</div>
</div>

<div class="row">
<div class="form-group ${hasErrors(bean: siteParamsInstance, field: 'parameterValue', 'error')} required">
    <div class="col-md-12">
	<label for="parameterValue" class="control-label">
		<g:message code="siteParams.parameterValue.label" default="Parameter Value" />
		<span class="required-indicator">*</span>
	</label>

        <g:textField name="parameterValue" required="" value="${siteParamsInstance?.parameterValue}"/>

    </div>

</div>
</div>

