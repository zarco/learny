json.array!(@calendars) do |calendar|
  json.extract! calendar, :title, :is_default
  json.url calendar_url(calendar, format: :json)
end