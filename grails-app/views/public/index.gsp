<%--
  Created by IntelliJ IDEA.
  User: bkpandey
  Date: 6/1/15
  Time: 10:16 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>

    <!-- Basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Welcome to 1hretouch!</title>

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
    <div role="main" class="main">
        <div class="slider-container">
            <div class="slider" id="revolutionSlider" data-plugin-revolution-slider data-plugin-options='{"startheight": 500}'>
                <ul>
                    <li data-transition="fade" data-slotamount="13" data-masterspeed="300" >

                        <asset:image src="img/slides/slide-bg.jpg" data-bgfit="cover" data-bgposition="left top"
                             data-bgrepeat="no-repeat" alt="" />

                        <div class="tp-caption top-label lfl stl textFirst"
                             data-x="155"
                             data-y="195"
                             data-speed="300"
                             data-start="500"
                             data-easing="easeOutExpo">We value your time</div>


                        <div class="tp-caption main-label sft stb"
                             data-x="150"
                             data-y="210"
                             data-speed="300"
                             data-start="1500"
                             data-easing="easeOutExpo">1H Retouch</div>

                        <div class="tp-caption bottom-label sft stb secText"
                             data-x="155"
                             data-y="265"
                             data-speed="500"
                             data-start="2000"
                             data-easing="easeOutExpo">Retouching was never better.</div>

                        <div class="tp-caption randomrotate"
                             data-x="650"
                             data-y="248"
                             data-speed="500"
                             data-start="2500"
                             data-easing="easeOutBack"><asset:image src="img/slides/img01.png" alt="" /></div>

                        <div class="tp-caption sfb"
                             data-x="600"
                             data-y="175"
                             data-speed="400"
                             data-start="3000"
                             data-easing="easeOutBack"><asset:image src="img/slides/img02.png" alt="" /></div>

                        <div class="tp-caption sfb"
                             data-x="750"
                             data-y="74"
                             data-speed="700"
                             data-start="3150"
                             data-easing="easeOutBack"><asset:image src="img/slides/img03.png" alt="" /></div>

                        <div class="tp-caption sfb"
                             data-x="975"
                             data-y="165"
                             data-speed="1000"
                             data-start="3250"
                             data-easing="easeOutBack"><asset:image src="img/slides/img04.png" alt="" /></div>



                    </li>
                    <li data-transition="fade" data-slotamount="13" data-masterspeed="300" >

                        <asset:image src="img/slides/slide-bg.jpg" data-bgfit="cover" data-bgposition="left top"
                                     data-bgrepeat="no-repeat" alt=""/>
                        <div class="tp-caption top-label lfl stl textFirst"
                             data-x="155"
                             data-y="195"
                             data-speed="300"
                             data-start="500"
                             data-easing="easeOutExpo">We value your time</div>


                        <div class="tp-caption main-label sft stb"
                             data-x="150"
                             data-y="210"
                             data-speed="300"
                             data-start="1500"
                             data-easing="easeOutExpo">1H Retouch</div>

                        <div class="tp-caption bottom-label sft stb secText"
                             data-x="155"
                             data-y="265"
                             data-speed="500"
                             data-start="2000"
                             data-easing="easeOutExpo">Retouching was never better.</div>

                        <div class="tp-caption randomrotate"
                             data-x="650"
                             data-y="248"
                             data-speed="500"
                             data-start="2500"
                             data-easing="easeOutBack"><asset:image src="img/slides/img01.png" alt="" /></div>

                        <div class="tp-caption sfb"
                             data-x="600"
                             data-y="175"
                             data-speed="400"
                             data-start="3000"
                             data-easing="easeOutBack"><asset:image src="img/slides/img02.png" alt="" /></div>

                        <div class="tp-caption sfb"
                             data-x="750"
                             data-y="74"
                             data-speed="700"
                             data-start="3150"
                             data-easing="easeOutBack"><asset:image src="img/slides/img03.png" alt="" /></div>

                        <div class="tp-caption sfb"
                             data-x="975"
                             data-y="165"
                             data-speed="1000"
                             data-start="3250"
                             data-easing="easeOutBack"><asset:image src="img/slides/img04.png" alt="" /></div>



                    </li>
                </ul>
            </div>
        </div>
        <div class="home-intro" id="home-intro">
            <div class="container">

                <div class="row">
                    <div class="col-md-6">
                        <div class="upLoad">
                            <a href="${createLink(uri:'/upload')}" class="btn btn-lg btn-primary">Upload your photo</a>

                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="retoucher">
                            <a href="${createLink(uri: '/register/retoucher')}" class="btn btn-lg btn-retoucher">Become a retoucher</a>

                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="home-price" id="home-price">
            <div class="container">
                <div class="row center">
                    <div class="col-md-12">
                        <div class="conAdd">
                            <p>Prices start from <span class="price-color"> 50¢ </span> Check out price per Technique now</p>
                            <p>Have more than <span class="price-color">100 images per month?</span> Become a Corporate Client.</p>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>

    <div class="container">

        <div class="row center">
            <div class="col-md-12">
                <h1 class="mb-sm word-rotator-title">Our Techniques</h1>

                <p class="lead">
                    Specialists in Clipping Path, Remove Background, Masking, Retouch, Color Correction and other photography &amp; image editing services
                </p>

                <div class="row">
                    <g:each in="${uniqueGroep}" status="i" var="groepInstance">
                        <div class="col-md-12 col-sm-12 col-xs-12  techniqueBlock ${groepInstance.replaceAll(" ","_")}" id="${groepInstance.replaceAll(" ","_")}">
                            <div class="owl-carousel owl-carousel-spaced" data-plugin-options='{"items": 3, "responsive": {"1199": {"items": 3}}, "autoplay": true, "autoplayTimeout": 6000}'>
                                <g:each in="${techniqueInstaneList}" status="j" var="techniqueInstance">
                                    <g:if test="${groepInstance == techniqueInstance.groep}">
                                        <div>
                                            <div class="portfolio-item img-thumbnail">
                                                <a class="thumb-info lightbox" style="text-decoration: none;"
                                                   href="#popupProject${techniqueInstance.id}"
                                                   data-plugin-options='{"type":"inline", preloader: false}'>
                                                    <img src="${grailsApplication.config.retouch.techniqueImageServer}${techniqueInstance.getLargeImageName()}"
                                                         class="img-responsive" alt="">
                                                    <span class="thumb-info-action">
                                                        <span title="Universal" class="thumb-info-action-icon"><i class="fa fa-link"></i></span>
                                                    </span>
                                                    <span class="btn btn-block btn-primary">${fieldValue(bean: techniqueInstance, field: "name")}</span>
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
        </div>

    </div>

    <section class="section section-text-light section-background section-center testParallex" style="background-image: url(${assetPath(src: 'img/testimonial.jpg')});">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <p class="mb-none">“I still had those leftover wedding images which needed some fixing and 1hretouch is really great for this.”</p>
                    <p><span class="colorRed">Selena Gomez</span></p>
                </div>
            </div>
        </div>
    </section>

    <div class="container">

        <div class="row">
            <div class="col-md-5">
                <h1>Why Us?</h1>

                <div class="feature-box">
                    <div class="feature-box-icon">
                        <i class="fa fa-lock"></i>
                    </div>
                    <div class="feature-box-info">
                        <p >100% Secure Site</p>
                    </div>
                </div>
                <div class="feature-box">
                    <div class="feature-box-icon">
                        <i class="fa fa-clock-o"></i>
                    </div>
                    <div class="feature-box-info">
                        <p >1 hour Express Service.</p>
                    </div>
                </div>
                <div class="feature-box">
                    <div class="feature-box-icon">
                        <i class="fa fa-flash"></i>
                    </div>
                    <div class="feature-box-info">
                        <p>15 minute Email Response</p>
                    </div>
                </div>
                <div class="feature-box">
                    <div class="feature-box-icon">
                        <i class="fa fa-adjust"></i>
                    </div>
                    <div class="feature-box-info">
                        <p >24/7 Job Tracking</p>
                    </div>
                </div>
                <div class="feature-box">
                    <div class="feature-box-icon">
                        <i class="fa fa-dollar"></i>
                    </div>
                    <div class="feature-box-info">
                        <p>Pricing From 50c</p>
                    </div>
                </div>

            </div>
            <div class="col-md-2">

            </div>
            <div class="col-md-5">
                <h1>YouTube</h1>
                <div class="embed-responsive embed-responsive-16by9">
                    <iframe frameborder="0" allowfullscreen="" src="https://www.youtube.com/embed/qjILMmlYsr4?showinfo=0&amp;wmode=opaque"></iframe>
                </div>

            </div>

        </div>
    </div>
</div>