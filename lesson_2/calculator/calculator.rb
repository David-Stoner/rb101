def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  /^-?\d+$/.match(input)
end

def float?(input)
  input.to_f.to_s == input || input.to_f.to_s == "#{input + '0'}"
end

def valid_number?(input)
  integer?(input) || float?(input)
end

def operation_to_message(operation)
  case operation
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

number1 = ''
number2 = ''
name = ''
operation = ''

operation_prompt = <<-MSG
  What operation would you like to perform?
  1) add
  2) subtract
  3) multiply
  4) divide
MSG

loop do
  prompt "Welcome to the calculator! Enter your name:"
  name = gets.chomp

  if name.empty?
    prompt "Make sure to use a valid name."
  else
    break
  end
end

prompt "Hi, #{name}!"

loop do
  loop do
    prompt "Enter the first number"
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt "That does not look like a valid number"
    end
  end

  loop do
    prompt "Enter the second number"
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt "That does not look like a valid number"
    end
  end

  prompt operation_prompt

  loop do
    operation = gets.chomp

    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt "Must choose 1, 2, 3 or 4"
    end
  end

  prompt "#{operation_to_message(operation)} the two numbers..."

  result =  case operation
            when '1'
              number1.to_i + number2.to_i
            when '2'
              number1.to_i - number2.to_i
            when '3'
              number1.to_i * number2.to_i
            when '4'
              number1.to_i / number2.to_i

            end

  prompt "Your result is #{result}"

  prompt "Do you want to perform another calculation?"
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt "Thank you for using the calculator #{name}"