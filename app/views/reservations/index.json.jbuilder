json.array!(@reservations) do |reservation|
  json.id reservation.to_param
  json.extract! reservation, :final_time, :max_participants
  #json.url reservation_url(reservation, format: :json)
  json.starts_at reservation.fmt_duration
  json.cover reservation.cover
  json.calendar do
   	json.id	reservation.calendar.to_param
	json.title reservation.calendar.title
  end
  
  json.venue do
	json.id reservation.calendar.venue.to_param
	json.name reservation.calendar.venue.name
  json.address reservation.calendar.venue.address
  end
  
  
end
