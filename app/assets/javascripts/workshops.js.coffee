# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready =->
  $("#workshops-_form-frmSearchReservations").on("ajax:success",(e, data, status, xhr)->
    $('.search-results table tbody').html('')
    $(data).each((index,item) ->
      
      html='<tr data-venue="'+item.venue.name+'" data-reservation-id="'+item.id+'" >'
      html+='<td></td>'
      html+='<td>'+item.venue.name+'</td>'
      html+='<td>'+item.starts_at+'</td>'
      html+='<td>'+item.venue.address+'</td>'
      html+='<td>'+item.cover+'</td>'
      html+='</tr>'
      $(html).appendTo('.search-results table tbody').click(() -> 
        $('.dlg_find_venue').modal('hide')  
        $('#establecimiento').attr('value',item.venue.name+ ' - '+item.starts_at)
          .siblings(':hidden').attr('value',item.id)
          
      )
      
      #$('.search-results table tbody').append(html)
    )
    
  )
  enable_workshop_price = ->
    is_checked = $('#workshop_free').prop('checked')
    if is_checked
      $('#workshop_price').prop 'disabled', true
    else
      $('#workshop_price').prop 'disabled', false
    return

  $('#workshop_free').on 'change', ->
    enable_workshop_price()
    return
    
  enable_workshop_price()
  return
  
$(document).ready(ready)
$(document).on('page:load', ready)