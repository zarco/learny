Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'sVkJcR5xEU7hNMliyb5YNPdHn', 'BHSIKEfFy4oBmmHEWat2XEg2clqhtN6Vjm2uB7c4Tmorusr6UF'
  provider :facebook, '932093316821488', 'ecac88818563adeba52f03c2683c82be'
end