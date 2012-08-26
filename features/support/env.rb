require 'rubygems'
require 'spork'
require 'fakefs/safe'
require 'fakeweb'

module FakeWeb
  class StubSocket
    def read_timeout=(ignored)
    end
  end
end

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

  
  FakeWeb.allow_net_connect = false

  (1..5).each do |id| 
    FakeWeb.register_uri(:put, "https://overniteme-test.s3.amazonaws.com/original/#{id.to_s}/rails-icon.jpg",
      :body => "Picture inserted.", :status => ["200", "OK"])
    FakeWeb.register_uri(:put, "https://overniteme-test.s3.amazonaws.com/small/#{id.to_s}/rails-icon.jpg",
      :body => "Picture inserted.", :status => ["200", "OK"])
  end
end

Spork.each_run do
end
