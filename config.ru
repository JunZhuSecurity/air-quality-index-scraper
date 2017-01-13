require 'rubygems'
require 'sinatra'
require 'aqiscraper'

map '/' do
	run aqiscraper
end