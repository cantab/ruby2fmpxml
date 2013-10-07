require 'sinatra'
require "sinatra/reloader" if development?
require 'nokogiri'
require './filemaker_xml_maker'

# use newrelic in production
configure :production do
  require 'newrelic_rpm'
end

get '/' do
  content_type :html
  "<h1>Ruby to FileMaker Pro XML</h1>"
end

get '/:my_string.?rot13/?' do
  content_type :xml
  result = params[:my_string].tr("A-Za-z", "N-ZA-Mn-za-m")
  FileMakerXMLMaker.new(result).to_fmpxml
end
