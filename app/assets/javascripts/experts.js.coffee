# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ready page:load", ->
  $("#workshop_free").on "change", ->
    is_checked = $("#workshop_free").prop('checked')
    if is_checked
      $('#workshop_price').prop('disabled', true).val '0'
    else
      $("#workshop_price").prop "disabled", false      
    return
  return