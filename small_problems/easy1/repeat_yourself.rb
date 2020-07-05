def repeat(str, num)
  counter = 0
  until counter >= num
    puts str
    counter += 1
  end
end

repeat('Hello', 3)