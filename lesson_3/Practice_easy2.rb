ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
puts ages.include? "Spot"
puts ages.any? "Spot"
puts ages.has_key? "Spot"

puts munsters_description = "The Munsters are creepy in a good way."
puts munsters_description.swapcase!
puts munsters_description.capitalize!
puts munsters_description.downcase!
puts munsters_description.upcase!

additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge! additional_ages
puts ages

advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.include? "Dino"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones

flintstones.push "Dino"
p flintstones

flintstones.pop
p flintstones

flintstones.append("Dino", "Hoppy")
p flintstones

advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.slice! (0..38) 
puts advice

statement = "The Flintstones Rock!"
puts statement.count "t"

puts title = "Flintstone Family Members".center(40)