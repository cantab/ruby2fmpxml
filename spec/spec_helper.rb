require 'rspec'
require 'rack/test'
require 'capybara'
require 'capybara/dsl'
require_relative '../ruby2fmpxml'

ENV['RACK_ENV'] = 'test'

def app
  Sinatra::Application
end

Capybara.app = Sinatra::Application

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end
