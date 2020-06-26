require 'yaml'
MESSAGES = YAML.load_file('messages.yml')

language = ''

loan_amount = 0.0
annual_rate = 0.0
loan_duration = 0
monthly_payment = 0.0

def integer?(input)
  /^-?\d+$/.match(input)
end

def float?(input)
  if input.to_f.to_s == input
    true
  elsif input.to_f.to_s == (input + '0')
    true
  else
    ('0' + input).to_f.to_s == ('0' + input)
  end
end

def valid_number?(input)
  (integer?(input) || float?(input)) && input.to_f > 0
end

def messages(message, language)
  MESSAGES[language][message]
end

def prompt(key, language)
  message = messages(key, language)
  puts "=> #{message}"
end

def display_pick_language
  prompt('language_select', 'en')
end

def display_welcome(language)
  prompt('welcome', language)
end

def display_invalid_name(language)
  prompt('invalid_name', language)
end

def display_get_loan(language)
  prompt('enter_loan', language)
end

def display_get_duration(language)
  prompt('enter_duration', language)
end

def display_get_rate(language)
  prompt('enter_rate', language)
  prompt('example', language)
end

def display_invalid_number(language)
  prompt('invalid_number', language)
end

def display_invalid_integer(language)
  prompt('invalid_whole_number', language)
end

def display_output(language, monthly_payment)
  puts format(messages('result', language), pmnt: monthly_payment.round(2).to_s)
end

def display_again(language)
  prompt('again', language)
end

def display_goodbye(language, user_name)
  puts format(messages('goodbye', language), name: user_name)
end

def display_greeting(language, user_name)
  puts format(messages('greeting', language), name: user_name)
end

def display_instructions(language)
  prompt('instructions', language)
end

def find_monthly_duration(loan_duration)
  loan_duration.to_i * 12
end

def find_monthly_rate(annual_rate)
  1 + ((annual_rate.to_f / 12) / 100)
end

def find_monthly_denom_factors(monthly_rate, monthly_duration)
  monthly_rate**(-monthly_duration)
end

def find_amortization_denominator(denom_monthlies)
  1 - denom_monthlies
end

def find_amortization(amort_denom, monthly_rate)
  (monthly_rate - 1) / amort_denom
end

def calculate_monthly_payment(loan_amount, amortization)
  loan_amount.to_i * amortization
end

def find_monthly_paymnt(loan_amount, loan_duration, annual_rate)
  monthly_duration = find_monthly_duration(loan_duration)
  monthly_rate = find_monthly_rate(annual_rate)
  denom_monthlies = find_monthly_denom_factors(monthly_rate, monthly_duration)
  amort_denom = find_amortization_denominator(denom_monthlies)
  amortization = find_amortization(amort_denom, monthly_rate)
  calculate_monthly_payment(loan_amount, amortization)
end

def select_language
  language_prompt = ''
  loop do
    display_pick_language
    language_prompt = gets.chomp
    break if (language_prompt == '1') || (language_prompt == '2')
  end
  return 'en' if language_prompt == '1'
  return 'es' if language_prompt == '2'
end

def get_name(language)
  loop do
    display_welcome(language)
    user_name = gets.chomp
    if user_name.empty?
      display_invalid_name(language)
    elsif /\A\s*\z/.match(user_name)
      display_invalid_name(language)
    else
      return user_name
    end
  end
end

def get_loan_amount(language)
  loop do
    display_get_loan(language)
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      return loan_amount
    else
      display_invalid_number(language)
    end
  end
end

def get_loan_duration(language)
  loop do
    display_get_duration(language)
    loan_duration = gets.chomp
    if integer?(loan_duration) && loan_duration.to_i > 0
      return loan_duration
    else
      display_invalid_integer(language)
    end
  end
end

def get_loan_rate(language)
  loop do
    display_get_rate(language)
    annual_rate = gets.chomp
    if valid_number?(annual_rate)
      return annual_rate
    else
      display_invalid_number(language)
    end
  end
end

def another_time(language)
  loop do
    display_again(language)
    go_again = gets.chomp
    if (go_again.downcase == 'y') || (go_again.downcase == 's')
      return true
    elsif go_again.downcase == 'n'
      return false
    end
  end
end

system('clear') || system('cls')
language = select_language
user_name = get_name(language)
display_greeting(language, user_name)
display_instructions(language)
loop do
  loan_amount = get_loan_amount(language)
  loan_duration = get_loan_duration(language)
  annual_rate = get_loan_rate(language)
  monthly_payment = find_monthly_paymnt(loan_amount, loan_duration, annual_rate)
  display_output(language, monthly_payment)
  break unless another_time(language) == true
  system('clear') || system('cls')
end

display_goodbye(language, user_name)
