flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = {}

flintstones.each_with_index do |name, index|
  p flintstones_hash = name => index
end

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

combined_ages = 0

ages.each_value { |age| combined_ages += age }

p combined_ages

ages_young = ages.select { |key, value| value < 100 }
p ages_young

ages.values.min

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.find_index { |str| str.start_with?('Be') }

p flintstones.map! { |str| str.slice(0..2) }