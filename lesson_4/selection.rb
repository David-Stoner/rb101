produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(hash)
  selected_keys = hash.keep_if { |key, value| value == 'Fruit' }
end

puts select_fruit(produce)