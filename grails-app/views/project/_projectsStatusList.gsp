<div class="col-md-12">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:each in="${projectInstanceList}" status="i" var="projectInstance">
        <div class="col-md-12 push-top">

            <div class="col-md-4">
                <img id="uploadedImage1" class="img-rounded img-responsive"
                     src="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.originalImage?.getLargeImageName()}">
            </div>
            <br>
            <div class="well col-md-8 center">
                <div class="col-md-4">
                    <a href="${createLink(uri: '/project/technique')}/${projectInstance.projectId}#eyes">#${fieldValue(bean: projectInstance, field: "projectId")}</a>
                </div>

                <div class="col-md-4">
                    <prettytime:display date="${projectInstance.createdDate}"/>
                </div>

                <div class="col-md-4">
                    <span class="tag label
                            <g:if test="${projectInstance.status == 'New'}">btn-danger</g:if>
                    <g:if test="${projectInstance.status == 'Paid'}">btn-warning</g:if>
                    <g:if test="${projectInstance.status == 'In Progress'}">btn-info</g:if>
                    <g:if test="${projectInstance.status == 'In Review'}">btn-dark</g:if>
                    <g:if test="${projectInstance.status == 'Complete'}">btn-success</g:if> ">
                        ${fieldValue(bean: projectInstance, field: "status")}
                    </span>
                </div>
            </div>
        </div>
        <hr class="tall" />
    </g:each>
    <ul class="pagination pull-right">
    <util:remotePaginate controller="project" action="projectsStatusList" total="${projectInstanceCount}"
                         update="projectFilterList" id="${id}"/>
        </ul>
</div>