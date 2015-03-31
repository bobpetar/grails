<!-- Start Technique -->
<div class="row show-grid">
    <div class="col-md-12">

        <div class="container">

            <ul data-option-key="filter" data-sort-id="portfolio" class="nav nav-pills sort-source">
                <li class="active text-capitalize" data-option-value="*"><a href="#">Show All</a></li>
                <g:each in="${uniqueTechniques}" status="i" var="techniqueInstance">
                    <li class="text-capitalize" data-option-value=".${techniqueInstance}"><a href="#">
                        ${techniqueInstance}
                    </a></li>
                </g:each>
            </ul>

            <hr>

            <div class="row">
                <ul data-sort-id="portfolio" class="portfolio-list sort-destination"
                    style="position: relative; height: 595px;">
                    <g:each in="${techniqueInstanceList}" status="i" var="techniqueInstance">
                        <li class="col-md-3 col-sm-6 col-xs-12 isotope-item ${fieldValue(bean: techniqueInstance, field: "groep")}"
                            style="position: absolute; left: 0px; top: 0px;">
                            <div class="portfolio-item img-thumbnail">
                                <g:link class="thumb-info" action="show" id="${techniqueInstance.id}">
                                    <img src="${grailsApplication.config.retouch.techniqueImageServer}${techniqueInstance.getThumbnailImageName()}"
                                         class="img-responsive" alt="">
                                    <span class="thumb-info-title">
                                        <span class="thumb-info-inner">${fieldValue(bean: techniqueInstance, field: "groep")}</span>
                                        <span class="thumb-info-type">${fieldValue(bean: techniqueInstance, field: "name")}</span>
                                    </span>
                                    <span class="thumb-info-action">
                                        <span class="thumb-info-action-icon" title="Universal"><i
                                                class="fa fa-link"></i></span>
                                    </span>
                                </g:link>
                            </div>
                        </li>
                    </g:each>
                </ul>
            </div>

        </div>
    </div>
</div>

<!-- End Technique -->
