<%--
  Created by IntelliJ IDEA.
  User: Aasiz
  Date: 2/26/2015
  Time: 2:06 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
    <asset:stylesheet src="imgnote/imgnotes.css" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>

    <script type="text/javascript">

        mynotes = [{"x1":"10","y1":"10","height":"150","width":"50","note":"This is a note"}, {"x1":"25","y1":"25","height":"70","width":"80","note":"<b>This</b> is a new note This is another note This is a new note"}];

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
            $('#uploadedImage').imgNotes({notes: mynotes, isMobile:true});

            // example of how to use the showAll/hideAll functions
            $('#shownotelink').toggle(
                    function(){
                        $('#tern').imgNotes.showAll();
                        return false;
                    },
                    function() {
                        $('#tern').imgNotes.hideAll();
                        return false;
                    }
            );

            //The following code is not a part of Image-notes plugin but added to show how to code the add notes functionality using the imgareaselect plugin
            $('#cancelnote').click(function(){
                $('#tern').imgAreaSelect({ hide: true, disable:true });
                $('#noteform').hide();
            });

            $('#addnotelink').click(function(){
                $('#tern').imgAreaSelect({ enable:true, onSelectChange: showaddnote, x1: 120, y1: 90, x2: 280, y2: 210 });
                return false;
            });


        });

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
                <g:render template="flow"/>
            </div>
        </div>
        <hr class="tall">

        <div class="row show-grid">
            <div class="col-md-4">
                <g:form action="addInstructions" id="${projectInstance?.projectId}" >
                    <header class="panel-heading">
                        <h3>Instructions</h3>
                    </header>
                    <textarea class="form-control" rows="3" id="textareaDefault" required="required" name="note" style="margin-top: 0px; margin-bottom: 0px; height: 150px;" >${projectInstance?.note}</textarea>
                    <br>
                    <fieldset class="buttons">
                        <g:submitButton name="continue" class="btn btn-primary" value="Continue" />
                    </fieldset>
                </g:form>
           </div>
            <div class="col-md-8"> <div class="isotope-item document col-md-11" style="float:none;">
                <div class="thumbnail">
                    <div class="thumb-preview">
                        <a class="thumb-image" href="javascript:void(0);">
                            <img id="uploadedImage" class="img-responsive" %{--onError="this.onerror=null;this.src='${createLink(uri: '/')}assets/noimage.png';"--}% src="${grailsApplication.config.retouch.imageServer}${projectInstance?.originalImage?.getLargeImageName()}"/>
                        </a>
                    </div>
                </div>
            </div></div>
        </div>
    </div>
</div>
%{--<asset:javascript src="imgnote/jquery.imgareaselect-0.4.js"  />--}%
<asset:javascript src="imgnote/jquery.imgnotes.js" />
</body>


</html>