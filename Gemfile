source 'https://rubygems.org'

ruby '2.1.2'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use postgresql as the database for Active Record
gem 'pg'
gem 'pg_search'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]


# Easily include static pages in your Rails app.
gem 'high_voltage'

group :production do
  # To load assets in Heroku.
  gem 'rails_12factor'
  gem 'puma'
end

group :test do
  gem 'ffaker', '~> 1.25.0'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'cucumber-rails', require: false
  gem 'web-console', '~> 2.0'
end

group :test,:development do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'unicorn'
  gem 'rails-admin-scaffold'
end

gem 'devise'

gem 'haml-rails'

gem 'carrierwave'
gem 'fog'#, '~> 1.3.1'
gem 'mini_magick'



gem "letter_opener", :group => :development

gem "simple_calendar", "~> 1.1.0"


gem 'kaminari'
gem 'time_difference', '~> 0.3.2'

gem 'rack-timeout'

gem 'state_machine', :git => 'https://github.com/seuros/state_machine.git'
gem 'rails-observers'

gem "paranoia", "~> 2.0"
gem "obfuscate_id", git: "https://github.com/namick/obfuscate_id"

#gem 'encrypted_id'

gem 'omniauth-twitter'
gem 'omniauth-facebook'

# Dependencias con bower
# gem 'rails-assets-BOWER_PACKAGE_NAME'
source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap'
  gem 'rails-assets-font-awesome'
  gem 'rails-assets-bootstrap-star-rating'
  gem 'rails-assets-bootstrap-datepicker'
  gem 'rails-assets-bootstrap-social'
end

