<%--
  Created by IntelliJ IDEA.
  User: Aasiz
  Date: 2/26/2015
  Time: 2:06 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@page expressionCodec="none" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
    <asset:stylesheet src="imgnote/imgnotes.css" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>

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
                        <li><a href="${createLink(uri: '/')}">Home</a></li>
                        <li class="active">Instructions</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <div class="container">

        <div class="row center">
            <div class="col-md-12">
                <g:render template="flow"/>
            </div>
        </div>
        <hr class="tall">

        <div class="row show-grid">
            <div class="col-md-4">


                <section class="panel">
                    <g:form action="addInstructions" id="${projectInstance?.projectId}" >
                        <header class="panel-heading">
                            <div class="panel-actions">
                                <a href="#" class="panel-action panel-action-toggle" data-panel-toggle></a>
                                %{--                <a href="#" class="panel-action panel-action-dismiss" data-panel-dismiss></a>--}%
                            </div>

                            <h2 class="panel-title">Project Instructions</h2>

                            <p class="panel-subtitle">
                                What would you like to do?
                            </p>
                        </header>
                        <div class="panel-body">

                            <div class="row">
                                <div class="form-group">
                                    <label class="control-label">Techniques</label>
                                    <retouch:selectWithOptGroup multiple="true" value="${projectInstance?.task?.techniques.id}" data-plugin-selectTwo="data-plugin-selectTwo" class="form-control populate" name="task.techniques" from="${techniques}" groupBy="groep" optionKey="id" optionValue="name"/>
                                </div>

                                <div class="form-group">
                                    <label class="control-label">Message</label>
                                    <textarea class="form-control"  maxlength="1500" data-plugin-maxlength rows="3" id="textareaDefault" required="required" name="note" style="margin-top: 0px; margin-bottom: 0px; height: 150px;" >${projectInstance?.note}</textarea>
                                </div>




                            </div>

                        </div>
                        <footer class="panel-footer">
                            <g:submitButton name="continue" class="btn btn-primary" value="Continue" />
                            <input id='addnotelink' class="btn btn-primary" type="button" value="Tag a note" >
                        </footer>
                    </g:form>
                </section>

            </div>
            <div class="col-md-8"> <div class="isotope-item document col-md-11" style="float:none;">
                <div class="thumbnail">
                    <div class="thumb-preview">
                        <a class="thumb-image" href="javascript:void(0);">
                            <div id="imageovelaynote">
                                <img id="uploadedImage" class="%{--img-responsive--}%" style="width: 100%;" %{--onError="this.onerror=null;this.src='${createLink(uri: '/')}assets/noimage.png';"--}% src="${grailsApplication.config.retouch.imageServer}${projectInstance?.task?.originalImage?.getLargeImageName()}"/>
                            </div>
                        </a>
                    </div>
                </div>
            </div></div>
            <div id="noteform" >


            %{--      <form id="NoteAddForm" method="post" action="/nagpurbirds2/notes/add">--}%
                <g:formRemote name="NoteAddForm" on404="alert('not found!')" onSuccess="tagSuccess(data);" update="updateMe" url="[controller: 'project', action:'addImageNote', id:projectInstance.taskId]">
                    <fieldset>
                        <input name="posX" type="hidden" value="" id="NoteX1" />
                        <input name="posY" type="hidden" value="" id="NoteY1" />
                        <input name="height" type="hidden" value="" id="NoteHeight" />
                        <input name="width" type="hidden" value="" id="NoteWidth" />
                        <textarea name="note" id="NoteNote" required="required" class="form-control"  maxlength="300"></textarea>
                    </fieldset>
                    <div class="submit"><input type="submit" value="Submit" class="btn btn-primary btn-xs notebut" /> &nbsp;&nbsp;&nbsp;<input type="button" value="Cancel" class="btn btn-primary btn-xs notebut" id="cancelnote" ></div>
                %{--</form>--}%
                </g:formRemote>
            </div>
        </div>
    </div>
</div>
%{--<asset:javascript src="imgnote/jquery.imgareaselect-0.4.js"  />--}%
<asset:javascript src="imgnote/jquery.imgnotes.js" />
</body>


</html>