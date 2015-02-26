<%@ page import="com.retouch.Project" %>



<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'assignedTo', 'error')} ">
	<label for="assignedTo">
		<g:message code="project.assignedTo.label" default="Assigned To" />
		
	</label>
	<g:select id="assignedTo" name="assignedTo.id" from="${com.retouch.User.list()}" optionKey="id" value="${projectInstance?.assignedTo?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="project.createdBy.label" default="Created By" />
		
	</label>
	<g:select id="createdBy" name="createdBy.id" from="${com.retouch.User.list()}" optionKey="id" value="${projectInstance?.createdBy?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'createdDate', 'error')} required">
	<label for="createdDate">
		<g:message code="project.createdDate.label" default="Created Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdDate" precision="day"  value="${projectInstance?.createdDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'note', 'error')} required">
	<label for="note">
		<g:message code="project.note.label" default="Note" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="note" required="" value="${projectInstance?.note}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="project.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="status" required="" value="${projectInstance?.status}"/>

</div>

