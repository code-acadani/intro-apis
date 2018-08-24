require "http"

system "clear"
puts "Welcome to the weather app!"

puts "Enter a city:"
city = gets.chomp
puts "Enter a state code:"
state = gets.chomp

response = HTTP.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22#{city}%2C%20#{state}%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")

weather_data = response.parse

temperature = weather_data["query"]["results"]["channel"]["item"]["condition"]["temp"]
condition = weather_data["query"]["results"]["channel"]["item"]["condition"]["text"]

puts "Today in #{city} it is #{temperature} degrees and #{condition} outside."