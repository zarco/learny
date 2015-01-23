$ ->
	$("#map_button").click ->
		$('#map_button').hide();
		$('.map_info').css('visibility', 'visible');
		window.markerDefined = false;
		currentLat = $('#venue_latitude').val();
		currentLng = $('#venue_longitude').val();
		# default location TODO: Un-HardCodeMe!
		myLatlng = new google.maps.LatLng(19.412342, -99.173391);
		if currentLat != "" and currentLng != ""
			myLatlng = new google.maps.LatLng(currentLat, currentLng);

		options = {center: myLatlng, zoom: 16};
		map = new google.maps.Map(document.getElementById('map_canvas'), options);


		google.maps.event.addListener(map, 'rightclick', (e)->
			if !window.markerDefined
				newLatLng = e.latLng;
		
				marker = new google.maps.Marker({
					position: newLatLng, 
					map: map,
					draggable: true,
					title: 'L'
				});

				google.maps.event.addListener(marker, 'dragend', (e)->
					updateLocation e.latLng;
				);

				updateLocation newLatLng;

				window.markerDefined = true;
		);

	updateLocation = (newLatLng) ->
		$('#venue_longitude').attr('value', newLatLng.lng());
		$('#venue_latitude').attr('value', newLatLng.lat());


