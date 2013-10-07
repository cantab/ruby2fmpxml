require 'sinatra'
require './filemaker_xml_maker'
require 'nokogiri'
require 'sinatra/reloader' if development?
require 'newrelic_rpm' if production?

get '/' do
  content_type :html
  "<h1>Ruby to FileMaker Pro XML</h1>"
end

get '/:my_string.?rot13/?' do
  content_type :xml
  result = params[:my_string].tr("A-Za-z", "N-ZA-Mn-za-m")
  FileMakerXMLMaker.new(result).to_fmpxml
end
