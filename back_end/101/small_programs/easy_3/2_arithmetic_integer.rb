# Write a program that prompts the user for two positive integers, and then prints the results of the 
# following operations on those two numbers: addition, subtraction, product, quotient, remainder, and 
# power. Do not worry about validating the input.

=begin

Input: two positive integers
Outputs: Results of addition, subtraction, product, quotient, remainder and power
Rules: Both numbers have to be positive; do not worry about validating input
Requirements: All the operations have to be displayed with their results as integers
Questions: Do I need to take into account float division?
Data Structure: strings, mathmatical operations
Examples: ==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103
Algorithm: 
- ask user for first number
  - puts 'Please enter the first number. It must be positive:
  - save to first_num
- ask for second number
  - puts 'Please enter the second number. It must be positive:
  - save to second_num
- puts 'Here are your calculations!'
- sum = #{first_num} + #{second_num}
- subtract = #{first_num} - #{second_num}
- product = #{first_num} * #{second_num}
- quotient = #{first_num} / #{second_num}
- remainder = #{first_num} % #{second_num}
- power = #{first_num} ** #{second_num}
- puts all mathematical variables in strings
  - ex. "#{first_number} + #{second_number} = #{sum}"
=end

# puts 'Please enter the first positive number:'
# first_number = gets.chomp.to_i

# puts 'Please enter the second positive number:'
# second_number = gets.chomp.to_i

# puts 'Here are your calculations!'

# sum = first_number + second_number  # I know this is a lot of repeating code, fix by using string interpolation to capture result of operation instead of saving to variable
# subtract = first_number - second_number
# product = first_number * second_number
# quotient = first_number / second_number
# remainder = first_number % second_number
# power = first_number ** second_number

# puts "#{first_number} + #{second_number} = #{sum}"
# puts "#{first_number} - #{second_number} = #{subtract}"
# puts "#{first_number} * #{second_number} = #{product}"
# puts "#{first_number} / #{second_number} = #{quotient}"
# puts "#{first_number} % #{second_number} = #{remainder}"
# puts "#{first_number} ** #{second_number} = #{power}"

# Another solution

def prompt(message)
  puts "#{message}"
end

prompt('Please enter the first positive number')
first_number = gets.chomp.to_i

prompt('Please enter the second positive number')
second_number = gets.chomp.to_i

prompt("#{first_number} + #{second_number} = #{first_number + second_number}")
prompt("#{first_number} - #{second_number} = #{first_number - second_number}")
prompt("#{first_number} * #{second_number} = #{first_number * second_number}")
prompt("#{first_number} / #{second_number} = #{first_number.to_f / second_number.to_f}")
prompt("#{first_number} % #{second_number} = #{first_number % second_number}")
prompt("#{first_number} ** #{second_number} = #{first_number**second_number}")
