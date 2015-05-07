Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'FPBJE4oqzHf5r4HKPBkMyzBF8', 'KCPdJvcpgumI6kuOpYVw96zGKG4XvRoqqJcc2ETtqYDnUiZUHZ'
  provider :facebook, '963983576975117', '6a943491cdd67e249dec2a732c56f4f5'
end