=begin
  
Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product
of all numbers between 1 and the entered integer. 

Input: integer, 's' or 'p'
Output: either sum or product of consecutive numbers based on user's number
Rules: number must be greater than 0, operations must be only addition or multiplication
Requirements: the addition or multiplication is between 1 and all the numbers up to that integer.
Data Structure: range, use reduce method for multiplication and addition
Algorithm: 
- use prompt message to get used to it instead of using puts
- create method to validate user's number 
  - def positive_number?(num)
      num.to_i > 0
- ask user for positive integer and validate
  - prompt('Please enter a positive integer: ')
  - save to num variable
- use case statement to give options 
- ask user to enter either 's' or 'p' to commute math
  - prompt('Enter 's' to compute the sum, or 'p' to compute the product.)
- case statement
  - case operation()
  when 's' then prompt('The sum of the intgers between 1 and num is #{(1..num).inject(:+)}'
  when 'p' then prompt('The product of the integers between 1 and num is #{(1..num).inject(:*)}')
- end case statement
=end

def prompt(msg)
  puts "#{msg}"
end


def valid_number?(num)
  num.to_i.to_s == num && num.to_i > 0
end

num = ''

  loop do 
    prompt 'Please enter a positive integer'
    num = gets.chomp
    break if valid_number?(num)
  end


prompt "Enter 's' to compute the sum, or 'p' to compute the product: "
sum = gets.chomp
sum = 's'

case sum
  when 's' then prompt "The sum of the integers between 1 and #{num} is #{(1..num).inject(:+)}!"
  when 'p' then prompt "The product of the integers between 1 and #{num} is #{(1..num).inject(:*)}!"
end
