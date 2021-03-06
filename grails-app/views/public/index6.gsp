<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="maintrans"/>
    <title>Welcome to 1hRetouch !!!</title>
    <script>
        function showTecniqueBlock(eleSelector){
            $(".techniqueBlock").hide();
            if(!eleSelector){
                $(".techniqueBlock").first().fadeIn(2000);
            }else{
                $(eleSelector).fadeIn(2000);
            }

        }

        $(document).ready(function(){
            showTecniqueBlock();
        });

    </script>

</head>

<div role="main" class="main" id="home">
    <div class="slider-container">
        <div class="slider" id="revolutionSliderFullScreen" data-plugin-revolution-slider
             data-plugin-options='{"fullScreen": "on"}'>
            <ul>
                <li data-slotamount="7" data-masterspeed="1000" data-fstransition="fade" data-fsmasterspeed="1000"
                    data-fsslotamount="7">
                    <asset:image class="img-responsive" src="img/slides/dark-cover.jpg" alt="dark"
                                 data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat"/>
                    <div class="tp-caption tp-fade fadeout fullscreenvideo"
                         data-x="0"
                         data-y="0"
                         data-speed="1000"
                         data-start="100"
                         data-easing="Power4.easeOut"
                         data-elementdelay="0.01"
                         data-endelementdelay="0.1"
                         data-endspeed="1500"
                         data-endeasing="Power4.easeIn"
                         data-autoplay="true"
                         data-autoplayonlyfirsttime="false"
                         data-nextslideatend="true"
                         data-volume="mute"
                         data-forceCover="1"
                         data-aspectratio="16:9"
                         data-forcerewind="on">

                        <video preload="none" width="100%" height="100%"
                               poster="${assetPath(src: 'img/slides/dark-cover.jpg')}">
                            <source src="${assetPath(src: 'video/dark.mp4')}" type="video/mp4"/>
                            <source src="${assetPath(src: 'video/dark.ogv')}" type="video/ogg">
                        </video>

                    </div>

                    <div class="tp-caption sft stb visible-lg"
                         data-x="177"
                         data-y="180"
                         data-speed="300"
                         data-start="1000"
                         data-easing="easeOutExpo"><asset:image src="img/slides/slide-title-border.png" alt=""/></div>

                    <div class="tp-caption top-label lfl stl"
                         data-x="227"
                         data-y="180"
                         data-speed="300"
                         data-start="500"
                         data-easing="easeOutExpo">${siteParams?.VIDEOCONTENT1}</div>

                    <div class="tp-caption sft stb visible-lg"
                         data-x="477"
                         data-y="180"
                         data-speed="300"
                         data-start="1000"
                         data-easing="easeOutExpo"><asset:image src="img/slides/slide-title-border.png" alt=""/></div>

                    <div class="tp-caption main-label sft stb"
                         data-x="135"
                         data-y="210"
                         data-speed="300"
                         data-start="1500"
                         data-easing="easeOutExpo">${siteParams?.VIDEOCONTENT2}</div>

                    <div class="tp-caption bottom-label sft stb"
                         data-x="185"
                         data-y="280"
                         data-speed="500"
                         data-start="2000"
                         data-easing="easeOutExpo">${siteParams?.VIDEOCONTENT3}</div>

                    <sec:ifNotGranted roles="ROLE_ADMIN, ROLE_RETOUCHER">
                        <a class="tp-caption customin btn btn-lg btn-primary main-button"
                           href="${createLink(uri: '/upload')}"
                           data-x="center" data-hoffset="0"
                           data-y="350"
                           data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                           data-speed="800"
                           data-start="1700"
                           data-easing="Back.easeInOut"
                           data-endspeed="300">
                            Upload Image!
                        </a>
                    </sec:ifNotGranted>

                </li>
            </ul>
        </div>
    </div>

    <section class="highlight top " id="techniques" style="  background-color: #eee !important; 	/*background-image: url(${assetPath(src: 'img/tempbck1.jpg')});*/ border-color: #eee !important;">
        <div class="container">

            <h3><strong>Techniques</strong></h3>

            <div class="row">
                <g:each in="${uniqueGroep}" status="i" var="groepInstance">
                    <div class="col-md-12 col-sm-12 col-xs-12  techniqueBlock ${groepInstance.replaceAll(" ","_")}" id="${groepInstance.replaceAll(" ","_")}">
                        <div class="owl-carousel owl-carousel-spaced" data-plugin-options='{"items": 3, "responsive": {"1199": {"items": 3}}, "autoplay": true, "autoplayTimeout": 6000}'>
                            <g:each in="${techniqueInstaneList}" status="j" var="techniqueInstance">
                                <g:if test="${groepInstance == techniqueInstance.groep}">
                                    <div>
                                        <div class="portfolio-item img-thumbnail">
                                            <a class="thumb-info lightbox"
                                               href="#popupProject${techniqueInstance.id}"
                                               data-plugin-options='{"type":"inline", preloader: false}'>
                                                <img src="${grailsApplication.config.retouch.techniqueImageServer}${techniqueInstance.getLargeImageName()}"
                                                     class="img-responsive" alt="">
                                                <span class="thumb-info-action">
                                                    <span title="Universal" class="thumb-info-action-icon"><i class="fa fa-link"></i></span>
                                                </span>
                                                <span class="btn btn-block btn-warning">${fieldValue(bean: techniqueInstance, field: "name")}</span>
                                            </a>

                                        </div>

                                        <div id="popupProject${techniqueInstance.id}" class="popup-inline-content">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <img src="${grailsApplication.config.retouch.techniqueImageServer}${techniqueInstance.getLargeImageName()}"
                                                         class="img-thumbnail img-responsive" alt="">
                                                </div>

                                                <div class="col-md-6">

                                                    <h4>${techniqueInstance.name}</h4>

                                                    <p>${techniqueInstance.description}</p>
                                                    <ul class="portfolio-details">
                                                        <li>
                                                            <ul class="list list-skills icons list-unstyled list-inline text-uppercase">
                                                                <li><i class="fa fa-check-circle"></i> ${techniqueInstance.groep} (group)
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </g:if>
                            </g:each>
                        </div>
                    </div>
                </g:each>
            </div>
            <ul class="nav nav-pills">
                <g:each in="${uniqueGroep}" status="i" var="groepInstance">
                    <li>
                        <a class="btn-dark text-capitalize" href="javascript:void(0);" onclick="showTecniqueBlock('#${groepInstance}')">
                            ${groepInstance}
                        </a>
                    </li>
                </g:each>
            </ul>

        </div>
    </section>

    %{--<div class="container">--}%

        %{--<div class="row featured-boxes">--}%
            %{--<div class="col-md-4" data-appear-animation="fadeInLeft">--}%
                %{--<div class="featured-box featured-box-secundary">--}%
                    %{--<div class="box-content">--}%
                        %{--<center>--}%
                            %{--<asset:image class="img-responsive" src="img/front/money_back_guarantee.png"/>--}%
                            %{--<h4>Money Back Guarantee</h4>--}%

                            %{--<p>If you are not happy you can send request for update or request your money back!</p>--}%
                        %{--</center>--}%
                    %{--</div>--}%
                %{--</div>--}%
            %{--</div>--}%

            %{--<div class="col-md-4" data-appear-animation="fadeInUp">--}%
                %{--<div class="featured-box featured-box-tertiary">--}%
                    %{--<div class="box-content">--}%
                        %{--<center>--}%
                            %{--<asset:image class="img-responsive" src="img/front/1hrdelivery.png"/>--}%
                            %{--<h4>1 HR Delivery</h4>--}%

                            %{--<p>Upload your image now and we'll deliver your retouched images within an hour!</p>--}%
                        %{--</center>--}%
                    %{--</div>--}%
                %{--</div>--}%
            %{--</div>--}%

            %{--<div class="col-md-4" data-appear-animation="fadeInRight">--}%
                %{--<div class="featured-box featured-box-quartenary">--}%
                    %{--<div class="box-content">--}%
                        %{--<center>--}%
                            %{--<asset:image class="img-responsive" src="img/front/reviews.png"/>--}%
                            %{--<h4>Reviews</h4>--}%

                            %{--<p>We are recommended by professional photographers and a lot of customers. Check our reviews or give one yourself after we retouched your images.</p>--}%
                        %{--</center>--}%
                    %{--</div>--}%
                %{--</div>--}%
            %{--</div>--}%
        %{--</div>--}%
    %{--</div>--}%

    <div class="container" id="pricing">
        <h3><strong>Pricing</strong> Plans</h3>
        <div class="row">
            <div class="pricing-table">
                <div class="col-md-4">
                    <div class="plan">
                        <h3>Custom<span>50&cent;</span></h3>
                        <a href="${createLink(uri: '/upload')}" class="btn btn-lg btn-primary">Upload Image</a>
                        <ul>
                            <li>Per technique</li>
                            <li>Automatically applies</li>
                            <li>For simple image</li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="plan most-popular">
                        <div class="plan-ribbon-wrapper">
                            <div class="plan-ribbon">Unlimited</div>
                        </div>
                        <h3>Unlimited<span>$10</span></h3>
                        <a href="${createLink(uri: '/upload')}" class="btn btn-lg btn-primary">Upload Image</a>
                        <ul>
                            <li>Unlimited techniques</li>
                            <li>Automatically applies</li>
                            <li>For full retouch</li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="plan">
                        <h3>Special<span>$?</span></h3>
                        <a href="mailto:${siteParams?.EMAIL}" class="btn btn-lg btn-primary">Price Quote</a>
                        <ul>
                            <li>For bulk images</li>
                            <li>Via coupon code</li>
                            <li>For big projects</li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <section class="page-top">
        <div class="container">
            <div class="row center">
                <div class="col-md-4">
                    <asset:image alt="" src="img/logos/logo-1.png" class="img-responsive" />
                </div>
                <div class="col-md-4">
                    <asset:image alt="" src="img/logos/logo-2.png" class="img-responsive" />
                </div>
                <div class="col-md-4">
                    <asset:image alt="" src="img/logos/logo-3.png" class="img-responsive" />
                </div>
            </div>
        </div>
    </section>

    <div class="map-section">
        <section class="featured footer map">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                    <div class="col-md-6">
                        <h2><strong>What</strong> Client’s Say</h2>
                        <div class="row">
                            <div class="owl-carousel push-bottom" data-plugin-options='{"items": 1}'>
                                <g:each in="${testimonialCustomerList}" status="i" var="testimonialCustomer">
                                    <div>
                                        <div class="col-md-12">
                                            <blockquote class="testimonial">
                                                <p>${testimonialCustomer?.testimonial}</p>
                                            </blockquote>
                                            <div class="testimonial-arrow-down"></div>
                                            <div class="testimonial-author">
                                                <g:if test="${testimonialCustomer.photo}">
                                                    <div class="img-thumbnail img-thumbnail-small">
                                                        <img src="${grailsApplication?.config?.retouch?.techniqueImageServer}${testimonialCustomer?.getThumbnailImageName()}"
                                                             class="img-responsive" alt="">

                                                    </div>
                                                </g:if>
                                                <p><strong>${testimonialCustomer?.fullName}</strong><span>${testimonialCustomer?.customerPosition}</span></p>
                                            </div>
                                        </div>
                                    </div>
                                </g:each>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h2><strong>What</strong> Retoucher’s Say</h2>
                        <div class="row">
                            <div class="owl-carousel push-bottom" data-plugin-options='{"items": 1}'>
                                <g:each in="${testimonialRetoucherList}" status="i" var="testimonialRetoucher">
                                    <div>
                                        <div class="col-md-12">
                                            <blockquote class="testimonial">
                                                <p>${testimonialRetoucher?.testimonial}</p>
                                            </blockquote>
                                            <div class="testimonial-arrow-down"></div>
                                            <div class="testimonial-author">
                                                <g:if test="${testimonialRetoucher.photo}">
                                                    <div class="img-thumbnail img-thumbnail-small">
                                                        <img src="${grailsApplication?.config?.retouch?.techniqueImageServer}${testimonialRetoucher?.getThumbnailImageName()}"
                                                             class="img-responsive" alt="">

                                                    </div>
                                                </g:if>
                                                <p><strong>${testimonialRetoucher?.fullName}</strong><span>${testimonialRetoucher?.customerPosition}</span></p>
                                            </div>
                                        </div>
                                    </div>
                                </g:each>
                            </div>
                        </div>
                    </div>
                    </div>

                </div>
            </div>
        </section>
    </div>
</div>
</html>