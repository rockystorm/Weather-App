require 'yahoo_weatherman'

def check(zipcode)
client = Weatherman::Client.new
weather = client.lookup_by_location(zipcode)
text = client.lookup_by_location(zipcode).condition['text']
city = weather.location['city']
puts "Right now it's #{text.downcase} in #{city}"

return weather
end

puts "What is your zipcode?"
zipcode = gets.to_s
weather = check(zipcode)
puts weather

today = Time.now.strftime('%w').to_i

weather.forecasts.each do |forecast|

	day = forecast['date']
 
weekday = day.strftime('%w').to_i
 
if weekday == today
   dayName = 'Today'
elsif weekday == today + 1
   dayName = 'Tomorrow'
else
   dayName = day.strftime('%A')
end

  puts dayName.to_s + ' is going to be ' + forecast['text'].downcase + ' with a low of ' + forecast['low'].to_s + ' and a high of ' + forecast['high'].to_s
end

