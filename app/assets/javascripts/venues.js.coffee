# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on "click", ".thumbnail", ->
  	$('#picture_modal').attr('src', $(this).attr('src'));
  	$('#myModal').modal({show:true});