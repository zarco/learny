json.array!(@admin_venues) do |admin_venue|
  json.extract! admin_venue, :id
  json.url admin_venue_url(admin_venue, format: :json)
end
