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
      html+='<td>'+''+'</td>'
      html+='</tr>'
      $(html).appendTo('.search-results table tbody').click(() -> 
        $('.dlg_find_venue').modal('hide')  
        $('#establecimiento').attr('value',item.venue.name+ ' - '+item.starts_at)
          .siblings(':hidden').attr('value',item.id)
          
      )
      
      #$('.search-results table tbody').append(html)
    )
    
  )
  (change_url = ->
    wbst = $("#expert_website").val().replace("http://", "")
    fb = $("#expert_facebook_link").val().replace("https://", "")
    twtr = $("#expert_twitter_link").val().replace("https://twitter.com/", "@")
    gplus = $("#expert_google_plus_link").val().replace("https://plus.google.com/", "")
    lnkd = $("#expert_linkedin_link").val().replace("https://www.linkedin.com/profile/view?", "")
    $("#expert_website").val wbst
    $("#expert_facebook_link").val fb
    $("#expert_twitter_link").val twtr
    $("#expert_google_plus_link").val gplus
    $("#expert_linkedin_link").val lnkd
    return
  )()
  
  
$(document).ready(ready)
$(document).on('page:load', ready)
