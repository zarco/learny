Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'FPBJE4oqzHf5r4HKPBkMyzBF8', 'KCPdJvcpgumI6kuOpYVw96zGKG4XvRoqqJcc2ETtqYDnUiZUHZ'
  provider :facebook, '932093316821488', 'ecac88818563adeba52f03c2683c82be'
end