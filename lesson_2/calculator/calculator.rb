require 'yaml'
MESSAGES = YAML.load_file('messages.yml')

number1 = ''
number2 = ''
name = ''
operation = ''
language = 'en'
language_prompt = ''

def messages(message, language)
  MESSAGES[language][message]
end

def prompt(key, language)
  message = messages(key, language)
  puts "=> #{message}"
end

def integer?(input)
  /^-?\d+$/.match(input)
end

def float?(input)
  case input
  when input.to_f.to_s == input then true
  when input.to_f.to_s == (input + '0') then true
  when ('0' + input).to_f.to_s == ('0' + input) then true
  else false
  end
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

def invalid_number_display(language)
  prompt('invalid_number', language)
end

def language_select
  prompt('language_select', 'en')
end

def welcome(language)
  prompt('welcome', language)
end

def name_get(language)
  prompt('name_get', language)
end

def hi(language, name)
  puts format(messages('hi', language), name: name)
end

def instructions(language)
  prompt('instructions', language)
end

def number1_prompt(language)
  prompt('get_number1', language)
end

def number2_prompt(language)
  prompt('get_number2', language)
end

def operator_choice(language)
  puts format(messages('operator_choice', language), line: "\n")
end

def invalid_choice(language)
  prompt('invalid_choice', language)
end

def calculating_message(language, operation)
  puts format(messages('calculating', language), operation: op_to_msg(operation))
end

def display_result(language, result)
  puts format(messages('display_result', language), result: result)
end

def again_message(language)
  prompt('again', language)
end

def goodbye(language, name)
  puts format(messages('goodbye', language), name: name)
end

def pick_language(language_prompt, language)
  loop do
    language_select
    language_prompt = gets.chomp
    break if (language_prompt == '1') || (language_prompt == '2')
  end
  return 'en' if language_prompt == '1'
  return 'es' if language_prompt == '2'
end

def enter_name(language)
  loop do
    welcome(language)
    name = gets.chomp
    if name.empty?
      name_get(language)
    else
      return name
    end
  end
end

def get_number1(language)
  loop do
    number1_prompt(language)
    number1 = gets.chomp

    if valid_number?(number1)
      return number1
    else
      invalid_number_display(language)
    end
  end
end

def get_number2(language)
  loop do
    number2_prompt(language)
    number2 = gets.chomp

    if valid_number?(number2)
      return number2
    else
      invalid_number_display(language)
    end
  end
end

def get_operation(language)
  loop do
    operation = gets.chomp

    if %w(1 2 3 4).include?(operation)
      return operation
    else
      invalid_choice(language)
    end
  end
end

def get_result(number1, number2, operation)
  case operation
  when '1'
    number1.to_i + number2.to_i
  when '2'
    number1.to_i - number2.to_i
  when '3'
    number1.to_i * number2.to_i
  when '4'
    number1.to_f / number2.to_f
  end
end

def another_time(language)
  loop do
    again_message(language)
    go_again = gets.chomp
    if (go_again.downcase == 'y') || (go_again.downcase == 's')
      return true
    elsif (go_again.downcase == 'n')
      return false
    end
  end
end

system('clear') || system('cls')
language = pick_language(language_prompt, language)
name = enter_name(language)
hi(language, name)
instructions(language)
loop do
  number1 = get_number1(language)
  number2 = get_number2(language)
  operator_choice(language)
  operation = get_operation(language)
  calculating_message(language, operation)
  result = get_result(number1, number2, operation)
  display_result(language, result)
  break unless another_time(language) == true
  system('clear') || system('cls')
end

goodbye(language, name)
