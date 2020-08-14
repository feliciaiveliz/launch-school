def prompt(message) # prompt will put it in front of message
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op # 2 spaces
  when '1' # 2 spaces
    'Adding' # 4 
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to Calculator! Enter your name: ")

name = ''
loop do
  name = Kernel.gets().chomp() # 2
  if name.empty?()
    prompt("Make sure to type a valid name.") # 4
  else
    break # 4
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = '' # 2
  loop do # 2
    prompt("What's the first number?") # 4
    number1 = Kernel.gets().chomp() # 4
    if valid_number?(number1) # 4
      break # 6
    else
      prompt("Sorry, that's an invalid number") # 6
    end # 4
  end

  number2 = '' # 2
  loop do # 2
    prompt("What's the second number?") # 4
    number2 = Kernel.gets().chomp() # 4

    if valid_number?(number2) # 4
      break # 6
    else
      prompt("Sorry, that's an invalid number")
    end
  end

  operator_prompt = <<-MSG # 2 
    What operation would you like to perform? 
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = nil # 2
  loop do # 2
    operator = Kernel.gets().chomp() # 4

    if %w(1 2 3 4).include?(operator) # 4
      break # 6
    else # 4
      prompt("Must choose 1, 2, 3, 4") # 6
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...") # 2

  result = case operator # 2
           when '1' # level it with 'case'
             number1.to_i() + number2.to_i() # 2 after when 
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end
  prompt("The result is #{result}!") # 2

  prompt("Would you like me to perform another calculation?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end # 0

prompt("Thank you for using Calculator!")
