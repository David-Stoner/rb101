require 'yaml'
MESSAGES = YAML.load_file('messages.yml')

user_name = ''
language = ''
language_prompt = ''

loan_amount = 0.0
annual_rate = 0.0
loan_duration = 0
monthly_rate = 0.0
monthly_duration = 0
monthly_payment = 0.0
denom_monthlies = 0.0
amort_denom = 0.0
amortization = 0.0

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
  integer?(input) || float?(input) && input.to_f >= 0
end

def messages(message, language)
  MESSAGES[language][message]
end

def prompt(key, language)
  message = messages(key, language)
  puts "=> #{message}"
end

def pick_language
  prompt('language_select', 'en')
end

def welcome(language)
  prompt('welcome', language)
end

def invalid_name(language)
  prompt('invalid_name', language)
end

def get_loan(language)
  prompt('enter_loan', language)
end

def get_duration(language)
  prompt('enter_duration', language)
end

def get_rate(language)
  prompt('enter_rate', language)
  prompt('example', language)
end

def invalid_number(language)
  prompt('invalid_number', language)
end

def output(language, monthly_payment)
  puts format(messages('result', language), pmnt: monthly_payment.round(2).to_s)
end

def again(language)
  prompt('again', language)
end

def goodbye(language, user_name)
  puts format(messages('goodbye', language), name: user_name)
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

def find_monthly_payment(loan_amount, amortization)
  loan_amount.to_i * amortization
end

loop do
  pick_language
  language_prompt = gets.chomp
  break if (language_prompt == '1') || (language_prompt == '2')
end

language_prompt == '1' ? language = 'en' : language = 'es'

loop do
  welcome(language)
  user_name = gets.chomp

  if user_name.empty?
    invalid_name(language)
  else
    break
  end
end

loop do
  loop do
    get_loan(language)
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      break
    else
      invalid_number(language)
    end
  end

  loop do
    get_duration(language)
    loan_duration = gets.chomp
    if valid_number?(loan_duration)
      break
    else
      invalid_number(language)
    end
  end

  loop do
    get_rate(language)
    annual_rate = gets.chomp
    if valid_number?(annual_rate)
      break
    else
      invalid_number(language)
    end
  end

  monthly_duration = find_monthly_duration(loan_duration)

  monthly_rate = find_monthly_rate(annual_rate)

  denom_monthlies = find_monthly_denom_factors(monthly_rate, monthly_duration)

  amort_denom = find_amortization_denominator(denom_monthlies)

  amortization = find_amortization(amort_denom, monthly_rate)

  monthly_payment = find_monthly_payment(loan_amount, amortization)

  output(language, monthly_payment)

  again(language)

  go_again = gets.chomp
  break unless (go_again.downcase == 'y') || (go_again.downcase == 's')

  system('clear') || system('cls')
end

goodbye(language, user_name)
