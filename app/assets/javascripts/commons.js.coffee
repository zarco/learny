//=require workshops

ready =->
  $('[data-behaviour~=datepicker]').datepicker();
  $('.datepicker').datepicker({
    language: "es",
    format: "dd/mm/yyyy",
    autoclose: true
  });
    
  $('.datetime-select select').each((index,item) ->
    $(item).addClass('form-control')
  )
    
$(document).ready(ready)
$(document).on('page:load', ready)
