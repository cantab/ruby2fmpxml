require 'sinatra'
require './filemaker_xml_maker'
require 'nokogiri'
require 'sinatra/reloader' if development?
require 'newrelic_rpm' if production?

get '/' do
  erb :index
end

get '/:my_string.?rot13/?' do
  content_type :xml

  input = params[:my_string]
  output = input.tr("A-Za-z", "N-ZA-Mn-za-m")

  display = { input: input, output: output }
  FileMakerXMLMaker.new(display).to_fmpxml
end
