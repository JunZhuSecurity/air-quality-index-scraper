require 'sinatra'
require 'mechanize'

# this initializes a Mechanize object
agent = Mechanize.new

# this array of hashes provides the name and URL of air quality indexes
# (AQIs) of various locations around the world
@locations = [
	{:name => "New York, USA", :url => "http://aqicn.org/city/newyork/"}, 
	{:name => "Beijing, China", :url => "http://aqicn.org/city/beijing/"}, 
	{:name => "Paris, France", :url => "http://aqicn.org/city/paris/"}, 
	{:name => "Singapore", :url => "http://aqicn.org/city/singapore/north/"}, 
	{:name => "Quito, Ecuador", :url => "http://aqicn.org/city/ecuador/quito/centro/"}, 
	{:name => "Addis Ababa, Ethiopia", :url => "http://aqicn.org/city/ethiopia/addis-ababa/us-embassy/"}, 
	{:name => "Sydney, Australia", :url => "http://aqicn.org/city/australia/nsw/rozelle/sydney-east/"}, 
	{:name => "Moscow, Russia", :url => "http://aqicn.org/city/moscow/shabol/"}, 
	{:name => "Istanbul, Turkey", :url => "http://aqicn.org/city/turkey/istanbul/kagithane/mthm/"}, 
	{:name => "Mexico City, Mexico", :url => "http://aqicn.org/city/mexico/mexico/merced/"}, 
	{:name => "Krakow, Poland", :url => "http://aqicn.org/city/poland/malopolska/krakow-ul.-dietla/"}, 
	{:name => "Tehran, Iran", :url => "http://aqicn.org/city/iran/tehran/shahre-rey/"}
]

# this loop passes each url into the scraper and grabs the realtime AQI
# from a div on each page and then prints the AQI along with the location name
@locations.each do |location|
	page = agent.get("#{location[:url]}")
	value = page.search('.aqivalue').first.text
	"The AQI for #{location[:name]} is #{value}."
end

# get '/' do
# 	@agent = Mechanize.new
# 	@locations = [
# 		{:name => "New York", :url => "http://aqicn.org/city/newyork/"}, 
# 		{:name => "Beijing", :url => "http://aqicn.org/city/beijing/"}, 
# 		{:name => "Paris", :url => "http://aqicn.org/city/paris/"}, 
# 		{:name => "Singapore", :url => "http://aqicn.org/city/singapore/north/"}, 
# 		{:name => "Quito", :url => "http://aqicn.org/city/ecuador/quito/centro/"}, 
# 		{:name => "Addis Ababa", :url => "http://aqicn.org/city/ethiopia/addis-ababa/us-embassy/"}, 
# 		{:name => "Sydney", :url => "http://aqicn.org/city/australia/nsw/rozelle/sydney-east/"}, 
# 		{:name => "Moscow", :url => "http://aqicn.org/city/moscow/shabol/"}, 
# 		{:name => "Istanbul", :url => "http://aqicn.org/city/turkey/istanbul/kagithane/mthm/"}, 
# 		{:name => "Mexico City", :url => "http://aqicn.org/city/mexico/mexico/merced/"}, 
# 		{:name => "Krakow", :url => "http://aqicn.org/city/poland/malopolska/krakow-ul.-dietla/"}, 
# 		{:name => "Tehran", :url => "http://aqicn.org/city/iran/tehran/shahre-rey/"}
# 	]
# 	erb :index
# end
