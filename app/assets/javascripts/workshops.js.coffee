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

  $('#expert_website').on 'keyup', ->
    regex_website = /\bwww\.(.+)\.(.+)\b/
    link_website = $('#expert_website').val()
    if link_website.match(regex_website)
      $('.website-form').removeClass('has-error').addClass 'has-success'
    else
      $('.website-form').removeClass('has-success').addClass 'has-error'
    return
  $('#expert_facebook_link').on 'keyup', ->
    regex_fb = /(\bfacebook.com\/)(.+)\b/
    link_fb = $('#expert_facebook_link').val()
    if link_fb.match(regex_fb)
      $('.fb-form').removeClass('has-error').addClass 'has-success'
    else
      $('.fb-form').removeClass('has-success').addClass 'has-error'
    return
  $('#expert_twitter_link').on 'keyup', ->
    regex_twtr = /@(.+)\b/
    link_twtr = $('#expert_twitter_link').val()
    if link_twtr.match(regex_twtr)
      $('.twtr-form').removeClass('has-error').addClass 'has-success'
    else
      $('.twtr-form').removeClass('has-success').addClass 'has-error'
    return
  $('#expert_linkedin_link').on 'keyup', ->
    regex_lnkd = /\bid=(\d+)\b/
    link_lnkd = $('#expert_linkedin_link').val()
    if link_lnkd.match(regex_lnkd)
      $('.lnkd-form').removeClass('has-error').addClass 'has-success'
    else
      $('.lnkd-form').removeClass('has-success').addClass 'has-error'
    return
  $('#expert_google_plus_link').on 'keyup', ->
    regex_gplus = /\+(.+)\b/
    link_gplus = $('#expert_google_plus_link').val()
    if link_gplus.match(regex_gplus)
      $('.gplus-form').removeClass('has-error').addClass 'has-success'
    else
      $('.gplus-form').removeClass('has-success').addClass 'has-error'
    return

$(document).ready(ready)
$(document).on('page:load', ready)
