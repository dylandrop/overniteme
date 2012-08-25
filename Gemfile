source 'https://rubygems.org'

gem 'rails', '3.2.6'
gem 'devise'
gem 'will_paginate'
gem 'tlsmail'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development do
  gem 'guard-spork'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl_rails', '~> 3.3.0'
end

group :production do
  gem 'pg'
end

group :test do
  gem 'bourne'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem "spork", "~> 1.0.0.rc3"
  gem 'rspec_multi_matchers'
end
