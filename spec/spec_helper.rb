require 'rubygems'
require 'spork'

Spork.prefork do
  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

  RSpec.configure do |config|
    config.infer_base_class_for_anonymous_controllers = false
    config.order = "random"
    config.mock_with :mocha
    config.include FactoryGirl::Syntax::Methods
    
    config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before js: :true do
      DatabaseCleaner.strategy = :truncation
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end
  end
end

Spork.each_run do
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  FactoryGirl.reload
end
