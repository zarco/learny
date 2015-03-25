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
      $('#workshop_price').prop('disabled', true).val '0'
    else
      $('#workshop_price').prop 'disabled', false    

  $('#workshop_free').on 'change', ->
    enable_workshop_price()
  
  enable_workshop_price()
  
  tour = new Tour({steps: [
    {      
      title: '¡Te damos la bienvenida a Learny!',
      content: 'A continuación te mostramos los puntos escenciales que debes conocer.',
      orphan: true,
      backdrop: true
    },
    {
      element: '#carousel_next_workshops',
      title: 'Talleres registrados',
      content: 'Cuando propongas talleres, aquí se mostrarán.'
    },
    {
      element: '#workshop_name',
      title: 'Proner un nuevo curso',
      content: 'Recuerda que para proponer un curso, el nombre debe ser claro.'
    },
    {
      element: '#workshop_description',
      title: 'Descripción del curso',
      content: 'Te recomendamos que la descripción sea llamativa para que consigas más estudiantes.'
    },
    {
      element: '#workshop_free',
      title: 'Curso gratuito',
      content: 'Si quieres comenzar a ganar fama en Learny, puedes comenzar dando cursos gratuitos. Solo marca la casilla y ¡Listo!'
    },
    {
      element: '#workshop_previous_skills',
      title: 'Conocimientos requeridos del estudiante',
      content: 'Si es necesario que tus estudiantes sepan algo antes de tomar tu curso puedes comentarlo aquí.'
    },
    {
      element: '#establecimiento',
      title: 'Buscar establecimiento',
      content: 'Puedes seleccionar el establecimiento que se adapte a tu horario, si aún no tienes un espacio , no te preocupes, tu curso será publicado para que comience a ganar popularidad hasta que consigas un lugar.'
    },    
    {
      element: '#home',
      title: 'Ir al inicio',
      content: 'Clic en el logo de Learny y regresarás siempre a esta página',
      placement: 'bottom'
    }    
  ]})
  # Initialize the tour
  tour.init()
  # Start the tour
  tour.start()
  
$(document).ready(ready)
$(document).on('page:load', ready)