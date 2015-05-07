json.array!(@reservations) do |reservation|
  json.extract! reservation, :starts_at, :final_time, :max_participants, :calendar_id, :cover
  json.url reservation_url(reservation, format: :json)
end