require 'sinatra'
require 'mechanize'

class aqiscraper < Sinatra::base
	get '/' do
		# this initializes a Mechanize object
		@agent = Mechanize.new
		# this array of hashes provides the name and URL of air quality indexes
		# (AQIs) of various locations around the world
		@locations = [
			{:name => "New York", :url => "http://aqicn.org/city/newyork/"}, 
			{:name => "Beijing", :url => "http://aqicn.org/city/beijing/"}, 
			{:name => "Paris", :url => "http://aqicn.org/city/paris/"}, 
			{:name => "Singapore", :url => "http://aqicn.org/city/singapore/north/"}, 
			{:name => "Quito", :url => "http://aqicn.org/city/ecuador/quito/centro/"}, 
			{:name => "Addis Ababa", :url => "http://aqicn.org/city/ethiopia/addis-ababa/us-embassy/"}, 
			{:name => "Sydney", :url => "http://aqicn.org/city/australia/nsw/rozelle/sydney-east/"}, 
			{:name => "Moscow", :url => "http://aqicn.org/city/moscow/shabol/"}, 
			{:name => "Istanbul", :url => "http://aqicn.org/city/turkey/istanbul/kagithane/mthm/"}, 
			{:name => "Mexico City", :url => "http://aqicn.org/city/mexico/mexico/merced/"}, 
			{:name => "Krakow", :url => "http://aqicn.org/city/poland/malopolska/krakow-ul.-dietla/"}, 
			{:name => "Tehran", :url => "http://aqicn.org/city/iran/tehran/shahre-rey/"}
		]
		erb :index
	end
end
