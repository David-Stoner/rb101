def factors(number)
  divisor = number
  factors = []
  begin
    break if divisor <= 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

puts factors(0)