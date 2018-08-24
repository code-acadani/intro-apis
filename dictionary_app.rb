require "http"

system "clear"
puts "Welcome to the dictionary app!"

puts "Enter a word: "
word = gets.chomp

response = HTTP.get("http://api.wordnik.com/v4/word.json/#{word}/definitions?limit=10&includeRelated=true&useCanonical=false&includeTags=false&api_key=9f63510ab680a9a2504370c0a530c846ba454b12337f0c6c0")

definition_data = response.parse

first_definition = definition_data[0]["text"]

puts "Definition: #{first_definition}" 


response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/examples?includeDuplicates=false&useCanonical=false&limit=5&api_key=9f63510ab680a9a2504370c0a530c846ba454b12337f0c6c0")

example_data = response.parse

first_example = example_data["examples"][0]["text"]

puts "Example Sentence: #{first_example}" 


response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=9f63510ab680a9a2504370c0a530c846ba454b12337f0c6c0")

pronunciation_data = response.parse

first_pronunciation = pronunciation_data[0]["raw"]

puts "Pronunciation: #{first_pronunciation}" 