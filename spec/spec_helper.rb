require 'rack/test'
require 'rspec'
require 'capybara/rspec'
require_relative '../ruby2fmpxml'

ENV['RACK_ENV'] = 'test'

def app
  Sinatra::Application
end

Capybara.app = Sinatra::Application

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.include Capybara::DSL
end
