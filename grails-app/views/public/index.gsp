<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to 1hRetouch !!!</title>
    <script>
        function showTecniqueBlock(eleSelector){
            $(".techniqueBlock").hide();
            if(!eleSelector){
                $(".techniqueBlock").first().fadeIn();
            }else{
                $(eleSelector).fadeIn();
            }

        }

        $(document).ready(function(){
           showTecniqueBlock();
        });


    </script>

</head>

<div role="main" class="main" id="home">
<div class="slider-container">
    <div class="slider" id="revolutionSlider" data-plugin-revolution-slider
         data-plugin-options='{"startheight": 500}'>
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
                     data-easing="easeOutExpo">DO YOU NEED A NEW</div>

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
                     data-easing="easeOutExpo">WEB DESIGN?</div>

                <div class="tp-caption bottom-label sft stb"
                     data-x="185"
                     data-y="280"
                     data-speed="500"
                     data-start="2000"
                     data-easing="easeOutExpo">Check out our options and features.</div>

            </li>
        </ul>
    </div>
</div>

<section class="highlight top">
    <div class="container">

        <h2>Techniques</h2>

        <div class="row">
    %{--        <ul data-sort-id="portfolio" class="portfolio-list sort-destination"
                style="position: relative; height: 100px;">--}%
                <g:each in="${uniqueGroep}" status="i" var="groepInstance">
                    <div class="col-md-12 col-sm-12 col-xs-12  techniqueBlock ${groepInstance.replaceAll(" ","_")}" id="${groepInstance.replaceAll(" ","_")}">
                        <div class="owl-carousel owl-carousel-spaced"
                             data-plugin-options='{"items": 4}'>
                            <g:each in="${techniqueInstaneList}" status="j" var="techniqueInstance">
                                <g:if test="${groepInstance == techniqueInstance.groep}">
                                    <div>
                                        <div class="portfolio-item img-thumbnail">
                                            <a class="thumb-info lightbox"
                                               href="#popupProject${techniqueInstance.id}"
                                               data-plugin-options='{"type":"inline", preloader: false}'>
                                                <img src="${grailsApplication.config.retouch.imageServer}${techniqueInstance.getLargeImageName()}"
                                                     class="img-responsive" alt="">
                                                <span
                                                        class="thumb-info-title"><span
                                                        class="thumb-info-inner">${techniqueInstance.groep}</span>
                                                    <span class="thumb-info-type">${techniqueInstance.name}</span>
                                                </span> <span class="thumb-info-action"><span title="Universal"
                                                                                              class="thumb-info-action-icon"><i
                                                        class="fa fa-link"></i></span>
                                            </span>
                                            </a>
                                        </div>

                                        <div id="popupProject${techniqueInstance.id}" class="popup-inline-content">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <img src="${grailsApplication.config.retouch.imageServer}${techniqueInstance.getLargeImageName()}"
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
       %{--     </ul>--}%
        </div>
        <ul class="nav nav-pills">
            <g:each in="${uniqueGroep}" status="i" var="groepInstance">
                <li>
                    <a class="btn btn-default" href="javascript:void(0);" onclick="showTecniqueBlock('#${groepInstance}')">
                        ${groepInstance}
                    </a>
                </li>
            </g:each>
        </ul>
       %{-- <ul data-option-key="filter" data-sort-id="portfolio"
            class="nav nav-pills sort-source text-capitalize">
            --}%%{-- <g:each in="${uniqueGroep}" status="i" var="groepInstance">
                 <li data-option-value=".${groepInstance}"><a class="btn-dark" href="#">
                     ${groepInstance}
                 </a></li>
             </g:each>--}%%{--
        </ul>--}%

    </div>
</section>

<div class="container">

    <div class="row featured-boxes">
        <div class="col-md-4">
            <div class="featured-box featured-box-secundary">
                <div class="box-content">
                    <center>
                        <asset:image class="img-responsive" src="img/front/money_back_guarantee.jpg"/>
                        <h4>Money Back Guarantee</h4>

                        <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus.</p>
                    </center>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="featured-box featured-box-tertiary">
                <div class="box-content">
                    <center>
                        <asset:image class="img-responsive" src="img/front/1hrdelivery.jpg"/>
                        <h4>1 HR Delivery</h4>

                        <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus.</p>
                    </center>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="featured-box featured-box-quartenary">
                <div class="box-content">
                    <center>
                        <asset:image class="img-responsive" src="img/front/reviews.jpg"/>
                        <h4>Reviews</h4>

                        <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus.</p>
                    </center>
                </div>
            </div>
        </div>
    </div>
</div>

</div>
</html>