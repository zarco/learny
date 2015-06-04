Rails.application.config.middleware.use OmniAuth::Builder do
  
  #puts "omniauth facebook #{ENV['FACEBOOK_APP_ID']} #{ENV['FACEBOOK_APP_SECRET']}"
  
  provider :twitter, 'sVkJcR5xEU7hNMliyb5YNPdHn', 'BHSIKEfFy4oBmmHEWat2XEg2clqhtN6Vjm2uB7c4Tmorusr6UF'
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']
end