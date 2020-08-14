require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')

def messages(message)
  MESSAGES[message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def name?(name)
  name.match(/^[0-9]/)
end

def number?(num)
  apr?(num) || integer?(num)
end

def integer?(num)
  (num.to_i.to_s == num) || (num.to_i >= 0) &&
    !num.strip.empty?
end

def apr?(num)
  (num.to_f.to_s == num) || (num.to_i.to_s == num) &&
    !num.to_f < 0 || !num.strip.empty?
end

def calc_monthly_payment(amount, apr, years)
  amount.to_f * ((apr / (1 - (1 + apr)**-years.to_i)))
end

def try_again?
  try_again = ''
  loop do
    try_again = gets.chomp.downcase
    if try_again.start_with? 'y'
      return true
    elsif try_again.start_with? 'n'
      return false
    end
    prompt(messages('invalid_answer'))
  end
end

prompt(messages('welcome'))

name = ''
loop do
  name = gets.chomp
  break unless name.strip.empty? || name?(name)
  prompt(messages('invalid_name'))
end

prompt "Howdy #{name}! Let's get started."

loop do
  amount = ''
  apr = ''
  years = ''
  loop do
    prompt(messages('amount'))
    amount = gets.chomp
    break if number?(amount)
    prompt(messages('invalid_amount'))
  end
  
  loop do
    prompt(messages('apr'))
    apr = gets.chomp
    break if apr?(apr)
    prompt(messages('invalid_apr'))
  end
  
  loop do
    prompt(messages('years'))
    years = gets.chomp
    break if apr?(years)
    prompt(messages('invalid_years'))
  end
  
  annual_interest = apr.to_f / 100
  apr = annual_interest / 12
  years = years.to_i * 12
  monthly_payment = calc_monthly_payment(amount, apr, years)
  
  prompt("Your monthly payment is $#{monthly_payment.round(2)}")
  prompt(messages('calc_again'))
  break unless answer?
  system('clear') || system('cls')
end

prompt "Thank you for using the Mortgage Calculator. Farewell #{name}!"
