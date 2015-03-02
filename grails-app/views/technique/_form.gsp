<%@ page import="com.retouch.Technique" %>



<div class="fieldcontain ${hasErrors(bean: techniqueInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="technique.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${techniqueInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: techniqueInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="technique.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${techniqueInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: techniqueInstance, field: 'groep', 'error')} ">
	<label for="groep">
		<g:message code="technique.groep.label" default="Groep" />
		
	</label>
	<g:textField name="groep" value="${techniqueInstance?.groep}"/>

</div>

