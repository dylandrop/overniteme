require 'rubygems'
require 'spork'
require 'fakefs/safe'

Spork.prefork do
  require 'cucumber/rails'
  require 'capybara/rspec'
  Capybara.default_selector = :css
  ActionController::Base.allow_rescue = false
  
  begin
    DatabaseCleaner.strategy = :transaction
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end

  Cucumber::Rails::Database.javascript_strategy = :truncation
end

Spork.each_run do
end
