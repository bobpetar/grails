<%@ page contentType="text/html;charset=UTF-8"%>
<%@page expressionCodec="none"%>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'project.label', default: 'Project')}" />
<asset:stylesheet src="imgnote/imgnotes.css" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>

 <script type="text/javascript">

        mynotes = ${imageTagsJson.encodeAsJSON()};

        $(window).load(function () {
            // somecode to detect mobile/touch devices, it is better
            // to use WURFL on server for this
            // Ref: http://roughlybrilliant.com/jquery_mobile_best_practices
            if( ('querySelector' in document
                    && 'localStorage' in window
                    && 'addEventListener' in window
                    && ('ontouchstart' in window || window.DocumentTouch && document instanceof DocumentTouch)
                    )
                    || navigator.userAgent.indexOf('IEMobile') > 0){

                var thisIsMobile = true;
            }

            //If your notes data is comming from a URL pass the URL like
            //$('#tern').imgNotes({url: "./json.html"});


            //If your notes data is in the same scrip but is not named notes pass it
            //Setting isMObile to true overlays an icon to toggle the notes, useful in touch devices
            $('#uploadedImage').imgNotes({notes: mynotes, isMobile:thisIsMobile,removeURL:'${createLink(controller: "project",action: "removeImageNote")}'});

            //The following code is not a part of Image-notes plugin but added to show how to code the add notes functionality using the imgareaselect plugin
            $('#cancelnote').click(function(){
                $('#uploadedImage').imgAreaSelect({ hide: true, disable:true });
                $('#noteform').hide();
            });

            $('#addnotelink, #uploadedImage').click(function(){
                initiaizeAddNote();
            });
/*            $('#uploadedImage').click(function(){
                initiaizeAddNote();
            });*/

            $('#uploadedImage').imgNotes.showAll();
            //initiaizeAddNote();
        });

        function initiaizeAddNote(){
            $('#uploadedImage').imgAreaSelect({ enable:true, onSelectChange: showaddnote, x1: 0, y1: 0, x2: 205, y2: 150 });
            return false;
        }

        function tagSuccess(data){
            if(data!="false" && data!=false){
                $('#uploadedImage').imgAreaSelect({ hide: true, disable:true });
                $("#NoteNote").val('');
                $('#noteform').hide();
                $('#uploadedImage').imgNotes.appendNote(data);
                new PNotify({
                    title: 'Success',
                    text: 'Note Saved',
                    type: 'success'
                });
            }
        }

        function tagRemoveSuccess(data){
            if(data!="false" && data!=false){
                new PNotify({
                    title: 'Success',
                    text: 'Note Removed',
                    type: 'success'
                });
            }
        }
        function tagRemoveFailed(data){
            console.log(data);
            new PNotify({
                title: 'Failed',
                text: 'Failed to delete note',
                type: 'error'
            });
        }

        function showaddnote(img, area){
            imgOffset = $(img).offset();
            form_left  = parseInt(imgOffset.left) + parseInt(area.x1);
            form_top   = parseInt(imgOffset.top) + parseInt(area.y1) + parseInt(area.height)+5;

            $('#noteform').css({ left: form_left + 'px', top: form_top + 'px'});

            $('#noteform').show();

            $('#noteform').css("z-index", 10000);
            $('#NoteX1').val(area.x1);
            $('#NoteY1').val(area.y1);
            $('#NoteHeight').val(area.height);
            $('#NoteWidth').val(area.width);

        }
    </script>
</head>
<body>
	<div role="main" class="main">

		<section class="page-top">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<ul class="breadcrumb">
							<li><a href="#">Home</a></li>
							<li class="active">Instructions</li>
						</ul>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<h1>Instructions</h1>
					</div>
				</div>
			</div>
		</section>

		<div class="container">

			<div class="row center">
				<div class="col-md-12">
					<g:render template="flow" />
				</div>
			</div>
			<hr class="tall">
			<div class="row show-grid">
				<div class="col-md-4">
					<ul data-option-key="filter" data-sort-id="portfolio"
						class="nav nav-pills sort-source">
						<li class="active" data-option-value="*"><a href="#">Show
								All</a></li>
						<g:each in="${uniqueTechniques}" status="i"
							var="techniqueInstance">
							<li data-option-value=".${techniqueInstance}"><a href="#">
									${techniqueInstance}
							</a></li>
						</g:each>
					</ul>
					<hr>
					<div class="row">
						<ul data-sort-id="portfolio"
							class="portfolio-list sort-destination"
							style="position: relative; height: 1185px;">
							<g:each in="${techniques}" status="i" var="techniqueInstance">
								<!-- Start Technique Block -->
								<li
									class="owl-item active col-md-6  col-sm-6 col-xs-12 isotope-item ${fieldValue(bean: techniqueInstance, field: "groep")}">
									<div>
										<div class="portfolio-item img-thumbnail">
											<a class="thumb-info lightbox"
												href="#${fieldValue(bean: techniqueInstance, field: 'id')}"
												data-plugin-options="{&quot;type&quot;:&quot;inline&quot;, preloader: false}">
												<img alt="" class="img-responsive"
												src="${grailsApplication.config.retouch.imageServer}${fieldValue(bean: techniqueInstance, field: "beforeafterimage")}" />
												<span class="thumb-info-title"> <span
													class="thumb-info-inner"> ${fieldValue(bean: techniqueInstance, field: "groep")}
												</span> <span class="thumb-info-type"> ${fieldValue(bean: techniqueInstance, field: "name")}
												</span>
											</span> <span class="thumb-info-action"> <span
													title="Universal" class="thumb-info-action-icon"><i
														class="fa fa-link"></i></span>
											</span>
											</a>
										</div>
										<div id="${fieldValue(bean: techniqueInstance, field: 'id')}"
											class="popup-inline-content mfp-hide">
											<h2>OWO! Have you ever seen this?</h2>

											<div class="row">
												<div class="col-md-6">
													<img class="img-thumbnail img-responsive"
														alt="${grailsApplication.config.retouch.imageServer}${fieldValue(bean: techniqueInstance, field: "name")}"
														src="${grailsApplication.config.retouch.imageServer}${fieldValue(bean: techniqueInstance, field: "beforeafterimage")}" />
												</div>
												<div class="col-md-6">

													<h4>
														Technique <strong>Description</strong>
													</h4>
													<p>
														${fieldValue(bean: techniqueInstance, field: "description")}
													</p>

													<a href="#" class="btn btn-primary">Select this
														Technique</a> <span class="arrow hlb"></span>

												</div>
											</div>
										</div>
									</div>
								</li>
							</g:each>
							<!-- End Technique Block -->
						</ul>

					</div>
				</div>
				<div class="col-md-8">
					<h2>Image</h2>
					<div class="isotope-item document col-md-12" style="float: none;">
						<div class="thumbnail">
							<div class="thumb-preview">
								<a class="thumb-image" href="javascript:void(0);">
									<div id="imageovelaynote">
										<img id="uploadedImage" class=""
											src="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.originalImage?.getLargeImageName()}"
											style="width: 100%;">
									</div>
								</a>
							</div>
						</div>


						<div class="row show-grid">
							<div class="col-md-6">
								<h2>Project Instructions</h2>
								<form method="post" action="">
									<div class="form-group">
										<textarea
											style="margin-top: 0px; margin-bottom: 0px; height: 150px;"
											name="note" required="required" id="textareaDefault" rows="3"
											data-plugin-maxlength="" maxlength="1500"
											class="form-control">message test</textarea>
									</div>
								</form>
							</div>
							<div class="col-md-6">
								<h2>Invoice</h2>
								<span class="show-grid-block">6</span>
							</div>
						</div>
					</div>
				</div>
				<div id="noteform">
					<g:formRemote name="NoteAddForm" on404="alert('not found!')"
						onSuccess="tagSuccess(data);" update="updateMe"
						url="[controller: 'project', action:'addImageNote', id:projectInstance.taskId]">
						<fieldset>
							<input name="posX" type="hidden" value="" id="NoteX1" /> <input
								name="posY" type="hidden" value="" id="NoteY1" /> <input
								name="height" type="hidden" value="" id="NoteHeight" /> <input
								name="width" type="hidden" value="" id="NoteWidth" />
							<textarea name="note" id="NoteNote" required="required"
								class="form-control" maxlength="300"></textarea>
						</fieldset>
						<div class="submit">
							<input type="submit" value="Submit"
								class="btn btn-primary btn-xs notebut" /> &nbsp;&nbsp;&nbsp;<input
								type="button" value="Cancel"
								class="btn btn-primary btn-xs notebut" id="cancelnote">
						</div>
					</g:formRemote>
				</div>
			</div>

		</div>
	</div>
	<asset:javascript src="imgnote/jquery.imgnotes.js" />
</body>


</html>