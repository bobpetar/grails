//= require jquery
//= require jquery.imgareaselect-0.4.js
//= require_self

/**
 * imgnotes jQuery plugin
 * version 1.0
 *
 * Copyright (c) 2008 - Dr. Tarique Sani <tarique@sanisoft.com>
 *
 * Dual licensed under the MIT (MIT-LICENSE.txt)
 * and GPL (GPL-LICENSE.txt) licenses.
 *
 * @URL      http://www.sanisoft.com/blog/2008/05/26/img-notes-jquery-plugin/
 * @Example  example.html
 *
 **/

//Wrap in a closure

var headerStateBig = true;

(function($) {

	$.fn.imgNotes = function(n) {

        if(undefined == notes) {
            var notes;
        }

		if(undefined != n.notes){
			notes = n.notes;
		}

        if(n.url) {
            $.ajaxSetup({async: false});
            $.getJSON(n.url, function(data){
                    notes = data;
                }
            );
        }

		image = this;
        imgNoteRemoveURL = n.removeURL;

		imgOffset = $(image).offset();

        imgHieght = $(image).height();
        imgWidth  = $(image).width();

		$(notes).each(function(){
			appendnote(this);
		});

		$(image).hover(
			function(){
				$('.note').show();
			}/*,
			function(){
				$('.note').hide();
                $('.notep').hide();
			}*/
		);

		addnoteevents();
        appendnotesicon(n.isMobile);

		$(window).resize(function () {
            resetNotes(notes,n.isMobile);
		});

       /* $(window).scroll(function () {
            if($("body").hasClass("sticky-menu-deactive")){
                if(!headerStateBig){
                    headerStateBig = true;
                    resetNotes(notes,n.isMobile);
                }
            }else{
                if(headerStateBig){
                    headerStateBig = false;
                    resetNotes(notes,n.isMobile);
                }

            }
        });*/

	}

    function resetNotes(notes,isMobile){
        $('.note').remove();
        $('.notep').remove();
        $('.notesicon').remove();

        imgOffset = $(image).offset();

        imgHieght = $(image).height();
        imgWidth  = $(image).width();

        $(notes).each(function(){
            appendnote(this);
        });
        addnoteevents();
        appendnotesicon(isMobile);

        $('.note').show();
        $('.notep').show();
    }

    $.fn.imgNotes.showAll = function() {
        $('.note').show();
        $('.notep').show();
    };

    $.fn.imgNotes.hideAll = function() {
        $('.note').hide();
        $('.notep').hide();
    };

    $.fn.imgNotes.appendNote = function(note_data) {
        appendnote(note_data);
        addnoteevents();
    };

	function addnoteevents() {
		$('.note').hover(
			function(){
				$('.note').show();
				$(this).next('.notep').show();
				$(this).next('.notep').css("z-index", 10000);
			},
			function(){
				$('.note').show();
				$(this).next('.notep').hide();
				$(this).next('.notep').css("z-index", 0);
			}
		);

        $(".noteX").click(function(){
            removeNote(this);
        })
	}

    function removeNote(ele){

        removeServerNote(ele);
    }

    function removeServerNote(ele){
        var noteId= $(ele).data("noteid");
        if(!noteId)return false;

        jQuery.ajax(
            {type:'POST',
                url:imgNoteRemoveURL+"/"+noteId,
                success:function(data,textStatus){

                    $("#imgtext_"+noteId).remove();
                    $("#imgnote_b"+noteId).remove();
                    console.log(imgNoteRemoveURL);
                    tagRemoveSuccess(data)},
                error:function(XMLHttpRequest,textStatus,errorThrown){}
            });
        return false;
    }




	function appendnote(note_data){

		note_left  = parseInt(imgOffset.left) + parseInt(note_data.x1);
		note_top   = parseInt(imgOffset.top) + parseInt(note_data.y1);
		note_p_top = note_top + parseInt(note_data.height)+5;

/*		note_area_div = $("<div class='note'></div>")
                            .css({ left:   note_left + 'px',
                                   top:    note_top + 'px',
                                   width:  note_data.width + 'px',
                                   height: note_data.height + 'px' });*/
        note_area_div = $("<div class='note' id='imgnote_b"+note_data.note_id+"'>"+' <button type="button" class="close noteX" data-dismiss="modal" aria-hidden="true" data-noteid="'+note_data.note_id+'" id="imgnotex'+note_data.note_id+'">×</button>'+"</div>").
            css({ left: note_left + 'px',
                top: note_top + 'px',
                width: note_data.width + 'px',
                height: note_data.height + 'px'
            });


        note_text_div = $('<div class="notep alternative-font " id="imgtext_'+note_data.note_id+'">'+note_data.note+'</div>')
                            .css({ left: note_left + 'px',
                                   top:  note_p_top + 'px'});

		$('body').append(note_area_div);
		$('body').append(note_text_div);
	}

    function appendnotesicon(isMobile) {
        if(true !== isMobile) {
            return
        }

        notes_icon_left  = parseInt(imgOffset.left) + parseInt(imgWidth) - 36;
        notes_icon_top   = parseInt(imgOffset.top) + parseInt(imgHieght) - 40;

        notes_icon_div = note_area_div = $("<div class='notesicon'></div>")
                                            .css({ left:   notes_icon_left + 'px',
                                                   top:    notes_icon_top + 'px'
                                                 });
        $('body').append(notes_icon_div);
                $('.notesicon').toggle(
            function(){
                $.fn.imgNotes.showAll();
            },
            function() {
                $.fn.imgNotes.hideAll();
            }
        );
    }

// End the closure
})(jQuery);
