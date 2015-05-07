json.array!(@workshops) do |workshop|
  json.extract! workshop, :name, :free, :state, :proposed_date
  json.url workshop_url(workshop, format: :json)
end