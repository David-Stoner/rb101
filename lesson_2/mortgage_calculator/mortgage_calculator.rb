require 'yaml'
MESSAGES = YAML.load_file('messages.yml')

user_name = ''
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
    float = true
  elsif input.to_f.to_s == (input + '0')
    float = true
  elsif ('0' + input).to_f.to_s == ('0' + input)
    float =  true
  else
    float = false
  end
  return float
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

def greeting(language, user_name)
  puts format(messages('greeting', language), name: user_name)
end

def instructions(language)
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

def find_monthly_payment(loan_amount, amortization)
  loan_amount.to_i * amortization
end

def do_the_math(loan_amount, loan_duration, annual_rate)
  monthly_duration = find_monthly_duration(loan_duration)
  monthly_rate = find_monthly_rate(annual_rate)
  denom_monthlies = find_monthly_denom_factors(monthly_rate, monthly_duration)
  amort_denom = find_amortization_denominator(denom_monthlies)
  amortization = find_amortization(amort_denom, monthly_rate)
  find_monthly_payment(loan_amount, amortization)
end
  
def select_language
  language_prompt = ''
  loop do
    pick_language
    language_prompt = gets.chomp
    break if (language_prompt == '1') || (language_prompt == '2')
  end
  return 'en' if language_prompt == '1'
  return 'es' if language_prompt == '2'
end

def get_name(language)
  loop do
    welcome(language)
    user_name = gets.chomp
    if user_name.empty?
      invalid_name(language)
    elsif /\A\s*\z/.match(user_name)
      invalid_name(language)
    else
      return user_name
    end
  end
end

def get_loan_amount(language)
  loop do
    get_loan(language)
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      return loan_amount
    else
      invalid_number(language)
    end
  end
end

def get_loan_duration(language)
  loop do
    get_duration(language)
    loan_duration = gets.chomp
    if valid_number?(loan_duration)
      return loan_duration
    else
      invalid_number(language)
    end
  end
end

def get_loan_rate(language)
  loop do
    get_rate(language)
    annual_rate = gets.chomp
    if valid_number?(annual_rate)
      return annual_rate
    else
      invalid_number(language)
    end
  end
end

def another_time(language)
  loop do
    again(language)
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
greeting(language, user_name)
instructions(language)
loop do
  loan_amount = get_loan_amount(language)
  loan_duration = get_loan_duration(language)
  annual_rate = get_loan_rate(language)
  monthly_payment = do_the_math(loan_amount, loan_duration, annual_rate)
  output(language, monthly_payment)
  break unless another_time(language) == true
  system('clear') || system('cls')
end

goodbye(language, user_name)
