require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def number?(num) # method that verifies both number or float
  integer?(num) || float?(num)
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def operation_to_message(op)
  case op
  when '1' then 'Adding'
  when '2' then 'Subtracting'
  when '3' then 'Multiplying'
  when '4' then 'Dividing'
  end
end

prompt(messages('welcome'))

name = '' # empty string
loop do # start loop
  name = gets.chomp # retrieve name
  break unless name.empty? || name.strip.empty? # verifies name
  prompt(messages('invalid_name')) # error message
end # end of loop

prompt "Hi, #{name}!"

loop do # main
  num1 = ''
  loop do
    prompt(messages('first_num'))
    num1 = gets.chomp
    break if number?(num1)
    prompt(messages('verify_first'))
  end

  num2 = ''
  loop do
    prompt(messages('second_num'))
    num2 = gets.chomp
    break if number?(num2)
    prompt(messages('verify_second'))
  end

  prompt(messages('operation'))

  operator = ''
  loop do
    operator = gets.chomp
    break if %w(1 2 3 4).include?(operator)
    prompt(messages('invalid_op'))
  end

  prompt("#{operation_to_message(operator)} your two numbers...")

  result = case operator
           when '1' then num1.to_f + num2.to_f
           when '2' then num1.to_f - num2.to_f
           when '3' then num1.to_f.round(2) * num2.to_f.round(2)
           when '4' then num1.to_f.round(2) / num2.to_f.round(2)
           end
  prompt("The result is #{result}!")
  prompt(messages('calculate'))
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
  system('clear') || system('cls')
end

prompt(messages('goodbye_message'))
