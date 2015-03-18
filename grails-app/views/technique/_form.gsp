<%@ page import="com.retouch.Technique" %>



<div class="fieldcontain ${hasErrors(bean: techniqueInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="technique.name.label" default="Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" required="" value="${techniqueInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: techniqueInstance, field: 'description', 'error')} required">
    <label for="description">
        <g:message code="technique.description.label" default="Description"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textArea name="description" cols="40" rows="5" maxlength="1000" required=""
                value="${techniqueInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: techniqueInstance, field: 'groep', 'error')} ">
    <label for="groep">
        <g:message code="technique.groep.label" default="Groep"/>

    </label>
    <g:textField name="groep" pattern="${techniqueInstance.constraints.groep.matches}"
                 value="${techniqueInstance?.groep}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: techniqueInstance, field: 'beforeafterimage', 'error')} ">
    <label for="beforeafterimage">
        <g:message code="technique.beforeafterimage.label" default="Beforeafterimage"/>

    </label>
    <g:textField name="beforeafterimage" value="${techniqueInstance?.beforeafterimage}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: techniqueInstance, field: 'ratePerTechnique', 'error')} ">
    <label for="ratePerTechnique">
        <g:message code="technique.ratePerTechnique.label" default="Rate Per Technique"/>

    </label>
    <g:field name="ratePerTechnique" value="${fieldValue(bean: techniqueInstance, field: 'ratePerTechnique')}"/>

</div>

