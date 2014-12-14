json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :final_time, :max_participants
  #json.url reservation_url(reservation, format: :json)
  json.starts_at reservation.fmt_duration
  json.calendar do
   	json.id	reservation.calendar.id
	json.title reservation.calendar.title
  end
  
  json.venue do
	json.id reservation.calendar.venue.id
	json.name reservation.calendar.venue.name
  end
  
  
end
