<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Welcome to 1hRetouch !!!</title>

</head>
<div role="main" class="main" id="home">

	<div class="slider-container slider-container-fullscreen">
		<div class="slider" id="revolutionSliderFullScreen"
			data-plugin-revolution-slider
			data-plugin-options='{"fullScreen": "on"}'>
			<ul>
				<li data-transition="fade" data-slotamount="10"
					data-masterspeed="300"><asset:image src="img/slides/slide-bg-full.jpg"
					data-fullwidthcentering="on" alt="" />

					<div class="tp-caption sft stb visible-lg" data-x="417"
						data-y="100" data-speed="300" data-start="1000"
						data-easing="easeOutExpo">
						<asset:image src="img/slides/slide-title-border.png" alt="" />
					</div>

					<div class="tp-caption top-label lfl stl" data-x="center"
						data-hoffset="0" data-y="100" data-speed="300" data-start="500"
						data-easing="easeOutExpo">DO YOU NEED A NEW</div>

					<div class="tp-caption sft stb visible-lg" data-x="717"
						data-y="100" data-speed="300" data-start="1000"
						data-easing="easeOutExpo">
						<asset:image src="img/slides/slide-title-border.png" alt="" />
					</div>

					<div class="tp-caption main-label sft stb" data-x="center"
						data-hoffset="0" data-y="130" data-speed="300" data-start="1500"
						data-easing="easeOutExpo">WEB DESIGN?</div>

					<div class="tp-caption bottom-label sft stb" data-x="center"
						data-hoffset="0" data-y="200" data-speed="500" data-start="2000"
						data-easing="easeOutExpo">Check out our options and
						features.</div> <a
					class="tp-caption customin btn btn-lg btn-primary main-button"
					href="${createLink(uri:'/upload') }" data-x="center" data-hoffset="0"
					data-y="250"
					data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
					data-speed="800" data-start="1700" data-easing="Back.easeInOut"
					data-endspeed="300"> Upload Image! </a></li>
				<li data-transition="fade" data-slotamount="10"
					data-masterspeed="300"><asset:image src="img/slides/dark-cover.jpg"
					data-bgposition="center center" data-bgfit="cover"
					data-bgrepeat="no-repeat" />

					<div class="tp-caption tp-fade fadeout fullscreenvideo" data-x="0"
						data-y="0" data-speed="1000" data-start="100"
						data-easing="Power4.easeOut" data-elementdelay="0.01"
						data-endelementdelay="0.1" data-endspeed="1500"
						data-endeasing="Power4.easeIn" data-autoplay="true"
						data-autoplayonlyfirsttime="false" data-nextslideatend="true"
						data-volume="mute" data-forceCover="1" data-aspectratio="16:9"
						data-forcerewind="on">

						<video preload="none" width="100%" height="100%"
							poster="">
							<source src="" type="video/mp4" />
							<source src="" type="video/ogg">
						</video>

					</div>

					<div class="tp-caption top-label lfl stl" data-x="140" data-y="180"
						data-speed="300" data-start="500" data-easing="easeOutExpo">You
						just found the</div>

					<div class="tp-caption main-label sft stb" data-x="135"
						data-y="210" data-speed="300" data-start="1500"
						data-easing="easeOutExpo">BEST SOLUTION</div>

					<div class="tp-caption bottom-label sft stb" data-x="150"
						data-y="280" data-speed="500" data-start="2000"
						data-easing="easeOutExpo">The #1 Selling HTML Site Template
						on ThemeForest</div> <a
					class="tp-caption customin btn btn-lg btn-primary main-button"
					href="${createLink(uri:'/upload') }" data-x="260" data-y="335"
					data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
					data-speed="800" data-start="2500" data-easing="Back.easeInOut"
					data-endspeed="300"> Upload Image! </a>

					<div class="tp-caption main-label sft stb visible-lg" data-x="345"
						data-y="415" data-speed="500" data-start="2700"
						data-easing="easeOutExpo">
						<a data-hash href="#home-intro"><i
							class="fa fa-arrow-circle-o-down"></i></a>
					</div></li>
			</ul>
		</div>
	</div>
	<section class="highlight top">
		<div class="container">
			<div class="row" id="projects">
				<div class="col-md-12">
					<h2>
						Technique <strong>List</strong>
					</h2>

					<div class="owl-carousel owl-carousel-spaced"
						data-plugin-options='{"items": 4}'>
                        <g:each in="${techniqueInstaneList}" status="i" var="techniqueInstance">
						<div>
							<div class="portfolio-item img-thumbnail">
								<a class="thumb-info lightbox" href="#popupProject${techniqueInstance.id}"
									data-plugin-options='{"type":"inline", preloader: false}'>
                                    <img src="${grailsApplication.config.retouch.imageServer}${techniqueInstance.getLargeImageName()}"
                                         class="img-responsive" alt="">
                                    <span
									class="thumb-info-title"> <span class="thumb-info-inner">${techniqueInstance.groep}</span>
										<span class="thumb-info-type">${techniqueInstance.name}</span>
								</span> <span class="thumb-info-action"> <span title="Universal"
										class="thumb-info-action-icon"><i class="fa fa-link"></i></span>
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
										<p> ${techniqueInstance.description}</p>
                                        <ul class="portfolio-details">
                                            <li>
                                                <ul class="list list-skills icons list-unstyled list-inline text-uppercase">
                                                    <li><i class="fa fa-check-circle"></i> ${techniqueInstance.groep} (group)</li>
                                                </ul>
                                            </li>
                                        </ul>

									</div>
								</div>
							</div>
						</div>
                        </g:each>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div class="container">

		<div class="row center">
			<div class="col-md-12">
				<h1 class="short word-rotator-title">
					Porto is <strong class="inverted" data-appear-animation="bounceIn">
						<span class="word-rotate" data-plugin-options='{"delay": 2000}'>
							<span class="word-rotate-items"> <span>incredibly</span> <span>especially</span>
								<span>extremely</span>
						</span>
					</span>
					</strong> beautiful and fully responsive.
				</h1>
				<p class="featured lead">Lorem ipsum dolor sit amet, consectetur
					adipiscing elit. Fusce elementum, nulla vel pellentesque consequat,
					ante nulla hendrerit arcu, ac tincidunt mauris lacus sed leo. vamus
					suscipit molestie vestibulum.</p>
			</div>
		</div>

		<hr class="tall" />
	</div>

</div>
</html>