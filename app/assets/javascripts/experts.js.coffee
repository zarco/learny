# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ready page:load", ->
  $("#chk-free").on "change", ->
    is_checked = $("#chk-free").prop('checked')
    if is_checked
      $("#txt-price").prop "disabled", true      
    else
      $("#txt-price").prop "disabled", false      
    return
  return