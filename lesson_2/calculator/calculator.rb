number1 = ''
number2 = ''
name = ''
operation = ''
language = 'english.txt'
language_prompt = ''

welcome = 1
name_get = 2
hi = 3
get_number1 = 4
invalid_number = 5
get_number2 = 6
invalid_choice = 7
calculating = 8
display_result = 9
again = 10
goodbye = 11
operator_choice = 12

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

def invalid_number_display(language, invalid_number)
  prompt get_line(language, invalid_number)
end

loop do
  prompt "1) for english, \n  2) para español"
  language_prompt = gets.chomp
  break if (language_prompt == '1') || (language_prompt == '2')
end

language = 'english.txt' if language_prompt == '1'
language = 'spanish.txt' if language_prompt == '2'

loop do
  prompt get_line(language, welcome)
  name = gets.chomp

  if name.empty?
    prompt get_line(language, name_get)
  else
    break
  end
end

prompt get_line(language, hi) % { name: name }

loop do
  loop do
    prompt get_line(language, get_number1)
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      invalid_number_display(language, invalid_number)
    end
  end

  loop do
    prompt get_line(language, get_number2)
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      invalid_number_display(language, invalid_number)
    end
  end

  prompt get_line(language, operator_choice) % { line: "\n" }

  loop do
    operation = gets.chomp

    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt get_line(language, invalid_choice)
    end
  end

  prompt get_line(language, calculating) % { operation: op_to_msg(operation) }

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

  prompt get_line(language, display_result) % { result: result }

  prompt get_line(language, again)
  go_again = gets.chomp
  break unless (go_again.downcase == 'y') || (go_again.downcase == 's')
  system('clear') || system('cls')
end

prompt get_line(language, goodbye) % { name: name }
