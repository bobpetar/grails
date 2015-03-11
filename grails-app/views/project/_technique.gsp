<!-- Start Technique -->
<div class="row show-grid">
    <div class="col-md-12">
        <ul data-option-key="filter" data-sort-id="portfolio"
            class="nav nav-pills sort-source">
            <li class="active" data-option-value="*"><a href="#">Show
            All</a></li>
            <g:each in="${uniqueTechniques}" status="i" var="techniqueInstance">
                <li data-option-value=".${techniqueInstance}"><a href="#">
                    ${techniqueInstance}
                </a></li>
            </g:each>
        </ul>

        <hr class="tail">

        <div class="row">
            <ul data-sort-id="portfolio" class="portfolio-list sort-destination"
                style="position: relative; height: 1185px;">
                <g:each in="${techniques}" status="i" var="techniqueInstance">
                    <!-- Start Technique Block -->
                    <li
                            class="owl-item active col-md-6  col-sm-4 col-xs-12 isotope-item ${fieldValue(bean: techniqueInstance, field: "groep")}">
                        <div>
                            <div class="portfolio-item img-thumbnail">
                                <a class="thumb-info lightbox"
                                   href="#${fieldValue(bean: techniqueInstance, field: 'id')}"
                                   data-plugin-options="{&quot;type&quot;:&quot;inline&quot;, preloader: false}">
                                    <img alt="" class="img-responsive"
                                         src="${grailsApplication.config.retouch.imageServer}${fieldValue(bean: techniqueInstance, field: "beforeafterimage")}"/>
                                    <span class="thumb-info-title"><span
                                            class="thumb-info-inner">${fieldValue(bean: techniqueInstance, field: "groep")}
                                    </span> <span
                                            class="thumb-info-type">${fieldValue(bean: techniqueInstance, field: "name")}
                                    </span>
                                    </span>
                                    <span class="thumb-info-action">
                                        <span title="Universal" class="thumb-info-action-icon">
                                            <i class="fa fa-link"></i>
                                        </span>
                                    </span>
                                </a>
                                <g:formRemote name="selectTechnique" id="selectTechnique"
                                              update="techniqueList"
                                              url="[controller: 'project', action: 'addTechniqueInvoice', id: projectInstance.taskId]">
                                    <input type="hidden" name="technique"
                                           value="${fieldValue(bean: techniqueInstance, field: 'id')}"/>
                                    <input type="submit" id="chooseTechnique1"
                                           class="btn btn-block btn-warning ${techniqueInvoiceList.technique.id.contains(techniqueInstance.id) ? 'disabled' : ''}"
                                           value="Choose Technique"/>
                                </g:formRemote>

                            </div>
                            <!-- Pop-up Page start-->

                            <div id="${fieldValue(bean: techniqueInstance, field: 'id')}"
                                 class="popup-inline-content mfp-hide">

                                <div class="row">

                                    <div class="col-md-6">
                                        <img class="img-thumbnail img-responsive"
                                             alt="${grailsApplication.config.retouch.imageServer}${fieldValue(bean: techniqueInstance, field: "name")}"
                                             src="${grailsApplication.config.retouch.imageServer}${fieldValue(bean: techniqueInstance, field: "beforeafterimage")}"/>
                                    </div>

                                    <div class="col-md-6">
                                        <h4>Technique <strong>Description</strong></h4>

                                        <p>${fieldValue(bean: techniqueInstance, field: "description")}</p>

                                        <g:formRemote name="selectTechnique" update="techniqueList"
                                                      url="[controller: 'project', action: 'addTechniqueInvoice', id: projectInstance.taskId]">
                                            <input type="hidden" name="technique"
                                                   value="${fieldValue(bean: techniqueInstance, field: 'id')}"/>
                                            <input type="submit" class="btn btn-primary ${techniqueInvoiceList.technique.id.contains(techniqueInstance.id) ? 'disabled' : ''} " value="Select This Technique"/>
                                            <span class="arrow hlb"></span>
                                        </g:formRemote>
                                    </div>

                                </div>
                            </div>

                            <!-- Pop-up Page End-->
                        </div>
                    </li>
                </g:each>
            <!-- End Technique Block -->
            </ul>

        </div>
    </div>
</div>

<!-- End Technique -->
