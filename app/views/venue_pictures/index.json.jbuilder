json.array!(@venue_pictures) do |venue_picture|
  json.extract! venue_picture, :id, :venue_id, :avatar
  json.url venue_picture_url(venue_picture, format: :json)
end
