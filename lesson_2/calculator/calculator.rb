def prompt(message)
  puts "=> #{message}"
end

def get_line(filename, lineno)
  File.open(filename, 'r') do |getline|
    (lineno - 1).times { getline.gets }
      getline.gets
  end
end

def integer?(input)
  /^-?\d+$/.match(input)
end

def float?(input)
  input.to_f.to_s == input || input.to_f.to_s == (input + '0')
end

def valid_number?(input)
  integer?(input) || float?(input)
end

def op_to_msg(operation)
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

operation_prompt = get_line('calculatortext.txt', 12) % { line: "\n" }

loop do
  prompt get_line('calculatortext.txt', 1)
  name = gets.chomp

  if name.empty?
    prompt get_line('calculatortext.txt', 2)
  else
    break
  end
end

prompt get_line('calculatortext.txt', 3) % { name: name }

loop do
  loop do
    prompt get_line('calculatortext.txt', 4)
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt get_line('calculatortext.txt', 5)
    end
  end

  loop do
    prompt get_line('calculatortext.txt', 6)
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt get_line('calculatortext.txt', 5)
    end
  end

  prompt operation_prompt

  loop do
    operation = gets.chomp

    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt get_line('calculatortext.txt', 7)
    end
  end

  prompt get_line('calculatortext.txt', 8) % { operation: op_to_msg(operation) }

  result = case operation
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt get_line('calculatortext.txt', 9) % { result: result }

  prompt get_line('calculatortext.txt', 10)
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt get_line('calculatortext.txt', 11) % { name: name }
