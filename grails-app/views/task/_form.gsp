<%@ page import="com.retouch.Task" %>



<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'finalImage', 'error')} ">
	<label for="finalImage">
		<g:message code="task.finalImage.label" default="Final Image" />
		
	</label>
	<g:select id="finalImage" name="finalImage.id" from="${com.retouch.ReImage.list()}" optionKey="id" value="${taskInstance?.finalImage?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'createAt', 'error')} required">
	<label for="createAt">
		<g:message code="task.createAt.label" default="Create At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createAt" precision="day"  value="${taskInstance?.createAt}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'originalImage', 'error')} required">
	<label for="originalImage">
		<g:message code="task.originalImage.label" default="Original Image" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="originalImage" name="originalImage.id" from="${com.retouch.ReImage.list()}" optionKey="id" required="" value="${taskInstance?.originalImage?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'project', 'error')} required">
	<label for="project">
		<g:message code="task.project.label" default="Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="project" name="project.id" from="${com.retouch.Project.list()}" optionKey="id" required="" value="${taskInstance?.project?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'tags', 'error')} ">
	<label for="tags">
		<g:message code="task.tags.label" default="Tags" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${taskInstance?.tags?}" var="t">
    <li><g:link controller="imageTag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="imageTag" action="create" params="['task.id': taskInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'imageTag.label', default: 'ImageTag')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'techniques', 'error')} ">
	<label for="techniques">
		<g:message code="task.techniques.label" default="Techniques" />
		
	</label>
	<g:select name="techniques" from="${com.retouch.Technique.list()}" multiple="multiple" optionKey="id" size="5" value="${taskInstance?.techniques*.id}" class="many-to-many"/>

</div>

