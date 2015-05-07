json.array!(@zones) do |zone|
  json.extract! zone, :name
  json.url zone_url(zone, format: :json)
end