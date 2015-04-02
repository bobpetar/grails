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
            <div class="col-md-8">
                <div class="progress-bars">
                    <div class="progress">
                        <g:if test="${projectInstance?.status == 'New'}">
                            <div class="progress-bar progress-bar-primary" data-appear-progress-animation="10%" data-appear-animation-delay="900" style="width: 10%;">
                                <span class="progress-bar-tooltip" style="opacity: 1;">10%</span>
                            </div>
                        </g:if>
                        <g:if test="${projectInstance?.status == 'Paid'}">
                            <div class="progress-bar progress-bar-primary" data-appear-progress-animation="20%" data-appear-animation-delay="900" style="width: 20%;">
                                <span class="progress-bar-tooltip" style="opacity: 1;">20%</span>
                            </div>
                        </g:if>
                        <g:if test="${projectInstance?.status == 'In Progress'}">
                            <div class="progress-bar progress-bar-primary" data-appear-progress-animation="40%" data-appear-animation-delay="900" style="width: 40%;">
                                <span class="progress-bar-tooltip" style="opacity: 1;">40%</span>
                            </div>
                        </g:if>
                        <g:if test="${projectInstance?.status == 'In Review'}">
                            <div class="progress-bar progress-bar-primary" data-appear-progress-animation="60%" data-appear-animation-delay="900" style="width: 60%;">
                                <span class="progress-bar-tooltip" style="opacity: 1;">60%</span>
                            </div>
                        </g:if>
                        <g:if test="${projectInstance?.status == 'Under Revision'}">
                            <div class="progress-bar progress-bar-primary" data-appear-progress-animation="80%" data-appear-animation-delay="900" style="width: 80%;">
                                <span class="progress-bar-tooltip" style="opacity: 1;">80%</span>
                            </div>
                        </g:if>
                        <g:if test="${projectInstance?.status == 'Complete'}">
                            <div class="progress-bar progress-bar-primary" data-appear-progress-animation="100%" data-appear-animation-delay="900" style="width: 100%;">
                                <span class="progress-bar-tooltip" style="opacity: 1;">100%</span>
                            </div>
                        </g:if>
                    </div>
                </div>
            </div>
            <div class="well col-md-8 center">
                <div class="col-md-4">
                    <g:if test="${projectInstance?.task?.payment?.status == 'COMPLETE'}"><a
                            href="${createLink(uri: '/project/orderdetails')}/${projectInstance.projectId}">#${fieldValue(bean: projectInstance, field: "projectId")}</a></g:if>
                    <g:else><a
                            href="${createLink(uri: '/project/technique')}/${projectInstance.projectId}#eyes">#${fieldValue(bean: projectInstance, field: "projectId")}</a></g:else>
                </div>

                <div class="col-md-4">
                    <prettytime:display date="${projectInstance.createdDate}"/>
                </div>

                <div class="col-md-4">
                    <span class="btn btn-group-xs
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
</div>