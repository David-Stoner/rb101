#3  advice = "Few things in life are as important as house training your pet dinosaur"
# =>advice[/important/] = "urgent"
# =>puts advice

# =>advice = "Few things in life are as important as house training your pet dinosaur"
# =>advice.gsub!('important', 'urgent')
# =>puts advice

#5  number_check = Array.new(91) { |index| index + 10 }
# =>number_check.include?(42) ? puts("It is there") : puts("Not here")
# =>p number_check
# =>number_check = (10..100).to_a
# =>number_check.include?(42) ? puts("It is there") : puts("Not here")
# =>p number_check

# =>number_check = (10..100).include? 42
# =>p number_check

#6  famous_words = "seven years ago..."
# =>famous_words = "Four score and " + "seven years ago"
#  puts famous_words

# =>famous_words = "seven years ago..."
# =>famous_words = "Four score and #{famous_words}"
# =>puts famous_words

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
p flintstones
flintstones.delete_if {|key| key != "Barney"}
p flintstones
flintstones = flintstones.to_a.flatten
p flintstones