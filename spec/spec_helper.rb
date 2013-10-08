require 'rspec'
require 'rack/test'
require_relative '../ruby2fmpxml'

ENV['RACK_ENV'] = 'test'

def app
  Sinatra::Application
end

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end
