# config/initializers/timeout.rb
if Rails.env.production? 
  Rack::Timeout.timeout = 20  # seconds
end