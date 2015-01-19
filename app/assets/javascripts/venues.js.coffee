# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on "click", ".thumbnail", ->
  	$('#picture_modal').attr('src', $(this).attr('src'));
  	$('#myModal').modal({show:true});



ready = ->
  console.log("map loading ...");
  script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=drawing&callback=initialize';
  document.body.appendChild(script);	

initialize = ->    
  mapOptions = {
    center: new google.maps.LatLng(19.4331, -99.1343),
    zoom: 15,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),mapOptions);
  geocoding  = new google.maps.Geocoder();

$(document).ready(ready)
$(document).on('page:load', ready)

