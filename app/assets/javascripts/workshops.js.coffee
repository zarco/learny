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

  $(".search-workshop").on 'focus', ->
    $(this).select()

  enable_workshop_price = ->
    is_checked = $('#workshop_free').prop('checked')
    if is_checked
      $('#workshop_price').prop('disabled', true).val '0'
    else
      $('#workshop_price').prop 'disabled', false    

  $('#workshop_free').on 'change', ->
    enable_workshop_price()
  
  enable_workshop_price()

$(window).scroll ->
  url = $('.pagination .next_page').attr('href')
  if url && $(window).scrollTop() > $(document).height() - $(window).height() - 250    
    bar = "<div class='progress'><div class='progress-bar progress-bar-striped active' role='progressbar' aria-valuenow='90' aria-valuemin='0' aria-valuemax='100' style='width: 82%'></div></div>"
    $('.pagination').addClass('col-md-12 col-xs-12').text('Buscando talleres...').append(bar)
    $.getScript(url)

$(document).ready(ready)
$(document).on('page:load', ready)