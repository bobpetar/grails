<%@ page import="com.retouch.Project" %>



<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'assignedTo', 'error')} ">
	<label for="assignedTo">
		<g:message code="project.assignedTo.label" default="Assigned To" />
		
	</label>
	<g:select id="assignedTo" name="assignedTo.id" from="${com.retouch.User.list()}" optionKey="id" value="${projectInstance?.assignedTo?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'note', 'error')} ">
	<label for="note">
		<g:message code="project.note.label" default="Note" />
		
	</label>
	<g:textArea name="note" cols="40" rows="5" maxlength="2000" value="${projectInstance?.note}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'client', 'error')} required">
	<label for="client">
		<g:message code="project.client.label" default="Client" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="client" name="client.id" from="${com.retouch.User.list()}" optionKey="id" required="" value="${projectInstance?.client?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'projectId', 'error')} required">
	<label for="projectId">
		<g:message code="project.projectId.label" default="Project Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="projectId" required="" value="${projectInstance?.projectId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'createdDate', 'error')} required">
	<label for="createdDate">
		<g:message code="project.createdDate.label" default="Created Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdDate" precision="day"  value="${projectInstance?.createdDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="project.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="status" required="" value="${projectInstance?.status}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'task', 'error')} required">
	<label for="task">
		<g:message code="project.task.label" default="Task" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="task" name="task.id" from="${com.retouch.Task.list()}" optionKey="id" required="" value="${projectInstance?.task?.id}" class="many-to-one"/>

</div>

