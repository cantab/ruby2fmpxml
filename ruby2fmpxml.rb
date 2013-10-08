require 'sinatra'
require './filemaker_xml_maker'
require 'nokogiri'
require 'sinatra/reloader' if development?
require 'newrelic_rpm' if production?

get '/' do
  erb :index
end

post '/rot13' do
  content_type :xml

  display = get_rot13(params[:my_string])
  get_fmpxml(display)
end

private

def get_rot13(input)
  { input: input, output: input.tr("A-Za-z", "N-ZA-Mn-za-m") }
end

def get_fmpxml(display)
  FileMakerXMLMaker.new(display).to_fmpxml
end
